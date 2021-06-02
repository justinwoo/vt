use regex::Regex;
use std::collections::HashSet;
use std::fs::{read_dir, DirEntry};
use vt::types::*;

pub fn get_paths(dir: &String) -> MyResult<Vec<Path>> {
    let path = std::path::Path::new(&dir);

    let entries = read_dir(path).or_else(|e| error(format!("Error getting paths: {}", e)))?;

    let mut dir_entries: Vec<DirEntry> = Vec::new();

    for entry in entries {
        if let Ok(entry) = entry {
            if let Some(ext) = entry.path().extension() {
                if ext.to_string_lossy() == "mkv" {
                    dir_entries.push(entry);
                }
            }
        }
    }

    dir_entries.sort_by_cached_key(|entry| {
        let md = entry.metadata().unwrap();
        let date = md.modified().unwrap();
        date
    });

    dir_entries.reverse();

    let mut filtered = Vec::new();

    for entry in dir_entries {
        filtered.push(entry.file_name().to_string_lossy().into());
    }

    Ok(filtered)
}

pub fn get_titles(dir: &String) -> MyResult<Vec<String>> {
    let regex = Regex::new(r"\[.*\] (.*) - \d+ [\[\(].+[\)\]]+.*\.mkv").unwrap();
    let paths = get_paths(dir)?;

    let mut set: HashSet<String> = HashSet::new();

    for path in paths {
        for cap in regex.captures_iter(&path) {
            set.insert(cap[1].to_string());
        }
    }

    Ok(set.into_iter().collect())
}

pub fn open_file(dir: &String, path: &String, exe: &String) -> MyResult<()> {
    let path = std::path::Path::new(&dir).join(path);
    std::process::Command::new(exe)
        .arg(&path)
        .spawn()
        .or(error(format!("Error opening exe: {}", exe)))?;
    Ok(())
}

pub async fn get_icons(dir: &String) -> MyResult<()> {
    let titles = get_titles(dir)?;

    for title in titles {
        let target = std::path::Path::new("dist/icons").join(&title);

        if !target.exists() {
            println!("Downloading target: {:?}", &target);

            let child = tokio::process::Command::new("get-icons")
                .arg(&title)
                .arg(target.to_string_lossy().to_string())
                .spawn()
                .expect("Error running get-icons");

            child.await.expect("Error waiting on get-icons");

            println!("Downloaded target: {:?}", &target);
        }
    }

    println!("get_icons succeeded.");

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_get_titles() {
        // should not crash when compiling regex
        let dir = std::env::var("DIR").unwrap_or("".to_owned());
        println!("Titles: {:?}", get_titles(&dir));
    }

    #[test]
    fn test_get_icons() {
        let dir = std::env::var("DIR").unwrap_or("".to_owned());
        let mut rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            get_icons(&dir).await.unwrap();
        });
    }
}

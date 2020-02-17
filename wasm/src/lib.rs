use regex::Regex;
use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::*;

use vt::types::*;

#[wasm_bindgen]
extern "C" {
    fn console_log(s: &str);
}

#[wasm_bindgen]
pub fn greet(name: &str) {
    console_log(&format!("Hello, {}!", name));
}

#[derive(Serialize, Deserialize)]
struct File {
    name: Path,
    watched: Option<String>,
    series: Option<String>,
    episode: Option<u32>,
    latest: Option<u32>,
}

#[wasm_bindgen]
pub fn get_files(paths_: JsValue, watched_: JsValue) -> JsValue {
    let regex = Regex::new(r"\[.*\] (.*) - (\d+) \[\d+p]\.mkv").unwrap();

    let paths: Vec<Path> = paths_.into_serde().unwrap();
    let watched: Vec<Watched> = watched_.into_serde().unwrap();

    let mut watched_iter = watched.into_iter();

    let files: Vec<File> = paths
        .into_iter()
        .map(|path| {
            let watched = watched_iter.find(|x| x.path == path).map(|r| r.created);

            let mut series = None;
            let mut episode = None;

            for cap in regex.captures_iter(&path) {
                if cap.len() > 1 {
                    series = Some(cap[1].to_string());
                    episode = Some(cap[2].to_string().parse::<u32>().unwrap());
                }
            }

            File {
                name: path,
                watched,
                series,
                episode,
                latest: None,
            }
        })
        .collect();

    JsValue::from_serde(&files).unwrap()
}

// calculateFiles :: AppState -> AppState
// calculateFiles state =
//   let
//     { filterWatched, grouped, paths, watchedData } = state

//     modifiers = { filterWatched, grouped }
//     allFiles = getFiles paths watchedData
//     files = processFiles allFiles modifiers

//   in state { files = files }

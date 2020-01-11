use rusqlite::{params, Connection};

use crate::types::*;

pub fn get_conn(dir: &String) -> MyResult<Connection> {
    let path = std::path::Path::new(&dir).join("filetracker");

    Connection::open(path)
        .or_else(|e| error(format!("Failed to connect to sqlite database: {}", e)))
}

pub fn ensure_table(conn: &Connection) -> MyResult<()> {
    conn.execute(
        "create table if not exists watched (path text primary key unique, created datetime)",
        params![],
    )
    .map(|_| ())
    .or(error("Error running ensure table query"))
}

pub fn upsert_watched_path(conn: &Connection, path: &String, watched: bool) -> MyResult<()> {
    conn.execute(
        if watched {
            "insert or replace into watched ( path, created ) values ( (?1), datetime() )"
        } else {
            "delete from watched where path = (?1)"
        },
        params![path],
    )
    .map(|_| ())
    .or(error("Error running upsert watched query"))
}

pub fn get_watched(conn: &Connection) -> MyResult<Vec<Watched>> {
    let mut stmt = conn
        .prepare("select path, created from watched order by created desc")
        .or_else(|e| {
            return error(format!(
                "Could not prepare statement for get watched query: {}",
                e
            ));
        })?;

    let rows = stmt
        .query_map(params![], |row| {
            Ok(Watched {
                path: row.get(0).unwrap(),
                created: row.get(1).unwrap(),
            })
        })
        .or(error("Could not query map for get watched query"))?;

    let collected: rusqlite::Result<Vec<Watched>> = rows.collect();

    collected.or_else(|e| error(format!("Could not collect results of get watched: {}", e)))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn test_get_conn() -> Connection {
        let path = std::path::Path::new("/tmp/test-vt-db");
        let _ = std::fs::remove_file(path);
        Connection::open(path).unwrap()
    }

    fn test_ensure_table() -> Connection {
        let conn = test_get_conn();
        assert!(ensure_table(&conn).is_ok());
        conn
    }

    #[test]
    fn test_init() {
        test_ensure_table();
    }

    #[test]
    fn test_actions() {
        let conn = test_ensure_table();
        let title = "title".to_string();

        assert!(upsert_watched_path(&conn, &title, true).is_ok());

        let watched = get_watched(&conn).unwrap();
        assert_eq!(watched.len(), 1);
        assert_eq!(watched[0].path, title.clone());

        assert!(upsert_watched_path(&conn, &title, false).is_ok());

        let watched = get_watched(&conn).unwrap();
        assert_eq!(watched.len(), 0);
    }
}

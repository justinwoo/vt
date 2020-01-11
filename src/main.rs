use actix_web::{web, App, HttpRequest, HttpServer};
use std::io;
use std::sync::Mutex;

use vt::types::{to_actix_result, ActixResult, Update, Open};

struct MyData {
    dir: String,
    exe: String,
    conn: rusqlite::Connection,
}

type MyState = web::Data<Mutex<MyData>>;

fn print_req(req: &HttpRequest) {
    println!(
        "Request: {:?} {:?} {}",
        req.head().version,
        req.head().method,
        req.path()
    );
}

async fn update(state: MyState, update: web::Json<Update>, req: HttpRequest) -> ActixResult {
    print_req(&req);
    let data = state.lock().unwrap();
    let conn = &data.conn;
    let result = vt::db::upsert_watched_path(conn, &update.path, update.watched);
    to_actix_result(result.map(|_| "OK"))
}

async fn watched(state: MyState, req: HttpRequest) -> ActixResult {
    print_req(&req);
    let data = state.lock().unwrap();
    let watched = vt::db::get_watched(&data.conn);
    to_actix_result(watched)
}

async fn files(state: MyState, req: HttpRequest) -> ActixResult {
    print_req(&req);
    let data = state.lock().unwrap();
    let dir = &data.dir;
    let paths = vt::files::get_paths(dir);
    to_actix_result(paths)
}

async fn open(state: MyState, open: web::Json<Open>, req: HttpRequest) -> ActixResult {
    print_req(&req);
    let data = state.lock().unwrap();
    let dir = &data.dir;
    let exe = &data.exe;
    let path = &open.path;
    let result = vt::files::open_file(dir, &path, exe);
    to_actix_result(result.map(|_| "OK"))
}

async fn get_icons(state: MyState, req: HttpRequest) -> ActixResult {
    print_req(&req);
    let data = state.lock().unwrap();
    let dir = &data.dir;
    let result = vt::files::get_icons(dir).await;
    to_actix_result(result.map(|_| "OK"))
}

#[actix_rt::main]
async fn main() -> io::Result<()> {
    let dir = std::env::var("DIR").expect("DIR must be set to the videos home.");
    let exe = std::env::var("EXE").expect("EXE must be set to an executable in PATH.");

    let conn = vt::db::get_conn(&dir).expect("Could not get a connection to the database.");
    vt::db::ensure_table(&conn).unwrap();

    let my_data = web::Data::new(Mutex::new(MyData { dir, exe, conn }));

    HttpServer::new(move || {
        App::new()
            .app_data(my_data.clone())
            .service(web::resource("/watched").to(watched))
            .service(web::resource("/files").to(files))
            .service(web::resource("/update").to(update))
            .service(web::resource("/get-icons").to(get_icons))
            .service(web::resource("/open").to(open))
            .service(actix_files::Files::new("/", "dist").index_file("index.html"))
    })
    .bind("127.0.0.1:4567")?
    .run()
    .await
}

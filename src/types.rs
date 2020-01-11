use actix_web::{error, Error, HttpResponse};
use serde::{Deserialize, Serialize};

pub type MyError = String;

pub fn error<A, S: Into<String>>(s: S) -> MyResult<A> {
    let string = s.into();
    Err(string)
}

pub type MyResult<A> = Result<A, MyError>;

pub type ActixResult = Result<HttpResponse, Error>;

pub fn to_actix_result<A: Serialize>(result: MyResult<A>) -> ActixResult {
    match result {
        Ok(x) => Ok(HttpResponse::Ok().json(x)),
        Err(e) => Err(error::ErrorBadRequest(e)),
    }
}

pub type Path = String;

#[derive(Deserialize, Serialize, Debug)]
pub struct Watched {
    pub path: Path,
    pub created: String,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct Update {
    pub path: Path,
    pub watched: bool,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct Open {
    pub path: Path,
}

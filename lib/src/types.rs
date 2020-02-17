use serde::{Deserialize, Serialize};

pub type MyError = String;

pub fn error<A, S: Into<String>>(s: S) -> MyResult<A> {
    let string = s.into();
    Err(string)
}

pub type MyResult<A> = Result<A, MyError>;

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

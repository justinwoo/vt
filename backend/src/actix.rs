use serde::{Serialize};
use actix_web::{error, Error, HttpResponse};

use vt::types::*;

pub type ActixResult = Result<HttpResponse, Error>;

pub fn to_actix_result<A: Serialize>(result: MyResult<A>) -> ActixResult {
    match result {
        Ok(x) => Ok(HttpResponse::Ok().json(x)),
        Err(e) => Err(error::ErrorBadRequest(e)),
    }
}


use dioxus_web::launch::launch;

mod app;
mod components;
mod pages;
mod router;

#[wasm_bindgen::prelude::wasm_bindgen]
pub fn main() {
    wasm_logger::init(wasm_logger::Config::default());
    launch(app::app, Vec::new(), Vec::new());
}
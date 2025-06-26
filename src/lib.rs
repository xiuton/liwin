use dioxus_web::launch::launch;
use crate::config::AppConfig;

mod app;
mod components;
mod pages;
mod router;
mod config;

#[wasm_bindgen::prelude::wasm_bindgen]
pub fn main() {
    wasm_logger::init(wasm_logger::Config::default());
    #[cfg(target_arch = "wasm32")]
    let config = AppConfig::get_default();
    #[cfg(not(target_arch = "wasm32"))]
    let config = AppConfig::load().expect("配置加载失败");
    println!("当前配置: {:?}", config);
    launch(app::app, Vec::new(), Vec::new());
}
use dioxus::prelude::*;
mod pages {
    pub mod home;
    pub mod about;
    pub mod not_found;
}
mod components {
    pub mod hello;
}
mod router;

use dioxus_router::prelude::*;
use router::AppRoute;

fn app() -> Element {
    rsx! {
        div {
            class: "min-h-screen flex flex-col items-center justify-center bg-gray-50",
            nav {
                class: "mb-8 space-x-4",
                Link { to: AppRoute::HomePage {}, class: "text-blue-600 hover:underline", "Home" }
                Link { to: AppRoute::AboutPage {}, class: "text-blue-600 hover:underline", "About" }
            }
            { router::router() }
        }
    }
}

#[wasm_bindgen::prelude::wasm_bindgen]
pub fn main() {
    launch(app);
} 
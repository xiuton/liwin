use dioxus::prelude::*;

fn app() -> Element {
    rsx! {
        div {
            class: "min-h-screen flex items-center justify-center bg-gray-50",
            h1 {
                class: "text-3xl font-bold text-gray-900",
                "Hello, world!"
            }
        }
    }
}

#[wasm_bindgen::prelude::wasm_bindgen]
pub fn main() {
    launch(app);
} 
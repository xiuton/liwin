use dioxus::prelude::*;

#[component]
pub fn Hello() -> Element {
    rsx! {
        div { class: "text-green-600 font-semibold", "Hello from components!" }
    }
} 
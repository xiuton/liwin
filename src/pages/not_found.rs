use dioxus::prelude::*;

#[component]
pub fn NotFound(segments: Vec<String>) -> Element {
    rsx! {
        div { class: "p-8 text-center text-red-600", h1 { class: "text-2xl font-bold", "404 Not Found" } p { "页面不存在: " } {segments.join("/")} }
    }
} 
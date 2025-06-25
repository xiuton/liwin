use dioxus::prelude::*;
use dioxus_router::prelude::*;
use crate::router::AppRoute;
use crate::components::button::Button;

#[component]
pub fn About() -> Element {
    let nav = use_navigator();
    rsx! {
        h1 { class: "text-4xl font-extrabold text-green-700 mb-4", "ℹ️ About Page" }
        p { class: "text-lg text-gray-600 mb-8 text-center", "本项目基于 Dioxus + TailwindCSS，适合快速构建现代 Web 应用。" }
        Button {
            class: "mb-4 bg-green-600 hover:bg-green-700 px-4 py-2 rounded-md text-white",
            onclick: move |_| { nav.push(AppRoute::HomePage {}); },
            "返回 Home"
        }
    }
} 
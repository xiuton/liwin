use dioxus::prelude::*;
use dioxus_router::prelude::*;
use crate::router::AppRoute;

#[component]
pub fn About() -> Element {
    let nav = use_navigator();
    rsx! {
        div { class: "p-8", 
            h1 { class: "text-2xl font-bold", "About Page" }
            button {
                class: "mt-4 px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700",
                onclick: move |_| { nav.push(AppRoute::HomePage {}); },
                "返回 Home"
            }
        }
    }
} 
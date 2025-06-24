use dioxus::prelude::*;
use crate::components::hello::Hello;
use dioxus_router::prelude::*;
use crate::router::AppRoute;

#[component]
pub fn Home() -> Element {
    let nav = use_navigator();
    rsx! {
        div { class: "p-8", 
            h1 { class: "text-2xl font-bold", "Home Page" }
            Hello {}
            button {
                class: "mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700",
                onclick: move |_| { nav.push(AppRoute::AboutPage {}); },
                "跳转到 About"
            }
        }
    }
} 
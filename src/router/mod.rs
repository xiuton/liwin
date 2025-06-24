use dioxus::prelude::*;
use dioxus_router::prelude::*;
use crate::pages::{home::Home, about::About, not_found::NotFound};

#[derive(Routable, PartialEq, Clone, Debug)]
pub enum AppRoute {
    #[route("/", Home)]
    HomePage {},
    #[route("/about", About)]
    AboutPage {},
    #[route("/:..segments", NotFound)]
    NotFoundPage { segments: Vec<String> },
}

pub fn router() -> Element {
    rsx! {
        Router::<AppRoute> {}
    }
} 
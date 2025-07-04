use dioxus::prelude::*;
use dioxus_router::prelude::*;
use crate::pages::{home::Home, about::About, not_found::NotFound};
use crate::components::layout::Layout;

#[derive(Routable, PartialEq, Clone, Debug)]
pub enum AppRoute {
    #[layout(Layout)]
    #[route("/", Home)]
    HomePage {},
    #[route("/:..segments", NotFound)]
    NotFoundPage { segments: Vec<String> },
    #[end_layout]

    #[route("/about", About)]
    AboutPage {}
} 
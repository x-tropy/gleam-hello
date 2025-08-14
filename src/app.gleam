import gleam/int
import gleam/string
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

type Model =
  String

fn init(_) -> Model {
  "Lucy1"
}

type Msg {
  UserUpdatedName(String)
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserUpdatedName(name) ->
      case string.length(name) <= 10 {
        True -> name
        False -> model
      }
  }
}

fn view(model: Model) -> Element(Msg) {
  html.div([], [
    html.span([], [html.text("input your name:")]),
    html.input([attribute.value(model), event.on_input(UserUpdatedName)]),
    html.p([], [html.text("Hello, " <> model)]),
  ])
}

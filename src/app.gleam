import gleam/int
import lustre
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

type Model =
  Int

fn init(_) -> Model {
  0
}

type Msg {
  UserClickedInc
  UserClickedDec
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedInc -> model + 1
    UserClickedDec -> model - 1
  }
}

fn view(model: Model) -> Element(Msg) {
  html.div([], [
    view_button(on_click: UserClickedInc, label: "+1111"),
    html.text(int.to_string(model)),
    view_button(on_click: UserClickedDec, label: "-111"),
  ])
}

fn view_button(on_click handle_click: msg, label text: String) -> Element(msg) {
  html.button([event.on_click(handle_click)], [html.text(text)])
}

type t = {
  trainer : Trainer.t;
  x_coord : int;
  y_coord : int;
}

let init_t_state t = { trainer = t; x_coord = 5; y_coord = 5 }
let get_location t = (t.x_coord, t.y_coord)
let move_up t = { t with y_coord = t.y_coord + 1 }
let move_down t = { t with y_coord = t.y_coord - 1 }
let move_left t = { t with x_coord = t.x_coord - 1 }
let move_right t = { t with x_coord = t.x_coord + 1 }

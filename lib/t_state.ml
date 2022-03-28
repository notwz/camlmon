type t = {
  trainer : Trainer.t;
  x_coord : int;
  y_coord : int;
  terrain : int;
}

exception OutOfBoundsMove of (int * int)

let init_t_state t =
  { trainer = t; x_coord = 5; y_coord = 5; terrain = 0 }

let get_location t = (t.x_coord, t.y_coord)

let move_left t =
  if t.y_coord > 0 then { t with y_coord = t.y_coord - 1 }
  else raise (OutOfBoundsMove (get_location t))

let move_right t =
  if t.y_coord < 10 then { t with y_coord = t.y_coord + 1 }
  else raise (OutOfBoundsMove (get_location t))

let move_up t =
  if t.x_coord > 0 then { t with x_coord = t.x_coord - 1 }
  else raise (OutOfBoundsMove (get_location t))

let move_down t =
  if t.x_coord < 10 then { t with x_coord = t.x_coord + 1 }
  else raise (OutOfBoundsMove (get_location t))

let get_trainer t = t.trainer

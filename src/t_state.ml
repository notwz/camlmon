type t = {trainer : Trainer.t; x_coord : int; y_coord : int}

let init_t_state t = {trainer = t; x_coord = 5; y_coord = 5}

let get_location t = (t.x_coord, t.y_coord)
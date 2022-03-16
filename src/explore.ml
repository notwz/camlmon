open Lib
open Map
open T_state
open Trainer

let rec take_turn map =
  let () = Printf.printf "Move: " in
  match read_line () with
  | "up" ->
      let new_map = Map.move_up map in
      let () = print_endline (Map.pp_map new_map) in
      take_turn new_map
  | "down" ->
      let new_map = Map.move_down map in
      let () = print_endline (Map.pp_map new_map) in
      take_turn new_map
  | "left" ->
      let new_map = Map.move_right map in
      let () = print_endline (Map.pp_map new_map) in
      take_turn new_map
  | "right" ->
      let new_map = Map.move_left map in
      let () = print_endline (Map.pp_map new_map) in
      take_turn new_map
  | "q" ->
      let () = print_endline "Quitting" in
      ()
  | _ ->
      print_endline "Please put a valid command:";
      take_turn map

let explore_main name id =
  let trainer = Trainer.init_trainer name id in
  let trainer_state = T_state.init_t_state trainer in
  let map = Map.init_map trainer_state in
  print_endline
    "Type 'up', 'down', 'left', 'right' to move around in the map. \
     ('q' to quit.) ";
  take_turn map

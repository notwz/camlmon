open Lib
open Map
open T_state
open Trainer

let rec take_turn map =
  let () =
    ANSITerminal.print_string [ ANSITerminal.cyan ] " \n Move: \n";
    Printf.printf "> "
  in
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
      let () =
        ANSITerminal.print_string
          [ ANSITerminal.magenta ]
          " \n Quitting ... \n"
      in
      ()
  | _ ->
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        "\n Please put a valid command:";
      take_turn map

let explore_main name id =
  let trainer = Trainer.init_trainer name id in
  let trainer_state = T_state.init_t_state trainer in
  let map = Map.init_map trainer_state in
  ANSITerminal.print_string [ ANSITerminal.blue ]
    " \n\
    \ Type 'up', 'down', 'left', 'right' to move around in the map. \
     ('q' to quit.) \n";
  take_turn map

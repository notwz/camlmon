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
  | "up" -> (
      match Map.move_up map with
      | exception OutOfBoundsMove pos ->
          let () =
            ANSITerminal.print_string
              [ ANSITerminal.magenta ]
              "Invalid movement, try again.\n"
          in
          take_turn map
      | new_map ->
          let () = print_endline (Map.pp_map new_map) in
          take_turn new_map)
  | "down" -> (
      match Map.move_down map with
      | exception OutOfBoundsMove pos ->
          let () =
            ANSITerminal.print_string
              [ ANSITerminal.magenta ]
              "Invalid movement, try again.\n"
          in
          take_turn map
      | new_map ->
          let () = print_endline (Map.pp_map new_map) in
          take_turn new_map)
  | "left" -> (
      match Map.move_left map with
      | exception OutOfBoundsMove pos ->
          let () =
            ANSITerminal.print_string
              [ ANSITerminal.magenta ]
              "Invalid movement, try again.\n"
          in
          take_turn map
      | new_map ->
          let () = print_endline (Map.pp_map new_map) in
          take_turn new_map)
  | "right" -> (
      match Map.move_right map with
      | exception OutOfBoundsMove pos ->
          let () =
            ANSITerminal.print_string
              [ ANSITerminal.magenta ]
              "Invalid movement, try again.\n"
          in
          take_turn map
      | new_map ->
          let () = print_endline (Map.pp_map new_map) in
          take_turn new_map)
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

let explore_main trainer =
  let trainer_state = T_state.init_t_state trainer in
  let map = Map.init_map trainer_state in
  print_endline (Map.pp_map map);
  ANSITerminal.print_string [ ANSITerminal.blue ]
    " \n\
    \ Type 'up', 'down', 'left', 'right' to move around in the map. \
     ('q' to quit.) \n";
  take_turn map

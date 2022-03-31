(* open Lib
open Map
open T_state
open Trainer
open Map_command
open Encounter

let rec take_turn map encounter =
  let () = Random.self_init () in
  if Random.int 3 < 1 && encounter then
    let () =
      encounter_main (map |> get_trainer_state |> get_trainer) 0
    in
    let () = print_endline (Map.pp_map map) in
    take_turn map false
  else
    let () =
      ANSITerminal.print_string [ ANSITerminal.cyan ] " \n Move: \n";
      Printf.printf "> "
    in
    match read_line () with
    | command -> (
        match parse command with
        | exception Empty ->
            let () =
              ANSITerminal.print_string
                [ ANSITerminal.magenta ]
                "Make a non-empty move.\n"
            in
            take_turn map false
        | exception Malformed ->
            let () =
              ANSITerminal.print_string
                [ ANSITerminal.magenta ]
                "The valid commands are up, down, left, right and q\n"
            in
            take_turn map false
        | Up -> (
            match Map.move_up map with
            | exception OutOfBoundsMove pos ->
                let () =
                  ANSITerminal.print_string
                    [ ANSITerminal.magenta ]
                    "Invalid movement, try again.\n"
                in
                take_turn map false
            | new_map ->
                let () = print_endline (Map.pp_map new_map) in
                take_turn new_map true)
        | Down -> (
            match Map.move_down map with
            | exception OutOfBoundsMove pos ->
                let () =
                  ANSITerminal.print_string
                    [ ANSITerminal.magenta ]
                    "Invalid movement, try again.\n"
                in
                take_turn map false
            | new_map ->
                let () = print_endline (Map.pp_map new_map) in
                take_turn new_map true)
        | Left -> (
            match Map.move_left map with
            | exception OutOfBoundsMove pos ->
                let () =
                  ANSITerminal.print_string
                    [ ANSITerminal.magenta ]
                    "Invalid movement, try again.\n"
                in
                take_turn map false
            | new_map ->
                let () = print_endline (Map.pp_map new_map) in
                take_turn new_map true)
        | Right -> (
            match Map.move_right map with
            | exception OutOfBoundsMove pos ->
                let () =
                  ANSITerminal.print_string
                    [ ANSITerminal.magenta ]
                    "Invalid movement, try again.\n"
                in
                take_turn map false
            | new_map ->
                let () = print_endline (Map.pp_map new_map) in
                take_turn new_map true)
        | Quit ->
            let () =
              ANSITerminal.print_string
                [ ANSITerminal.magenta ]
                " \n Quitting ... \n"
            in
            ())

let explore_main trainer =
  let trainer_state = T_state.init_t_state trainer in
  let map = Map.init_map trainer_state in
  print_endline (Map.pp_map map);
  ANSITerminal.print_string [ ANSITerminal.blue ]
    " \n\
    \ Type 'up', 'down', 'left', 'right' to move around in the map. \
     ('q' to quit.) \n";
  take_turn map true *)

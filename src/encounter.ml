open Lib
open Trainer
open Catch_state
open Graphics

let print_endline str =
  ANSITerminal.print_string [ ANSITerminal.cyan ] (str ^ "\n")

let rec take_turn catch_state =
  if Catch_state.caught catch_state then
    print_endline "You have caught the pokemon!"
  else if Catch_state.ran_away catch_state then
    print_endline "The pokemon has ran away!"
  else
    let () = print_endline "Will you throw a ball, bait, or a rock?" in
    let () = Printf.printf "> " in
    match read_line () with
    | "ball" ->
        let () = print_endline "You threw a ball at the pokemon!" in
        take_turn (catch catch_state)
    | "bait" ->
        let () = print_endline "You threw bait at the pokemon!" in
        take_turn (bait catch_state)
    | "rock" ->
        let () = print_endline "You threw a rock at the pokemon!" in
        take_turn (rock catch_state)
    | _ ->
        let () =
          ANSITerminal.print_string
            [ ANSITerminal.magenta ]
            "Invalid action, try again.\n"
        in
        take_turn catch_state

let process ev =
  if
    ev.mouse_x >= 540 && ev.mouse_x <= 600 && ev.mouse_y >= 290
    && ev.mouse_y <= 315
  then "ball"
  else if
    ev.mouse_x >= 620 && ev.mouse_x <= 680 && ev.mouse_y >= 209
    && ev.mouse_y <= 315
  then "bait"
  else if
    ev.mouse_x >= 700 && ev.mouse_x <= 760 && ev.mouse_y >= 290
    && ev.mouse_y <= 315
  then "rock"
  else "a"

let rec take_turn_2 catch_state () =
  let () = print_endline "\n enter" in
  moveto 520 250;
  if Catch_state.caught catch_state then (
    let () = print_endline "You have caught the pokemon!" in
    set_color green;
    draw_string "You have caught the pokemon!")
  else if Catch_state.ran_away catch_state then (
    let () = print_endline "The pokemon has ran away!" in
    set_color red;
    draw_string "The pokemon has ran away!")
  else
    (* moveto 500 220; set_color blue; draw_string "continue
       trying..."; *)
    let () =
      print_endline "\n Will you throw a ball, bait, or a rock?"
    in
    let () = Printf.printf "> " in
    let ev = wait_next_event [ Button_down ] in
    match process ev with
    | "ball" ->
        let () = print_endline "You threw a ball at the pokemon!" in
        take_turn_2 (catch catch_state) ()
    | "rock" ->
        let () = print_endline "You threw a rock at the pokemon!" in
        take_turn_2 (rock catch_state) ()
    | "bait" ->
        let () =
          print_endline
            ("You threw bait at the pokemon!"
            ^ string_of_bool (Catch_state.caught catch_state))
        in
        take_turn_2 (bait catch_state) ()
    | _ ->
        let () =
          ANSITerminal.print_string
            [ ANSITerminal.magenta ]
            "Invalid action, try again.\n"
        in
        take_turn_2 catch_state ()

let encounter_main trainer terrain =
  let () =
    print_endline
      (Trainer.get_trainer_name trainer
      ^ " has entered an encounter with magikarp!")
  in
  take_turn Catch_state.init_state

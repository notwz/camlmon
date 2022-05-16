open Lib
open Trainer
open Catch_state
open Graphics
open Gui_library

let paint_battle () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  clear_graph ();
  clear_window black;
  Graphics.moveto title_x 400;
  set_color black;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  set_color bg_1;
  draw_img charmander (340, (y_res / 2) - 150) ()

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

let encounter_main trainer terrain =
  let () =
    print_endline
      (Trainer.get_trainer_name trainer
      ^ " has entered an encounter with magikarp!")
  in
  take_turn Catch_state.init_state

let encounter_gui () =
  paint_battle ();
  let e = wait_next_event [ Key_pressed ] in
  moveto 350 30;
  let pp = String.make 1 e.key in
  draw_string ("You pressed button" ^ pp);
  Unix.sleep 2;
  ()

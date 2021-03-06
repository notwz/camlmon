open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Lib
open Trainer
open Safari_zone
open Battle
open Battle_encounter
open Pokemon
open Gui_library

(* let printDes (des : string) = ANSITerminal.print_string [
   ANSITerminal.cyan ] (" Des " ^ des ^ "!") *)

let dialogue = [ "Dialogue 1"; "Dialogue 2"; "Dialogue 3" ]

type dialogue_type =
  | Prof
  | Arena
  | Catch
  | Battle

let new_game_dialogue =
  [
    "Hi! Sorry to keep you waiting!";
    "Welcome to the world of POKeMON!";
    "My name is FOSTER. ";
    "But everyone call me the PROFOSTER.";
    "This is what we call a 'POKeMON.' ";
    "This world is inhabited by creatures known as POKeMON.";
    "We humans live alongside POKeMON, at times as friendly ";
    "playmates, and at times as cooperative workmates.";
    "Sometimes, we band together and battle others like us.";
    "Despite our closeness, we don't know everything";
    "In fact, there are many secrets surrounding POKeMON.";
    "I've been researching to unravel POKeMON mysteries.";
    "That's what I do. But, enough about me.";
    "All right. What's your name?";
    "All right are you ready?";
    "Your very own adventure is about to unfold.";
    "Take courage, and leap into the world of POKeMON ";
    "where dreams, adventure, and friendships await!";
    "I'll be expecting you to come see me in my POKeMON LAB!";
  ]

let catch_dialogue =
  [
    "Welcome to the safari zone! ";
    "Here you have the ability to catch POKeMON.";
    "Move around with the [w] [a] [s] [d] keys!";
    "Try it out!";
  ]

let arena_dialogue =
  [
    "Welcome to the POKeMON arena trainer!";
    "Here, you will test your skills and experience ... ";
    " ... against other trainers.";
    "Try it out!";
  ]

let battle_dialogue =
  [
    "Welcome to the POKeMON training grounds.";
    "Here, you will earn experience ... ";
    " ... battling against other POKeMON.";
    "Try it out!";
  ]

type coordiante = int * int

let panel_color = rgb 151 199 218
let panel_border_1 = rgb 27 34 64
let panel_border_2 = rgb 165 119 26
let grey = rgb 160 160 160
let bg_1 = rgb 255 243 224
let bg_2 = rgb 255 224 178
let bg_3 = rgb 255 183 77
let bg_4 = rgb 255 152 0
let bg_5 = rgb 255 140 0
let bg_6 = rgb 239 108 0
let dialogue_x = 340
let dialogue_y = 0
let dialogue_width = 600
let dialogue_height = 200
let main_width = dialogue_width
let main_height = y_res - dialogue_height
let main_x = dialogue_x
let main_y = dialogue_y + dialogue_height
let img_size : int = 60
let panel_outline = 3
let pokemon_logo = "public/menu_images/pokemon_logo.png"
let charmander = "public/menu_images/charmander.png"
let pikachu = "public/menu_images/pikachu.png"
let professor = "public/menu_images/professor.png"
let arena = "public/menu_images/arena.png"
let loading_screen = "public/menu_images/loading_screen.png"
let start_screen = "public/menu_images/start_screen.png"
let font = "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1"

(** [paint_prof] paints the prof image in designated position when
    introducing game to user*)
let rec paint_prof () =
  set_color white;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  set_color bg_1;
  fill_rect dialogue_x (y_res - 20) dialogue_width 20;
  set_color bg_2;
  fill_rect dialogue_x (y_res - 40) dialogue_width 20;
  set_color bg_3;
  fill_rect dialogue_x (y_res - 60) dialogue_width 20;
  set_color bg_4;
  fill_rect dialogue_x (y_res - 80) dialogue_width 20;
  set_color bg_5;
  fill_rect dialogue_x (y_res - 100) dialogue_width 20;
  set_color bg_6;
  fill_rect dialogue_x (y_res - 120) dialogue_width 20;
  draw_img professor ((x_res / 2) - 140, (y_res / 2) - 150) ()

(** [paint_transition n] paints the transition page between choosing
    option page and the actual game*)
let paint_transition name () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  clear_graph ();
  clear_window black;
  Graphics.moveto title_x 400;
  set_color black;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  set_color bg_1;
  draw_img name (340, (y_res / 2) - 150) ()

let state_ref = ref (init_trainer "" 0)

(** ==============================

    Paint Name

    appears in intro dialouge and mutates the name field in the trainer
    state

    ==============================*)

(** [paint_name st] allows user to type their preferred username using
    ',' as backspace and paints the name in following conversations*)
let rec paint_name (state : Trainer.t ref) () =
  try
    let name = Trainer.get_trainer_name !state in
    set_color white;
    fill_rect main_x main_y main_width main_height;
    moveto (main_x + 50) (main_y + 100);
    set_color black;
    draw_string (" Name is : " ^ name);
    moveto (main_x + 50) (main_y + 70);
    draw_string "Press [ , ] to backspace";
    moveto (main_x + 50) (main_y + 50);
    draw_string "Press [ ; ] to confirm";
    synchronize ();
    let e = wait_next_event [ Key_pressed ] in
    if e.key = ';' then (
      Graphics.moveto 360 100;
      set_color black;
      Graphics.draw_string ("Ah, " ^ name ^ " has a nice ring to it.");
      Unix.sleep 1;
      state_ref := set_trainer_name name !state_ref)
    else if e.key = ',' then
      let len = String.length name in
      let backspaced_name = String.sub name 0 (len - 1) in
      let new_state =
        ref (Trainer.set_trainer_name backspaced_name !state)
      in
      paint_name new_state ()
    else
      let new_char = String.make 1 e.key in
      let new_name = name ^ new_char in
      let new_state = ref (Trainer.set_trainer_name new_name !state) in
      paint_name new_state ()
  with Invalid_argument _ -> paint_name state ()

(** [paint_dialogue s d] draws all the texts in dialogue list [d] using
    trainer information about trainer [s]*)
let rec paint_dialogue text (state : Trainer.t ref) d_type () =
  clear_graph ();
  clear_window grey;
  let paint_main =
    match d_type with
    | Prof -> paint_prof ()
    | Arena -> paint_transition arena ()
    | Catch -> paint_transition loading_screen ()
    | Battle -> paint_transition arena ()
  in
  paint_main;
  if text = "This is what we call a 'POKeMON.' " then
    draw_img pikachu ((x_res / 2) + 50, y_res / 2) ();
  Graphics.set_color Graphics.white;
  Graphics.fill_rect dialogue_x dialogue_y dialogue_width
    dialogue_height;
  Graphics.set_color panel_border_1;
  Graphics.set_line_width 5;
  Graphics.draw_rect dialogue_x dialogue_y dialogue_width
    dialogue_height;
  Graphics.set_color panel_border_2;
  Graphics.set_line_width 10;
  Graphics.draw_rect 346 6 588 188;
  Graphics.moveto 360 150;
  set_color black;
  Graphics.draw_string text;
  if text = "All right. What's your name?" then paint_name state ();
  Graphics.moveto 360 50;
  Graphics.draw_string "[ Press ; key to continue ... ]";
  synchronize ();
  let e = wait_next_event [ Key_pressed ] in
  if e.key = ';' then ()
  else if e.key = 'q' then Stdlib.exit 0
  else paint_dialogue text state d_type ()

(** [display_catch_dialogue d s] draws all the texts in dialogue list
    [d] using trainer information about trainer [s]*)
let rec display_catch_dialogue dialogues (state : Trainer.t ref) =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Catch ()
  done;
  safari state 340 0 ()

(** [display_arena_dialogue d s] draws all the texts in dialogue list
    [d] in turn using trainer information about trainer [s]*)
let rec display_arena_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Arena ()
  done;
  battle_main 0 0 ()

(** [display_battle_dialogue d s] draws all the texts in dialogue list
    [d] in turn using trainer information about trainer [s]*)
let rec display_battle_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Battle ()
  done;
  battle_main 0 0 ()

(** ==============================

    Select Buttons

    appear after intro dialogue

    ==============================*)

(** [select_buttons state select] draws the buttons and waits for user
    keyboard command to determine which state to move to next *)
let rec select_buttons (state : Trainer.t ref) (select_y : int) () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  let catch = "[ 1 ] Catch Pokemon" in
  let catch_x = item_x_d (fst (text_size catch)) in
  let battle = "[ 2 ] Battle Pokemon" in
  let battle_x = item_x_d (fst (text_size battle)) in
  let duel = "[ 3 ] Battle Trainers" in
  let duel_x = item_x_d (fst (text_size duel)) in
  let directions =
    " Change options with [w] and [s]. Press [;] to select."
  in
  let directions_x = item_x_d (fst (text_size directions)) in
  let state = ref (Trainer.init_trainer "" 0) in
  clear_graph ();
  clear_window black;
  Graphics.moveto title_x 400;
  Graphics.set_color white;
  Graphics.draw_string title;
  Graphics.moveto catch_x 350;
  Graphics.draw_string catch;
  Graphics.moveto battle_x 300;
  Graphics.draw_string battle;
  Graphics.moveto duel_x 250;
  Graphics.draw_string duel;
  Graphics.moveto directions_x 150;
  Graphics.draw_string directions;
  moveto 400 select_y;
  draw_string " > ";
  synchronize ();
  let e = wait_next_event [ Key_pressed ] in
  match e.key with
  | 'w' ->
      if select_y = 350 then select_buttons state 350 ()
      else select_buttons state (select_y + 50) ()
  | 's' ->
      if select_y = 250 then select_buttons state 250 ()
      else select_buttons state (select_y - 50) ()
  | ';' -> (
      match select_y with
      | 350 -> display_catch_dialogue catch_dialogue state
      | 300 -> display_arena_dialogue battle_dialogue state
      | 250 -> display_battle_dialogue arena_dialogue state
      | _ ->
          if e.key <> 'q' then select_buttons state select_y ()
          else Stdlib.exit 0)
  | _ ->
      if e.key <> 'q' then select_buttons state select_y ()
      else Stdlib.exit 0

(** [display_new_game_dialogue d s] draws all the texts in dialogue list
    [d] in turn using trainer information about trainer [s]*)
let rec display_new_game_dialogue dialogues (state : Trainer.t ref) =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Prof ()
  done;
  select_buttons state 350 ()

(** [loading_menu] paints the initial loaidng menu, accepts user's 's'
    key command to move on *)
let rec loading_menu () =
  Graphics.set_window_title "Camlmon";
  clear_window black;
  draw_img pokemon_logo (280, 360) ();
  draw_img start_screen (0, 0) ();
  Graphics.set_font font;
  set_color yellow;
  Graphics.moveto 500 150;
  Graphics.draw_string "Press [ s ] key to continue... ";
  Graphics.moveto 650 20;
  Graphics.set_color Graphics.white;
  Graphics.draw_string
    "Developed by [Maxwell Pang, Yunci Sun, and Will Zhang] inc.";
  synchronize ();
  let e = wait_next_event [ Key_pressed ] in
  if e.key = 's' then
    display_new_game_dialogue new_game_dialogue state_ref
  else if e.key = 'p' then safari state_ref 340 0 ()
  else if e.key = 'b' then battle_main 0 0 ()
  else if e.key = 'c' then battle_encounter_main random_pokemon 0 0 ()
  else loading_menu ();
  synchronize ()

let main_menu () =
  Graphics.open_graph " 1280x720";
  auto_synchronize false;
  loading_menu ();
  synchronize ();
  close_graph ()

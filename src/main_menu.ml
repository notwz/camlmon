open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore
open Lib
open Trainer
open Safari_zone

let printDes (des : string) =
  ANSITerminal.print_string [ ANSITerminal.cyan ] (" Des " ^ des ^ "!")

let dialogue = [ "Dialogue 1"; "Dialogue 2"; "Dialogue 3" ]

type dialogue_type =
  | Prof
  | Arena
  | Catch
  | Battle

let new_game_dialogue =
  [
    (* "Hi! Sorry to keep you waiting!"; "Welcome to the world of
       POKeMON!"; "My name is FOSTER. "; "But everyone call me the
       PROFOSTER."; "This is what we call a 'POKeMON.' "; "This world is
       widely inhabited by creatures known as POKeMON."; "We humans live
       alongside POKeMON, at times as friendly playmates, \ and"; " at
       times as cooperative workmates."; "And sometimes, we band
       together and battle others like us. "; "But despite our
       closeness, we don't know everything about POKeMON."; "In fact,
       there are many, many secrets surrounding POKeMON."; "To unravel
       POKeMON mysteries, I've been undertaking research."; "That's what
       I do. But, enough about me."; "All right. What's your name?";
       "All right are you ready?"; "Your very own adventure is about to
       unfold."; "Take courage, and leap into the world of POKeMON where
       dreams, "; "adventure, and friendships await!"; *)
    "Well, I'll be expecting you later. Come see me in my POKeMON LAB.";
  ]

let catch_dialogue =
  [
    (* "Welcome to the safari zone! "; "Here you have the ability to
       catch POKeMON."; "Move around with the [w] [a] [s] [d] keys!"; *)
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

let pokemon_logo = "public/menu_images/pokemon_logo.png"
let charmander = "public/menu_images/charmander.png"
let pikachu = "public/menu_images/pikachu.png"
let professor = "public/menu_images/professor.png"
let arena = "public/menu_images/arena.png"
let loading_screen = "public/menu_images/loading_screen.png"
let start_screen = "public/menu_images/start_screen.png"
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
let x_res : int = 1280
let y_res : int = 720
let window_res : coordiante = (x_res, y_res)
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
let item_x_d (width : int) = (x_res - width) / 2
let item_y_d (width : int) = (y_res - width) / 2

let draw_img name (coor : int * int) () =
  let img = Png.load_as_rgb24 name [] in
  let g = Graphic_image.of_image img in
  Graphics.draw_image g (fst coor * 1) (snd coor * 1)

let clear_window color =
  let fg = foreground in
  set_color color;
  fill_rect 0 0 (size_x ()) (size_y ());
  set_color fg

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

let paint_arena () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  clear_graph ();
  clear_window black;
  Graphics.moveto title_x 400;
  set_color black;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  set_color bg_1;
  draw_img arena (340, (y_res / 2) - 150) ()

let paint_catch () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  clear_graph ();
  clear_window black;
  Graphics.moveto title_x 400;
  set_color black;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  set_color bg_1;
  draw_img loading_screen (340, (y_res / 2) - 150) ()

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

let rec paint_name state () =
  try
    let name = Trainer.get_trainer_name state in
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
      ())
    else if e.key = ',' then
      let len = String.length name in
      let backspaced_name = String.sub name 0 (len - 1) in
      let new_state = Trainer.set_trainer_name backspaced_name state in
      paint_name new_state ()
    else
      let new_char = String.make 1 e.key in
      let new_name = name ^ new_char in
      let new_state = Trainer.set_trainer_name new_name state in
      paint_name new_state ()
  with Invalid_argument _ -> paint_name state ()

let rec paint_dialogue text state d_type () =
  clear_graph ();
  clear_window grey;
  let paint_main =
    match d_type with
    | Prof -> paint_prof ()
    | Arena -> paint_arena ()
    | Catch -> paint_catch ()
    | Battle -> paint_battle ()
  in
  paint_main;
  if text = "This is what we call a 'POKeMON.' " then
    draw_img pikachu (x_res / 2, (y_res / 2) + 200) ();
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

let rec display_catch_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Catch ()
  done;
  safari state 340 0 ()

let rec display_arena_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Arena ()
  done;
  ()

let rec display_battle_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Battle ()
  done;
  ()

let rec select_buttons state (select_y : int) () =
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
  let state = Trainer.init_trainer "" 0 in
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

let rec display_new_game_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state Prof ()
  done;
  select_buttons state 350 ()

(* let rec select_menu () = let title = "Main Menu" in let title_x =
   item_x_d (fst (text_size title)) in let catch = "[ 1 ] Catch Pokemon"
   in let catch_x = item_x_d (fst (text_size catch)) in let battle = "[
   2 ] Battle Pokemon" in let battle_x = item_x_d (fst (text_size
   battle)) in let duel = "[ 3 ] Battle Trainers" in let duel_x =
   item_x_d (fst (text_size duel)) in let directions = "Press [1] [2] or
   [3] to choose option to play" in let directions_x = item_x_d (fst
   (text_size directions)) in let state = Trainer.init_trainer "" 0 in
   clear_graph (); clear_window black; Graphics.set_font
   "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
   Graphics.moveto title_x 400; Graphics.set_color white;
   Graphics.draw_string title; Graphics.moveto catch_x 350;
   Graphics.draw_string catch; Graphics.moveto battle_x 300;
   Graphics.draw_string battle; Graphics.moveto duel_x 250;
   Graphics.draw_string duel; Graphics.moveto directions_x 150;
   Graphics.draw_string directions; let e = wait_next_event [
   Key_pressed ] in let key_description = if e.keypressed then sprintf
   "key %c was pressed" e.key else "No key pressed. " in set_color
   white; moveto 0 0; draw_string key_description; match e.key with |
   '1' -> display_dialogue new_game_dialogue state | '2' -> test () |
   '3' -> display_dialogue dialogue state | 'd' -> display_dialogue
   dialogue state | _ -> if e.key <> 'q' then select_menu () else
   Stdlib.exit 0 *)

let rec loading_menu () =
  let state = Trainer.init_trainer "" 0 in
  Graphics.set_window_title "Camlmon";
  clear_window black;
  draw_img pokemon_logo (280, 360) ();
  draw_img start_screen (0, 0) ();
  Graphics.set_font
    "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1";
  set_color yellow;
  Graphics.moveto 500 150;
  Graphics.draw_string "Press [ s ] key to continue... ";
  Graphics.moveto 650 20;
  Graphics.set_color Graphics.white;
  Graphics.draw_string
    "Developed by [Maxwell Pang, Yunci Sun, and Will Zhang] inc.";
  synchronize ();

  let e = wait_next_event [ Key_pressed ] in
  if e.key = 's' then display_new_game_dialogue new_game_dialogue state
  else if e.key = 'p' then safari state 340 0 ()
  else loading_menu ();
  synchronize ()

let main_menu () =
  Graphics.open_graph " 1280x720";
  auto_synchronize false;
  loading_menu ();
  synchronize ();
  close_graph ()

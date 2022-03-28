open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore
open Lib
open Trainer

let printDes (des : string) =
  ANSITerminal.print_string [ ANSITerminal.cyan ] (" Des " ^ des ^ "!")

let dialogue = [ "Dialogue 1"; "Dialogue 2"; "Dialogue 3" ]

let new_game_dialouge =
  [
    "Hi! Sorry to keep you waiting!";
    "Welcome to the world of POKeMON!";
    "My name is FOSTER. ";
    "But everyone call me the PROFOSTER.";
    "This is what we call a 'POKeMON.' ";
    "This world is widely inhabited by creatures known as POKeMON.";
    "We humans live alongside POKeMON, at times as friendly playmates, \
     and";
    " at times as cooperative workmates.";
    "And sometimes, we band together and battle others like us. ";
    "But despite our closeness, we don't know everything about POKeMON.";
    "In fact, there are many, many secrets surrounding POKeMON.";
    "To unravel POKeMON mysteries, I've been undertaking research.";
    "That's what I do. ";
    "And you are? ";
    "Are you a Boy or a Girl? ";
    "All right. What's your name?";
    "All right are you ready?";
    "Your very own adventure is about to unfold.";
    "Take courage, and leap into the world of POKeMON where dreams, ";
    "adventure, and friendships await!";
    "Well, I'll be expecting you later. Come see me in my POKeMON LAB.";
  ]

type coordiante = int * int

let pokemon_logo = "public/menu_images/pokemon_logo.png"
let charmander = "public/menu_images/charmander.png"
let pikachu = "public/menu_images/pikachu.png"
let professor = "public/menu_images/professor.png"
let panel_color = rgb 151 199 218
let panel_border_1 = rgb 27 34 64
let panel_border_2 = rgb 165 119 26
let grey = rgb 160 160 160
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

let rec paint_main () =
  set_color white;
  fill_rect dialogue_x dialogue_y dialogue_width y_res;
  draw_img professor ((x_res / 2) - 140, (y_res / 2) - 150) ()

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
    let e = wait_next_event [ Key_pressed ] in
    if e.key = ';' then ()
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

let rec paint_dialogue text state () =
  clear_graph ();
  clear_window grey;
  paint_main ();
  if text = "This is what we call a 'POKêMON.' " then
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
  let e = wait_next_event [ Key_pressed ] in
  if e.key = ';' then ()
  else if e.key = 'q' then Stdlib.exit 0
  else paint_dialogue text state ()

let rec display_dialogue dialogues state =
  let len = List.length dialogues in
  for i = 0 to len - 1 do
    let text = List.nth dialogues i in
    paint_dialogue text state ()
  done

let rec select_menu () =
  let title = "Main Menu" in
  let title_x = item_x_d (fst (text_size title)) in
  let catch = "[ 1 ] Catch Pokemon" in
  let catch_x = item_x_d (fst (text_size catch)) in
  let battle = "[ 2 ] Battle Pokemon" in
  let battle_x = item_x_d (fst (text_size battle)) in
  let duel = "[ 3 ] Battle Trainers" in
  let duel_x = item_x_d (fst (text_size duel)) in
  let directions = "Press [1] [2] or [3] to choose option to play" in
  let directions_x = item_x_d (fst (text_size directions)) in
  let state = Trainer.init_trainer "" 0 in
  clear_graph ();
  clear_window black;
  Graphics.set_font
    "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
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
  let e = wait_next_event [ Key_pressed ] in
  let key_description =
    if e.keypressed then sprintf "key %c was pressed" e.key
    else "No key pressed. "
  in
  set_color white;
  moveto 0 0;
  draw_string key_description;
  match e.key with
  | '1' -> display_dialogue new_game_dialouge state
  | '2' -> display_dialogue dialogue state
  | '3' -> display_dialogue dialogue state
  | 'd' -> display_dialogue dialogue state
  | _ -> if e.key <> 'q' then select_menu () else Stdlib.exit 0

let rec loading_menu () =
  Graphics.set_window_title "Camlmon";
  clear_window black;
  draw_img pokemon_logo (280, 360) ();
  Graphics.set_font
    "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1";
  set_color yellow;
  Graphics.moveto 570 250;
  Graphics.draw_string "CAMLMON VERSION";
  Graphics.moveto 500 200;
  Graphics.draw_string "Press [ s ] key to continue... ";
  Graphics.moveto 650 20;
  Graphics.set_color Graphics.white;
  Graphics.draw_string
    "Developed by [Maxwell Pang, Sunci Sun, and Will Zhang] inc.";
  let e = wait_next_event [ Key_pressed ] in
  if e.key = 's' then select_menu () else loading_menu ()

let main_menu () =
  Graphics.open_graph " 1280x720";
  loading_menu ();
  close_graph ()

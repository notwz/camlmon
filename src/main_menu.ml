open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore

let printDes (des : string) =
  ANSITerminal.print_string [ ANSITerminal.cyan ] (" Des " ^ des ^ "!")

let rec loop () =
  clear_graph ();
  Graphics.set_window_title "Camlmon";
  Graphics.set_font
    "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
  Graphics.moveto 100 500;
  Graphics.draw_string
    "Welcome to the Camlmon Pokemon Game written in OCaml!";
  Graphics.moveto 100 400;
  Graphics.set_color Graphics.red;
  Graphics.draw_string " Main Menu ";
  Graphics.moveto 100 350;
  Graphics.draw_string "[ 1 ]  catch pokemon";
  Graphics.moveto 100 300;
  Graphics.draw_string "[ 2 ]  battle pokemon";
  Graphics.moveto 100 250;
  Graphics.draw_string "[ 3 ]  battle users";
  Graphics.moveto 100 150;
  Graphics.draw_string
    " type in '1'  '2' or '3' to choose option to play! ";
  let e = wait_next_event [ Key_pressed ] in
  let key_description =
    if e.keypressed then sprintf "key %c was pressed" e.key
    else "No key pressed. "
  in
  moveto 0 100;
  draw_string key_description;

  if e.key <> 'q' then loop () else ()

let rec loading_menu () =
  Graphics.set_window_title "Camlmon";
  Graphics.set_font
    "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
  Graphics.moveto 100 500;
  Graphics.draw_string
    "Welcome to the Camlmon Pokemon Game written in OCaml!";
  Graphics.moveto 100 400;
  Graphics.draw_string "Press [ space bar ] to continue... ";
  let e = wait_next_event [ Key_pressed ] in
  if e.key = 's' then loop () else loading_menu ()

let main_menu () =
  Graphics.open_graph "";
  loading_menu ();
  close_graph ()

open Sdlevent
open Sdlinit
open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore

let rec listen_main_menu (input : string) =
  print_endline ("You chose: " ^ input);
  match input with
  | "1" -> explore_main "Ash Ketchum" 1
  | "2" -> (
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        " \n\
        \ Feature not yet implemented. Sorry! Please choose again. \n";
      print_string "> ";
      match read_line () with
      | x -> listen_main_menu x)
  | "3" -> (
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        "\n Feature not yet implemented. Sorry! Please choose again. \n";
      print_string "> ";
      match read_line () with
      | x -> listen_main_menu x)
  | _ -> (
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        " \n Please put a valid input. \n";
      print_string "> ";
      match read_line () with
      | x -> listen_main_menu x)

let rec main_menu_terminal =
  ANSITerminal.print_string
    [ ANSITerminal.cyan; ANSITerminal.Bold ]
    " Main Menu \n";
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    " >>> [ 1 ]  catch pokemon \n";
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    " >>> [ 2 ]  battle pokemon [not implemented] \n";
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    " >>> [ 3 ]  battle users [not implemented] \n \n";
  ANSITerminal.print_string [ ANSITerminal.blue ]
    " Type in ' 1'  '2' or '3'\n to choose option to play: \n ";
  print_string "> ";
  match read_line () with
  | exception End_of_file -> ()
  | x -> listen_main_menu x

let rec listen_new_user (input : string) =
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    (" \n Hmmm," ^ input
   ^ " has a good ring to it.   \n\n\
     \        Welcome to the vast world of Pokemon. \n\
     \ \n\
     \        This world is inhabited by creatures big and small, cute \
      and fierce, \n\
     \        friendly and dangerous called Pokemon. \n\
     \ \n\
     \        My name is Profesor Foster. They call me the Profoster. \n\
     \ \n\
     \        My task for you is to explore the regions in this world \
      and log their information \n\
     \      into this device I created, the Camldex. \n\
     \      \n\
     \ Do you accept my task of filling this Camldex? (y/y) ");
  print_string "> ";
  match read_line () with
  | _ ->
      ANSITerminal.print_string [ ANSITerminal.blue ]
        " \n\
        \ You nod your head yes, despite what you really want to say.  \n";
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        " \n You obtained the Camldex!  \n";
      main_menu_terminal

let rec loop () =
  let e = wait_next_event [ Mouse_motion; Key_pressed ] in

  let mouse_description =
    sprintf "Mouse position: %d,%d" e.mouse_x e.mouse_y
  in
  let key_description =
    if e.keypressed then sprintf "Key %c was pressed" e.key else ""
  in

  clear_graph ();
  moveto 0 100;
  draw_string key_description;
  moveto 0 0;
  draw_string mouse_description;

  if e.key <> 'q' then loop () else ()

let parseInput (input : string) =
  print_endline ("your input was: " ^ input)

let test_main () =
  Graphics.open_graph "";
  loop ();
  close_graph ()

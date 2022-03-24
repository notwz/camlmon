open Game
open Sdl
open Lib
open Printf
open Gui
open Test
open Explore

let clear = function
  | x -> Sys.command "clear" + x

let rec listen (input : string) =
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
      | x -> listen x)
  | "3" -> (
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        "\n\
        \ Feature not\n\
        \   yet implemented. Sorry! Please choose again. \n";
      print_string "> ";
      match read_line () with
      | x -> listen x)
  | _ -> (
      ANSITerminal.print_string
        [ ANSITerminal.magenta ]
        " \n Please put a\n   valid input. \n";
      print_string "> ";
      match read_line () with
      | x -> listen x)

let main_menu_terminal (start : bool) =
  if true then (
    ANSITerminal.print_string
      [ ANSITerminal.cyan; ANSITerminal.Bold ]
      " Main Menu \n";
    ANSITerminal.print_string [ ANSITerminal.cyan ]
      " >>> [ 1 ] catch pokemon \n";
    ANSITerminal.print_string [ ANSITerminal.cyan ]
      " >>> [ 2 ] battle pokemon [not implemented] \n";
    ANSITerminal.print_string [ ANSITerminal.cyan ]
      " >>> [ 3 ] battle users [not implemented] \n   \n";
    ANSITerminal.print_string [ ANSITerminal.blue ]
      " Type in '1' '2' or '3'\n to choose option to play: \n";
    printf "> ";
    match read_line () with
    | exception End_of_file -> ()
    | x -> listen x)
  else print_string "invalid"

let rec listen_new_user (input : string) =
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    (" \n Hmmm, " ^ input ^ " has a good ring to it.\n   \n\n" ^ input
   ^ ", Welcome to the vast world of Cámlmon!! \n\
     \  \n\
     \  This world \n\
     \        is inhabited by creatures big and small, cute and fierce, \n\
     \        friendly and dangerous called Pokémon. \n\
     \  \n\
     \ ");
  printf " \n press [enter] to continue ... ";
  clear 1;
  match read_line () with
  | _ -> (
      ANSITerminal.print_string [ ANSITerminal.cyan ]
        "💬 My name is\n\
        \        Profesor Foster. They call me the Profoster. \n\
        \  \n\
         💬 My task for\n\
        \        you is to explore the regions in this world  and log \
         their\n\
        \        information  into this device I created, the Camldex.";
      printf " \n press [enter] to continue ... ";
      clear 1;
      match read_line () with
      | _ -> (
          ANSITerminal.print_string [ ANSITerminal.cyan ]
            "💬 Do you accept my task of filling this Cámldex? (y/n) \n ";
          printf "> ";
          match read_line () with
          | "y" ->
              ANSITerminal.print_string [ ANSITerminal.blue ]
                " \n\
                \  You nod your\n\
                \   head yes, eager to fufill your destiny \n";
              ANSITerminal.print_string
                [ ANSITerminal.magenta ]
                " \n  ✨ You obtained the Cámldex!  ✨\n";
              main_menu_terminal true
          | _ ->
              ANSITerminal.print_string [ ANSITerminal.blue ]
                " \n\
                \  You nod your\n\
                \   head yes, despite what you really wanted to say. \n";
              ANSITerminal.print_string
                [ ANSITerminal.magenta ]
                " \n  ✨ You obtained the Cámldex!  ✨\n";
              clear 1;
              main_menu_terminal true))

let main () =
  ANSITerminal.print_string
    [ ANSITerminal.green; ANSITerminal.Bold ]
    "\n\n Welcome to the  Cámlmon Pokémon Game written in OCaml! \n\n";
  ANSITerminal.print_string [ ANSITerminal.cyan ]
    " \n What should we call you trainer?";
  printf "\n >%! ";
  match read_line () with
  | exception End_of_file -> ()
  | x -> listen_new_user x

let () = Gui.menu_screen ()

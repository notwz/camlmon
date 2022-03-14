(*open OCLib*)
open Game
open Sdl

let rec listen (input : string) =
  print_endline ("your input was " ^ input)

let main () =
  ANSITerminal.print_string [ ANSITerminal.green ]
    "\n\n Welcome to the Camlmon Pokemon Game written in OCaml! \n";
  print_endline " Main Menu ";
  print_endline " >>> [ 1 ]  catch pokemon";
  print_endline " >>> [ 2 ]  battle pokemon";
  print_endline " >>> [ 3 ]  battle users";
  print_endline " type in ' 1'  '2' or '3'\n to choose option to play! ";
  match read_line () with
  | exception End_of_file -> ()
  | x -> listen x

let () = main ()

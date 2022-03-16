open Sdlevent
open Sdlinit
open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf

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

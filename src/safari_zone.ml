open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore
open Lib
open Trainer

let game_x = 340
let game_y = 0
let game_w = 600
let game_h = 720

type command =
  | Up
  | Left
  | Right
  | Down

let clear_window color =
  let fg = foreground in
  set_color color;
  fill_rect 0 0 (size_x ()) (size_y ());
  set_color fg

let rec safari x y () =
  clear_graph ();
  clear_window black;
  moveto 420 420;
  set_color black;
  fill_rect game_x game_y game_w game_h;
  set_color white;
  fill_rect x y 20 20;
  let e = wait_next_event [ Key_pressed ] in
  let user_command =
    match e.key with
    | 'w' -> safari x (y + 20) ()
    | 'a' -> safari (x - 20) y ()
    | 'd' -> safari (x + 20) y ()
    | 's' -> safari x (y - 20) ()
    | _ -> ()
  in
  user_command;
  ()
(* let new_render = match user_command with | Up -> safari x (y + 20) ()
   | Left -> safari (x - 20) y () | Right -> safari (x + 20) y () | Down
   -> safari x (y - 20) () in new_render *)

open Graphics
open Camlimages
open Graphic_image
open Images
open Png

(* brew install libpng *)
(* opam install graphics *)
(* opam install camlimages  *)
(* opam install oUnit*)

type tile =
  | Path
  | Bush
  | Puddle
  | Rock

(* in position (1-11, 1-11) *)
type coordinate = int * int

(* let a = Map.init_map *)

type map_tile = {
  tile_type : tile;
  bottom_left : coordinate;
}

(* type t = {map_tile; } *)

(* let press_123 () = let valid_key=true in while !valid_key do
   Graphics.read_key () *)

(* Graphics.wait_next_event [Key_pressed] *)

(* if Graphics.read_key = '1' *)
let menu_screen () =
  Graphics.open_graph " 660x660";
  Graphics.set_window_title "Camlmon";
  Graphics.set_font
    "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
  Graphics.moveto 100 500;
  Graphics.draw_string
    "Welcome to the Camlmon Pokemon Game written in OCaml!";
  Graphics.moveto 100 400;
  Graphics.draw_string " Main Menu ";
  Graphics.moveto 100 350;
  Graphics.draw_string "[ 1 ]  catch pokemon";
  Graphics.moveto 100 300;
  Graphics.draw_string "[ 2 ]  battle pokemon";
  Graphics.moveto 100 250;
  Graphics.draw_string "[ 3 ]  battle users";
  Graphics.moveto 100 150;
  Graphics.draw_string
    " type in '1'  '2' or '3' to choose option to play! "

let img_size = 60
let pixel_to_position (pos : int * int) : int * int = (1, 1)

let draw_pic name coor () =
  let image = Png.load_as_rgb24 name [] in
  let g = Graphic_image.of_image image in
  Graphics.draw_image g (fst coor * img_size) (snd coor * img_size)

let draw_bush (coor : int * int) =
  let image = Png.load_as_rgb24 "./map_images/bush.png" [] in
  let g = Graphic_image.of_image image in
  Graphics.draw_image g
    (fst coor * img_size)
    ((11 - snd coor) * img_size)

let rec draw_map1_bush list =
  match list with
  | [] -> ()
  | x :: xs ->
      draw_bush x;
      draw_map1_bush xs

open Lib
open Graphics
open Camlimages
open Graphic_image
open Images
open Png
open Map

(* brew install libpng *)
(* opam install graphics *)
(* opam install camlimages  *)
(* opam install oUnit*)

type tile =
  | Path
  | Grass
  | Puddle
  | Rock

(* in position (1-11, 1-11) *)
type coordinate = int * int

type map_tile = {
  tile_type : tile;
  bottom_left : coordinate;
}

(* image file names *)
let grass = "./map_images/grass.png"
let rock = "./map_images/rock.png"
let puddle = "./map_images/puddle.png"
let path = "./map_images/path.png"
let trainer = "./map_images/trainer.png"

let rec menu_screen () =
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
    " type in '1'  '2' or '3' to choose option to play! ";
  let rec press_123 key =
    let rec unimplemented () =
      Graphics.open_graph " 660x660";
      Graphics.set_window_title "Camlmon";
      Graphics.set_font
        "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1";
      Graphics.moveto 100 350;
      Graphics.draw_string
        "Feature not yet implemented. Sorry! Please choose again.";
      Graphics.draw_string "Press '1' to go back to main page";
      let rec press_1 key =
        match (wait_next_event [ Key_pressed ]).key with
        | '1' -> menu_screen ()
        | _ -> press_1 key
      in
      press_1 ()
    in
    match (wait_next_event [ Key_pressed ]).key with
    | '1' -> ()
    | '2' -> unimplemented ()
    | '3' -> unimplemented ()
    | _ -> press_123 key
  in
  press_123 ()

let img_size = 60
let pixel_to_position (pos : int * int) : int * int = (1, 1)

let draw_img name coor () =
  let image = Png.load_as_rgb24 name [] in
  let g = Graphic_image.of_image image in
  Graphics.draw_image g
    (fst coor * img_size)
    ((11 - snd coor) * img_size)

(* let draw_bush (coor : int * int) = let image = Png.load_as_rgb24
   "./map_images/bush.png" [] in let g = Graphic_image.of_image image in
   Graphics.draw_image g (fst coor * img_size) ((11 - snd coor) *
   img_size) *)

let bushes =
  [
    (0, 5);
    (0, 6);
    (0, 7);
    (1, 4);
    (1, 5);
    (1, 6);
    (2, 3);
    (2, 4);
    (2, 5);
    (3, 2);
    (3, 3);
    (3, 4);
    (3, 10);
    (4, 1);
    (4, 2);
    (4, 3);
    (4, 4);
    (4, 9);
    (4, 10);
    (5, 0);
    (5, 1);
    (5, 2);
    (5, 8);
    (5, 9);
    (5, 10);
    (6, 0);
    (6, 1);
    (6, 6);
    (6, 7);
    (6, 8);
    (6, 9);
    (7, 0);
    (7, 6);
    (7, 7);
    (7, 8);
    (8, 5);
    (8, 6);
    (8, 7);
    (9, 4);
    (9, 5);
    (9, 6);
    (10, 3);
    (10, 4);
    (10, 5);
  ]

let rec draw_map1_bush list =
  match list with
  | [] -> ()
  | x :: xs ->
      draw_img grass x ();
      draw_map1_bush xs

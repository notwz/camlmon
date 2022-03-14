open Graphics
open Camlimages
open Graphic_image
open Images
open Png

(* brew install libpng *)
(* opam install camlimages  *)
(* opam install oUnit*)

type coordinate = float * float

let draw_canvas () = Graphics.open_graph " 660x660"

let draw_file name coor =
  let img = Png.load name [] in
  let g = Graphic_image.of_image img in
  Graphics.draw_image g (fst coor) (snd coor)

let draw_grass () : unit =
  let image = Png.load_as_rgb24 "./map_images/grass.png" [] in
  let g = Graphic_image.of_image image in
  Graphics.draw_image g 0 0

type direction =
  | N
  | S
  | W
  | E

type tile =
  | Path
  | Bush
  | River

type map_tile = {
  tile_type : tile;
  bottom_left : coordinate;
}

let map1 = []
let map2 = []
let map3 = []
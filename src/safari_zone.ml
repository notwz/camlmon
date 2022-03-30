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

type tile_type =
  | Bush
  | Path
  | Water

type move =
  | Valid
  | Invalid

exception NoMovement

type tile_info = {
  coord : int * int;
  tile : tile_type;
}

let key_map = [ ((340, 0), Path) ]

let append l1 l2 =
  let rec loop acc l1 l2 =
    match (l1, l2) with
    | [], [] -> List.rev acc
    | [], h :: t -> loop (h :: acc) [] t
    | h :: t, l -> loop (h :: acc) t l
  in
  loop [] l1 l2

(** [make_map px x y tile_count tile_type] makes a new map along a
    diagonal. *)
let rec make_map tile_size x y tile_count (tile_type : tile_type) =
  let new_count = tile_count - 1 in
  let new_x = x + tile_size in
  let new_y = y + tile_size in
  let new_tile = ((new_x, y), tile_type) in
  match tile_count with
  | 0 -> []
  | _ -> new_tile :: make_map tile_size new_x y new_count tile_type

let map =
  [
    ((340, 0), Path);
    ((340, 16), Path);
    ((340, 32), Path);
    ((340, 48), Path);
    ((340, 64), Path);
    ((340, 80), Path);
    ((340, 96), Path);
    ((340, 112), Path);
    ((340, 128), Path);
    ((340, 144), Path);
    ((340, 160), Path);
    ((340, 176), Path);
    ((340, 192), Path);
    ((340, 208), Path);
    ((340, 224), Path);
    ((340, 240), Path);
    ((340, 256), Path);
    ((340, 272), Path);
    ((356, 0), Bush);
    ((356, 16), Bush);
    ((356, 32), Bush);
    ((356, 48), Bush);
    ((356, 64), Bush);
    ((356, 80), Bush);
    ((356, 96), Bush);
    ((356, 112), Bush);
    ((356, 128), Bush);
    ((356, 144), Bush);
    ((356, 160), Bush);
    ((356, 176), Bush);
    ((356, 192), Bush);
    ((356, 208), Bush);
    ((356, 224), Bush);
    ((356, 240), Bush);
    ((356, 256), Bush);
    ((356, 272), Bush);
    ((372, 0), Bush);
    ((372, 16), Bush);
    ((372, 32), Bush);
    ((372, 48), Bush);
    ((372, 64), Bush);
    ((372, 80), Bush);
    ((372, 96), Bush);
    ((372, 112), Bush);
    ((372, 128), Bush);
    ((372, 144), Bush);
    ((372, 160), Bush);
    ((372, 176), Bush);
    ((372, 192), Bush);
    ((372, 208), Bush);
    ((372, 224), Bush);
    ((372, 240), Bush);
    ((372, 256), Bush);
    ((372, 272), Bush);
    ((388, 0), Bush);
    ((388, 16), Bush);
    ((388, 32), Bush);
    ((388, 48), Bush);
    ((388, 64), Bush);
    ((388, 80), Bush);
    ((388, 96), Bush);
    ((388, 112), Bush);
    ((388, 128), Bush);
    ((388, 144), Bush);
    ((388, 160), Bush);
    ((388, 176), Bush);
    ((388, 192), Bush);
    ((388, 208), Bush);
    ((388, 224), Bush);
    ((388, 240), Bush);
    ((388, 256), Bush);
    ((388, 272), Bush);
    ((404, 0), Path);
    ((404, 16), Path);
    ((404, 32), Path);
    ((404, 48), Path);
    ((404, 64), Path);
    ((404, 80), Path);
    ((404, 96), Path);
    ((404, 112), Path);
    ((404, 128), Path);
    ((404, 144), Path);
    ((404, 160), Path);
    ((404, 176), Path);
    ((404, 192), Path);
    ((404, 208), Path);
    ((404, 224), Path);
    ((404, 240), Path);
    ((404, 256), Path);
    ((404, 272), Path);
    ((420, 0), Bush);
    ((420, 16), Bush);
    ((420, 32), Bush);
    ((420, 48), Bush);
    ((420, 64), Bush);
    ((420, 80), Bush);
    ((420, 96), Bush);
    ((420, 112), Path);
    ((420, 128), Path);
    ((420, 144), Path);
    ((420, 160), Path);
    ((420, 176), Path);
    ((420, 192), Path);
    ((420, 208), Path);
    ((420, 224), Path);
    ((420, 240), Path);
    ((420, 256), Path);
    ((420, 272), Path);
    ((436, 0), Bush);
    ((436, 16), Bush);
    ((436, 32), Bush);
    ((436, 48), Bush);
    ((436, 64), Bush);
    ((436, 80), Bush);
    ((436, 96), Bush);
    ((436, 112), Bush);
    ((436, 128), Bush);
    ((436, 144), Bush);
    ((436, 160), Bush);
    ((436, 176), Bush);
    ((436, 192), Bush);
    ((436, 208), Bush);
    ((436, 224), Bush);
    ((436, 240), Bush);
    ((436, 256), Bush);
    ((436, 272), Bush);
    ((452, 0), Bush);
    ((452, 16), Bush);
    ((452, 32), Bush);
    ((452, 48), Bush);
    ((452, 64), Bush);
    ((452, 80), Bush);
    ((452, 96), Bush);
    ((452, 112), Bush);
    ((452, 128), Bush);
    ((452, 144), Bush);
    ((452, 160), Bush);
    ((452, 176), Bush);
    ((452, 192), Bush);
    ((452, 208), Bush);
    ((452, 224), Bush);
    ((452, 240), Bush);
    ((452, 256), Bush);
    ((452, 272), Bush);
    ((468, 0), Water);
    ((468, 16), Water);
    ((468, 32), Water);
    ((468, 48), Water);
    ((468, 64), Water);
    ((468, 80), Water);
    ((468, 96), Water);
    ((468, 112), Water);
    ((468, 128), Water);
    ((468, 144), Water);
    ((468, 160), Water);
    ((468, 176), Water);
    ((468, 192), Water);
    ((468, 208), Water);
    ((468, 224), Water);
    ((468, 240), Water);
    ((468, 256), Water);
    ((468, 272), Water);
    ((484, 0), Water);
    ((484, 16), Water);
    ((484, 32), Water);
    ((484, 48), Water);
    ((484, 64), Water);
    ((484, 80), Water);
    ((484, 96), Water);
    ((484, 112), Water);
    ((484, 128), Water);
    ((484, 144), Water);
    ((484, 160), Water);
    ((484, 176), Water);
    ((484, 192), Water);
    ((484, 208), Water);
    ((484, 224), Water);
    ((484, 240), Water);
    ((484, 256), Water);
    ((484, 272), Water);
    ((500, 0), Water);
    ((500, 16), Water);
    ((500, 32), Water);
    ((500, 48), Water);
    ((500, 64), Water);
    ((500, 80), Water);
    ((500, 96), Water);
    ((500, 112), Water);
    ((500, 128), Water);
    ((500, 144), Water);
    ((500, 160), Water);
    ((500, 176), Water);
    ((500, 192), Water);
    ((500, 208), Water);
    ((500, 224), Water);
    ((500, 240), Water);
    ((500, 256), Water);
    ((500, 272), Water);
    ((516, 0), Bush);
    ((516, 16), Bush);
    ((516, 32), Bush);
    ((516, 48), Bush);
    ((516, 64), Bush);
    ((516, 80), Bush);
    ((516, 96), Bush);
    ((516, 112), Bush);
    ((516, 128), Bush);
    ((516, 144), Bush);
    ((516, 160), Bush);
    ((516, 176), Bush);
    ((516, 192), Bush);
    ((516, 208), Bush);
    ((516, 224), Bush);
    ((516, 240), Bush);
    ((516, 256), Bush);
    ((516, 272), Bush);
    ((532, 0), Bush);
    ((532, 16), Bush);
    ((532, 32), Bush);
    ((532, 48), Bush);
    ((532, 64), Bush);
    ((532, 80), Bush);
    ((532, 96), Bush);
    ((532, 112), Bush);
    ((532, 128), Bush);
    ((532, 144), Bush);
    ((532, 160), Bush);
    ((532, 176), Bush);
    ((532, 192), Bush);
    ((532, 208), Bush);
    ((532, 224), Bush);
    ((532, 240), Bush);
    ((532, 256), Bush);
    ((532, 272), Bush);
    ((548, 0), Path);
    ((548, 16), Path);
    ((548, 32), Path);
    ((548, 48), Path);
    ((548, 64), Path);
    ((548, 80), Path);
    ((548, 96), Path);
    ((548, 112), Path);
    ((548, 128), Path);
    ((548, 144), Path);
    ((548, 160), Path);
    ((548, 176), Path);
    ((548, 192), Path);
    ((548, 208), Path);
    ((548, 224), Path);
    ((548, 240), Path);
    ((548, 256), Path);
    ((548, 272), Path);
    ((564, 0), Bush);
    ((564, 16), Bush);
    ((564, 32), Bush);
    ((564, 48), Bush);
    ((564, 64), Bush);
    ((564, 80), Bush);
    ((564, 96), Bush);
    ((564, 112), Bush);
    ((564, 128), Bush);
    ((564, 144), Bush);
    ((564, 160), Bush);
    ((564, 176), Bush);
    ((564, 192), Bush);
    ((564, 208), Bush);
    ((564, 224), Bush);
    ((564, 240), Bush);
    ((564, 256), Bush);
    ((564, 272), Bush);
    ((580, 0), Bush);
    ((580, 16), Bush);
    ((580, 32), Bush);
    ((580, 48), Bush);
    ((580, 64), Bush);
    ((580, 80), Bush);
    ((580, 96), Bush);
    ((580, 112), Bush);
    ((580, 128), Bush);
    ((580, 144), Bush);
    ((580, 160), Bush);
    ((580, 176), Bush);
    ((580, 192), Bush);
    ((580, 208), Bush);
    ((580, 224), Bush);
    ((580, 240), Bush);
    ((580, 256), Bush);
    ((580, 272), Bush);
    ((596, 0), Water);
    ((596, 16), Water);
    ((596, 32), Water);
    ((596, 48), Water);
    ((596, 64), Water);
    ((596, 80), Water);
    ((596, 96), Water);
    ((596, 112), Water);
    ((596, 128), Water);
    ((596, 144), Water);
    ((596, 160), Water);
    ((596, 176), Water);
    ((596, 192), Water);
    ((596, 208), Water);
    ((596, 224), Water);
    ((596, 240), Water);
    ((596, 256), Water);
    ((596, 272), Water);
  ]

let clear_window color =
  let fg = foreground in
  set_color color;
  fill_rect 0 0 (size_x ()) (size_y ());
  set_color fg

let trainer_still = "public/trainer_images/trainer_still.png"

(** ==============================================================

    Tiles are 16x16 pixels big.

    Game display window is 600px x 720px.

    Thus, can fit 37 Tiles Wide and 45 Tiles High.

    The actual graphics window is 1280px so 80 Tiles long.

    Display Guide:

    - X-COORD: Starting at x = 340 start painting tiles at any position
      340 + 16x
    - Y-COORD: any y position that is a mulitple of 16

    ============================================================== *)
let grass_tile = "public/map_images/grass_tile.png"

let water_tile = "public/map_images/water_tile.png"
let path_tile = "public/map_images/path_tile.png"

let draw_img name (coor : int * int) () =
  let img = Png.load name [] in
  let g = Graphic_image.of_image img in
  Graphics.draw_image g (fst coor * 1) (snd coor * 1)

let draw_trainer name (coor : int * int) () =
  let img = Png.load_as_rgb24 name [] in
  let g = Graphic_image.of_image img in
  Graphics.draw_image g (fst coor * 1) (snd coor * 1)

let paint_row tile count x y () =
  for i = 0 to count do
    draw_img tile (x + (16 * i), y) ()
  done;
  ()

let paint_map map () =
  let len = List.length map in
  for i = 0 to len - 1 do
    let coord = fst (List.nth map i) in
    let tile =
      match snd (List.nth map i) with
      | Bush -> grass_tile
      | Path -> path_tile
      | Water -> water_tile
    in
    draw_img tile coord ()
  done;
  ()

let tile_info coord map () =
  try
    let b = List.assoc coord map in
    let tile_type =
      match b with
      | Bush -> "Bush"
      | Path -> "Path"
      | Water -> "Water"
    in
    set_color cyan;
    moveto 100 360;
    draw_string
      ("Current location is "
      ^ string_of_int (fst coord)
      ^ ", "
      ^ string_of_int (snd coord));
    moveto 100 330;
    draw_string ("Current tile is " ^ tile_type)
  with Not_found -> ()

let trainer_info (state : Trainer.t) () =
  let name = get_trainer_name state in
  set_color cyan;
  moveto 100 420;
  draw_string "Trainer Info: ";
  moveto 100 390

let parse_command key x y =
  match key with
  | Up -> if y > 704 then Invalid else Valid
  | Right -> if x > 920 then Invalid else Valid
  | Left -> if x = 340 then Invalid else Valid
  | Down -> if y = 0 || y < 15 then Invalid else Valid

let rec safari state x y () =
  try
    clear_graph ();
    clear_window black;
    moveto 500 500;
    let row1 = make_map 45 295 0 14 Path in
    let row2 = make_map 45 295 45 14 Bush in
    let row3 = make_map 45 295 90 14 Bush in
    let row4 = make_map 45 295 135 14 Bush in
    let row5 = make_map 45 295 180 14 Bush in
    let row6 = make_map 45 295 225 14 Bush in
    let row7 = make_map 45 295 270 14 Path in
    let row8 = make_map 45 295 315 14 Water in
    let row9 = make_map 45 295 360 14 Water in
    let row10 = make_map 45 295 405 14 Path in
    let row12 = make_map 45 295 450 14 Bush in
    let row13 = make_map 45 295 495 14 Bush in
    let row14 = make_map 45 295 540 14 Bush in
    let row15 = make_map 45 295 585 14 Bush in
    let row16 = make_map 45 295 630 14 Bush in
    let row17 = make_map 45 295 675 14 Path in
    let new_map = append row1 row2 in
    let new_map = append new_map row3 in
    let new_map = append new_map row4 in
    let new_map = append new_map row5 in
    let new_map = append new_map row6 in
    let new_map = append new_map row7 in
    let new_map = append new_map row8 in
    let new_map = append new_map row9 in
    let new_map = append new_map row10 in
    let new_map = append new_map row12 in
    let new_map = append new_map row13 in
    let new_map = append new_map row14 in
    let new_map = append new_map row15 in
    let new_map = append new_map row16 in
    let new_map = append new_map row17 in
    paint_map new_map ();
    moveto 420 420;
    set_color black;
    draw_trainer trainer_still (x, y) ();
    tile_info (x, y) new_map ();
    trainer_info state ();
    let e = wait_next_event [ Key_pressed ] in
    let user_command =
      match e.key with
      | 'w' -> Up
      | 'a' -> Left
      | 'd' -> Right
      | 's' -> Down
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoMovement
    in
    let valid_move_check = parse_command user_command x y in
    if valid_move_check = Valid then (
      let new_render =
        match user_command with
        | Up -> safari state x (y + 45) ()
        | Left -> safari state (x - 45) y ()
        | Right -> safari state (x + 45) y ()
        | Down -> safari state x (y - 45) ()
      in
      new_render;
      ())
    else raise NoMovement
  with NoMovement -> safari state x y ()

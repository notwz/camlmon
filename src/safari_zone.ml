open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore
open Lib
open Trainer
open Encounter

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

let rec make_row tile_size x y tile_count (tile_type : tile_type) =
  let new_count = tile_count - 1 in
  let new_x = x + tile_size in
  let new_tile = ((new_x, y), tile_type) in
  match tile_count with
  | 0 -> []
  | _ -> new_tile :: make_map tile_size new_x y new_count tile_type

let rec smart_make_map lst y =
  let final_map = lst in
  let tile_type =
    if y < 200 then Path else if y < 400 then Bush else Water
  in
  match y with
  | 720 -> final_map
  | _ ->
      let new_row = make_row 45 295 y 13 tile_type in
      let new_y = y + 45 in
      let final_map = append final_map new_row in
      smart_make_map final_map new_y

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

let get_tile_type coord map =
  let b = List.assoc coord map in
  let tile_type =
    match b with
    | Bush -> "Bush"
    | Path -> "Path"
    | Water -> "Water"
  in
  tile_type

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
    let new_map = smart_make_map [] 0 in
    paint_map new_map ();
    moveto 420 420;
    set_color black;
    draw_trainer trainer_still (x, y) ();
    tile_info (x, y) new_map ();
    trainer_info state ();
    if get_tile_type (x, y) new_map = "Bush" then encounter_gui ();
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

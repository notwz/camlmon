open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Lib
open Trainer
open Battle_encounter
open Pokemon
open P_state
open Gui_library

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
(** Raised when no movement should occur*)

type tile_info = {
  coord : int * int;
  tile : tile_type;
}
(** The abstract type representing a tile*)

let grass_tile = "public/map_images/grass_tile.png"
let water_tile = "public/map_images/water_tile.png"
let path_tile = "public/map_images/path_tile.png"
let trainer_still = "public/trainer_images/trainer_still.png"

(** [append l1 l2] is the list with list [l2] appended to list [l1]*)
let append l1 l2 =
  let rec loop acc l1 l2 =
    match (l1, l2) with
    | [], [] -> List.rev acc
    | [], h :: t -> loop (h :: acc) [] t
    | h :: t, l -> loop (h :: acc) t l
  in
  loop [] l1 l2

(** [make_map px x y tile_count tile_type] is a new map made up of tiles
    with tile size [px], number of tiles [tile_count], tile type
    [tile_type], coodinates represented by [x] and [y], along a
    diagonal. *)
let rec make_map tile_size x y tile_count (tile_type : tile_type) =
  let new_count = tile_count - 1 in
  let new_x = x + tile_size in
  let new_tile = ((new_x, y), tile_type) in
  match tile_count with
  | 0 -> []
  | _ -> new_tile :: make_map tile_size new_x y new_count tile_type

(** [smart_make_map lst y] makes a map from the tile list [lst] and tile
    type of a row depend on the converted coordinate [y]*)
let rec smart_make_map lst y =
  let final_map = lst in
  let tile_type =
    if y < 200 then Path else if y < 400 then Bush else Water
  in
  match y with
  | 720 -> final_map
  | _ ->
      let new_row = make_map 45 295 y 14 tile_type in
      let new_y = y + 45 in
      let final_map = append final_map new_row in
      smart_make_map final_map new_y

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

(** [paint_row n c x y] paints tile with tile image named [n] [c] times
    in a role using bottom left corner coordinates [x] and [y]*)
let paint_row tile count x y () =
  for i = 0 to count do
    draw_img tile (x + (16 * i), y) ()
  done;
  ()

(** [paint_map map] paints map using Graphics *)
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

(** [tile_info c m] paints coordinate and tile type of tile at
    coordinate [c] in map [m]. *)
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
    moveto 60 360;
    draw_string
      ("Current location is "
      ^ string_of_int (fst coord)
      ^ ", "
      ^ string_of_int (snd coord));
    moveto 60 330;
    draw_string ("Current tile is " ^ tile_type)
  with Not_found -> ()

(** [get_tile_type c m] is the tile type of the tile placed at [c]
    location of the map [m] *)
let get_tile_type coord map =
  let b = List.assoc coord map in
  let tile_type =
    match b with
    | Bush -> "Bush"
    | Path -> "Path"
    | Water -> "Water"
  in
  tile_type

(** [trainer_info st] retrieves and paints the trainer [st] 's name on
    game screen *)
let trainer_info (state : Trainer.t) () =
  (* let name = get_trainer_name state in *)
  set_color cyan;
  moveto 100 420;
  draw_string "Trainer Info: "

(** [parse_command key x y] is [Valid] iff the x and y are in the
    correct range*)
let parse_command key x y =
  match key with
  | Up -> if y > 704 then Invalid else Valid
  | Right -> if x > 920 then Invalid else Valid
  | Left -> if x = 340 then Invalid else Valid
  | Down -> if y = 0 || y < 15 then Invalid else Valid

let rec safari (state : Trainer.t ref) x y () =
  try
    clear_graph ();
    clear_window black;
    moveto 500 500;
    let new_map = smart_make_map [] 0 in
    paint_map new_map ();
    moveto 420 420;
    set_color black;
    draw_img trainer_still (x, y) ();
    tile_info (x, y) new_map ();
    trainer_info !state ();
    synchronize ();
    let b = List.assoc (x, y) new_map in
    if b = Bush then enc state x y ();
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

(** [enc state x y] triggers an encounter with pokemon and battle with
    it*)
and enc state x y () =
  Random.self_init ();
  let enc = Random.int 10 in
  let pokemon =
    Random.self_init ();
    let n = Random.int pokemons_len in
    saf_ran_pokemon n
  in
  if enc = 1 then battle_encounter_main pokemon 0 0 ()

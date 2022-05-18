open Graphics
open Graphic_image
open Camlimages
open Images
open Png
open Printf
open Explore
open Lib

let charmander = "public/menu_images/charmander.png"

type coordiante = int * int

let grass_tile = "public/map_images/grass_tile.png"
let water_tile = "public/map_images/water_tile.png"
let path_tile = "public/map_images/path_tile.png"
let trainer_still = "public/trainer_images/trainer_still.png"
let panel_color = rgb 151 199 218
let panel_border_1 = rgb 27 34 64
let panel_border_2 = rgb 165 119 26
let grey = rgb 160 160 160
let bg_1 = rgb 255 243 224
let bg_2 = rgb 255 224 178
let bg_3 = rgb 255 183 77
let bg_4 = rgb 255 152 0
let bg_5 = rgb 255 140 0
let bg_6 = rgb 239 108 0
let x_res : int = 1280
let y_res : int = 720
let window_res : coordiante = (x_res, y_res)
let dialogue_x = 340
let dialogue_y = 0
let dialogue_width = 600
let dialogue_height = 200
let main_width = dialogue_width
let main_height = y_res - dialogue_height
let main_x = dialogue_x
let main_y = dialogue_y + dialogue_height
let img_size : int = 60
let panel_outline = 3
let item_x_d (width : int) = (x_res - width) / 2
let item_y_d (width : int) = (y_res - width) / 2
let game_x = 340
let game_y = 0
let game_w = 600
let game_h = 720

let draw_img name (coor : int * int) () =
  let img = Png.load_as_rgb24 name [] in
  let g = Graphic_image.of_image img in
  Graphics.draw_image g (fst coor) (snd coor)

let clear_window color =
  let fg = foreground in
  set_color color;
  fill_rect 0 0 (size_x ()) (size_y ());
  set_color fg
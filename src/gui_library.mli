(** The module Gui_library contains constants and functions that can be
    used across files for gui*)

open Graphics

val panel_color : color
(** [panel_color] is the panel color*)

val panel_border_1 : color
(** [panel_border_1] is the color of panel's outside contour *)

val panel_border_2 : color
(** [panel_border_2] is the color of panel's inside contour *)

val bg_1 : color
(** [panel_border_2] is one of the background color *)

val grey : color
(** [grey] is the grey color *)

val charmander : string
(** [charmander] is the address to the image charmander.jpg*)

val x_res : int
(** [x_res] is the width of the whole canvas drawn*)

val y_res : int
(** [x_res] is the height of the whole canvas drawn*)

val dialogue_x : int
(** [dialogue_x] is the bottom left x coordinate of dialogue text box*)

val dialogue_y : int
(** [dialogue_y] is the bottom left y coordinate of dialogue text box*)

val dialogue_width : int
(** [dialogue_width] is the width of dialogue text box*)

val dialogue_height : int
(** [dialogue_height] is the height of dialogue text box*)

val main_width : int
(** [main_width] is the width of main window*)

val main_x : int
(** [main_x] is the bottom left x coordinate of main window*)

val main_y : int
(** [main_x] is the bottom left y coordinate of main window*)

val item_x_d : int -> int
(** [item_x_d x] is the bottom left x coordinate of the item to be drawn*)

val item_y_d : int -> int
(** [item_x_d y] is the bottom left y coordinate of the item to be drawn*)

val clear_window : color -> unit
(** [clear_window c] paints the whole window with color c *)

val draw_img : string -> int * int -> unit -> unit
(** [draw_img n coor ()] draws the image with address n at coordinate
    coor*)

val game_x : color
(** [game_x] is the x coordinate of bottom left corner of the game
    screen *)

val game_y : color
(** [game_y] is the y coordinate of bottom left corner of the game
    screen *)

val game_w : color
(** [game_w] is the width of the game screen *)

val game_h : color
(** [game_h] is the height of the game screen *)
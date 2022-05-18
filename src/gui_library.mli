open Graphics

val panel_color : color
val panel_border_1 : color
val panel_border_2 : color
val bg_1 : color
val bg_2 : color
val bg_3 : color
val bg_4 : color
val bg_5 : color
val bg_6 : color
val grey : color
val charmander : string
val x_res : int
val y_res : int
val dialogue_x : int
val dialogue_y : int
val dialogue_width : int
val dialogue_height : int
val main_width : int
val main_height : int
val main_x : int
val main_y : int
val panel_outline : int
val item_x_d : int -> int
val item_y_d : int -> int
val clear_window : color -> unit
val draw_img : string -> int * int -> unit -> unit
val draw_img_rgb : string -> int * int -> unit -> unit
val grass_tile : string
val path_tile : string
val water_tile : string
val trainer_still : string

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
(** battle_main is where battling occurs, it contains information about
    trainer's pokemon, the enemy pokemon, and their respective moves *)

open Lib

val battle_main : int -> int -> unit -> unit
(** [battle_main] is where user can battle with another pokemon by
    selecting possible moves, eventually the user or the enemy will win,
    and user can choose to battle again or quit *)
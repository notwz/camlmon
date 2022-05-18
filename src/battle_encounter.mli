(** battle_encounter is where catching and battling occurs after
    encountering a pokemon in safari zone, it contains information about
    trainer's pokemon, the enemy pokemon, and their respective moves.
    Also includes information about catching state *)

open Lib

val battle_encounter_main : Pokemon.t -> int -> int -> unit -> unit
(** [battle_encounter_main] is where encounter and battling occur when
    user encounters a pokemon while exploring safari zone. The user can
    try to catch the pokemon or battle with pokemon *)

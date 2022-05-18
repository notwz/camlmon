open Lib

type command =
  | Up
  | Left
  | Right
  | Down
      (** The abstract type of values representing user command to move
          trainer *)

val safari : Trainer.t ref -> int -> int -> unit -> unit
(** [safari t x y] paints the safari zone map and information about
    trainer [t], the trainer is initialized at coordinate (x,y) and can
    move around using keyboard commands to explore the map. During the
    process the trainer may trigger an encounter with a pokemon and
    interact with it*)

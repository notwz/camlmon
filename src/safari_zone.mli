open Lib

type command =
  | Up
  | Left
  | Right
  | Down
      (** The abstract type of values representing user command to move
          trainer *)

val safari : Trainer.t ref -> int -> int -> unit -> unit

open Lib

type command =
  | Up
  | Left
  | Right
  | Down

val safari : Trainer.t -> int -> int -> unit -> unit

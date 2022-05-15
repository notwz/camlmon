open Lib

type command =
  | Up
  | Left
  | Right
  | Down

val safari : Trainer.t ref -> int -> int -> unit -> unit

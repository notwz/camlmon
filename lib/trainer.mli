type t
(** The abstract type of values repesenting trainers. *)

val get_pokemon : t -> Pokemon.t list
(** [get_pokemon t] is the list of the pokemon that trainer [t] has in
    his party. *)

val init_trainer : string -> int -> t
(** [init_trainer s n] is a trainer with name [s] and id [n]. *)

val set_trainer_name : string -> t -> t
(** [set_trainer_name n st] is trainer [st] with name set to [n]*)

val get_trainer_name : t -> string
(** [get_trainer_name st] is the name of trainer [st]*)

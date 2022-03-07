type t
(** The abstract type of values repesenting trainers. *)

val get_pokemon : t -> Pokemon.t list
(** [get_pokemon t] returns a list of the pokemon that trainer [t] has
    in his party. *)

val init_trainer : string -> int -> t
(** [init_trainer s n] returns a trainer with name s and id n. *)
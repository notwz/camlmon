type t
(** The abstract type of values repesenting trainers. *)

val get_name : t -> string
(** [get_name t] returns the name of trainer [t]. *)

val get_pokemon : t -> Pokemon.t list
(** [get_pokemon t] returns a list of the pokemon that trainer [t] has
    in his party. *)

val init_trainer : string -> int -> t
(** [init_trainer s n] returns a trainer with name s and id n. *)

val set_trainer_name : string -> t -> t
(** [set_trainer_name n st] changes the trainer's name to [n] given state [st] *)
val get_trainer_name : t -> string
(** [get_trainer_name st] retreives the trainer's name to given state [st] *)

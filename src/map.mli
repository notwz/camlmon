(** Representation of the world when the user is in explorer mode. *)

type t

val init_map : Trainer.t -> t
(** [init_map trainer] creates an initial map with trainer t in a t_state. *)

val pp_map : t -> string
(** [pp_map t] returns a string representation of the map. *)
(** Representation of the trainer state while in explorer mode *)

type t

val init_t_state : Trainer.t -> t
(** [init_t_state] returns a t_state with trainer [t] at the default position. *)

val get_location : Trainer.t -> int * int
(** [get_location t] returns the location of the trainer in the map. *)
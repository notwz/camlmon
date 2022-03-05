(** Representation of the trainer state while in explorer mode *)

type t

val init_t_state : Trainer.t -> t
(** [init_t_state t] returns a t_state with trainer [t] at the default position. *)

val get_location : t -> int * int
(** [get_location t] returns the location of the trainer in the map. *)

val move_up : t -> t
(** [move_up t] returns the state after the trainer is moved up one square. *)

val move_down : t -> t
(** [move_down t] returns the state after the trainer is moved down one square. *)

val move_left : t -> t
(** [move_left t] returns the state after the trainer is moved left one square. *)

val move_right : t -> t
(** [move_right t] returns the state after the trainer is moved right one square. *)
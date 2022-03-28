(** Representation of the trainer state while in explorer mode *)

type t

exception OutOfBoundsMove of (int * int)

val init_t_state : Trainer.t -> t
(** [init_t_state t] returns a t_state with trainer [t] at the default
    position. *)

val get_location : t -> int * int
(** [get_location t] returns the location of the trainer in the map. *)

val move_up : t -> t
(** [move_up t] returns the state after the trainer is moved up one
    square. @raises [OutOfBoundsMove pos] with the current position if
    move places trainer out of bound. *)

val move_down : t -> t
(** [move_down t] returns the state after the trainer is moved down one
    square. @raises [OutOfBoundsMove pos] with the current position if
    move places trainer out of bound. *)

val move_left : t -> t
(** [move_left t] returns the state after the trainer is moved left one
    square. @raises [OutOfBoundsMove pos] with the current position if
    move places trainer out of bound. *)

val move_right : t -> t
(** [move_right t] returns the state after the trainer is moved right
    one square. @raises [OutOfBoundsMove pos] with the current position
    if move places trainer out of bound. *)

val get_trainer : t -> Trainer.t
(** [get_trainer t] returns the trainer in trainer state [t]. *)
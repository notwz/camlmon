(** Representation of the trainer state while in explorer mode *)

type t
(** The abstract type representing a trainer state *)

exception OutOfBoundsMove of (int * int)
(** Raised when the trainer attempts to move but is at the boundary of
    map *)

val init_t_state : Trainer.t -> t
(** [init_t_state t] is the t_state with trainer [t] at the default
    position. *)

val get_location : t -> int * int
(** [get_location t] is the location of the trainer [t] in the map. *)

val move_up : t -> t
(** [move_up t] is the trainer state after the trainer [t] is moved up
    one square.
    @raise [OutOfBoundsMove pos] with the current position if move places trainer out of bound. *)

val move_down : t -> t
(** [move_down t] returns the trainer state after the trainer [t] is moved down one
    square. @raises [OutOfBoundsMove pos] with the current position if move places trainer out of bound. *)

val move_left : t -> t
(** [move_left t] returns the trainer state after the trainer [t] is moved left one
    square. 
    @raises [OutOfBoundsMove pos] with the current position if
    move places trainer out of bound. *)

val move_right : t -> t
(** [move_right t] returns the trainer state after the trainer [t] is moved right
    one square. 
    @raises [OutOfBoundsMove pos] with the current position
    if move places trainer out of bound. *)

val get_trainer : t -> Trainer.t
(** [get_trainer t] is the trainer in trainer state [t]. *)
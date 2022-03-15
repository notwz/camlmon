(** Representation of the world when the user is in explorer mode. *)

type t

val init_map_a : T_state.t -> t
(** [init_map_a trainer] creates an initial map A with trainer t in a
    t_state. *)

val init_map_b : T_state.t -> t
(** [init_map_a trainer] creates an initial map B with trainer t in a
    t_state. *)

val init_map : T_state.t -> t
(** [init_map trainer] creates an initial map with trainer t in a
    t_state. *)

val pp_map : t -> string
(** [pp_map t trainer] returns a string representation of the map with
    the trainer. *)

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

(*(* * Representation of the world when the user is in explorer mode. *)

  type t

  val init_map_a : T_state.t -> t (** [init_map_a trainer] is the
  initial map A with trainer t in a t_state. *)

  val init_map_b : T_state.t -> t (** [init_map_a trainer] is the
  initial map B with trainer t in a t_state. *)

  val init_map : T_state.t -> t (** [init_map trainer] is the initial
  map with trainer t in a t_state. *)

  val get_t_state : t -> T_state.t (** [get_t_state t ] is the trainer
  state of map t*)

  val get_bush : t -> (int * int) list (** [get_t_state t ] is the
  bushes coordinate of map t*)

  val get_puddles : t -> (int * int) list (** [get_t_state t ] is the
  puddles coordinate of map t*)

  val get_rocks : t -> (int * int) list (** [get_t_state t ] is the
  rocks coordinate of map t*)

  val pp_map : t -> string (** [pp_map t trainer] is a string
  representation of the map with the trainer. *)

  val move_up : t -> t (** [move_up t] is the state after the trainer is
  moved up one square. @raises [OutOfBoundsMove pos] with the current
  position if move places trainer out of bound. *)

  val move_down : t -> t (** [move_down t] is the state after the
  trainer is moved down one square. @raises [OutOfBoundsMove pos] with
  the current position if move places trainer out of bound. *)

  val move_left : t -> t (** [move_left t] is the state after the
  trainer is moved left one square. @raises [OutOfBoundsMove pos] with
  the current position if move places trainer out of bound. *)

  val move_right : t -> t (** [move_right t] is the state after the
  trainer is moved right one square. @raises [OutOfBoundsMove pos] with
  the current position if move places trainer out of bound. *)

  val get_trainer_state : t -> T_state.t (** [get_trainer_state t] is
  the trainer state of the trainer inside of map [t]. *)*)

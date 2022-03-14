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

val pp_map : t -> T_state.t -> string
(** [pp_map t trainer] returns a string representation of the map with
    the trainer. *)

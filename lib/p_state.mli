(** Representation of the pokemon state. This module represents the
    state of the pokemon within a battle. *)

type t
(** The abstract type representing a pokemon's state *)

type move
(** The abstract type representing a pokemon's move *)

exception InvalidMove
(** Raised when move is not found in move list *)

val pokemon_name : t -> string
(** [pokemon_name p] is the name of pokemon [p] *)

val move_name : move -> string
(** [move_name m] returns the name of move [m]. *)

val move_pp : move -> int * int
(** [move_pp move] represents the current count and max count of the
    move *)

val init_move : Pokemon.p_move -> move
(** [init_move m] initializes a pokemon's move with the data from
    pokemon move [m]. *)

val init_move_set : Pokemon.t -> move list
(** [init_move_set] initializes a pokemon's move set with the given move
    sets. *)

val init_p_state : Pokemon.t -> t
(** [init_p_state] is a new pokemon state. *)

val valid_move : t -> string -> bool
(** [valid_move] returns true or false if the move is in the pokemon's
    current move set and if the current count of moves left is greater
    than 0. *)

val use_move : move -> move
(** [use_move m] returns the move [m] after it was used once. *)

val use_moves : t -> move -> t
(** [use_move st n] returns the state [st] after it uses a move with
    name [n]. It should decrement the current count of moves left for
    the move it just used. *)

val use_moves_str : t -> string -> t
(** [use_move st n] returns the state [st] after it uses a move with
    name [n]. It should decrement the current count of moves left for
    the move it just used. *)

val calculate_damage : t -> move -> int
(** [calculate_damage p m] returns the damage that move m does to
    pokemon p including both accuracy and how effective the move is. *)

val damaged : t -> int -> t
(** [damaged] returns a new pokemon state after it has been targeted by
    an attack move from opponent pokemon. *)

val get_hp : t -> int
(** [get_hp t] gets the current hp of pokemon [t]. *)

val set_hp : t -> int -> t
(** [set_hp t hp] sets the current hp of pokemon [t] to [hp]. *)

val get_move_set : t -> move list

(* val get_move_info : t -> move *)

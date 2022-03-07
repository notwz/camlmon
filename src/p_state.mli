(** Representation of the pokemon state. This module represents the
    state of the pokemon within a battle. *)

type move
type t

exception InvalidMove
(** Raised when move is found in list *)

val init_move : string -> int -> int -> move 
(** [init_move] initializes a pokemon's move with name and moves left  *)
val init_move_set : move list -> move list
(** [init_move_set] initializes a pokemon's move set with the given move sets  *)
val init_p_state : int -> move list -> t
(** [init_p_state] creates a new pokemon state *)

val valid_move : t -> string -> bool
(** [valid_move] returns true or false if the move is in the pokemon's
    current move set and if the current count of moves left is > 0 *)

val use_move : t -> string -> t
(** [use_move] returns the user's current pokemon's state after it uses
    a move. It should decrement the current count of moves left for the
    move it just used *)

val damaged : t -> int -> t
(** [damaged] returns a new pokemon state after it has been targeted by
    an attack move from opponent pokemon *)

val get_hp : t -> int
(** [get_hp] gets the pokemon's current hp *)

val get_move_set : t -> move list

(* val get_move_info : t -> move *)



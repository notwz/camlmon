(** Representation of the pokemon state. This module represents the
    state of the pokemon within a battle. *)

type moves_left
type t

exception InvalidMove

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

val test_ps_0 : t
(** [test_ps_0] are for testing purposes *)

val test_ps_1 : t
val test_ps_damaged : t
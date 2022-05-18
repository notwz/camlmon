(** Representation of a catch state while in catching mode *)

open P_state

type t
(** The abstract type of values representing the battle state. *)

exception NoWinnerFound
(** Raised when no winner is found when [winner t] is called. *)

val init_state : P_state.t -> P_state.t -> t
(** [init_state p1 p2] is the initial battle state between pokemon of
    the trainer [p1] and enemy pokemon [p2] with [p1] going first. *)

val move : P_state.move -> t -> t

(** [move m t] is the state of the battle state after the pokemon whose
    turn it is uses a move. [t] is the pokemon that uses the move. *)

val b_p1_s : t -> P_state.t
(** [b_p1_s t] takes in battle state and returns in the first pokemon's
    state, which is always the trainer's pokemon. *)

val b_p2_s : t -> P_state.t
(** [b_p2_s t] takes in battle state and returns in the second pokemon's
    state, which is always the enemy's pokemon. *)

val is_done : t -> bool
(** [is_done t] is whether or not the battle state [t] is over. *)

val winner : t -> string
(** [winner t] is the winner of battle state [t]. [winner t] is "e" if
    enemy wins. ie. you, the trainer faint first. [winner t] is "t" if
    you, the trainer wins. ie. the enemy faints first. Raises
    [NoWinnerFound] if the game is not finished. *)

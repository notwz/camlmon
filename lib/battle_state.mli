open P_state

type t
(** the abstract type of values representing the battle state. *)

exception NoWinnerFound
(** raised when no winner is found when [winner t] is called. *)

val init_state : P_state.t -> P_state.t -> t
(** [init_state p1 p2] creates the initial battle state between p1 and
    p2 with p1 going first. p1 is the trainer. p2 is the enemy. *)

val move : P_state.move -> t -> t
(** [move m t] is the state of the battle state after the pokemon whose
    turn it is uses a move.
    [t] is the pokemon that uses the move.  *)

val b_p1_s : t -> P_state.t
(** [b_p1_s t] takes in battle state and returns in the first pokemon's state, 
    which is always the trainer's pokemon. *)
val b_p2_s : t -> P_state.t
(** [b_p2_s t] takes in battle state and returns in the second pokemon's state, 
    which is always the enemy's pokemon. *)

val is_done : t -> bool
(** [is_done t] returns whether or not the battle state t is over. *)

val winner : t -> string
(** [winner t] returns the winner of battle state t. @raises [NoWinnerFound] 
    if the game is not finished. Returns "e" if enemy wins. ie. you, the trainer
        faint first. 
    Returns "t" if you, the trainer wins. ie. the enemy faints first. 
        *)

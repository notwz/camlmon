open P_state

type t
(** The abstract type of values representing the battle state. *)

exception NoWinnerFound
(** Raised when no winner is found when [winner t] is called. *)

val init_state : P_state.t -> P_state.t -> t
(** [init_state p1 p2] is the initial battle state between pokemon of
    the trainer [p1] and enemy pokemon [p2] with [p1] going first. *)

val move : P_state.move -> t -> t
(** [move m t] is the updated state of the battle state [t] after the
    pokemon whose turn it is uses a move [m]. *)

val is_done : t -> bool
(** [is_done t] is whether or not the battle state [t] is over. *)

val winner : t -> string
(** [winner t] is the winner of battle state [t]. [winner t] is "e" if
    enemy wins. ie. you, the trainer faint first. [winner t] is "t" if
    you, the trainer wins. ie. the enemy faints first.

    @raise [NoWinnerFound] if the game is not finished. *)

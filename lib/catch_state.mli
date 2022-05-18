type t
(** The abstract type of values representing catch states. *)

val init_state : t
(** [init_state] is the initial state of the catching part of the game. *)

val catch : t -> t
(** [catch t] is the state that occurs after the user attempts to catch
    the pokemon in state [t]. *)

val bait : t -> t
(** [bait t] is the state that occurs after the user attempts to use
    bait on the pokemon in state [t]. *)

val rock : t -> t
(** [rock t] is the state that occurs after the user attempts to throw a
    rock on the pokemon in state [t]. *)

val caught : t -> bool
(** [caught t] is [true] iff the pokemon has been caught in state [t]. *)

val ran_away : t -> bool
(** [ran_away t] is [true] iff the pokemon has ran away in state [t]. *)

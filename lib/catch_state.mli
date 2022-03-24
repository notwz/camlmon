type t
(** The abstract type of values representing the catch state. *)

val init_state : t
(** [init_state] returns the initial state of the catching part of the
    game. *)

val catch : t -> t
(** [catch t] returns the state that occurs after the user attempts to
    catch the pokemon in state [t]. *)

val bait : t -> t
(** [bait t] returns the state that occurs after the user attempts to
    use bait on the pokemon in state [t]. *)

val rock : t -> t
(** [rock t] returns the state that occurs after the user attempts to
    throw a rock on the pokemon in state [t]. *)

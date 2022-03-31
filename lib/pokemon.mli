type t

type p_type =
  | Normal
  | Fire
  | Water
  | Grass
  | Electric
  | Ice
  | Fighting
  | Poison
  | Ground
  | Flying
  | Psychic
  | Bug
  | Rock
  | Ghost
  | Dark
  | Dragon
  | Steel
  | Fairy

type p_move

val cut : p_move
val strength : p_move
val flamethrower : p_move
val surf : p_move
val leaf_blade : p_move
val thunderbolt : p_move
val thunder : p_move
val ice_beam : p_move
val blizzard : p_move
val close_combat : p_move
val sludge_bomb : p_move
val earthquake : p_move
val fly : p_move
val brave_bird : p_move
val psychic : p_move
val bug_buzz : p_move
val stone_edge : p_move
val shadow_ball : p_move
val crunch : p_move
val dragon_claw : p_move
val flash_cannon : p_move
val moonblast : p_move

val random_pokemon : t
(** [random_pokemon] returns one of the random pokemon stored in our
    data. *)

val get_max_hp : t -> int
(** [get_max_hp t] returns the max hp of pokemon [t]. *)

val get_move_set : t -> p_move list
(** [get_move_set t] returns the list of all the moves pokemon [t]
    knows.*)

val get_move_name : p_move -> string
(** [get_move_name m] returns the name of move [m]. *)

val get_max_pp : p_move -> int
(** [get_max_pp m] returns the maximum amount of power points of move
    [m]. *)

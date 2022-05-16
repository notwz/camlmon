type t

type p_type =
  | Normal
  | Fire
  | Water
  | Electric
  | Grass
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

val tackle : p_move
val cut : p_move
val strength : p_move
val flamethrower : p_move
val surf : p_move
val thunderbolt : p_move
val thunder : p_move
val electroball : p_move
val leaf_blade : p_move
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
val normal_test : t
val fire_test : t
val water_test : t
val electric_test : t
val grass_test : t
val ice_test : t
val fighting_test : t
val poison_test : t
val flying_test : t
val ground_test : t
val psychic_test : t
val bug_test : t
val rock_test : t
val ghost_test : t
val dragon_test : t
val dark_test : t
val steel_test : t
val fairy_test : t
val pikachu : t

val random_pokemon : t
(** [random_pokemon] returns one of the random pokemon stored in our
    data. *)
val random_pokemon_2 : t
(** [random_pokemon_2] returns one of the random pokemon stored in our
    data. *)

val get_pokemon_name : t -> string
(** [get_pokemon_name] returns the name of the pokemon. *)

val get_front_sprite : t -> string 
(** [get_front_sprite] returns the string of img location of the front 
    sprite image of pokemon t. *)
val get_back_sprite : t -> string 
(** [get_back_sprite] returns the string of img location of the back 
    sprite image of pokemon t. *)

val get_max_hp : t -> int
(** [get_max_hp t] returns the max hp of pokemon [t]. *)

val get_move_set : t -> p_move list
(** [get_move_set t] returns the list of all the moves pokemon [t]
    knows.*)

val get_move_name : p_move -> string
(** [get_move_name m] returns the name of move [m]. *)

val get_move_type : p_move -> p_type
(** [get_move_type m] returns the type of move [m]. *)

val get_move_dmg : p_move -> int
(** [get_move_dmg m] returns the damage of move [m]. *)

val get_move_acc : p_move -> int
(** [get_move_acc m] returns the accuracy of move [m]. *)

val get_max_pp : p_move -> int
(** [get_max_pp m] returns the maximum amount of power points of move
    [m]. *)

val calculate_damage : t -> p_move -> int
(** [calculate_damage p m] returns the damage that move m does to
    pokemon p including both accuracy and how effective the move is. *)

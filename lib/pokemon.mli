(** Representation of a pokemon in game *)

type t
(** The abstract type that represents a pokemon *)

(** Represent possible types of pokemon *)
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
(** [p_move] represents the a pokemon move*)

val normal_move : p_move
(** [normal_move] is a type of move*)

val fire_move : p_move
(** [fire_move] is a type of move*)

val water_move : p_move
(** [water_move] is a type of move*)

val electric_move : p_move
(** [electric_move] is a type of move*)

val grass_move : p_move
(** [grass_move] is a type of move*)

val ice_move : p_move
(** [ice_move] is a type of move*)

val fighting_move : p_move
(** [fighting_move] is a type of move*)

val poison_move : p_move
(** [poison_move] is a type of move*)

val ground_move : p_move
(** [ground_move] is a type of move*)

val flying_move : p_move
(** [flying_move] is a type of move*)

val psychic_move : p_move
(** [psychic_move] is a type of move*)

val bug_move : p_move
(** [bug_move] is a type of move*)

val rock_move : p_move
(** [rock_move] is a type of move*)

val ghost_move : p_move
(** [ghost_move] is a type of move*)

val dragon_move : p_move
(** [dragon_move] is a type of move*)

val dark_move : p_move
(** [dark_move] is a type of move*)

val steel_move : p_move
(** [steel_move] is a type of move*)

val fairy_move : p_move
(** [fairy_move] is a type of move*)

val tackle : p_move
(** [tackle] is a type of move*)

val cut : p_move
(** [cut] is a type of move*)

val strength : p_move
(** [strength] is a type of move*)

val flamethrower : p_move
(** [flamethrower] is a type of move*)

val surf : p_move
(** [surf] is a type of move*)

val thunderbolt : p_move
(** [thunderbolt] is a type of move*)

val thunder : p_move
(** [thunder] is a type of move*)

val electroball : p_move
(** [electroball] is a type of move*)

val leaf_blade : p_move
(** [leaf_blade] is a type of move*)

val ice_beam : p_move
(** [ice_beam] is a type of move*)

val blizzard : p_move
(** [blizzard] is a type of move*)

val close_combat : p_move
(** [close_combat] is a type of move*)

val sludge_bomb : p_move
(** [sludge_bomb] is a type of move*)

val earthquake : p_move
(** [earthquake] is a type of move*)

val fly : p_move
(** [fly] is a type of move*)

val brave_bird : p_move
(** [brave_bird] is a type of move*)

val psychic : p_move
(** [psychic] is a type of move*)

val bug_buzz : p_move
(** [bug_buzz] is a type of move*)

val stone_edge : p_move
(** [stone_edge] is a type of move*)

val shadow_ball : p_move
(** [shadow_ball] is a type of move*)

val crunch : p_move
(** [crunch] is a type of move*)

val dragon_claw : p_move
(** [dragon_claw] is a type of move*)

val flash_cannon : p_move
(** [flash_cannon] is a type of move*)

val moonblast : p_move
(** [moonblast] is a type of move*)

val normal_test : t
(** [normal_test] is pokemon of type normal*)

val fire_test : t
(** [fire_test] is pokemon of type fire *)

val water_test : t
(** [water_test] is pokemon of type water*)

val electric_test : t
(** [electric_test] is pokemon of type electric*)

val grass_test : t
(** [grass_test] is pokemon of type grass*)

val ice_test : t
(** [ice_test] is pokemon of type ice*)

val fighting_test : t
(** [fighting_test] is pokemon of type fighting*)

val poison_test : t
(** [poison_test] is pokemon of type poison*)

val flying_test : t
(** [flying_test] is pokemon of type flying*)

val ground_test : t
(** [ground_test] is pokemon of type ground*)

val psychic_test : t
(** [psychic_test] is pokemon of type psychic*)

val bug_test : t
(** [bug_test] is pokemon of type bug*)

val rock_test : t
(** [rock_test] is pokemon of type rock*)

val ghost_test : t
(** [ghost_test] is pokemon of type ghost*)

val dragon_test : t
(** [dragon_test] is pokemon of type dragon*)

val dark_test : t
(** [dark_test] is pokemon of type dark*)

val steel_test : t
(** [steel_test] is pokemon of type steel*)

val fairy_test : t
(** [fairy_test] is pokemon of type fairy*)

val pikachu : t
(** [pikachu] is a pikachu pokemon*)

val random_pokemon : t
(** [random_pokemon] returns one of the random pokemon stored in our
    data. *)

val random_pokemon_2 : t
(** [random_pokemon_2] returns one of the random pokemon stored in our
    data. *)

val saf_ran_pokemon : int -> t
(** [saf_ran_pokemon n] returns the pokemon at index [n] in pokemon
    array. *)

val pokemons_len : int
(** [pokemons_len] is length of pokemon array. *)

val get_pokemon_name : t -> string
(** [get_pokemon_name p] returns the name of the pokemon [p]. *)

val get_move_type_str : t -> string -> string
(** [get_pokemon_name p] returns the name of the pokemon [p]. *)

val get_front_sprite : t -> string
(** [get_front_sprite t] returns the string of img location of the front
    sprite image of pokemon [t]. *)

val get_back_sprite : t -> string
(** [get_back_sprite t] returns the string of img location of the back
    sprite image of pokemon [t]. *)

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

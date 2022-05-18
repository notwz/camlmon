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

type p_move = {
  move_name : string;
  damage : int;
  move_type : p_type;
  accuracy : int;
  max_pp : int;
}

type t = {
  id : int;
  name : string;
  p_type : p_type;
  p_moves : p_move list;
  max_hp : int;
  front_img : string;
  back_img : string;
}

let type_to_str = function
  | Normal -> "Normal"
  | Fire -> "Fire"
  | Water -> "Water"
  | Electric -> "Electric"
  | Grass -> "Grass"
  | Ice -> "Ice"
  | Fighting -> "Fighting"
  | Poison -> "Poison"
  | Ground -> "Ground"
  | Flying -> "Flying"
  | Psychic -> "Psychic"
  | Bug -> "Bug"
  | Rock -> "Rock"
  | Ghost -> "Ghost"
  | Dragon -> "Dragon"
  | Dark -> "Dark"
  | Steel -> "Steel"
  | Fairy -> "Fair"

let get_pokemon_name t = t.name

let get_move_type_str t goal =
  let rec find_move moves goal =
    match moves with
    | h :: t ->
        if h.move_name = goal then h.move_type else find_move t goal
    | _ -> failwith "ERR: pokemon.ml get_move_type -> Move not found."
  in
  let move_type = find_move t.p_moves goal in
  move_type |> type_to_str

let type_to_id = function
  | Normal -> 0
  | Fire -> 1
  | Water -> 2
  | Electric -> 3
  | Grass -> 4
  | Ice -> 5
  | Fighting -> 6
  | Poison -> 7
  | Ground -> 8
  | Flying -> 9
  | Psychic -> 10
  | Bug -> 11
  | Rock -> 12
  | Ghost -> 13
  | Dragon -> 14
  | Dark -> 15
  | Steel -> 16
  | Fairy -> 17

let type_efficacy =
  [
    [
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      0.5;
      0.;
      1.;
      1.;
      0.5;
      1.;
    ];
    [
      1.;
      0.5;
      0.5;
      1.;
      2.;
      2.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      0.5;
      1.;
      0.5;
      1.;
      2.;
      1.;
    ];
    [
      1.;
      2.;
      0.5;
      1.;
      0.5;
      1.;
      1.;
      1.;
      2.;
      1.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      1.;
      1.;
      1.;
    ];
    [
      1.;
      1.;
      2.;
      0.5;
      0.5;
      1.;
      1.;
      1.;
      0.;
      2.;
      1.;
      1.;
      1.;
      1.;
      0.5;
      1.;
      1.;
      1.;
    ];
    [
      1.;
      0.5;
      2.;
      1.;
      0.5;
      1.;
      1.;
      0.5;
      2.;
      0.5;
      1.;
      0.5;
      2.;
      1.;
      0.5;
      1.;
      0.5;
      1.;
    ];
    [
      1.;
      0.5;
      0.5;
      1.;
      2.;
      0.5;
      1.;
      1.;
      2.;
      2.;
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      1.;
    ];
    [
      2.;
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      1.;
      0.5;
      0.5;
      0.5;
      2.;
      0.;
      1.;
      2.;
      2.;
      0.5;
    ];
    [
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      1.;
      0.5;
      0.5;
      1.;
      1.;
      1.;
      0.5;
      0.5;
      1.;
      1.;
      0.;
      2.;
    ];
    [
      1.;
      2.;
      1.;
      2.;
      0.5;
      1.;
      1.;
      2.;
      1.;
      0.;
      1.;
      0.5;
      2.;
      1.;
      1.;
      1.;
      2.;
      1.;
    ];
    [
      1.;
      1.;
      1.;
      0.5;
      2.;
      1.;
      2.;
      1.;
      1.;
      1.;
      1.;
      2.;
      0.5;
      1.;
      1.;
      1.;
      0.5;
      1.;
    ];
    [
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      2.;
      1.;
      1.;
      0.5;
      1.;
      1.;
      1.;
      1.;
      0.;
      0.5;
      1.;
    ];
    [
      1.;
      0.5;
      1.;
      1.;
      2.;
      1.;
      0.5;
      0.5;
      1.;
      0.5;
      2.;
      1.;
      1.;
      0.5;
      1.;
      2.;
      0.5;
      0.5;
    ];
    [
      1.;
      2.;
      1.;
      1.;
      1.;
      2.;
      0.5;
      1.;
      0.5;
      2.;
      1.;
      2.;
      1.;
      1.;
      1.;
      1.;
      0.5;
      1.;
    ];
    [
      0.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      1.;
      1.;
    ];
    [
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      0.;
    ];
    [
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      0.5;
      1.;
      1.;
      1.;
      2.;
      1.;
      1.;
      2.;
      1.;
      0.5;
      1.;
      0.5;
    ];
    [
      1.;
      0.5;
      0.5;
      0.5;
      1.;
      2.;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      1.;
      1.;
      1.;
      0.5;
      2.;
    ];
    [
      1.;
      0.5;
      1.;
      1.;
      1.;
      1.;
      2.;
      0.5;
      1.;
      1.;
      1.;
      1.;
      1.;
      1.;
      2.;
      2.;
      0.5;
      1.;
    ];
  ]

let get_max_hp t = t.max_hp
let get_move_set t = t.p_moves
let get_move_name p_move = p_move.move_name
let get_move_type p_move = p_move.move_type
let get_move_dmg p_move = p_move.damage
let get_move_acc p_move = p_move.accuracy
let get_max_pp p_move = p_move.max_pp

let calculate_damage p p_move =
  let () = Random.self_init () in
  if Random.int 100 < get_move_acc p_move then
    let move_index = p_move |> get_move_type |> type_to_id in
    let p_index = type_to_id p.p_type in
    let scale = List.nth (List.nth type_efficacy move_index) p_index in
    int_of_float ((p_move |> get_move_dmg |> float_of_int) *. scale)
  else 0

(** [create_move n d t a max] is a pokemon move with name [n] damage [d]
    t [t] accuracy [a] max_pp [max]*)
let create_move
    (name : string)
    (damage : int)
    (t : p_type)
    (accuracy : int)
    (max_pp : int) : p_move =
  { move_name = name; damage; move_type = t; accuracy; max_pp }

let normal_move = create_move "normal move" 10 Normal 100 20
let fire_move = create_move "fire move" 10 Fire 100 20
let water_move = create_move "water move" 10 Water 100 20
let electric_move = create_move "electric move" 10 Electric 100 20
let grass_move = create_move "grass move" 10 Grass 100 20
let ice_move = create_move "ice move" 10 Ice 100 20
let fighting_move = create_move "fighting move" 10 Fighting 100 20
let poison_move = create_move "poison move" 10 Poison 100 20
let ground_move = create_move "ground move" 10 Ground 100 20
let flying_move = create_move "flying move" 10 Flying 100 20
let psychic_move = create_move "psychic move" 10 Psychic 100 20
let bug_move = create_move "bug move" 10 Bug 100 20
let rock_move = create_move "rock move" 10 Rock 100 20
let ghost_move = create_move "ghost move" 10 Ghost 100 20
let dragon_move = create_move "dragon move" 10 Dragon 100 20
let dark_move = create_move "dark move" 10 Dark 100 20
let steel_move = create_move "steel move" 10 Steel 100 20
let fairy_move = create_move "Fairy move" 10 Fairy 100 20
let cut = create_move "cut" 50 Normal 100 20
let strength = create_move "strength" 70 Normal 100 10
let tackle = create_move "tackle" 30 Normal 100 40
let flamethrower = create_move "Flamethrower" 90 Fire 100 15
let ember = create_move "Ember" 90 Fire 100 15
let flareblitz = create_move "Flare Blitz" 90 Fire 100 15
let fireblast = create_move "Fire Blast" 90 Fire 100 15
let firespin = create_move "Fire Spin" 90 Fire 100 15
let thundershock = create_move "Thunder Shock" 90 Electric 100 15
let thunderfang = create_move "Thunder Fang" 90 Electric 100 15
let zapcannon = create_move "Zap Cannon" 90 Electric 100 15
let reversal = create_move "Reversal" 90 Fighting 100 15
let highjumpkick = create_move "High Jump Kick" 90 Fighting 100 15
let forcepalm = create_move "Force Palm" 90 Psychic 100 15
let belch = create_move "Belch" 90 Ghost 100 15
let sludge = create_move "Sludge" 90 Ghost 100 15
let rockthrow = create_move "Rock Throw" 90 Rock 100 15
let rockslide = create_move "Rock Slide" 90 Rock 100 15
let thrash = create_move "Thrash" 90 Flying 100 15
let drillpeck = create_move "Drill Peck" 90 Normal 100 15
let pluck = create_move "Pluck" 90 Flying 100 15
let wingattack = create_move "Wing Attack" 90 Flying 100 15
let surf = create_move "surf" 90 Water 100 15
let thunderbolt = create_move "thunderbolt" 90 Electric 100 15
let thunder = create_move "thunder" 110 Electric 70 5
let electroball = create_move "Electroball" 100 Electric 90 10
let leaf_blade = create_move "leaf blade" 90 Grass 100 15
let ice_beam = create_move "ice beam" 90 Ice 100 15
let blizzard = create_move "blizzard" 110 Ice 70 5
let close_combat = create_move "close combat" 100 Fighting 100 10
let sludge_bomb = create_move "sludge bomb" 90 Poison 90 15
let earthquake = create_move "earthquake" 100 Ground 100 15
let fly = create_move "fly" 70 Flying 90 15
let brave_bird = create_move "brave bird" 100 Flying 90 10
let psychic = create_move "psychic" 90 Psychic 100 20
let bug_buzz = create_move "bug buzz" 90 Bug 100 15
let stone_edge = create_move "stone edge" 100 Rock 90 10
let shadow_ball = create_move "shadow ball" 90 Ghost 100 15
let crunch = create_move "crunch" 90 Dark 100 15
let dragon_claw = create_move "dragon claw" 90 Dragon 100 15
let flash_cannon = create_move "flash cannon" 90 Steel 100 15
let moonblast = create_move "moonblast" 90 Fairy 100 15
let splash = create_move "splash" 0 Normal 100 40

(** [make_test i n t m hp f b] is a pokemon with id [i] name [n] p_type
    [t] p_moves [m] max_hp [hp] front_img [f] and back_img [b]*)
let make_test
    (id : int)
    (name : string)
    (p_type : p_type)
    (p_moves : p_move list)
    (max_hp : int)
    (front_img : string)
    (back_img : string) =
  { id; name = "name"; p_type; p_moves; max_hp; front_img; back_img }

let p_move_list = [ tackle; flamethrower; surf; thunderbolt ]
let normal_test = make_test 0 "normal" Normal p_move_list 200 "" ""
let fire_test = make_test 0 "fire" Fire p_move_list 200 "" ""
let water_test = make_test 0 "water" Water p_move_list 200 "" ""

let electric_test =
  make_test 0 "electric" Electric p_move_list 200 "" ""

let grass_test = make_test 0 "grass" Grass p_move_list 200 "" ""
let ice_test = make_test 0 "ice" Ice p_move_list 200 "" ""

let fighting_test =
  make_test 0 "fighting" Fighting p_move_list 200 "" ""

let poison_test = make_test 0 "poison" Poison p_move_list 200 "" ""
let flying_test = make_test 0 "flying" Flying p_move_list 200 "" ""
let ground_test = make_test 0 "ground" Ground p_move_list 200 "" ""
let psychic_test = make_test 0 "psychic" Psychic p_move_list 200 "" ""
let bug_test = make_test 0 "bug" Bug p_move_list 200 "" ""
let rock_test = make_test 0 "rock" Rock p_move_list 200 "" ""
let ghost_test = make_test 0 "ghost" Ghost p_move_list 200 "" ""
let dragon_test = make_test 0 "dragon" Dragon p_move_list 200 "" ""
let dark_test = make_test 0 "dark" Dark p_move_list 200 "" ""
let steel_test = make_test 0 "steel" Steel p_move_list 200 "" ""
let fairy_test = make_test 0 "fairy" Fairy p_move_list 200 "" ""

let pikachu =
  {
    id = 0;
    name = "Pikachu";
    p_type = Electric;
    p_moves = [ tackle; thunderbolt; thunder; electroball ];
    max_hp = 500;
    front_img = "public/pokemon_images/pikachu_f.png";
    back_img = "public/pokemon_images/pikachu_b.png";
  }

let charizard =
  {
    id = 0;
    name = "Charizard";
    p_type = Fire;
    p_moves = [ strength; flamethrower; fly; earthquake ];
    max_hp = 500;
    front_img = "public/pokemon_images/charizard_f.png";
    back_img = "public/pokemon_images/charizard_b.png";
  }

let weezing =
  {
    id = 0;
    name = "Weezing";
    p_type = Ghost;
    p_moves = [ psychic; shadow_ball; crunch; moonblast ];
    max_hp = 500;
    front_img = "public/pokemon_images/weezing_f.png";
    back_img = "public/pokemon_images/weezing_b.png";
  }

let magikarp =
  {
    id = 0;
    name = "Magikarp";
    p_type = Water;
    p_moves = [ surf; splash; splash; splash ];
    max_hp = 500;
    front_img = "public/pokemon_images/magikarp_f.png";
    back_img = "public/pokemon_images/magikarp_b.png";
  }

let rapidash =
  {
    id = 0;
    name = "Rapidash";
    p_type = Fire;
    p_moves = [ flamethrower; flareblitz; fireblast; firespin ];
    max_hp = 500;
    front_img = "public/pokemon_images/rapidash_f.png";
    back_img = "public/pokemon_images/rapidash_b.png";
  }

let dodrio =
  {
    id = 0;
    name = "Dodrio";
    p_type = Flying;
    p_moves = [ thrash; drillpeck; pluck; wingattack ];
    max_hp = 500;
    front_img = "public/pokemon_images/dodrio_f.png";
    back_img = "public/pokemon_images/dodrio_b.png";
  }

let medicham =
  {
    id = 0;
    name = "Medicham";
    p_type = Fighting;
    p_moves = [ thrash; reversal; forcepalm; highjumpkick ];
    max_hp = 500;
    front_img = "public/pokemon_images/medicham_f.png";
    back_img = "public/pokemon_images/medicham_b.png";
  }

let onix =
  {
    id = 0;
    name = "Onix";
    p_type = Rock;
    p_moves = [ rockthrow; stone_edge; earthquake; rockslide ];
    max_hp = 500;
    front_img = "public/pokemon_images/onix_f.png";
    back_img = "public/pokemon_images/onix_b.png";
  }

let raikou =
  {
    id = 0;
    name = "Raikou";
    p_type = Electric;
    p_moves = [ thunderbolt; zapcannon; thundershock; thunderfang ];
    max_hp = 800;
    front_img = "public/pokemon_images/raikou_f.png";
    back_img = "public/pokemon_images/raikou_b.png";
  }

let pokemons =
  [|
    pikachu;
    charizard;
    weezing;
    magikarp;
    rapidash;
    dodrio;
    medicham;
    onix;
    raikou;
  |]

let randomelement arr =
  Random.self_init ();
  let n = Random.int (Array.length arr) in
  Array.get arr n

let random_pokemon = randomelement pokemons
let random_pokemon_2 = randomelement pokemons
let saf_ran_pokemon n = Array.get pokemons n
let pokemons_len = Array.length pokemons
let get_front_sprite t = t.front_img
let get_back_sprite t = t.back_img

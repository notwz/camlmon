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

let get_pokemon_name t = t.name

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
    [ 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 0.5; 0.; 1.; 1.; 0.5; 1. ];
    [
      1.; 0.5; 0.5; 1.; 2.; 2.; 1.; 1.; 1.; 1.; 1.; 2.; 0.5; 1.; 0.5; 1.; 2.; 1.;
    ];
    [
      1.; 2.; 0.5; 1.; 0.5; 1.; 1.; 1.; 2.; 1.; 1.; 1.; 2.; 1.; 0.5; 1.; 1.; 1.;
    ];
    [
      1.; 1.; 2.; 0.5; 0.5; 1.; 1.; 1.; 0.; 2.; 1.; 1.; 1.; 1.; 0.5; 1.; 1.; 1.;
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
      1.; 0.5; 0.5; 1.; 2.; 0.5; 1.; 1.; 2.; 2.; 1.; 1.; 1.; 1.; 2.; 1.; 0.5; 1.;
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
      1.; 1.; 1.; 1.; 2.; 1.; 1.; 0.5; 0.5; 1.; 1.; 1.; 0.5; 0.5; 1.; 1.; 0.; 2.;
    ];
    [ 1.; 2.; 1.; 2.; 0.5; 1.; 1.; 2.; 1.; 0.; 1.; 0.5; 2.; 0.; 0.; 0.; 2.; 0. ];
    [
      1.; 1.; 1.; 0.5; 2.; 1.; 2.; 1.; 1.; 1.; 1.; 2.; 0.5; 1.; 1.; 1.; 0.5; 1.;
    ];
    [ 1.; 1.; 1.; 1.; 1.; 1.; 2.; 2.; 1.; 1.; 0.5; 1.; 1.; 1.; 1.; 0.; 0.5; 1. ];
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
      1.; 2.; 1.; 1.; 1.; 2.; 0.5; 1.; 0.5; 2.; 1.; 2.; 1.; 1.; 1.; 1.; 0.5; 1.;
    ];
    [ 0.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 2.; 1.; 1.; 2.; 1.; 0.5; 1.; 1. ];
    [ 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 1.; 2.; 1.; 0.5; 0. ];
    [
      1.; 1.; 1.; 1.; 1.; 1.; 0.5; 1.; 1.; 1.; 2.; 1.; 1.; 2.; 1.; 0.5; 1.; 0.5;
    ];
    [
      1.; 0.5; 0.5; 0.5; 1.; 2.; 1.; 1.; 1.; 1.; 1.; 1.; 2.; 1.; 1.; 1.; 0.5; 2.;
    ];
    [
      1.; 0.5; 1.; 1.; 1.; 1.; 2.; 0.5; 1.; 1.; 1.; 1.; 1.; 1.; 2.; 2.; 0.5; 1.;
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

let cut =
  {
    move_name = "cut";
    damage = 50;
    move_type = Normal;
    accuracy = 100;
    max_pp = 20;
  }

let strength =
  {
    move_name = "strength";
    damage = 70;
    move_type = Normal;
    accuracy = 100;
    max_pp = 10;
  }

let tackle =
  {
    move_name = "tackle";
    damage = 30;
    move_type = Normal;
    accuracy = 100;
    max_pp = 40;
  }

let flamethrower =
  {
    move_name = "Flamethrower";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let ember =
  {
    move_name = "Ember";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let flareblitz =
  {
    move_name = "Flare Blitz";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let fireblast =
  {
    move_name = "Fire Blast";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let firespin =
  {
    move_name = "Fire Spin";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let thundershock =
  {
    move_name = "Thunder Shock";
    damage = 90;
    move_type = Electric;
    accuracy = 100;
    max_pp = 15;
  }

let thunderfang =
  {
    move_name = "Thunder Fang";
    damage = 90;
    move_type = Electric;
    accuracy = 100;
    max_pp = 15;
  }

let zapcannon =
  {
    move_name = "Zap Cannon";
    damage = 90;
    move_type = Electric;
    accuracy = 100;
    max_pp = 15;
  }

let reversal =
  {
    move_name = "Reversal";
    damage = 90;
    move_type = Fighting;
    accuracy = 100;
    max_pp = 15;
  }

let highjumpkick =
  {
    move_name = "High Jump Kick";
    damage = 90;
    move_type = Fighting;
    accuracy = 100;
    max_pp = 15;
  }

let forcepalm =
  {
    move_name = "Force Palm";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let belch =
  {
    move_name = "Belch";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let sludge =
  {
    move_name = "Sludge";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let rockthrow =
  {
    move_name = "Rock Throw";
    damage = 90;
    move_type = Rock;
    accuracy = 100;
    max_pp = 15;
  }

let rockslide =
  {
    move_name = "Rock Slide";
    damage = 90;
    move_type = Rock;
    accuracy = 100;
    max_pp = 15;
  }

let thrash =
  {
    move_name = "Thrash";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let drillpeck =
  {
    move_name = "Drill Peck";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let pluck =
  {
    move_name = "Pluck";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let wingattack =
  {
    move_name = "Wing Attack";
    damage = 90;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let surf =
  {
    move_name = "surf";
    damage = 90;
    move_type = Water;
    accuracy = 100;
    max_pp = 15;
  }

let thunderbolt =
  {
    move_name = "thunderbolt";
    damage = 90;
    move_type = Electric;
    accuracy = 100;
    max_pp = 15;
  }

let thunder =
  {
    move_name = "thunder";
    damage = 110;
    move_type = Electric;
    accuracy = 70;
    max_pp = 5;
  }

let electroball =
  {
    move_name = "Electroball";
    damage = 100;
    move_type = Electric;
    accuracy = 90;
    max_pp = 10;
  }

let leaf_blade =
  {
    move_name = "leaf blade";
    damage = 90;
    move_type = Grass;
    accuracy = 100;
    max_pp = 15;
  }

let ice_beam =
  {
    move_name = "ice beam";
    damage = 90;
    move_type = Ice;
    accuracy = 100;
    max_pp = 15;
  }

let blizzard =
  {
    move_name = "blizzard";
    damage = 110;
    move_type = Ice;
    accuracy = 70;
    max_pp = 5;
  }

let close_combat =
  {
    move_name = "close combat";
    damage = 100;
    move_type = Fighting;
    accuracy = 100;
    max_pp = 10;
  }

let sludge_bomb =
  {
    move_name = "sludge bomb";
    damage = 90;
    move_type = Poison;
    accuracy = 90;
    max_pp = 15;
  }

let earthquake =
  {
    move_name = "earthquake";
    damage = 100;
    move_type = Ground;
    accuracy = 100;
    max_pp = 15;
  }

let fly =
  {
    move_name = "fly";
    damage = 70;
    move_type = Flying;
    accuracy = 90;
    max_pp = 15;
  }

let brave_bird =
  {
    move_name = "brave bird";
    damage = 100;
    move_type = Flying;
    accuracy = 90;
    max_pp = 10;
  }

let psychic =
  {
    move_name = "psychic";
    damage = 90;
    move_type = Psychic;
    accuracy = 100;
    max_pp = 20;
  }

let bug_buzz =
  {
    move_name = "bug buzz";
    damage = 90;
    move_type = Bug;
    accuracy = 100;
    max_pp = 15;
  }

let stone_edge =
  {
    move_name = "stone edge";
    damage = 100;
    move_type = Rock;
    accuracy = 90;
    max_pp = 10;
  }

let shadow_ball =
  {
    move_name = "shadow ball";
    damage = 90;
    move_type = Ghost;
    accuracy = 100;
    max_pp = 15;
  }

let crunch =
  {
    move_name = "crunch";
    damage = 90;
    move_type = Dark;
    accuracy = 100;
    max_pp = 15;
  }

let dragon_claw =
  {
    move_name = "dragon claw";
    damage = 90;
    move_type = Dragon;
    accuracy = 100;
    max_pp = 15;
  }

let flash_cannon =
  {
    move_name = "flash cannon";
    damage = 90;
    move_type = Steel;
    accuracy = 100;
    max_pp = 15;
  }

let moonblast =
  {
    move_name = "moonblast";
    damage = 90;
    move_type = Fairy;
    accuracy = 100;
    max_pp = 15;
  }

let splash =
  {
    move_name = "splash";
    damage = 0;
    move_type = Normal;
    accuracy = 100;
    max_pp = 40;
  }

let normal_test =
  {
    id = 0;
    name = "normal";
    p_type = Normal;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let fire_test =
  {
    id = 0;
    name = "fire";
    p_type = Fire;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let water_test =
  {
    id = 0;
    name = "water";
    p_type = Water;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let electric_test =
  {
    id = 0;
    name = "electric";
    p_type = Electric;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let grass_test =
  {
    id = 0;
    name = "grass";
    p_type = Grass;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let ice_test =
  {
    id = 0;
    name = "ice";
    p_type = Ice;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let fighting_test =
  {
    id = 0;
    name = "fighting";
    p_type = Fighting;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let poison_test =
  {
    id = 0;
    name = "poison";
    p_type = Poison;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let flying_test =
  {
    id = 0;
    name = "flying";
    p_type = Flying;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let ground_test =
  {
    id = 0;
    name = "ground";
    p_type = Ground;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let psychic_test =
  {
    id = 0;
    name = "psychic";
    p_type = Psychic;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let bug_test =
  {
    id = 0;
    name = "bug";
    p_type = Bug;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let rock_test =
  {
    id = 0;
    name = "rock";
    p_type = Rock;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let ghost_test =
  {
    id = 0;
    name = "ghost";
    p_type = Ghost;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let dragon_test =
  {
    id = 0;
    name = "dragon";
    p_type = Dragon;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let dark_test =
  {
    id = 0;
    name = "dark";
    p_type = Dark;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let steel_test =
  {
    id = 0;
    name = "steel";
    p_type = Steel;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let fairy_test =
  {
    id = 0;
    name = "fairy";
    p_type = Fairy;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
    front_img = "";
    back_img = "";
  }

let pikachu =
  {
    id = 0;
    name = "Pikachu";
    p_type = Electric;
    p_moves = [ tackle; thunderbolt; thunder; electroball ];
    max_hp = 100;
    front_img = "public/pokemon_images/pikachu_f.png";
    back_img = "public/pokemon_images/pikachu_b.png";
  }

let charizard =
  {
    id = 0;
    name = "Charizard";
    p_type = Fire;
    p_moves = [ strength; flamethrower; fly; earthquake ];
    max_hp = 100;
    front_img = "public/pokemon_images/charizard_f.png";
    back_img = "public/pokemon_images/charizard_b.png";
  }

let weezing =
  {
    id = 0;
    name = "Weezing";
    p_type = Ghost;
    p_moves = [ psychic; shadow_ball; crunch; moonblast ];
    max_hp = 100;
    front_img = "public/pokemon_images/weezing_f.png";
    back_img = "public/pokemon_images/weezing_b.png";
  }

let magikarp =
  {
    id = 0;
    name = "Magikarp";
    p_type = Water;
    p_moves = [ surf; splash; splash; splash ];
    max_hp = 200;
    front_img = "public/pokemon_images/magikarp_f.png";
    back_img = "public/pokemon_images/magikarp_b.png";
  }

let rapidash =
  {
    id = 0;
    name = "Rapidash";
    p_type = Fire;
    p_moves = [ flamethrower; flareblitz; fireblast; firespin ];
    max_hp = 200;
    front_img = "public/pokemon_images/rapidash_f.png";
    back_img = "public/pokemon_images/rapidash_b.png";
  }

let dodrio =
  {
    id = 0;
    name = "Dodrio";
    p_type = Flying;
    p_moves = [ thrash; drillpeck; pluck; wingattack ];
    max_hp = 200;
    front_img = "public/pokemon_images/dodrio_f.png";
    back_img = "public/pokemon_images/dodrio_b.png";
  }

let medicham =
  {
    id = 0;
    name = "Medicham";
    p_type = Fighting;
    p_moves = [ thrash; reversal; forcepalm; highjumpkick ];
    max_hp = 200;
    front_img = "public/pokemon_images/medicham_f.png";
    back_img = "public/pokemon_images/medicham_b.png";
  }

let onix =
  {
    id = 0;
    name = "Onix";
    p_type = Rock;
    p_moves = [ rockthrow; stone_edge; earthquake; rockslide ];
    max_hp = 200;
    front_img = "public/pokemon_images/onix_f.png";
    back_img = "public/pokemon_images/onix_b.png";
  }

let raikou =
  {
    id = 0;
    name = "Raikou";
    p_type = Rock;
    p_moves = [ thunderbolt; zapcannon; thundershock; thunderfang ];
    max_hp = 200;
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
let get_front_sprite t = t.front_img
let get_back_sprite t = t.back_img

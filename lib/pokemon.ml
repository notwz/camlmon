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
}

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
      0.;
      0.;
      0.;
      2.;
      0.;
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
    move_name = "flamethrower";
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

let normal_test =
  {
    id = 0;
    name = "normal";
    p_type = Normal;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let fire_test =
  {
    id = 0;
    name = "fire";
    p_type = Fire;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let water_test =
  {
    id = 0;
    name = "water";
    p_type = Water;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let electric_test =
  {
    id = 0;
    name = "electric";
    p_type = Electric;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let grass_test =
  {
    id = 0;
    name = "grass";
    p_type = Grass;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let ice_test =
  {
    id = 0;
    name = "ice";
    p_type = Ice;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let fighting_test =
  {
    id = 0;
    name = "fighting";
    p_type = Fighting;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let poison_test =
  {
    id = 0;
    name = "poison";
    p_type = Poison;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let flying_test =
  {
    id = 0;
    name = "flying";
    p_type = Flying;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let ground_test =
  {
    id = 0;
    name = "ground";
    p_type = Ground;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let psychic_test =
  {
    id = 0;
    name = "psychic";
    p_type = Psychic;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let bug_test =
  {
    id = 0;
    name = "bug";
    p_type = Bug;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let rock_test =
  {
    id = 0;
    name = "rock";
    p_type = Rock;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let ghost_test =
  {
    id = 0;
    name = "ghost";
    p_type = Ghost;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let dragon_test =
  {
    id = 0;
    name = "dragon";
    p_type = Dragon;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let dark_test =
  {
    id = 0;
    name = "dark";
    p_type = Dark;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let steel_test =
  {
    id = 0;
    name = "steel";
    p_type = Steel;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let fairy_test =
  {
    id = 0;
    name = "fairy";
    p_type = Fairy;
    p_moves = [ tackle; flamethrower; surf; thunderbolt ];
    max_hp = 200;
  }

let pikachu =
  {
    id = 0;
    name = "pikachu";
    p_type = Electric;
    p_moves = [ tackle; thunderbolt; thunder ];
    max_hp = 100;
  }

let random_pokemon = pikachu

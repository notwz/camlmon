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

let get_max_hp t = t.max_hp
let get_move_set t = t.p_moves
let get_move_name p_move = p_move.move_name
let get_max_pp p_move = p_move.max_pp

let cut =
  {
    move_name = "cut";
    damage = 5;
    move_type = Normal;
    accuracy = 100;
    max_pp = 20;
  }

let strength =
  {
    move_name = "strength";
    damage = 7;
    move_type = Normal;
    accuracy = 100;
    max_pp = 10;
  }

let tackle =
  {
    move_name = "tackle";
    damage = 3;
    move_type = Normal;
    accuracy = 100;
    max_pp = 40;
  }

let flamethrower =
  {
    move_name = "flamethrower";
    damage = 9;
    move_type = Fire;
    accuracy = 100;
    max_pp = 15;
  }

let surf =
  {
    move_name = "surf";
    damage = 9;
    move_type = Water;
    accuracy = 100;
    max_pp = 15;
  }

let leaf_blade =
  {
    move_name = "leaf blade";
    damage = 9;
    move_type = Grass;
    accuracy = 100;
    max_pp = 15;
  }

let thunderbolt =
  {
    move_name = "thunderbolt";
    damage = 9;
    move_type = Electric;
    accuracy = 100;
    max_pp = 15;
  }

let thunder =
  {
    move_name = "thunder";
    damage = 11;
    move_type = Electric;
    accuracy = 70;
    max_pp = 5;
  }

let ice_beam =
  {
    move_name = "ice beam";
    damage = 9;
    move_type = Ice;
    accuracy = 100;
    max_pp = 15;
  }

let blizzard =
  {
    move_name = "blizzard";
    damage = 11;
    move_type = Ice;
    accuracy = 70;
    max_pp = 5;
  }

let close_combat =
  {
    move_name = "close combat";
    damage = 10;
    move_type = Fighting;
    accuracy = 90;
    max_pp = 10;
  }

let sludge_bomb =
  {
    move_name = "sludge bomb";
    damage = 9;
    move_type = Poison;
    accuracy = 90;
    max_pp = 15;
  }

let earthquake =
  {
    move_name = "earthquake";
    damage = 10;
    move_type = Ground;
    accuracy = 100;
    max_pp = 15;
  }

let fly =
  {
    move_name = "fly";
    damage = 7;
    move_type = Flying;
    accuracy = 90;
    max_pp = 15;
  }

let brave_bird =
  {
    move_name = "brave bird";
    damage = 10;
    move_type = Flying;
    accuracy = 90;
    max_pp = 10;
  }

let psychic =
  {
    move_name = "psychic";
    damage = 9;
    move_type = Psychic;
    accuracy = 100;
    max_pp = 20;
  }

let bug_buzz =
  {
    move_name = "bug buzz";
    damage = 9;
    move_type = Bug;
    accuracy = 100;
    max_pp = 15;
  }

let stone_edge =
  {
    move_name = "stone edge";
    damage = 10;
    move_type = Rock;
    accuracy = 90;
    max_pp = 10;
  }

let shadow_ball =
  {
    move_name = "shadow ball";
    damage = 9;
    move_type = Ghost;
    accuracy = 100;
    max_pp = 15;
  }

let crunch =
  {
    move_name = "crunch";
    damage = 9;
    move_type = Dark;
    accuracy = 100;
    max_pp = 15;
  }

let dragon_claw =
  {
    move_name = "dragon claw";
    damage = 9;
    move_type = Dragon;
    accuracy = 100;
    max_pp = 15;
  }

let flash_cannon =
  {
    move_name = "flash cannon";
    damage = 9;
    move_type = Steel;
    accuracy = 100;
    max_pp = 15;
  }

let moonblast =
  {
    move_name = "moonblast";
    damage = 9;
    move_type = Fairy;
    accuracy = 100;
    max_pp = 15;
  }

let pikachu =
  {
    id = 0;
    name = "pikachu";
    p_type = Electric;
    p_moves = [ tackle; thunderbolt; thunder ];
    max_hp = 10;
  }

let random_pokemon = pikachu

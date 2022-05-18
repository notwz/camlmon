open Pokemon

type move = {
  move_name : string;
  move_data : Pokemon.p_move;
  current_count : int;
  max_count : int;
}

type t = {
  hp : int;
  move_set : move list;
  pokemon : Pokemon.t;
}

let init_move (m : Pokemon.p_move) : move =
  {
    move_name = get_move_name m;
    move_data = m;
    current_count = get_max_pp m;
    max_count = get_max_pp m;
  }

let pokemon_name (pokemon : t) = get_pokemon_name pokemon.pokemon
let move_name m = m.move_name

let init_move_set (pokemon : Pokemon.t) : move list =
  List.map (fun x -> init_move x) (get_move_set pokemon)

let init_p_state (pokemon : Pokemon.t) : t =
  { hp = get_max_hp pokemon; move_set = init_move_set pokemon; pokemon }

exception InvalidMove

let rec find_move move_set (name : string) =
  match move_set with
  | h :: t -> if h.move_name = name then h else find_move t name
  | [] -> raise InvalidMove

let move_pp move = (move.current_count, move.max_count)

let valid_move (state : t) (name : string) : bool =
  try
    let move_info = find_move state.move_set name in
    let move_pp = move_info.current_count in
    move_pp > 0
  with InvalidMove -> false

let use_move (m : move) = { m with current_count = m.current_count - 1 }

let rec update_moves_list (m_list : move list) (move : move) : move list
    =
  match m_list with
  | [] -> []
  | h :: t ->
      if h = move then
        { move with current_count = h.current_count - 1 } :: t
      else h :: update_moves_list t move

let rec update_moves_list_str (m_list : move list) (move : string) :
    move list =
  match m_list with
  | [] -> []
  | h :: t ->
      if h.move_name = move then
        { h with current_count = h.current_count - 1 } :: t
      else h :: update_moves_list_str t move

let use_moves (state : t) (move : move) : t =
  let new_moves_set = update_moves_list state.move_set move in
  { state with move_set = new_moves_set }

let use_moves_str (state : t) (move : string) : t =
  let new_moves_set = update_moves_list_str state.move_set move in
  { state with move_set = new_moves_set }

let calculate_damage (state : t) (move : move) =
  calculate_damage state.pokemon move.move_data

let damaged (state : t) (damage : int) : t =
  { state with hp = state.hp - damage }

let get_hp (state : t) : int = state.hp
let set_hp (state : t) health = { state with hp = health }
let get_move_set (state : t) : move list = state.move_set

(** [test_moves] is a list of moves *)
let test_moves : move list =
  [
    {
      move_name = "cut";
      move_data = Pokemon.cut;
      current_count = 2;
      max_count = 5;
    };
    {
      move_name = "fly";
      move_data = Pokemon.fly;
      current_count = 2;
      max_count = 5;
    };
    {
      move_name = "thunder";
      move_data = Pokemon.thunder;
      current_count = 2;
      max_count = 5;
    };
    {
      move_name = "strength";
      move_data = Pokemon.strength;
      current_count = 0;
      max_count = 5;
    };
  ]

(** [test_moves] is another list of moves *)
let new_test_moves : move list =
  [
    {
      move_name = "cut";
      move_data = Pokemon.cut;
      current_count = 1;
      max_count = 5;
    };
    {
      move_name = "fly";
      move_data = Pokemon.fly;
      current_count = 2;
      max_count = 5;
    };
    {
      move_name = "thunder";
      move_data = Pokemon.thunder;
      current_count = 2;
      max_count = 5;
    };
    {
      move_name = "strength";
      move_data = Pokemon.strength;
      current_count = 0;
      max_count = 5;
    };
  ]

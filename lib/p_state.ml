type move = {
  move_name : string;
  current_count : int;
  max_count : int;
}

type t = {
  hp : int;
  move_set : move list;
}

let init_move (name : string) (current_count : int) (max_count : int) :
    move =
  { move_name = name; current_count; max_count }

let init_move_set (move_set : move list) : move list =
  List.map (fun x -> x) move_set

let init_p_state (hp : int) (move_set : move list) : t =
  { hp; move_set }

exception InvalidMove

let rec find_move move_set (name : string) =
  match move_set with
  | h :: t -> if h.move_name = name then h else find_move t name
  | [] -> raise InvalidMove

let valid_move (state : t) (name : string) : bool =
  try
    let move_info = find_move state.move_set name in
    let move_set = move_info.current_count in
    if move_set > 0 then true else false
  with InvalidMove -> false

let rec update_moves_list (m_list : move list) (name : string) :
    move list =
  match m_list with
  | [ h ] ->
      if h.move_name = name then
        [ { h with current_count = h.current_count - 1 } ]
      else [ h ]
  | h :: t ->
      if h.move_name = name then
        { h with current_count = h.current_count - 1 } :: t
      else update_moves_list t name
  | [] -> []

let use_move (state : t) (name : string) : t =
  let new_moves_set = update_moves_list state.move_set name in
  { hp = state.hp; move_set = new_moves_set }

let damaged (state : t) (damage : int) : t =
  { state with hp = state.hp - damage }

let get_hp (state : t) : int = state.hp
let get_move_set (state : t) : move list = state.move_set

let test_moves : move list =
  [
    { move_name = "cut"; current_count = 2; max_count = 5 };
    { move_name = "fly"; current_count = 2; max_count = 5 };
    { move_name = "thunder"; current_count = 2; max_count = 5 };
    { move_name = "shove"; current_count = 0; max_count = 5 };
  ]

let new_test_moves : move list =
  [
    { move_name = "cut"; current_count = 1; max_count = 5 };
    { move_name = "fly"; current_count = 2; max_count = 5 };
    { move_name = "thunder"; current_count = 2; max_count = 5 };
    { move_name = "shove"; current_count = 0; max_count = 5 };
  ]

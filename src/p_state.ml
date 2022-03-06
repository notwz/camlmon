type moves_left = {
  move_name : string;
  current_count : int;
  max_count : int;
}

type t = {
  hp : int;
  moves : moves_left list;
}

exception InvalidMove

let rec find_move moves (move : string) =
  match moves with
  | h :: t -> if h.move_name = move then h else find_move t move
  | [] -> raise InvalidMove

let valid_move (state : t) (move : string) : bool =
  let move_info = find_move state.moves move in
  if move_info = raise InvalidMove then false
  else
    let moves_left = move_info.current_count in
    if moves_left < 0 then true else false

let rec update_moves_list (m_list : moves_left list) (move : string) :
    moves_left list =
  match m_list with
  | [ h ] ->
      if h.move_name = move then
        [ { h with current_count = h.current_count - 1 } ]
      else [ h ]
  | h :: t ->
      if h.move_name = move then
        { h with current_count = h.current_count - 1 } :: t
      else update_moves_list t move
  | [] -> []

let use_move (state : t) (move : string) : t =
  let new_moves_set = update_moves_list state.moves move in
  { hp = state.hp; moves = new_moves_set }

let damaged (state : t) (damage : int) : t =
  { state with hp = state.hp - damage }

let test_moves : moves_left list =
  [
    { move_name = "cut"; current_count = 2; max_count = 5 };
    { move_name = "fly"; current_count = 2; max_count = 5 };
    { move_name = "thunder"; current_count = 2; max_count = 5 };
    { move_name = "shove"; current_count = 0; max_count = 5 };
  ]

let new_test_moves : moves_left list =
  [
    { move_name = "cut"; current_count = 1; max_count = 5 };
    { move_name = "fly"; current_count = 2; max_count = 5 };
    { move_name = "thunder"; current_count = 2; max_count = 5 };
    { move_name = "shove"; current_count = 0; max_count = 5 };
  ]

let test_ps_0 : t = { hp = 12; moves = test_moves }
let test_ps_1 : t = { hp = 12; moves = new_test_moves }
let test_ps_damaged : t = { hp = 10; moves = test_moves }

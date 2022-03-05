type moves_left = { move_name : string; current_count: int; max_count: int }
type t = { hp : int; moves : moves_left list }

exception NoMove
let rec find_move (moves) ( move: string) = 
  match moves with 
  | h :: t -> if h.move_name = move then 
    h else find_move t move 
  | [] -> raise NoMove
  

let valid_move (state : t) (move : string) : bool = 
  let move_info = find_move state.moves move in 
  let moves_left = move_info.current_count in 
  if (moves_left < 0) then true else false 

let test_moves : moves_left list = 
  [{move_name = "cut"; current_count = 2; max_count = 5};
  {move_name = "fly"; current_count = 2; max_count = 5};
  {move_name = "thunder"; current_count = 2; max_count = 5};
  {move_name = "shove"; current_count = 0; max_count = 5}]
let test_p_state : t =  
  { hp = 12; moves = test_moves}

  


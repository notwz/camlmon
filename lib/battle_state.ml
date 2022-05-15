open Pokemon

exception NoWinnerFound

type t = {
  p1 : P_state.t;
  p2 : P_state.t;
  move_first : bool;
}

let init_state p1 p2 = { p1; p2; move_first = true }

let move m t =
  let move_name = P_state.move_name m in
  if t.move_first then
    if P_state.valid_move t.p1 move_name then
      let new_p1 = P_state.use_moves t.p1 move_name in
      let new_p2 =
        P_state.damaged t.p2 (P_state.calculate_damage t.p2 m)
      in
      { p1 = new_p1; p2 = new_p2; move_first = false }
    else raise P_state.InvalidMove
  else if P_state.valid_move t.p2 move_name then
    let new_p2 = P_state.use_moves t.p2 move_name in
    let new_p1 =
      P_state.damaged t.p1 (P_state.calculate_damage t.p1 m)
    in
    { p1 = new_p1; p2 = new_p2; move_first = true }
  else raise P_state.InvalidMove

let is_done t = P_state.get_hp t.p1 <= 0 || P_state.get_hp t.p2 <= 0

let winner t =
  if P_state.get_hp t.p1 <= 0 then "e"
  else if P_state.get_hp t.p2 <= 0 then "t"
  else raise NoWinnerFound

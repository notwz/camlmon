type t = {
  catch_prob : int;
  run_away_prob : int;
  caught : bool;
  ran_away : bool;
}

let init_state =
  {
    catch_prob = 20;
    run_away_prob = 20;
    caught = false;
    ran_away = false;
  }

let caught st = st.caught
let ran_away st = st.ran_away

let catch st =
  let () = Random.self_init () in
  let seed = Random.int 60 in
  if seed < st.catch_prob then { st with caught = true }
  else if seed < st.catch_prob + st.run_away_prob then
    { st with ran_away = true }
  else st

let bait st =
  let () = Random.self_init () in
  let seed = Random.int 60 in
  if seed < st.run_away_prob then { st with ran_away = true }
  else
    {
      st with
      catch_prob = st.catch_prob / 2;
      run_away_prob = st.run_away_prob / 2;
    }

let rock st =
  let () = Random.self_init () in
  let seed = Random.int 60 in
  if seed < st.run_away_prob then { st with ran_away = true }
  else
    {
      st with
      catch_prob = max 30 (st.catch_prob * 2);
      run_away_prob = max 30 (st.run_away_prob * 2);
    }
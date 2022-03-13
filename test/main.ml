open OUnit2
open Game
open P_state
open Trainer
open T_state
open Map

(********************************************************************
   Here are some helper functions for your testing of set-like lists.
 ********************************************************************)

(** [cmp_set_like_lists lst1 lst2] compares two lists to see whether
    they are equivalent set-like lists. That means checking two things.
    First, they must both be {i set-like}, meaning that they do not
    contain any duplicates. Second, they must contain the same elements,
    though not necessarily in the same order. *)
let cmp_set_like_lists lst1 lst2 =
  let uniq1 = List.sort_uniq compare lst1 in
  let uniq2 = List.sort_uniq compare lst2 in
  List.length lst1 = List.length uniq1
  && List.length lst2 = List.length uniq2
  && uniq1 = uniq2

(** [pp_string s] pretty-prints string [s]. *)
let pp_string s = "\"" ^ s ^ "\""

let pp_bool bool = if bool = true then "true" else "false"

(** [pp_list pp_elt lst] pretty-prints list [lst], using [pp_elt] to
    pretty-print each element of [lst]. *)
(* let pp_list pp_elt lst = let pp_elts lst = let rec loop n acc =
   function | [] -> acc | [ h ] -> acc ^ pp_elt h | h1 :: (h2 :: t as
   t') -> if n = 100 then acc ^ "..." (* stop printing long list *) else
   loop (n + 1) (acc ^ pp_elt h1 ^ "; ") t' in loop 0 "" lst in "[" ^
   pp_elts lst ^ "]" *)

(* These tests demonstrate how to use [cmp_set_like_lists] and [pp_list]
   to get helpful output from OUnit. *)

(********************************************************************
   End helper functions.
 ********************************************************************)

(* You should not be testing any helper functions here. Test only the
   functions exposed in the [.mli] files. Do not expose your helper
   functions. See the handout for an explanation. *)

(* Dummy pokemon states for testing *)
let cut = init_move "cut" 5 5
let cut1 = init_move "cut" 4 5
let soar = init_move "soar" 5 5
let strength = init_move "strength" 0 5
let swim = init_move "swim" 1 5
let move_set_0 = [ cut; soar; strength; swim ]
let move_set_1 = [ cut1; soar; strength; swim ]
let ps_0 = init_p_state 12 move_set_0
let ps_1 = init_p_state 12 move_set_1
let ps_damaged_0 = init_p_state 10 move_set_0
let ps_damaged_1 = init_p_state 10 move_set_1

let ps_valid_move_test (name : string) state move expected_output : test
    =
  name >:: fun _ ->
  assert_equal expected_output (valid_move state move) ~printer:pp_bool

let ps_move_test (name : string) state move expected_output : test =
  name >:: fun _ -> assert_equal expected_output (use_move state move)

let ps_damaged_test (name : string) state damage expected_output : test
    =
  name >:: fun _ -> assert_equal expected_output (damaged state damage)

let p_state_tests =
  [
    ps_valid_move_test "valid move on test state (cut) " ps_0 "cut" true;
    ps_valid_move_test "valid move on test state (soar) " ps_0 "soar"
      true;
    ps_valid_move_test "valid move on test state (shove) " ps_0 "shove"
      false;
    ps_valid_move_test "valid move on test state (strength) " ps_0
      "strength" false;
    ps_move_test "Using cut once" ps_0 "cut" ps_1;
    ps_damaged_test "Pokemon received 2 dmg (ps0) : " ps_0 2
      ps_damaged_0;
    ps_damaged_test "Pokemon received 2 dmg (ps1) : " ps_1 2
      ps_damaged_1;
  ]

let map_pp_test
    (name : string)
    (first_map : bool)
    (expected_output : string) =
  name >:: fun _ ->
  let trainer = init_trainer "Bob" 0 in
  assert_equal expected_output
    (pp_map
       (if first_map then init_map_a trainer else init_map_b trainer)
       (init_t_state trainer))
    ~printer:(fun x -> x)

let map_tests =
  [
    map_pp_test "first map pretty printing" true
      "~~~~~###^^^\n\
       ~~~~###^^^^\n\
       ~~~###^^^^^\n\
       ~~###^^^^^#\n\
       ~#### ^^^##\n\
       ###^ T ^###\n\
       ##^^^ ####~\n\
       #^^^^^###~~\n\
       ^^^^^###~~~\n\
       ^^^^###~~~~\n\
       ^^^###~~~~~";
    map_pp_test "second map pretty printing" false
      "^^^^^^^^^^^\n\
       ^^##^^^^^^^\n\
       ########^^#\n\
       ###########\n\
       ~~~~~ ~~~~~\n\
       ~~~~ T ~~~~\n\
       ~~~~~ ~~~~~\n\
       ###########\n\
       ##^^^###^^#\n\
       ^^^^^^^^^^^\n\
       ^^^^^^^^^^^";
  ]

let suite =
  "🐪 Test suite for camlmon : 🐪"
  >::: List.flatten [ p_state_tests; map_tests ]

let _ = run_test_tt_main suite

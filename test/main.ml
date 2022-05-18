open OUnit2
open Game
open Lib
open P_state
open Pokemon
open T_state
open Trainer

(** ================================================================
    Testing Plan:

    As the majority of our game is tested visually, our testing was
    primarily done by play testing. We have shortcuts to each GUI for
    catching, battling, safari zone exploration and intro dialouge.
    These test the gui functions and displays in [battle_encounter.mli],
    [battle.mli], [safari_zone.mli], and [main_menu.mli] respectfully.
    We use a combination of black-box and glass-box testing to verify
    our code. We also use unit tests to test our game engine.

    Our testing demonstrates the correctness of the system because it
    has a quantitative measurement for the code tested with unit cases,
    and the visual GUI aspects are clearly correctly rendered or
    incorrectly rendered when we launch the game and run sequences of
    inputs.

    ================================================================*)

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

let rec range (n : int) : int list =
  if n = 0 then [ 0 ] else n :: range (n - 1)

let id_to_type = function
  | 0 -> "normal"
  | 1 -> "fire"
  | 2 -> "water"
  | 3 -> "electric"
  | 4 -> "grass"
  | 5 -> "ice"
  | 6 -> "fighting"
  | 7 -> "poison"
  | 8 -> "ground"
  | 9 -> "flying"
  | 10 -> "psychic"
  | 11 -> "bug"
  | 12 -> "rock"
  | 13 -> "ghost"
  | 14 -> "dragon"
  | 15 -> "dark"
  | 16 -> "steel"
  | 17 -> "fairy"
  | _ -> "null"

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
let pokemons =
  [
    normal_test;
    fire_test;
    water_test;
    electric_test;
    grass_test;
    ice_test;
    fighting_test;
    poison_test;
    ground_test;
    flying_test;
    psychic_test;
    bug_test;
    rock_test;
    ghost_test;
    dragon_test;
    dark_test;
    steel_test;
    fairy_test;
  ]

(* Dummy pokemon moves for testing *)
let moves : p_move list =
  [
    normal_move;
    fire_move;
    water_move;
    electric_move;
    grass_move;
    ice_move;
    fighting_move;
    poison_move;
    ground_move;
    flying_move;
    psychic_move;
    bug_move;
    rock_move;
    ghost_move;
    dragon_move;
    dark_move;
    steel_move;
    fairy_move;
  ]

let (expected_damages : int list list) =
  [
    [
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      5;
      0;
      10;
      10;
      5;
      10;
    ];
    [
      10; 5; 5; 10; 20; 20; 10; 10; 10; 10; 10; 20; 5; 10; 5; 10; 20; 10;
    ];
    [
      10;
      20;
      5;
      10;
      5;
      10;
      10;
      10;
      20;
      10;
      10;
      10;
      20;
      10;
      5;
      10;
      10;
      10;
    ];
    [
      10; 10; 20; 5; 5; 10; 10; 10; 0; 20; 10; 10; 10; 10; 5; 10; 10; 10;
    ];
    [ 10; 5; 20; 10; 5; 10; 10; 5; 20; 5; 10; 5; 20; 10; 5; 10; 5; 10 ];
    [
      10; 5; 5; 10; 20; 5; 10; 10; 20; 20; 10; 10; 10; 10; 20; 10; 5; 10;
    ];
    [ 20; 10; 10; 10; 10; 20; 10; 5; 10; 5; 5; 5; 20; 0; 10; 20; 20; 5 ];
    [
      10; 10; 10; 10; 20; 10; 10; 5; 5; 10; 10; 10; 5; 5; 10; 10; 0; 20;
    ];
    [
      10;
      20;
      10;
      20;
      5;
      10;
      10;
      20;
      10;
      0;
      10;
      5;
      20;
      10;
      10;
      10;
      20;
      10;
    ];
    [
      10;
      10;
      10;
      5;
      20;
      10;
      20;
      10;
      10;
      10;
      10;
      20;
      5;
      10;
      10;
      10;
      5;
      10;
    ];
    [
      10;
      10;
      10;
      10;
      10;
      10;
      20;
      20;
      10;
      10;
      5;
      10;
      10;
      10;
      10;
      0;
      5;
      10;
    ];
    [ 10; 5; 10; 10; 20; 10; 5; 5; 10; 5; 20; 10; 10; 5; 10; 20; 5; 5 ];
    [
      10;
      20;
      10;
      10;
      10;
      20;
      5;
      10;
      5;
      20;
      10;
      20;
      10;
      10;
      10;
      10;
      5;
      10;
    ];
    [
      0;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      20;
      10;
      10;
      20;
      10;
      5;
      10;
      10;
    ];
    [
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      10;
      20;
      10;
      5;
      0;
    ];
    [
      10;
      10;
      10;
      10;
      10;
      10;
      5;
      10;
      10;
      10;
      20;
      10;
      10;
      20;
      10;
      5;
      10;
      5;
    ];
    [
      10; 5; 5; 5; 10; 20; 10; 10; 10; 10; 10; 10; 20; 10; 10; 10; 5; 20;
    ];
    [
      10;
      5;
      10;
      10;
      10;
      10;
      20;
      5;
      10;
      10;
      10;
      10;
      10;
      10;
      20;
      20;
      5;
      10;
    ];
  ]

let ps_valid_move_test (name : string) state move expected_output : test
    =
  name >:: fun _ ->
  assert_equal expected_output (valid_move state move) ~printer:pp_bool

let ps_move_test (name : string) state move expected_output : test =
  name >:: fun _ -> assert_equal expected_output (use_moves state move)

let ps_damaged_test (name : string) state damage expected_output : test
    =
  name >:: fun _ -> assert_equal expected_output (damaged state damage)

let ps_damage_test
    (name : string)
    (pokemon : Pokemon.t)
    (move : Pokemon.p_move)
    (expected_output : int) : test =
  name >:: fun _ ->
  assert_equal expected_output (calculate_damage pokemon move)
    ~printer:(fun x -> string_of_int x)

let f x =
  let i = x / 18 in
  let j = x mod 18 in
  ps_damage_test
    ("test move " ^ id_to_type i ^ " on pokemon " ^ id_to_type j)
    (List.nth pokemons j) (List.nth moves i)
    (List.nth (List.nth expected_damages i) j)

let p_state_tests =
  [
    ps_damage_test "Normal received 90 dmg from ice beam" normal_test
      ice_beam 90;
    ps_damage_test "Normal received 0 dmg from shadow ball" normal_test
      shadow_ball 0;
    ps_damage_test "Normal received 200 dmg from close combat"
      normal_test close_combat 200;
    ps_damage_test "Electric received 200 dmg from earthquake"
      electric_test earthquake 200;
    ps_damage_test "Electric received 90 damage from flamethrower"
      electric_test flamethrower 90;
    ps_damage_test "Flying received 180 dmg from ice beam" flying_test
      ice_beam 180;
    ps_damage_test "Flying received 0 dmg from earthquake" flying_test
      earthquake 0;
    ps_damage_test "Ghost received 0 dmg from tackle" ghost_test tackle
      0;
    ps_damage_test "Ghost received 180 dmg from shadow ball" ghost_test
      shadow_ball 180;
    ps_damage_test "Ground received 180 dmg from surf" ground_test surf
      180;
    ps_damage_test "Ground received 0 dmg from thunderbolt" ground_test
      thunderbolt 0;
    ps_damage_test "Dark received 180 dmg from moonblast" dark_test
      moonblast 180;
    ps_damage_test "Dark received 0 dmg from psychic" dark_test psychic
      0;
  ]
  @ List.map f (range 323)

(* let map_pp_test (name : string) (first_map : bool) (expected_output :
   string) = name >:: fun _ -> let trainer = init_trainer "Bob" 0 in let
   t_state = init_t_state trainer in assert_equal expected_output
   (pp_map (if first_map then init_map_a t_state else init_map_b
   t_state)) ~printer:(fun x -> x) *)

(* let map_tests = [ map_pp_test "first map pretty printing" true
   "🌊🌊🌊🌊🌊🟩🟩🟩🗿🗿🗿\n\ 🌊🌊🌊🌊🟩🟩🟩🗿🗿🗿🗿\n\ 🌊🌊🌊🟩🟩🟩🗿🗿🗿🗿🗿\n\ 🌊🌊🟩🟩🟩🗿🗿🗿🗿🗿🟩\n\
   🌊🟩🟩🟩🟩🟫🗿🗿🗿🟩🟩\n\ 🟩🟩🟩🗿🟫🐪🟫🗿🟩🟩🟩\n\ 🟩🟩🗿🗿🗿🟫🟩🟩🟩🟩🌊\n\ 🟩🗿🗿🗿🗿🗿🟩🟩🟩🌊🌊\n\
   🗿🗿🗿🗿🗿🟩🟩🟩🌊🌊🌊\n\ 🗿🗿🗿🗿🟩🟩🟩🌊🌊🌊🌊\n\ 🗿🗿🗿🟩🟩🟩🌊🌊🌊🌊🌊"; map_pp_test "second map
   pretty printing" false "🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿\n\ 🗿🗿🟩🟩🗿🗿🗿🗿🗿🗿🗿\n\ 🟩🟩🟩🟩🟩🟩🟩🟩🗿🗿🟩\n\
   🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩\n\ 🌊🌊🌊🌊🌊🟫🌊🌊🌊🌊🌊\n\ 🌊🌊🌊🌊🟫🐪🟫🌊🌊🌊🌊\n\ 🌊🌊🌊🌊🌊🟫🌊🌊🌊🌊🌊\n\
   🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩\n\ 🟩🟩🗿🗿🗿🟩🟩🟩🗿🗿🟩\n\ 🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿\n\ 🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿🗿"; ] *)

let suite =
  "🐪 Test suite for camlmon : 🐪"
  >::: List.flatten [ p_state_tests (*map_tests*) ]

let _ = run_test_tt_main suite

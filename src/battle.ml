open Graphics 
open Graphic_image
open Explore 
open Lib 
open Trainer
open Encounter
open Gui_library
open Pokemon 
open P_state
open Battle_state

exception NoCommand

let t_pokemon = random_pokemon
let e_pokemon = random_pokemon_2
let t_p_state = init_p_state t_pokemon
let e_p_state = init_p_state e_pokemon
let battle_state = Battle_state.init_state t_p_state e_p_state 

let max a b = if a >= b then a else b

(** pokemon names *)
let t_name = pokemon_name t_p_state 
let e_name = pokemon_name e_p_state

(** pokemon hps *)
let t_max_hp = get_max_hp t_pokemon
let e_max_hp = get_max_hp e_pokemon

(** pokemon moves *)
let t_moves = get_move_set t_p_state
let e_moves = get_move_set e_p_state


(** pokemon images are 120 x 120 *)
let pokemon_back = get_back_sprite t_pokemon
let pokemon_front = get_front_sprite e_pokemon
let battle_bg = "public/menu_images/battle_bg.png"
(* 
type move = { name:string; damage:int}
let moves = [ 
  {name="Force Palm"; damage=20};
  {name="Shadow Ball"; damage=20};
  {name="Rain Dance"; damage=20};
  {name="Judgement"; damage=20}
  ]

type pokemon = { name: string; max_hp: int; hp: int; moves: move list}
let t_pokemon = { name = "Charizard"; max_hp=100; hp=30; moves = moves}
let e_pokemon = { name = "Weezing"; max_hp = 80; hp= 10; moves = moves} *)




let draw_t_pokemon (pokemon : P_state.t) () = 
  let name = pokemon_name pokemon in 
  let hp = get_hp pokemon in 
  set_color white; 
  fill_rect 660 250 300 100; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect 660 250 300 100;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 665 255 290 88;
  moveto 680 290; 
  let hp_ratio = max(ceil(150. *. ((hp |> float_of_int )/. (t_max_hp|> float_of_int ))) |> int_of_float) 0 in 
  let set_hp_color hp () = 
    match hp with 
    | a -> if a > 30 then set_color green else set_color red; 
  in set_hp_color hp_ratio ();
  fill_rect 680 290 hp_ratio 10;
  set_color black;
  moveto 680 310; 
  draw_string name; 
  moveto 880 270; 
  draw_string (string_of_int (max hp 0) ^ "/" ^ string_of_int t_max_hp);
  draw_img_rgb pokemon_back (400, 205) ();
  synchronize (); 
  () 

let draw_enemy pokemon () =
  let name = pokemon_name pokemon in 
  let hp = get_hp pokemon in 
  set_color white; 
  fill_rect 300 550 300 100; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect 300 550 300 100;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 305 555 290 88;
  let hp_ratio = max(ceil(150. *. ((hp |> float_of_int )/. (e_max_hp|> float_of_int ))) |> int_of_float) 0 in 
  let set_hp_color hp () = 
    match hp with 
    | a -> if a > 30 then set_color green else set_color red; 
  in set_hp_color hp_ratio ();
  fill_rect 320 590 hp_ratio 10;
  set_color black;
  moveto 320 610; 
  draw_string name;
  moveto 520 570; 
  draw_string (string_of_int (max hp 0) ^ "/" ^  string_of_int e_max_hp);
  draw_img_rgb pokemon_front (700, 500) ();
  synchronize ();
  () 

let draw_text_box x y () = 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  moveto 360 150;
  draw_string "What will you do?";
  moveto 380 50;
  draw_string "Attack [a]";
  moveto 500 50; 
  draw_string "Quit [q]";
  synchronize ();
  ()


let draw_move_info x y n t_s () = 
  let move_list = get_move_set t_s in
  let move_selected = List.nth move_list n in 
  let move_pp_curr = fst (move_pp move_selected) in 
  let move_pp_max = snd (move_pp move_selected) in
  let move_type = get_move_type_str t_pokemon (move_selected |> move_name) in 
  set_color grey;
  moveto (x+140) (y-20); 
  draw_string ((move_pp_curr |> string_of_int) ^ "/" ^  (move_pp_max |> string_of_int));
  moveto (x) (y-20); 
  draw_string move_type;
  set_color black;
  () 

let rec draw_moves x y t_s e_s selected () = 
  try 
   (** text box *)
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  draw_img_rgb battle_bg (670, 424) ();
  (** move info *)
  (* set_color black;
  fill_rect 100 300 200 80; 
  set_line_width 3; 
  set_color white;
  draw_rect 104 304 192 72;
  let move_list = get_move_set t_s in
  let move_selected = List.nth move_list selected in 
  let move_pp_curr = fst (move_pp move_selected) in 
  let move_pp_max = snd (move_pp move_selected) in
  let move_type = get_move_type_str t_pokemon (move_selected |> move_name) in 
  set_color white;
  moveto 120 350; 
  draw_string (" > " ^ (move_selected |> move_name));
  moveto 120 330; 
  draw_string ((move_pp_curr |> string_of_int) ^ "/" ^  (move_pp_max |> string_of_int));
  moveto 120 310; 
  draw_string move_type; *)
  (** move set *)
  (** borders for moves*)
  set_line_width 8;
  set_color black;
  draw_rect 370 118 240 55;
  set_line_width 6;
  set_color grey;
  draw_rect 371 119 238 53;
  set_color black;
  set_line_width 8;
  set_color black;
  draw_rect 370 33 240 55;
  set_line_width 6;
  set_color grey;
  draw_rect 371 34 238 53;
  set_color black;
  set_line_width 8;
  set_color black;
  draw_rect 670 118 240 55;
  set_line_width 6;
  set_color grey;
  draw_rect 671 119 238 53;
  set_color black;
  set_line_width 8;
  set_color black;
  draw_rect 670 33 240 55;
  set_line_width 6;
  set_color grey;
  draw_rect 671 34 238 53;
  set_color black;
  moveto 400 145;
  draw_string ((List.nth t_moves 0 |> move_name ) ^ " [1]");
  draw_move_info 400 145 0 t_s ();
  moveto 400 60;
  draw_string ((List.nth t_moves 1 |> move_name ) ^ " [2]");
  draw_move_info 400 60 1 t_s ();
  moveto 700 145;
  draw_string ((List.nth t_moves 2 |> move_name ) ^ " [3]");
  draw_move_info 700 145 2 t_s ();
  moveto 700 60;
  draw_string ((List.nth t_moves 3 |> move_name ) ^ " [4]");
  draw_move_info 700 60 3 t_s ();
  moveto x y; 
  set_color blue;
  draw_string "[                    ]";
  draw_t_pokemon t_s ();
  draw_enemy e_s ();
  synchronize ();
  let b_s = init_state t_s e_s in
  if is_done b_s then draw_victory_screen "name" () else
  let e = wait_next_event [ Key_pressed ] in
      let user_command =
      match e.key with
      | '1' -> draw_moves 380 140 t_s e_s 0 ()
      | '2' -> draw_moves 380 50 t_s e_s 1 ()
      | '3' -> draw_moves 680 140 t_s e_s 2 ()
      | '4' -> draw_moves 680 50 t_s e_s  3 ()
      | 'a' -> take_move x y b_s (); draw_moves x y t_s e_s 0 ()
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoCommand
      in user_command 
  with NoCommand -> draw_moves x y t_s e_s 0 ()

and take_move x y b_s () = 
  let (move_name, move) = 
    match (x,y) with 
    | (380, 140) -> ((List.nth t_moves 0 |> move_name ), List.nth t_moves 0)
    | (380, 50) -> ((List.nth t_moves 1 |> move_name ), List.nth t_moves 1)
    | (680, 140) -> ((List.nth t_moves 2 |> move_name ), List.nth t_moves 2)
    | (680, 50) -> ((List.nth t_moves 3 |> move_name ), List.nth t_moves 3)
    | _ -> raise NoCommand 
  in 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  moveto 380 120;
  set_color black;
  draw_string (t_name ^ " used " ^ move_name ^ "!");
  synchronize ();
  let new_b_state = Battle_state.move move b_s in 
  (* let dmg = calculate_damage t_s move in  *)
  let new_e_s = b_p2_s new_b_state in 
  let new_t_s = b_p1_s new_b_state in
  (* let new_t_s = use_moves_str t_s move_name in  *)
  Unix.sleep 1;
  draw_enemy new_e_s ();
  let b_s = init_state new_t_s new_e_s in
  let game_over = is_done b_s in 
  if game_over then 
  let next_screen = match winner b_s with 
    | "t" -> draw_victory_screen e_name () 
    | "e" -> draw_victory_screen t_name () 
    | _ -> raise NoCommand
  in 
  next_screen 
  else 
  enemy_move x y new_t_s new_e_s ();
  draw_moves 380 140 new_t_s new_e_s 0 ()


and enemy_move x y t_s e_s () = 
  let e_moves = get_move_set e_s in 
  let len = List.length e_moves in 
  Random.self_init (); 
  let n = Random.int len in 
  let move = List.nth e_moves n in 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  moveto 380 120;
  set_color black;
  draw_string (e_name ^ " used " ^ (move |> move_name ) ^ "!");
  synchronize ();
  let dmg = calculate_damage e_s move in 
  let new_t_s = damaged t_s dmg in 
  Unix.sleep 1;
  draw_t_pokemon new_t_s ();
  let b_s = init_state new_t_s e_s in
  let game_over = is_done b_s in 
  if game_over then 
  let next_screen = match winner b_s with 
    | "t" -> draw_victory_screen e_name () 
    | "e" -> draw_victory_screen t_name () 
    | _ -> raise NoCommand
  in 
  next_screen 
  else 
  draw_moves 380 140 new_t_s e_s 0 ();
  ()

and draw_victory_screen (name: string) () = 
  try 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  moveto 360 150;
  draw_string (name ^ " fainted!");
  moveto 380 50;
  draw_string "Again! [a]";
  moveto 500 50; 
  draw_string "Run! [q]";
  synchronize ();
  let e = wait_next_event [ Key_pressed ] in
      let user_command =
      match e.key with
      | 'a' -> ( 
        let t_pokemon = random_pokemon in 
        let e_pokemon = random_pokemon_2 in 
        let t_p_state = init_p_state t_pokemon in 
        let e_p_state = init_p_state e_pokemon in draw_moves 380 140 t_p_state e_p_state 0 () )
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoCommand
      in user_command 
  with NoCommand -> draw_victory_screen "ERROR:" ()

let battle_intro_dialogue () = 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  draw_enemy e_p_state ();
  moveto 360 150;
  draw_string ("A wild Pokemon appeared!");
  moveto 500 100;
  draw_string " [1] -> [4] : select your move";
  moveto 500 80; 
  draw_string " [a] key : to use the move";
  synchronize(); 
  () 

let rec battle_main x y () = 
  try 
    clear_graph(); 
    clear_window white; 
    set_color panel_color; 
    battle_intro_dialogue (); 
    Unix.sleep 3;
    draw_text_box x y();
    synchronize();
    let e = wait_next_event [ Key_pressed ] in
      let user_command =
      match e.key with
      | 'a' -> draw_moves 380 140 t_p_state e_p_state 0 ()
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoCommand
      in user_command 
  with NoCommand -> battle_main x y ()
 
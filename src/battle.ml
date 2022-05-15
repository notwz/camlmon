open Graphics 
open Graphic_image
open Explore 
open Lib 
open Trainer
open Encounter
open Gui_library

exception NoCommand

let pokemon_back = "public/pokemon_images/charizard_b.png" 
let pokemon_front = "public/pokemon_images/weezing_sprite.png"

type move = { name:string; damage:int}
let moves = [ 
  {name="Force Palm"; damage=20};
  {name="Shadow Ball"; damage=20};
  {name="Rain Dance"; damage=20};
  {name="Judgement"; damage=20}]

type pokemon = { name: string; max_hp: int; hp: int; moves: move list}
let t_pokemon = { name = "Charizard"; max_hp=100; hp=30; moves = moves}
let e_pokemon = { name = "Weezing"; max_hp = 80; hp= 10; moves = moves}
let draw_t_pokemon (pokemon: pokemon) () = 
  set_color white; 
  fill_rect 660 250 300 100; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect 660 250 300 100;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 665 255 290 88;
  moveto 680 290; 
  let hp_ratio = ceil(150. *. ((pokemon.hp |> float_of_int )/. (pokemon.max_hp|> float_of_int ))) |> int_of_float in 
  let set_hp_color hp () = 
    match hp with 
    | a -> if a > 30 then set_color green else set_color red; 
  in set_hp_color hp_ratio ();
  fill_rect 680 290 hp_ratio 10;
  set_color black;
  moveto 680 310; 
  draw_string pokemon.name; 
  moveto 880 270; 
  draw_string (string_of_int pokemon.hp ^ "/" ^ string_of_int pokemon.max_hp);
  draw_img_rgb pokemon_back (400, 205) ();
  synchronize (); 
  () 


let draw_enemy pokemon () =
  set_color white; 
  fill_rect 300 550 300 100; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect 300 550 300 100;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 305 555 290 88;
  let hp_ratio = ceil(150. *. ((pokemon.hp |> float_of_int )/. (pokemon.max_hp|> float_of_int ))) |> int_of_float in 
  let set_hp_color hp () = 
    match hp with 
    | a -> if a > 30 then set_color green else set_color red; 
  in set_hp_color hp_ratio ();
  fill_rect 320 590 hp_ratio 10;
  set_color black;
  moveto 320 610; 
  draw_string pokemon.name;
  moveto 520 570; 
  draw_string (string_of_int pokemon.hp ^ "/" ^  string_of_int pokemon.max_hp);
  draw_img_rgb pokemon_front (700, 550) ();
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

let rec draw_moves x y () = 
  try 
  set_color white; 
  fill_rect dialogue_x dialogue_y dialogue_width dialogue_height; 
  set_color panel_border_1; 
  set_line_width 5; 
  draw_rect dialogue_x dialogue_y dialogue_width dialogue_height;
  set_color panel_border_2;
  set_line_width 10;
  draw_rect 346 6 588 188;
  set_color black;
  moveto 400 140;
  draw_string ((List.nth moves 0).name ^ " [1]");
  moveto 400 50;
  draw_string ((List.nth moves 1).name ^ " [2]");
  moveto 700 140;
  draw_string ((List.nth moves 2).name ^ " [3]");
  moveto 700 50;
  draw_string ((List.nth moves 3).name ^ " [4]");
  moveto x y; 
  draw_string "> ";
  draw_t_pokemon t_pokemon ();
  draw_enemy e_pokemon ();
  synchronize ();
  let e = wait_next_event [ Key_pressed ] in
      let user_command =
      match e.key with
      | '1' -> draw_moves 380 140 ()
      | '2' -> draw_moves 380 50 ()
      | '3' -> draw_moves 680 140 ()
      | '4' -> draw_moves 680 50 ()
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoCommand
      in user_command 
  with NoCommand -> draw_moves x y ()


let rec battle_main x y () = 
  try 
    clear_graph(); 
    clear_window white; 
    set_color panel_color; 
    draw_text_box x y();
    synchronize();
    let e = wait_next_event [ Key_pressed ] in
      let user_command =
      match e.key with
      | 'a' -> draw_moves 380 140 ()
      | 'q' -> Stdlib.exit 0
      | _ -> raise NoCommand
      in user_command 
  with NoCommand -> battle_main x y ()
 
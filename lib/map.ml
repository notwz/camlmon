type t = {
  trainer_state : T_state.t;
  bushes : (int * int) list;
  puddles : (int * int) list;
  rocks : (int * int) list;
}

let path_blocks = [ (4, 5); (5, 4); (5, 5); (5, 6); (6, 5) ]

let init_map_a t =
  {
    trainer_state = t;
    bushes =
      [
        (0, 5);
        (0, 6);
        (0, 7);
        (1, 4);
        (1, 5);
        (1, 6);
        (2, 3);
        (2, 4);
        (2, 5);
        (3, 2);
        (3, 3);
        (3, 4);
        (3, 10);
        (4, 1);
        (4, 2);
        (4, 3);
        (4, 4);
        (4, 9);
        (4, 10);
        (5, 0);
        (5, 1);
        (5, 2);
        (5, 8);
        (5, 9);
        (5, 10);
        (6, 0);
        (6, 1);
        (6, 6);
        (6, 7);
        (6, 8);
        (6, 9);
        (7, 0);
        (7, 6);
        (7, 7);
        (7, 8);
        (8, 5);
        (8, 6);
        (8, 7);
        (9, 4);
        (9, 5);
        (9, 6);
        (10, 3);
        (10, 4);
        (10, 5);
      ];
    puddles =
      [
        (0, 0);
        (0, 1);
        (0, 2);
        (0, 3);
        (0, 4);
        (1, 0);
        (1, 1);
        (1, 2);
        (1, 3);
        (2, 0);
        (2, 1);
        (2, 2);
        (3, 0);
        (3, 1);
        (4, 0);
        (6, 10);
        (7, 9);
        (7, 10);
        (8, 8);
        (8, 9);
        (8, 10);
        (9, 7);
        (9, 8);
        (9, 9);
        (9, 10);
        (10, 6);
        (10, 7);
        (10, 8);
        (10, 9);
        (10, 10);
      ];
    rocks =
      [
        (0, 8);
        (0, 9);
        (0, 10);
        (1, 7);
        (1, 8);
        (1, 9);
        (1, 10);
        (2, 6);
        (2, 7);
        (2, 8);
        (2, 9);
        (2, 10);
        (3, 5);
        (3, 6);
        (3, 7);
        (3, 8);
        (3, 9);
        (4, 6);
        (4, 7);
        (4, 8);
        (5, 3);
        (5, 7);
        (6, 2);
        (6, 3);
        (6, 4);
        (7, 1);
        (7, 2);
        (7, 3);
        (7, 4);
        (7, 5);
        (8, 0);
        (8, 1);
        (8, 2);
        (8, 3);
        (8, 4);
        (9, 0);
        (9, 1);
        (9, 2);
        (9, 3);
        (10, 0);
        (10, 1);
        (10, 2);
      ];
  }

let init_map_b t =
  {
    trainer_state = t;
    bushes =
      [
        (1, 2);
        (1, 3);
        (2, 0);
        (2, 1);
        (2, 2);
        (2, 3);
        (2, 4);
        (2, 5);
        (2, 6);
        (2, 7);
        (2, 10);
        (3, 0);
        (3, 1);
        (3, 2);
        (3, 3);
        (3, 4);
        (3, 5);
        (3, 6);
        (3, 7);
        (3, 8);
        (3, 9);
        (3, 10);
        (7, 0);
        (7, 1);
        (7, 2);
        (7, 3);
        (7, 4);
        (7, 5);
        (7, 6);
        (7, 7);
        (7, 8);
        (7, 9);
        (7, 10);
        (8, 0);
        (8, 1);
        (8, 5);
        (8, 6);
        (8, 7);
        (8, 10);
      ];
    puddles =
      [
        (4, 0);
        (4, 1);
        (4, 2);
        (4, 3);
        (4, 4);
        (4, 6);
        (4, 7);
        (4, 8);
        (4, 9);
        (4, 10);
        (5, 0);
        (5, 1);
        (5, 2);
        (5, 3);
        (5, 7);
        (5, 8);
        (5, 9);
        (5, 10);
        (6, 0);
        (6, 1);
        (6, 2);
        (6, 3);
        (6, 4);
        (6, 6);
        (6, 7);
        (6, 8);
        (6, 9);
        (6, 10);
      ];
    rocks =
      [
        (0, 0);
        (0, 1);
        (0, 2);
        (0, 3);
        (0, 4);
        (0, 5);
        (0, 6);
        (0, 7);
        (0, 8);
        (0, 9);
        (0, 10);
        (1, 0);
        (1, 1);
        (1, 4);
        (1, 5);
        (1, 6);
        (1, 7);
        (1, 8);
        (1, 9);
        (1, 10);
        (2, 8);
        (2, 9);
        (8, 2);
        (8, 3);
        (8, 4);
        (8, 8);
        (8, 9);
        (9, 0);
        (9, 1);
        (9, 2);
        (9, 3);
        (9, 4);
        (9, 5);
        (9, 6);
        (9, 7);
        (9, 8);
        (9, 9);
        (9, 10);
        (10, 0);
        (10, 1);
        (10, 2);
        (10, 3);
        (10, 4);
        (10, 5);
        (10, 6);
        (10, 7);
        (10, 8);
        (10, 9);
        (10, 10);
      ];
  }

let init_map t =
  if
    let () = Random.self_init () in
    Random.int 2 = 0
  then init_map_a t
  else init_map_b t

let blank_map =
  [
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    "\n";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
    " ";
  ]

let rec modify_map
    (map : string list)
    (list : (int * int) list)
    (s : string) =
  match list with
  | [] -> map
  | hd :: tl ->
      modify_map
        (List.mapi
           (fun i x -> if i = (fst hd * 12) + snd hd then s else x)
           map)
        tl s

let pp_map t =
  let template = blank_map in
  let template_paths = modify_map template path_blocks "🟫" in
  let template_bushes = modify_map template_paths t.bushes "🟩" in
  let template_puddles = modify_map template_bushes t.puddles "🌊" in
  let template_rocks = modify_map template_puddles t.rocks "🗿" in
  let template_trainer =
    modify_map template_rocks
      [ T_state.get_location t.trainer_state ]
      "🐪"
  in
  List.fold_right (fun x acc -> x ^ acc) template_trainer ""

let move_up t =
  { t with trainer_state = T_state.move_up t.trainer_state }

let move_down t =
  { t with trainer_state = T_state.move_down t.trainer_state }

let move_left t =
  { t with trainer_state = T_state.move_left t.trainer_state }

let move_right t =
  { t with trainer_state = T_state.move_right t.trainer_state }

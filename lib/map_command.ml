type command =
  | Up
  | Down
  | Left
  | Right
  | Quit

exception Empty
exception Malformed

(** [remove_empty lst] is the list that contains all elements in list
    [lst] but with empty strings removed*)
let remove_empty string_list =
  List.fold_right
    (fun x y -> if x = "" then y else x :: y)
    string_list []

let parse str =
  match str |> String.split_on_char ' ' |> remove_empty with
  | [] -> raise Empty
  | [ "up" ] -> Up
  | [ "down" ] -> Down
  | [ "left" ] -> Left
  | [ "right" ] -> Right
  | [ "q" ] -> Quit
  | _ -> raise Malformed

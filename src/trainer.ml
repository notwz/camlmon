type t = {name : string; id : int; party : Pokemon.t list}

let get_pokemon t = t.party

let init_trainer s n = {name = s; id = n; party = []}
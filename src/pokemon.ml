type p_types =  Normal | Fire | Water | Grass | Electric | Ice | Fighting | Poison | Ground | Flying | Psychic | Bug | Rock | Ghost | Dark | Dragon | Steel | Fairy 

let normal = Normal
let fire = Fire
let water = Water
let grass = Grass
let electric = Electric
let ice = Ice
let fighting = Fighting
let poison = Poison
let ground = Ground
let flying = Flying
let psychic = Psychic
let bug = Bug
let rock = Rock
let ghost = Ghost
let dark = Dark
let dragon = Dragon
let steel = Steel
let fairy = Fairy

type p_moves = { move_name: string; damage: int; move_type : p_types; accuracy: int}

type t = { p_id: int; p_name: string; p_type: p_types; p_moves: p_moves list }


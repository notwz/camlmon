(** Representation of user command *)

type command =
  | Up
  | Down
  | Left
  | Right
  | Quit
      (** The type [command] represents a player command that is
          decomposed into a direction and a command to quit. *)

exception Empty
(** Raised when an empty command is parsed. *)

exception Malformed
(** Raised when a malformed command is encountered. *)

val parse : string -> command
(** [parse str] parses a player's input into a [command], as follows.
    The first word (i.e., consecutive sequence of non-space characters)
    of [str] becomes the verb.

    - [parse "    up   "] is [Up]
    - [parse "  down "] is [Down]
    - [parse "right"] is [Right]
    - [parse "  q "] is [Quit].

    Requires: [str] contains only alphanumeric (A-Z, a-z, 0-9) and space
    characters (only ASCII character code 32; not tabs or newlines,
    etc.).

    Raises: [Empty] if [str] is the empty string or contains only
    spaces.

    Raises: [Malformed] if the command is malformed. A command is
    {i malformed} if the verb is neither "quit" nor "go", or if the verb
    is "quit" and there is a non-empty object phrase, or if the verb is
    "go" and there is an empty object phrase.*)
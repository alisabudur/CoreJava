val append : 'a list -> 'a list -> 'a list
val find : 'a -> 'a list -> bool
val union : 'a list -> 'a list -> 'a list
val difference : 'a list -> 'a list -> 'a list -> (string * string) list
val check_dup : 'a list -> bool
val toStringPair : string * string -> string
val toStringPairs : (string * string) list -> string

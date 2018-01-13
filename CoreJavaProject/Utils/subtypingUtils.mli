val first : 'a * 'b -> 'a
val last : 'a * 'b -> 'b
val searchForPairs :
  string * string -> (string * string) list -> (string * string) list
val searchForAllPairs :
  (string * string) list -> (string * string) list -> (string * string) list
val existsNewPairs : 'a list -> 'a list -> bool
val transitiveClosure : (string * string) list -> (string * string) list

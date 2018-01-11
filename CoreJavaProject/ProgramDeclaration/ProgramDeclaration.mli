type cJProgram = CJProgram of ClassDeclaration.cJClass list
val getClassList : cJProgram -> ClassDeclaration.cJClass list
val toStringCJProgram : cJProgram -> string
val classListWellTyped : cJProgram -> bool
val classListNoDuplicated : cJProgram -> bool
val lastClassIsMain : cJProgram -> bool
val programWellTyped : cJProgram -> bool
val getInheritancePairs : cJProgram -> (string * string) list
val toStringInheritancePairs : (string * string) list -> string
val first : 'a * 'b -> 'a
val last : 'a * 'b -> 'b
val searchForPairs :
  string * string -> (string * string) list -> (string * string) list
val searchForAllPairs :
  (string * string) list -> (string * string) list -> (string * string) list
val existsNewPairs : 'a list -> 'a list -> bool
val transitiveClosure : (string * string) list -> (string * string) list

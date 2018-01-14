type cJProgram = CJProgram of ClassDeclaration.cJClass list
val getClassList : cJProgram -> ClassDeclaration.cJClass list
val toStringCJProgram : cJProgram -> string
val classListNoDuplicated : cJProgram -> bool
val lastClassIsMain : cJProgram -> bool
val getInheritancePairs : cJProgram -> (string * string) list
val getClassWithName : string -> cJProgram -> ClassDeclaration.cJClass
val isSubtype : cJProgram -> string * string -> bool

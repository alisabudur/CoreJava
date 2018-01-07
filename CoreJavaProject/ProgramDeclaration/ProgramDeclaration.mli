type cJProgram = CJProgram of ClassDeclaration.cJClass list
val toStringCJProgram : cJProgram -> string
val classListWellTyped : cJProgram -> bool
val classListNoDuplicated : cJProgram -> bool
val programWellTyped : cJProgram -> bool

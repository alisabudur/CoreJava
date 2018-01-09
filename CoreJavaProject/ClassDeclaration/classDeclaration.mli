type cJClass =
    CJClass of string * string * FieldDeclaration.cJFieldList *
      MethodDeclaration.cJMethodList
val toStringCJClass : cJClass -> string
val classWellTyped : cJClass -> bool
val getClassName : cJClass -> string
val getFiledList : cJClass -> FieldDeclaration.cJFieldList
val hasMainMethod : cJClass -> bool
val getInheritancePair : cJClass -> string * string
val toStringPair : string * string -> string

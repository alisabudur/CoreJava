type cJClass =
    CJClass of string * string * FieldDeclaration.cJFieldList *
      MethodDeclaration.cJMethodList
val toStringCJClass : cJClass -> string

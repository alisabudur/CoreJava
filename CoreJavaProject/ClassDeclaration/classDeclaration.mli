type cJClass =
    CJClass of string * string * FieldDeclaration.cJFieldList *
      MethodDeclaration.cJMethodList
val toStringCJClass : cJClass -> string
val classWellTyped : cJClass -> bool
val getClassName : cJClass -> string
val getFieldList : cJClass -> FieldDeclaration.cJFieldList
val getMethodList : cJClass -> MethodDeclaration.cJMethodList
val hasMainMethod : cJClass -> bool
val getInheritancePair : cJClass -> string * string
val getFieldWithName :
  string -> FieldDeclaration.cJFieldList -> FieldDeclaration.cJField
val getMethodWithName :
  string -> MethodDeclaration.cJMethodList -> MethodDeclaration.cJMethod

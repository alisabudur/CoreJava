open FieldDeclaration;;
open MethodDeclaration;;

type cJClass = CJClass of string*string*cJFieldList*cJMethodList;;

val toStringCJClass : cJClass -> string;;
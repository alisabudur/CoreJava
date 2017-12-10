open TypeDeclaration;;

type cJField = CJField of (cJType*string);;

type cJFieldList = CJFieldList of cJField list;;

val toStringCJField : cJField -> string;;

val toStringCJFieldList : cJFieldList -> string;;
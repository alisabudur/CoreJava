type cJField = CJField of (TypeDeclaration.cJType * string)
type cJFieldList = CJFieldList of cJField list
val toStringCJField : cJField -> string
val toStringCJFieldList : cJFieldList -> string

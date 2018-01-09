type cJField = CJField of (TypeDeclaration.cJType * string)
type cJFieldList = CJFieldList of cJField list
val getType : cJField -> TypeDeclaration.cJType
val getName : cJField -> string
val toStringCJField : cJField -> string
val toStringCJFieldList : cJFieldList -> string
val getFieldName : cJField -> string
val fieldListNotDuplicated : cJFieldList -> bool

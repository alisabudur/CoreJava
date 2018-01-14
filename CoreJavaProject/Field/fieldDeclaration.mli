type cJField = CJField of (TypeDeclaration.cJType * string)
type cJFieldList = CJFieldList of cJField list
val getFieldType : cJField -> TypeDeclaration.cJType
val toStringCJField : cJField -> string
val toStringCJFieldList : cJFieldList -> string
val getFieldName : cJField -> string
val fieldListNotDuplicated : cJFieldList -> bool

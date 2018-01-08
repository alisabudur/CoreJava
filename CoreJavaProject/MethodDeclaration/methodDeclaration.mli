type cJMethodParameter = CJMethodParameter of TypeDeclaration.cJType * string
type cJMethodParameterList = CJMethodParameterList of cJMethodParameter list
type cJMethod =
    CJMethod of TypeDeclaration.cJType * string * cJMethodParameterList *
      ExpDeclaration.superExp
type cJMethodList = CJMethodList of cJMethod list
val toStringCJMethodParameter : cJMethodParameter -> string
val toStringCJMethodParameterList : cJMethodParameterList -> string
val toStringCJMethod : cJMethod -> string
val toStringCJMethodList : cJMethodList -> string
val getMethodName : cJMethod -> string
val methodListNotDuplicated : cJMethodList -> bool
val existMainMethod : cJMethodList -> bool

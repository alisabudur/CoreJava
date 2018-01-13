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
val getParameterType : cJMethodParameter -> TypeDeclaration.cJType
val getParameterName : cJMethodParameter -> string
val getMethodReturnType : cJMethod -> TypeDeclaration.cJType
val getMethodSuperExp : cJMethod -> ExpDeclaration.superExp
val methodListNotDuplicated : cJMethodList -> bool
val existMainMethod : cJMethodList -> bool
val getParametersTE : cJMethodParameterList -> (string * string) list
val getVariablesTE : ExpDeclaration.superExp -> (string * string) list
val getMethodTE : cJMethod -> (string * string) list

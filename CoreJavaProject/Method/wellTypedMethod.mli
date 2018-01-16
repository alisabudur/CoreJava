val printTE : (string * TypeDeclaration.cJType) list -> string
val wellTypedMethod :
  MethodDeclaration.cJMethod ->
  string * TypeDeclaration.cJType -> ProgramDeclaration.cJProgram -> bool
val wellTypedMethodList :
  MethodDeclaration.cJMethodList ->
  string * TypeDeclaration.cJType -> ProgramDeclaration.cJProgram -> bool

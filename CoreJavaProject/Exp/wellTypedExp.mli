val wellTypedExp :
  ExpDeclaration.exp ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> bool
val wellTypedVarList :
  ExpDeclaration.varList ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> bool
val wellTypedExp2 :
  ExpDeclaration.exp2 ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> bool
val wellTypedExp3 :
  ExpDeclaration.exp3 ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> bool
val wellTypedSuperExp :
  ExpDeclaration.superExp ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> bool

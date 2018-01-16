val printTE : (string * TypeDeclaration.cJType) list -> string
val getVarType :
  string -> (string * TypeDeclaration.cJType) list -> TypeDeclaration.cJType
val existsVar : string -> (string * TypeDeclaration.cJType) list -> bool
val getTypeOfConstExp : ExpDeclaration.constExp -> TypeDeclaration.cJType
val getTypeOfExp :
  ExpDeclaration.exp ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> TypeDeclaration.cJType
val getTypeOfExp2 :
  ExpDeclaration.exp2 ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> TypeDeclaration.cJType
val getTypeOfExp3 :
  ExpDeclaration.exp3 ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> TypeDeclaration.cJType
val getTypeOfSuperExp :
  ExpDeclaration.superExp ->
  (string * TypeDeclaration.cJType) list ->
  ProgramDeclaration.cJProgram -> TypeDeclaration.cJType

val getVarType : string -> (string * string) list -> string
val getTypeOfConstExp : ExpDeclaration.constExp -> string
val getTypeOfExp :
  ExpDeclaration.exp ->
  (string * string) list -> ProgramDeclaration.cJProgram -> string
val getTypeOfExp2 :
  ExpDeclaration.exp2 ->
  (string * string) list -> ProgramDeclaration.cJProgram -> string
val getTypeOfExp3 :
  ExpDeclaration.exp3 ->
  (string * string) list -> ProgramDeclaration.cJProgram -> string
val getTypeOfSuperExp :
  ExpDeclaration.superExp ->
  (string * string) list -> ProgramDeclaration.cJProgram -> string

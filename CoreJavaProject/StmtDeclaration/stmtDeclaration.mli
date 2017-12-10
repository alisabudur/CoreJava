type stmt =
    IfStmt of ExpDeclaration.exp * stmt
  | IfElseStmt of ExpDeclaration.exp * stmt * stmt
  | WhileStmt of ExpDeclaration.exp * stmt
  | CompoundStmt of stmt * stmt
  | AssignStmt of string * ExpDeclaration.exp
	| ReturnStmt of ExpDeclaration.exp;;

val toStringStmt : stmt -> string

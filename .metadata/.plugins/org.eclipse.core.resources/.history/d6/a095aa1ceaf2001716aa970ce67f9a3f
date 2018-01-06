open ExpDeclaration;;

type stmt = IfStmt of exp*stmt
					| IfElseStmt of exp*stmt*stmt
					| WhileStmt of exp*stmt
					| CompoundStmt of stmt*stmt
					| AssignStmt of string*exp
					| ReturnStmt of exp;;

let rec toStringStmt (s: stmt) = 
	match s with
	| IfStmt(exp, st) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringStmt(st); "\n}\n"]
	| IfElseStmt(exp, ifSt, elseSt) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringStmt(ifSt); "\n}\nelse\n{\n"; toStringStmt(elseSt); "\n}\n"]
	| WhileStmt(exp, st) -> String.concat "" ["while("; toStringExp(exp); ")\n{\n"; toStringStmt(st); "\n}\n"]
	| CompoundStmt(st1, st2) -> String.concat "" [toStringStmt(st1); "\n"; toStringStmt(st2)]
	| AssignStmt(name, exp) -> String.concat "" [name; " = "; toStringExp(exp)]
	| ReturnStmt(exp) -> String.concat "" ["return "; toStringExp(exp)];;
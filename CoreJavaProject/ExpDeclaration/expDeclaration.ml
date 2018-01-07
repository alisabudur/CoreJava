open TypeDeclaration;;



type operatorInt = AddInt 
					| SubInt
					| MulInt
					| DivInt;;

type operatorFloat = AddFloat
					| SubFloat
					| MulFloat
					| DivFloat;; 

type constExp = ConstInt of int
					| ConstFloat of float
					| ConstBool of bool
					| ConstString of string
					| ConstVoid
					| Null;;

type exp = ArithIntExp of operatorInt*exp*exp
					| ArithFloatExp of operatorFloat*exp*exp
					| ConstExp of constExp
					| VariableExp of string
					| FieldValueExp of string*string
					| NotExp of exp
					| GreaterExp of exp*exp
					| LessExp of exp*exp
					| EqualExp of exp*exp
					| NotEqualExp of exp*exp
					| AndExp of exp*exp
					| OrExp of exp*exp;;

type varList = VarList of exp list;;

(*type boolExp = NotExp of boolExp
					| GreaterExp of exp*exp
					| LessExp of exp*exp
					| EqualExp of exp*exp
					| NotEqualExp of exp*exp
					| AndExp of boolExp*boolExp
					| OrExp of boolExp*boolExp;;*)

type exp2 = NewExp of string*varList
					| MethodCall of string*varList;;

type superExp = Exp of exp
					| Exp2 of exp2
					| IfExp of exp*superExp
					| IfElseExp of exp*superExp*superExp
					| WhileExp of exp*superExp
					| CompoundExp of superExp*superExp
					| AssignExp of string*superExp
					| ReturnExp of exp
					| DeclareVarExp of cJType*string;;

(*let rec toStringBoolExp (e: boolExp) = 
	match e with
	| NotExp(e) -> String.concat "" [toStringBoolExp(e)]
	| GreaterExp(param1, param2) -> String.concat "" [string_of_int(param1); " > "; string_of_int(param2)]
	| LessExp(param1, param2) -> String.concat "" [string_of_int(param1); " < "; string_of_int(param2)]
	| EqualExp(param1, param2) -> String.concat "" [string_of_int(param1); " == "; string_of_int(param2)]
	| AndExp(param1, param2) -> String.concat "" [toStringBoolExp(param1); " && "; toStringBoolExp(param2)]
	| OrExp(param1, param2) -> String.concat "" [toStringBoolExp(param1); " || "; toStringBoolExp(param2)];;*)

let toStringConstExp (e: constExp) = 
	match e with
	| ConstInt(p) -> String.concat "" [string_of_int(p)]
	| ConstFloat(p) -> String.concat "" [string_of_float(p)]
	| ConstBool(p) -> String.concat "" [string_of_bool(p)]
	| ConstString(p) -> p
	| ConstVoid -> "()"
	| Null -> "null";;

let toStringOpeatorInt (o: operatorInt) = 
	match o with
	| AddInt -> " + "
	| SubInt -> " - "
	| MulInt -> " * "
	| DivInt -> " / ";;

let toStringOpeatorFloat (o: operatorFloat) = 
	match o with
	| AddFloat -> " +. "
	| SubFloat -> " -. "
	| MulFloat -> " *. "
	| DivFloat -> " /. ";;

let rec toStringExp (e : exp) = 
	match e with
	| ArithIntExp(operator, exp1, exp2) -> String.concat "" [toStringExp(exp1); " "; toStringOpeatorInt(operator); " "; toStringExp(exp2)]
	| ArithFloatExp(operator, exp1, exp2) -> String.concat "" [toStringExp(exp1); " "; toStringOpeatorFloat(operator); " "; toStringExp(exp2)]
	| ConstExp(e) -> toStringConstExp(e)
	| VariableExp(name) -> String.concat "" [name]
	| FieldValueExp(objectName, fieldName) -> String.concat "." [objectName; fieldName]
	| NotExp(e) -> String.concat "" [toStringExp(e)]
	| GreaterExp(param1, param2) -> String.concat "" [toStringExp(param1); " > "; toStringExp(param2)]
	| LessExp(param1, param2) -> String.concat "" [toStringExp(param1); " < "; toStringExp(param2)]
	| EqualExp(param1, param2) -> String.concat "" [toStringExp(param1); " == "; toStringExp(param2)]
	| NotEqualExp(param1, param2) -> String.concat "" [toStringExp(param1); " == "; toStringExp(param2)]
	| AndExp(param1, param2) -> String.concat "" [toStringExp(param1); " && "; toStringExp(param2)]
	| OrExp(param1, param2) -> String.concat "" [toStringExp(param1); " || "; toStringExp(param2)];;

let rec toStringVarList(l: varList) = 
	match l with
	| VarList([]) -> ""
	| VarList([x]) -> toStringExp(x)
	| VarList(x::y) -> String.concat "" [toStringExp(x); ", "; toStringVarList(VarList(y))];;

let rec toStringExp2 (e: exp2) =
	match e with
	| NewExp(name, varList) -> String.concat "" ["new "; name; "("; toStringVarList(varList); ")"]
	| MethodCall(name, varList) -> String.concat "" [name; "("; toStringVarList(varList); ")"];;

let rec toStringSuperExp(e: superExp) = 
	match e with
	| Exp(e) -> toStringExp(e)
	| Exp2(e) -> toStringExp2(e)
	| IfExp(exp, st) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringSuperExp(st); "\n}\n"]
	| IfElseExp(exp, ifSt, elseSt) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringSuperExp(ifSt); "\n}\nelse\n{\n"; toStringSuperExp(elseSt); "\n}\n"]
	| WhileExp(exp, st) -> String.concat "" ["while("; toStringExp(exp); ")\n{\n"; toStringSuperExp(st); "\n}\n"]
	| CompoundExp(st1, st2) -> String.concat "" [toStringSuperExp(st1); "\n"; toStringSuperExp(st2)]
	| AssignExp(name, exp) -> String.concat "" [name; " = "; toStringSuperExp(exp)]
	| ReturnExp(exp) -> String.concat "" ["return "; toStringExp(exp)]
	| DeclareVarExp(tip, name) -> String.concat " " [toStringCJType(tip); name]

(*let rec toStringBlkExp (s: blkExp) = 
	match s with
	| IfExp(exp, st) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringBlkExp(st); "\n}\n"]
	| IfElseExp(exp, ifSt, elseSt) -> String.concat "" ["if("; toStringExp(exp); ")\n{\n"; toStringBlkExp(ifSt); "\n}\nelse\n{\n"; toStringBlkExp(elseSt); "\n}\n"]
	| WhileExp(exp, st) -> String.concat "" ["while("; toStringExp(exp); ")\n{\n"; toStringBlkExp(st); "\n}\n"]
	| CompoundExp(st1, st2) -> String.concat "" [toStringBlkExp(st1); "\n"; toStringBlkExp(st2)]
	| AssignExp(name, exp) -> String.concat "" [name; " = "; toStringSuperExp(exp)]
	| ReturnExp(exp) -> String.concat "" ["return "; toStringExp(exp)]*)
	
		
				


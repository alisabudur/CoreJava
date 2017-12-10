open TypeDeclaration;;

type boolExp = NotExp of boolExp
					| GreaterExp of int*int
					| LessExp of int*int
					| EqualExp of int*int;;


type exp = ArithExp of string*exp*exp
					| ConstExp of string
					| VariableExp of string
					| FieldValueExp of string*string
					| BoolExp of boolExp;;

let rec toStringBoolExp (e: boolExp) = 
	match e with
	| NotExp(e) -> String.concat "" [toStringBoolExp(e)]
	| GreaterExp(param1, param2) -> String.concat "" [string_of_int(param1); " > "; string_of_int(param2)]
	| LessExp(param1, param2) -> String.concat "" [string_of_int(param1); " < "; string_of_int(param2)]
	| EqualExp(param1, param2) -> String.concat "" [string_of_int(param1); " == "; string_of_int(param2)];;

let rec toStringExp (e : exp) = 
	match e with
	| ArithExp(operator, exp1, exp2) -> String.concat "" [toStringExp(exp1); " "; operator; " "; toStringExp(exp2)]
	| ConstExp(name) -> String.concat "" [name]
	| VariableExp(name) -> String.concat "" [name]
	| FieldValueExp(objectName, fieldName) -> String.concat "." [objectName; fieldName]
	| BoolExp(boolExp) -> String.concat "" [toStringBoolExp(boolExp)];;
		
				


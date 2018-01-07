open ClassDeclaration;;

type cJProgram = CJProgram of cJClass list;;

let rec toStringCJProgram (p : cJProgram) = 
	match p with
	| CJProgram([]) -> ""
	| CJProgram(x::y) -> String.concat "" [toStringCJClass(x); "\n\n"; toStringCJProgram(CJProgram(y))]
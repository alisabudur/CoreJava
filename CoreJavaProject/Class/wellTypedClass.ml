open ClassDeclaration;;
open FieldDeclaration;;
open MethodDeclaration;;
open TypeDeclaration;;
open ProgramDeclaration;;
open WellTypedMethod;;

let wellTypedClass (c: cJClass) (p: cJProgram) = 
	match c with 
	| CJClass(name, parentName, fieldList, methodList) -> (fieldListNotDuplicated fieldList) && 
																												(methodListNotDuplicated methodList) &&
																												(wellTypedMethodList methodList p);;

let rec wellTypedClassList (p: cJProgram) (paux: cJProgram) = 
	match p with 
	| CJProgram([]) -> false
	| CJProgram([x]) -> wellTypedClass x paux
	| CJProgram(x::y) -> (wellTypedClass x paux) && 
											 (wellTypedClassList (CJProgram(y)) paux);;
open MethodDeclaration;;
open ProgramDeclaration;;
open TypeDeclaration;;
open ExpUtils;;
open MethodUtils;;
open WellTypedExp;;

let rec wellTypedMethod (m: cJMethod) (p: cJProgram) =
	 (isSubtype p ((toStringCJType (getMethodBodyType m p)), (toStringCJType (getMethodReturnType m)))) && (wellTypedSuperExp (getMethodSuperExp m) (getMethodTE m) p);;

let rec wellTypedMethodList (l: cJMethodList) (p: cJProgram) = 
	match l with 
	| CJMethodList([]) -> true
	| CJMethodList([x]) -> wellTypedMethod x p
	| CJMethodList(h::t) -> (wellTypedMethod h p) && 
													(wellTypedMethodList (CJMethodList(t)) p);
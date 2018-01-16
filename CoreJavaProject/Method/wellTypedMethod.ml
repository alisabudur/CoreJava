open MethodDeclaration;;
open ProgramDeclaration;;
open TypeDeclaration;;
open ListUtils;;
open ExpUtils;;
open MethodUtils;;
open WellTypedExp;;
open SubtypingUtils;;

let rec printTE(t: (string*cJType) list) = 
	match t with
	| [] -> ""
	| [x] -> String.concat "" [first(x); "-"; (toStringCJType (last(x)));"\n"]
	| h::t -> String.concat "" [first(h); "-"; (toStringCJType (last(h)));"\n"; printTE(t)];; 

let rec wellTypedMethod (m: cJMethod) (teClass: (string*cJType)) (p: cJProgram) =	
	(isSubtype p ((toStringCJType (getMethodBodyType m teClass p)), (toStringCJType (getMethodReturnType m)))) && (wellTypedSuperExp (getMethodSuperExp m) (teClass :: (getMethodTE m)) p);;

let rec wellTypedMethodList (l: cJMethodList) (teClass: (string*cJType)) (p: cJProgram) = 
	match l with 
	| CJMethodList([]) -> true
	| CJMethodList([x]) -> wellTypedMethod x teClass p
	| CJMethodList(h::t) -> (wellTypedMethod h teClass p) && 
													(wellTypedMethodList (CJMethodList(t)) teClass p);;
													
													
													
open FieldDeclaration;;
open MethodDeclaration;;

type cJClass = CJClass of string*string*cJFieldList*cJMethodList;;

let toStringCJClass (c: cJClass) = 
	match c with 
	| CJClass(name, parentName, fieldList, methodList) -> 
		String.concat "" ["class "; name; " extends "; parentName; "{\n\n"; toStringCJFieldList(fieldList); "#\n\n"; toStringCJMethodList(methodList); "}" ];;

let getClassName(c: cJClass) = 
	match c with
	| CJClass(name, _, _, _) -> name;;

let getFieldList(c: cJClass) = 
	match c with 
	| CJClass(_, _, fieldList, _) -> fieldList;;

let getMethodList(c: cJClass) = 
	match c with 
	| CJClass(_, _, _, methodList) -> methodList;;
		
let hasMainMethod(c: cJClass) =
	match c with
	| CJClass(_, _, _, methodList)	-> 	existMainMethod(methodList);;

let getInheritancePair(c: cJClass): (string*string) = 
	match c with 
	| CJClass(child, parent, _, _) -> (child, parent);;

let rec getFieldWithName(name:string) (l: cJFieldList) = 
	match l with
	| CJFieldList([]) -> raise (Failure (String.concat " " ["ClassDeclaration:"; "No field with name: "; name]))
	| CJFieldList(h::t) -> if getFieldName(h) = name then 
														h 
												 else 
													 	getFieldWithName name (CJFieldList(t));;

let rec getMethodWithName(name: string) (l: cJMethodList) = 
	match l with
	| CJMethodList([]) -> raise (Failure (String.concat " " ["ClassDeclaration:"; "No method with name: "; name]))
  | CJMethodList(h :: t) -> if getMethodName(h) = name then 
															 h 
														else 
															 getMethodWithName name (CJMethodList(t));;
		 




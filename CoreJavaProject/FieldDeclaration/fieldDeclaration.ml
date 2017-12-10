open TypeDeclaration;;

type cJField = CJField of (cJType*string);;

type cJFieldList = CJFieldList of cJField list;;

let toStringCJField (f:cJField) = 
	match f with
	| CJField (typ, name) -> String.concat "" [toStringCJType(typ); " "; name];;

let rec toStringCJFieldList (list: cJFieldList) = 
	match list with
	| CJFieldList([]) -> ""
	| CJFieldList([x]) -> String.concat "" [toStringCJField(x); "\n\n"]
	| CJFieldList(x::y) -> String.concat "" [toStringCJField(x); "\n"; toStringCJFieldList(CJFieldList(y))]
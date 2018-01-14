type cJPrimType = CJInt 
								| CJFloat 
								| CJBool 
								| CJString
								| CJVoid;;

type cJClassType = CJClassType of string;;
 
type cJBottom = CJBottom of string;;

type cJType = CJPrimType of cJPrimType
						| CJClassType of cJClassType
						| CJBottom of cJBottom;;

let toStringCJPrimType (t:cJPrimType) = 
	match t with
	| CJInt -> "int"
	| CJFloat -> "float"
	| CJBool -> "bool"
	| CJString -> "string"
	| CJVoid -> "void";;

let toStringCJClassType (t: cJClassType) =
	match t with
	| CJClassType(s) -> s;;

let toStringCJType (t:cJType) =
	match t with
	| CJPrimType(s) -> toStringCJPrimType s
	| CJClassType(s) -> toStringCJClassType s
	| CJBottom(s) -> "_|_";;

let isClassType(t: cJType) = 
	match t with
	| CJPrimType(_) -> false
	| CJClassType(_) -> true
	| CJBottom(_) -> false;;


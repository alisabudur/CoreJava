type cJPrimType = CJInt 
								| CJFloat 
								| CJBool 
								| CJString
								| CJVoid;; 

type cJType = CJPrimType of cJPrimType
						| CJClassType of string;;

val toStringCJPrimType : cJPrimType -> string;;

val toStringCJType : cJType -> string;;
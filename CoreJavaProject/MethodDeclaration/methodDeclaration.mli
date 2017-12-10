open TypeDeclaration;;
open StmtDeclaration;;

type cJMethodParameter = CJMethodParameter of cJType*string;;

type cJMethodParameterList = CJMethodParameterList of cJMethodParameter list;;

type cJMethod = CJMethod of cJType*string*cJMethodParameterList*stmt;;

type cJMethodList = CJMethodList of cJMethod list;;

val toStringCJMethodParameter : cJMethodParameter -> string;;

val toStringCJMethodParameterList : cJMethodParameterList -> string;;

val toStringCJMethod : cJMethod -> string;;

val toStringCJMethodList : cJMethodList -> string;;
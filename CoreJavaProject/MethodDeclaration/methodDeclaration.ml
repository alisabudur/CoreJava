open TypeDeclaration;;
open ExpDeclaration;;

type cJMethodParameter = CJMethodParameter of cJType*string;;

type cJMethodParameterList = CJMethodParameterList of cJMethodParameter list;;

type cJMethod = CJMethod of cJType*string*cJMethodParameterList*superExp;;

type cJMethodList = CJMethodList of cJMethod list;;

let toStringCJMethodParameter (p: cJMethodParameter) = 
	match p with
	| CJMethodParameter(tip, name) -> String.concat "" [toStringCJType(tip); " "; name];;

let rec toStringCJMethodParameterList (list: cJMethodParameterList) =
	match list with
	| CJMethodParameterList([]) -> ""
	| CJMethodParameterList([x]) -> String.concat "" [toStringCJMethodParameter(x)]
	| CJMethodParameterList(x::y) -> String.concat "" [toStringCJMethodParameter(x); ", "; toStringCJMethodParameterList(CJMethodParameterList(y))];;

let toStringCJMethod (m: cJMethod) =
	match m with
	| CJMethod(typ, name, paramList, st) -> String.concat "" [toStringCJType(typ); " "; name; "("; toStringCJMethodParameterList(paramList); ") {\n"; toStringSuperExp(st); "\n}\n"];;

let rec toStringCJMethodList (list: cJMethodList) =
	match list with
	| CJMethodList([]) -> ""
	| CJMethodList([x]) -> String.concat "" [toStringCJMethod(x); "\n\n"]
	| CJMethodList(x::y) -> String.concat "" [toStringCJMethod(x); "\n\n"; toStringCJMethodList(CJMethodList(y))];;

let rec methodListNotDuplicated(list: cJMethodList) =
	match list with 
	| CJMethodList([]) -> true
	| CJMethodList([x]) -> true
	| CJMethodList(h::t) -> let x = (List.filter (fun x -> x = h) t) in
         if (x == []) then
					begin
							Printf.printf "%s\n" "x method empty";
            	methodListNotDuplicated(CJMethodList(t));
					end						
         else	
					begin	
							Printf.printf "%s\n" "x method not empty";				
       				false;
					end
						
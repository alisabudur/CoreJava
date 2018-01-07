open ClassDeclaration;;

type cJProgram = CJProgram of cJClass list;;

let rec toStringCJProgram (p : cJProgram) = 
	match p with
	| CJProgram([]) -> ""
	| CJProgram(x::y) -> String.concat "" [toStringCJClass(x); "\n\n"; toStringCJProgram(CJProgram(y))];;

let rec classListWellTyped (p : cJProgram) = 
	match p with 
	| CJProgram([]) -> false
	| CJProgram([x]) -> classWellTyped(x)
	| CJProgram(x::y) -> classWellTyped(x) && classListWellTyped(CJProgram(y));;

let rec classListNoDuplicated(p: cJProgram) = 
	match p with
	| CJProgram([]) -> true
	| CJProgram([x]) -> true
	| CJProgram(h::t) -> let x = (List.filter (fun x -> getClassName(x) = getClassName(h)) t) in
         if (x == []) then
					begin	
							Printf.printf "%s\n" "x class empty";					
            	classListNoDuplicated(CJProgram(t));
					end						
         else	
					begin	
							Printf.printf "%s\n" "x class not empty";				
       				false;
					end;;

let programWellTyped(p: cJProgram):bool = classListWellTyped(p) && classListNoDuplicated(p);;
	
					
					
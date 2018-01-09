open ClassDeclaration;;

type cJProgram = CJProgram of cJClass list;;

let getClassList(p : cJProgram) = 
	match p with 
	| CJProgram(l) -> l;;

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

let lastClassIsMain(p: cJProgram):bool = hasMainMethod(List.hd(List.rev(getClassList(p))));;	

let programWellTyped(p: cJProgram):bool = classListWellTyped(p) && classListNoDuplicated(p) && lastClassIsMain(p);;

let rec getInheritancePairs(p: cJProgram): ((string*string) list) = 
	match p with 
	| CJProgram([]) -> []
	| CJProgram(h::t) -> getInheritancePair(h) :: getInheritancePairs(CJProgram(t));;	

let rec toStringInheritancePairs(l: (string*string) list) = 
	match l with 
	| [] -> ""
	| h::t -> String.concat "" [toStringPair(h); toStringInheritancePairs(t)];;	
	
let first(child, _) = child;;
let last(_, parent) = parent;;

let searchForPairs(h: string*string) (l: (string*string) list): ((string*string) list) = 
	let x = (List.filter (fun x -> first(x) = last(h)) l) in
				if (x == []) then
					begin	
							Printf.printf "%s\n" "x empty";					
							[];
					end						
         else	
					begin	
							Printf.printf "%s\n" "x  not empty";				
       				(List.map (fun y -> (first(h), last(y))) x);
					end;;

let append l1 l2 =
  let rec loop acc l1 l2 =
    match l1, l2 with
    | [], [] -> List.rev acc
    | [], h :: t -> loop (h :: acc) [] t
    | h :: t, l -> loop (h :: acc) t l
    in
    loop [] l1 l2;;

let rec getInheritanceTree(l: (string*string) list) ( rez: (string*string) list) = 
 	match l with
	| [] -> rez 
	| h::t -> (getInheritanceTree (append t (searchForPairs h t))  (h::rez));;

					
					
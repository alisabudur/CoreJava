open MethodDeclaration;;
open ProgramDeclaration;;
open ExpUtils;;

let rec getMethodBodyType (m: cJMethod) (p: cJProgram) = 
	getTypeOfSuperExp (getMethodSuperExp(m)) (getMethodTE(m)) p;;


open MethodDeclaration;;
open ProgramDeclaration;;
open TypeDeclaration;;
open ExpUtils;;

let rec getMethodBodyType (m: cJMethod) (teClass: (string*cJType)) (p: cJProgram) = 
	getTypeOfSuperExp (getMethodSuperExp(m)) (teClass :: (getMethodTE(m))) p;;


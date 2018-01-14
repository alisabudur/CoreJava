open ProgramDeclaration;;
open TypeDeclaration;;
open WellTypedClass;;

let wellTypedProgram (p: cJProgram) = 
	(wellTypedClassList p p) && classListNoDuplicated(p) && lastClassIsMain(p);;
open ClassDeclaration;;

type cJProgram = CJProgram of cJClass list;;

val toStringCJProgram : cJProgram -> string;;
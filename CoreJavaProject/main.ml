open ClassDeclaration;;
open MethodDeclaration;;
open FieldDeclaration;;
open TypeDeclaration;;
open ProgramDeclaration;;
open ExpDeclaration;;
open SubtypingUtils;;
open ListUtils;;
open ExpUtils;;
open MethodUtils;;
open WellTypedMethod;;
open WellTypedProgram;;

let nameParameter = CJMethodParameter(CJPrimType(CJString), "newName");;
let ageParameter = CJMethodParameter(CJPrimType(CJInt), "newAge");;

let setNameParameterList = CJMethodParameterList([nameParameter; ageParameter]);;
let emptyParameterList = CJMethodParameterList([]);;

let declareStmt = DeclareVarExp(CJClassType(CJClassType("Person")), "name");;
let varList = VarList([ConstExp(ConstString("name"))]);;
let newStmt = (Exp2(NewExp(CJClassType("Person"), varList)));;
let assignStmt = AssignExp("name", newStmt);;
let assignStmt2 = AssignExp("newVar", newStmt);;
let compoundStmt = CompoundExp(assignStmt, Exp3(newStmt));;
let compoundStmt2 = CompoundExp(declareStmt, compoundStmt);;
let ifStmt = IfExp(ConstExp(ConstString("name")), compoundStmt2);;

let constExp1 = ConstExp(ConstInt(1));;
let varList = VarList([constExp1]);;
let methodCallStmt = Exp3(Exp2(MethodCall("a", "setName", varList)));;
let constExp2 = Exp3(Exp(ConstExp(ConstString("ceva"))));;
let compountStmt3 = CompoundExp(methodCallStmt, constExp2);;

let setNameMethod = CJMethod(CJClassType(CJClassType("Object")), "setName", setNameParameterList, ifStmt);;
let getNameMethod = CJMethod(CJPrimType(CJString), "getName", emptyParameterList, compountStmt3);;

let methodList = CJMethodList([setNameMethod; getNameMethod]);;

let nameField = CJField(CJPrimType(CJString), "name");;
let ageField = CJField(CJPrimType(CJInt), "age");;

let fieldList = CJFieldList([nameField; ageField]);;

let personClass = CJClass("Person", "Object", fieldList, methodList);;
let personClass2 = CJClass("Person2", "Person", CJFieldList([]), methodList);;
let personClass3 = CJClass("Person3", "Person2", CJFieldList([]), methodList);;

let program = CJProgram([personClass2]);;

let stringProgram = toStringCJProgram(program);;


Printf.printf "%s\n--------------------------\n" stringProgram;;
(*Printf.printf "Program well typed: %s\n" (string_of_bool (wellTypedProgram program));;*)
Printf.printf "Method well typed: %s\n" (string_of_bool (wellTypedMethod setNameMethod program));;
Printf.printf "Method returned type: %s\n" (toStringCJType (getMethodReturnType setNameMethod));;
Printf.printf "Method body type: %s\n" (toStringCJType (getMethodBodyType setNameMethod program));;



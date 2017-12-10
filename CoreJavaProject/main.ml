open ClassDeclaration;;
open MethodDeclaration;;
open FieldDeclaration;;
open TypeDeclaration;;
open ProgramDeclaration;;
open StmtDeclaration;;
open ExpDeclaration;;

let nameParameter = CJMethodParameter(CJPrimType(CJString), "newName");;
let ageParameter = CJMethodParameter(CJPrimType(CJInt), "newAge");;

let setNameParameterList = CJMethodParameterList([nameParameter; ageParameter]);;
let emptyParameterList = CJMethodParameterList([]);;

let assignStmt = AssignStmt("name", ConstExp("newName"));;
let ifStmt = IfStmt(ConstExp("name"), assignStmt);;

let returnStmt = ReturnStmt(ConstExp("name"));;
let setNameMethod = CJMethod(CJPrimType(CJVoid), "setName", setNameParameterList, ifStmt);;
let getNameMethod = CJMethod(CJPrimType(CJString), "getName", emptyParameterList, returnStmt);;
let methodList = CJMethodList([setNameMethod; getNameMethod]);;

let nameField = CJField(CJPrimType(CJString), "name");;
let ageField = CJField(CJPrimType(CJInt), "age");;

let fieldList = CJFieldList([nameField; ageField]);;

let personClass = CJClass("Person", "Object", fieldList, methodList);;

let program = CJProgram([personClass]);;

let v3 = toStringCJProgram(program);;

Printf.printf "%s" v3;;
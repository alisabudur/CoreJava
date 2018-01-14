type operatorInt = AddInt | SubInt | MulInt | DivInt
type operatorFloat = AddFloat | SubFloat | MulFloat | DivFloat
type constExp =
    ConstInt of int
  | ConstFloat of float
  | ConstBool of bool
  | ConstString of string
  | ConstVoid
  | Null
type exp =
    ArithIntExp of operatorInt * exp * exp
  | ArithFloatExp of operatorFloat * exp * exp
  | ConstExp of constExp
  | VariableExp of string
  | FieldValueExp of string * string
  | NotExp of exp
  | GreaterExp of exp * exp
  | LessExp of exp * exp
  | EqualExp of exp * exp
  | NotEqualExp of exp * exp
  | AndExp of exp * exp
  | OrExp of exp * exp
type varList = VarList of exp list
type exp2 =
    NewExp of TypeDeclaration.cJClassType * varList
  | MethodCall of string * string * varList
type exp3 = Exp of exp | Exp2 of exp2
type superExp =
    Exp3 of exp3
  | IfExp of exp * superExp
  | IfElseExp of exp * superExp * superExp
  | WhileExp of exp * superExp
  | CompoundExp of superExp * superExp
  | AssignExp of string * exp3
  | ReturnExp of exp
  | DeclareVarExp of TypeDeclaration.cJType * string
val toStringConstExp : constExp -> string
val toStringOpeatorInt : operatorInt -> string
val toStringOpeatorFloat : operatorFloat -> string
val toStringExp : exp -> string
val toStringVarList : varList -> string
val toStringExp2 : exp2 -> string
val toStringExp3 : exp3 -> string
val toStringSuperExp : superExp -> string

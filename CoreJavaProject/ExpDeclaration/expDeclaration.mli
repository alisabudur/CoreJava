type operatorInt = AddInt | SubInt | MulInt | DivInt
type operatorFloat = AddFloat | SubFloat | MulFloat | DivFloat
type boolExp =
    NotExp of boolExp
  | GreaterExp of int * int
  | LessExp of int * int
  | EqualExp of int * int
  | AndExp of boolExp * boolExp
  | OrExp of boolExp * boolExp
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
  | BoolExp of boolExp
type varList = VarList of exp list
type blkExp =
    IfExp of exp * blkExp
  | IfElseExp of exp * blkExp * blkExp
  | WhileExp of exp * blkExp
  | CompoundExp of blkExp * blkExp
  | AssignExp of string * exp
  | ReturnExp of exp
  | NewExp of string * varList
val toStringBoolExp : boolExp -> string
val toStringConstExp : constExp -> string
val toStringOpeatorInt : operatorInt -> string
val toStringOpeatorFloat : operatorFloat -> string
val toStringExp : exp -> string
val toStringVarList : varList -> string
val toStringBlkExp : blkExp -> string

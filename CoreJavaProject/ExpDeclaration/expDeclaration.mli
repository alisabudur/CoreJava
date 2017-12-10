type boolExp =
    NotExp of boolExp
  | GreaterExp of int * int
  | LessExp of int * int
  | EqualExp of int * int;;

type exp =
    ArithExp of string * exp * exp
  | ConstExp of string
  | VariableExp of string
  | FieldValueExp of string * string
  | BoolExp of boolExp;;

val toStringBoolExp : boolExp -> string;;
val toStringExp : exp -> string;;

{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
    [' ' '\t']        { token lexbuf }     (* skip blanks *)
  | ['\n' ]           { EOL }
  | ['0'-'9']+        { INT(int_of_string(Lexing.lexeme lexbuf)) }
  | '+'               { PLUS }
  | '-'               { MINUS }
  | '*'               { TIMES }
  | '/'               { DIV }
  | '('               { LPAREN }
  | ')'               { RPAREN }
  | "let"             { LET }
  | ['a'-'z' 'A'-'Z'] { IDENT }
  | '='               { EQ }
  | eof               { raise Eof }

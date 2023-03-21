grammar Expr;

program: (var)* knot+ EOF;

knot : ID '{' content* '}'; 
var: var_name '=' value;
value: int|str;
int:INT;
str:'"'(ID|INT)*'"';


content: text
	| goto
	| print
	| img
	| choice
	| var_op
	;

var_op : '[' var_name '=' expr ']';

expr:   expr ('*'|'/') expr
    |   expr ('+'|'-') expr
    |   int
    |   '(' expr ')'
    |   str
    | var_name
    ;


goto : '(' knot_name ')' ;
print : '(''(' var_name ')'')';
img: '(''!' img_name ')';
choice: '(' '(' pair*  ')'')';
pair:'!'option_text goto;
option_text: (ID|INT)*;
knot_name: ID;
var_name:ID|INT;
img_name:IMG_NAME;
text: ID|INT;

EQ : '=' ;
LPAREN : '('; 
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;
GH:'"';
EXLAM: '!';
L: '[';
R: ']';
MULT: '*';
DIVIDE: '/';
SUB: '-';
ADD: '+';

IMG_NAME: ID '.png'| ID '.jpg';
INT : [0-9]+ ;
ID: [a-zA-Z_][a-zA-Z_0-9]*; 
WS: [ \t\n\r\f]+ -> skip ;


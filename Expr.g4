grammar Expr;

program: (var)* knot+ EOF;

knot: ID '{' content* '}' NEWLINE?;

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
	| if
	;

if: '(' cond '?' then')';
then: goto;
eval: expr ('='|'>'|'<'|'>''='|'<''='|'!''=') expr;
cond:  eval
	| cond 'or' cond
	| cond 'and' cond
	| '(' cond ')';


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
NEWLINE : '\r'? '\n';


text: (ID | INT | WS | NEWLINE)+;



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
WS: [ \t]+ -> skip ;  // Skip whitespace characters except newline


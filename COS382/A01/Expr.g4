grammar Expr;

prog: (s NEWLINE|NEWLINE)+EOF;

s: b r t;

b: o n;

r: x
 | x';'r
 | x'-'x
 | x'-'x';'r
 | x'--'x
 | x'--'x';'r
 | /* epsilon */
 ;

x: c
 | c':'v
 ;

c: d;

v: l
 | l','v
 ;

l: d
 | d'-'d
 ;

t: '('n')'
 | /* epsilon */
 ;

o: DIGIT
 | /* epsilon */
 ;

d: DIGIT
 | DIGIT d
 ;

n: LETTER
 | LETTER n
 ;

DIGIT: [0-9];
LETTER: [a-zA-Z];

NEWLINE: '\r' ? '\n';
WS: [ \t]+ -> skip;

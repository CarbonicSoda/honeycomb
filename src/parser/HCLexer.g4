// $antlr-format alignColons trailing, columnLimit 150, reflowComments false, useTab false

lexer grammar HCLexer;

options {
    language = Cpp;
}

channels {
    ERROR
}

// comments
MultiLineComment  : '/*' .*? '*/' -> channel(HIDDEN);
SingleLineComment : '//' ~[\r\n]* -> channel(HIDDEN);

// semicolon
Semicolon: ';';

// reserved keywords
Fn     : 'fn';
Return : 'return';

// constructs
OpenParen  : '(';
CloseParen : ')';
OpenBrace  : '{';
CloseBrace : '}';

// arithmetic operators
Plus     : '+';
Minus    : '-';
Multiply : '*';
Divide   : '/';
Power    : '^';

// numeral
Numeral:
    'inf'
    | Decimal? ('.' Decimal | Decimal '.') Decimal? Exponent?
    | Decimal Exponent
    | Decimal;

// whitespace
WhiteSpace: [ \t]+ -> channel(HIDDEN);

// unexpected
Unexpected: . -> channel(ERROR);

// fragments
fragment Decimal: '0' | [1-9] [0-9]*;

fragment Exponent: [eE] [+-]? Decimal;
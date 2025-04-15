// $antlr-format alignColons hanging, alignSemicolons hanging, useTab false
// $antlr-format allowShortRulesOnASingleLine false, columnLimit 150, reflowComments false

parser grammar HCParser;

options {
    tokenVocab = HCLexer;
    language = Cpp;
}

program
    : statementList? EOF
    ;

statementList
    : (block | statement Semicolon)+
    ;

block
    : OpenBrace list = statementList? CloseBrace
    ;

statement
    : expression
    ;

expression
    : <assoc = right> left = expression Power right = expression    # PowerExpression
    | <assoc = right> op = (Plus | Minus) arg = expression          # UnaryExpression
    | left = expression op = (Multiply | Divide) right = expression # MultiplicativeExpression
    | left = expression op = (Plus | Minus) right = expression      # AdditiveExpression
    | num = Numeral                                                 # NumeralExpression
    | OpenParen enclosed = expression CloseParen                    # ParenthesizedExpression
    ;
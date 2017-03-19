%namespace GPLexTutorial

DecimalNumeral					[0-9_]+[lL]?
OctalNumeral					0[0-7_]+[lL]?
HexNumeral						0[xX][0-9a-fA-F_]+[lL]?
BinaryNumeral					0[bB][0-1_]+[lL]?
DecimalFloatingPointNumeral			[0-9]*\.?[0-9]+([eE][+-]?[0-9]+)?[dDfF]?
HexdecimalFloatingPointNumeral			0[xX][0-9a-fA-F]*\.?[0-9a-fA-F]*([pP][+-]?[0-9]+)?

%%

/* Literals(Integer, FloatingPoint) by Ze Chen */
{DecimalNumeral}					{ yylval.num = yytext; return (int)Tokens.IntergerLiteral; }
{HexNumeral}						{ yylval.num = yytext; return (int)Tokens.IntergerLiteral; }
{OctalNumeral}						{ yylval.num = yytext; return (int)Tokens.IntergerLiteral; }
{BinaryNumeral}						{ yylval.num = yytext; return (int)Tokens.IntergerLiteral; }

{DecimalFloatingPointNumeral}+		{ yylval.flo = yytext; return (int)Tokens.FloatingPointLiteral;}
{HexdecimalFloatingPointNumeral}	{ yylval.flo = yytext; return (int)Tokens.FloatingPointLiteral;}

.									{}
%%
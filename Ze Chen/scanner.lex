%namespace GPLexTutorial

DecimalNumeral					[0-9_]+[lL]?
OctalNumeral					0[0-7_]+[lL]?
HexNumeral						0[xX][0-9a-fA-F_]+[lL]?
BinaryNumeral					0[bB][0-1_]+[lL]?
DecimalFloatingPointNumeral			[0-9]*\.?[0-9]+([eE][+-]?[0-9]+)?[dDfF]?
HexdecimalFloatingPointNumeral			0[xX][0-9a-fA-F]*\.?[0-9a-fA-F]*([pP][+-]?[0-9]+)?

%%

/* Literals(Integer, FloatingPoint) by Ze Chen */
({DecimalNumeral}|{HexNumeral}|{OctalNumeral}|{BinaryNumeral})						{ yylval.num = int.Parse(yytext); return (int)Tokens.IntergerLiteral;}

({DecimalFloatingPointNumeral}|{HexdecimalFloatingPointNumeral})      		{ yylval.flo = float.Parse(yytext); return (int)Tokens.FloatingPointLiteral;}

.                             { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                              }
%%

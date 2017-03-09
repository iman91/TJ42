%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]
float [0-9]+\.[0-9]+

%%
/* Literals(Integer, FloatingPoint) by Ze Chen */
{digit}+	                 { yylval.num = int.Parse(yytext); return (int)Tokens.INTERGER; }
{float}+					 { yylval.flo = float.Parse(yytext); return (int)Tokens.FLOAT;}

[ \r\n\t]						/* ingore the white space */ 

%%

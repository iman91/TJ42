%namespace GPLexTutorial
/*just add*/
digit [0-9]
float [0-9]+\.[0-9]+

%%
/* Literals(Integer, FloatingPoint) by Ze Chen (JASON) */
{digit}+	                 { yylval.num = int.Parse(yytext); return (int)Tokens.INTERGER; }
{float}+					         { yylval.flo = float.Parse(yytext); return (int)Tokens.FLOAT;}

[ \r\n\t]						/* ingore the white space */ 

%%

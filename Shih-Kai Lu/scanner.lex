%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]
float [0-9]+\.[0-9]+

%%
/* Identifiers/Comments/Whitespace by Shih-Kai Lu */
{letter}({letter}|{digit})*  { yylval.name = yytext; return (int)Tokens.IDENTIFIER; }
"/*"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}
"*/"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}
"//"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}

[ \r\n\t]						/* ingore the white space */ 

%%

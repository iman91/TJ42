%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]

%%
/* Identifiers/Comments/Whitespace by Shih-Kai Lu */
{letter}({letter}|{digit})*  { yylval.ident = yytext; return (int)Tokens.IDENTIFIER; }
"/*"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}
"*/"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}
"//"						 { yylval.comme = yytext; return (int)Tokens.COMMENTS;}

[ \r\n\t]						/* ingore the white space */ 

%%

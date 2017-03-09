%namespace GPLexTutorial

%%
/* Operators & Separators by Hao Ge */
"="							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"<"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"!"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"~"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"?"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
":"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"->"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"=="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"<="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"!="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"&&"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"||"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"++"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"--"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"+"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"-"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"*"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"/"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"&"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"|"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"^"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"%"							 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"<<"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">>"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">>>"						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"+="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"-="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"*="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"/="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"&="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"|="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"^="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"%="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
"<<="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">>="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }
">>>="						 { yylval.oper = yytext; return (int)Tokens.OPERATORS; }

"("							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
")"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"{"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"}"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"["							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"]"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
";"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
","							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"."							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"..."						 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"@"							 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }
"::"						 { yylval.separ = yytext; return (int)Tokens.SEPARATORS; }

[ \r\n\t]						/* ingore the white space */ 

%%

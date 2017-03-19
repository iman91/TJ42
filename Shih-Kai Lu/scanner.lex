%namespace GPLexTutorial

Identifier						    [a-zA-Z_][a-zA-Z0-9_]*
WhiteSpace					    	[ \s]
TraditionalComment				(\/\*|\*\/)
EndOfLineComment					\/\/

%%
/* Identifiers/Comments/Whitespace by Shih-Kai Lu */
{Identifier}					  	{ yylval.ident = yytext; return (int)Tokens.Identifiers; }
{TraditionalComment}			{ yylval.comme = yytext; return (int)Tokens.Comment;}
{EndOfLineComment}				{ yylval.comme = yytext; return (int)Tokens.Comment;}
{WhiteSpace}					  	{} 

.									        {}
%%

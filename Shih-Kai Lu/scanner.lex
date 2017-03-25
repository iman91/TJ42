%namespace GPLexTutorial

Identifier						    [a-zA-Z_][a-zA-Z0-9_]*
WhiteSpace					    	[ \s]
TraditionalComment				(\/\*|\*\/)
EndOfLineComment					\/\/

%%
/* Identifiers/Comments/Whitespace by Shih-Kai Lu */
{Identifier}					  	{ yylval.ident = yytext; return (int)Tokens.Identifiers; }
{TraditionalComment}			{ return (int)Tokens.Comment;}
{EndOfLineComment}				{ return (int)Tokens.Comment;}
{WhiteSpace}					  	{ return (int)Tokens.WS;} 

.                             { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                              }
%%

%namespace GPLexTutorial

escapecharacter [b, t, n, f, r, ", ', \\, 0, 1, 2, 3, 4, 5, 6,7]

%%
true|false		{yylval.name = yytext; return (int)Tokens.BooleanLiteral;}
\"((\\{escapecharacter})|[^\\"])*\"	{yylval.name = yytext.Replace("\\\"","\""); return (int)Tokens.stringliteral; }
[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }0
%%

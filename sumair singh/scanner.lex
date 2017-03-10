%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]


%%

if                           { return (int)Tokens.IF; }
else                         { return (int)Tokens.ELSE; }
int                          { return (int)Tokens.INT; }
bool                         { return (int)Tokens.BOOL; }

null    { yylval.name = yytext; return (int)Tokens.nullliteral; }
'.*'                     { yylval.name = yytext; return (int)Tokens.characterliteral; }



[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%
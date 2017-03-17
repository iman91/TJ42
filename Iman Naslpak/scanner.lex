%namespace GPLexTutorial
InputCharacter [^\\"]
OctalDigit [0-7]
ZeroToThree [0-3]
OctalEscape {OctalDigit}|{OctalDigit}{OctalDigit}|{ZeroToThree}{OctalDigit}{OctalDigit}
EscapeSequence \\([btnfr\"'\\]|{OctalEscape})
StringCharacter {InputCharacter}|{EscapeSequence}


%%

true|false		{yylval.name = yytext; return (int)Tokens.BooleanLiteral;}

\"{StringCharacter}*\"	{yylval.name = yytext; return (int)Tokens.StringLiteral; }



[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }
%%
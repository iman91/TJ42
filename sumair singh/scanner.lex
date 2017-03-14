%namespace GPLexTutorial


SingleCharacter [^'\\]

OctalDigit [0-7]
ZeroToThree [0-3]
OctalEscape {OctalDigit}|{OctalDigit}{OctalDigit}|{ZeroToThree}{OctalDigit}{OctalDigit}
EscapeSequence \\([btnfr\"'\\]|{OctalEscape})





%%



null    { yylval.name = yytext; return (int)Tokens.NullLiteral; }
'({SingleCharacter}|{EscapeSequence})'                    { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }




[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%
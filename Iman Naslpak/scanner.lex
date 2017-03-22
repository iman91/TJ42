%{
int lines = 0;
%}
%namespace GPLexTutorial
InputCharacter [^\\"]
OctalDigit [0-7]
ZeroToThree [0-3]
OctalEscape {OctalDigit}|{OctalDigit}{OctalDigit}|{ZeroToThree}{OctalDigit}{OctalDigit}
EscapeSequence \\([btnfr\"'\\]|{OctalEscape})
StringCharacter {InputCharacter}|{EscapeSequence}
Identifier						    [a-zA-Z_][a-zA-Z0-9_]*


%%
int                          { return (int)Tokens.INT; }
short                         { return (int)Tokens.SHORT; }
byte                          { return (int)Tokens.BYTE; }
long                          { return (int)Tokens.LONG; }
char                          { return (int)Tokens.CHAR; }

true|false		{yylval.name = yytext; return (int)Tokens.BooleanLiteral;}
\"{StringCharacter}*\"	{yylval.name = yytext; return (int)Tokens.StringLiteral; }
{Identifier}	{yylval.name = yytext; return (int)Tokens.Identifier; }

";"							{ return ';';}
","							{ return ',';}
"{"							{ return '{';}
"}"							{ return '}';}


[\n]		{ lines++;    }
[ \t\r]      /* ignore other whitespace */


.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }
%%
public override void yyerror( string format, params object[] args )
{
    System.Console.Error.WriteLine("Error: line {0}, {1}", lines,
        String.Format(format, args));
}

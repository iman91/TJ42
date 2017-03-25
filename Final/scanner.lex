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
DecimalNumeral					[0-9_]+[lL]?
OctalNumeral					0[0-7_]+[lL]?
HexNumeral						0[xX][0-9a-fA-F_]+[lL]?
BinaryNumeral					0[bB][0-1_]+[lL]?


%%
int                          { return (int)Tokens.INT; }
short                         { return (int)Tokens.SHORT; }
byte                          { return (int)Tokens.BYTE; }
long                          { return (int)Tokens.LONG; }
char                          { return (int)Tokens.CHAR; }
public                          { return (int)Tokens.PUBLIC; }				
protected                           { return (int)Tokens.PROTECTED; }
private                           { return (int)Tokens.PRIVATE; }
abstract                           { return (int)Tokens.ABSTRACT; }
static                           { return (int)Tokens.STATIC; }
final                           { return (int)Tokens.FINAL; }
synchronized                           { return (int)Tokens.SYNCHRONIZED; }
native                           { return (int)Tokens.NATIVE; }
strictfp                          { return (int)Tokens.STRICFFP; }
class                          { return (int)Tokens.CLASS; }
void						{ return (int)Tokens.VOID; }

({DecimalNumeral}|{HexNumeral}|{OctalNumeral}|{BinaryNumeral})						{yylval.num = int.Parse(yytext); return (int)Tokens.IntergerLiteral;}

true|false		{yylval.name = yytext; return (int)Tokens.BooleanLiteral;}
\"{StringCharacter}*\"	{yylval.name = yytext; return (int)Tokens.StringLiteral; }
{Identifier}	{yylval.name = yytext; return (int)Tokens.Identifier; }

";"							{ return ';';}
","							{ return ',';}
"{"							{ return '{';}
"}"							{ return '}';}
"("							{ return '(';}
")"							{ return ')';}
"["							{ return '[';}
"]"							{ return ']';}
"="							{ return '=';}

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

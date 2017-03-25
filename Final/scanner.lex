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

";"									{ return ';'; }
"{"									{ return '{'; }
"}"									{ return '}'; }
","									{ return ','; }
":"									{ return ':'; }
"="									{ return '='; }
"("									{ return '('; }
")"									{ return ')'; }
"["									{ return '['; }
"]"									{ return ']'; }
"."									{ return '.'; }
"&"									{ return '&'; }
"!"									{ return '!'; }
"~"									{ return '~'; }
"-"									{ return '-'; }
"+"									{ return '+'; }
"*"									{ return '*'; }
"/"									{ return '/'; }
"%"									{ return '%'; }
"<"									{ return '<'; }
">"									{ return '>'; }
"^"									{ return '^'; }
"|"									{ return '|'; }
"?"									{ return '?'; }
"@"									{ return '@'; }
"::"								{ return (int)Tokens.DOUBLECOLON; }
">>>"								{ return (int)Tokens.UNSIGNRIGHT; }
"..."								{ return (int)Tokens.ELLIPSIS; }
">>="								{ return (int)Tokens.RIGHT_ASSIGN; }
"<<="								{ return (int)Tokens.LEFT_ASSIGN; }
"+="								{ return (int)Tokens.ADD_ASSIGN; }
"-="								{ return (int)Tokens.SUB_ASSIGN; }
"*="								{ return (int)Tokens.MUL_ASSIGN; }
"/="								{ return (int)Tokens.DIV_ASSIGN; }
"%="								{ return (int)Tokens.MOD_ASSIGN; }
"&="								{ return (int)Tokens.AND_ASSIGN; }
"^="								{ return (int)Tokens.XOR_ASSIGN; }
"|="								{ return (int)Tokens.OR_ASSIGN; }
">>"								{ return (int)Tokens.RIGHT_OP; }
"<<"								{ return (int)Tokens.LEFT_OP; }
"++"								{ return (int)Tokens.INC_OP; }
"--"								{ return (int)Tokens.DEC_OP; }
"->"								{ return (int)Tokens.PTR_OP; }
"&&"								{ return (int)Tokens.AND_OP; }
"||"								{ return (int)Tokens.OR_OP; }
"<="								{ return (int)Tokens.LE_OP; }
">="								{ return (int)Tokens.GE_OP; }
"=="								{ return (int)Tokens.EQ_OP; }
"!="								{ return (int)Tokens.NE_OP; }

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

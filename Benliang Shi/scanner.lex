%namespace GPLexTutorial
%option unicode

%{
int lines=0;
%}

Terminator				      		(CR|LF|CR LF)
Keyword                                                 (abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|if|goto|implements|import)

%%

/* Terminator & First 25 Keywordsnd by Benliang Shi */

LF                           { return LF; }
CR                           { return CR; }
CR LF                        { return CR LF; }
abstract                     { return (int)Tokens.ABSTRACT; }
boolean                      { return (int)Tokens.BOOLEAN; }
break                        { return (int)Tokens.BREAK; }
byte                         { return (int)Tokens.BYTE; }
case                         { return (int)Tokens.CASE; }
catch                        { return (int)Tokens.CATCH; }
char                         { return (int)Tokens.CHAR; }
class                        { return (int)Tokens.CLASS; }
const                        { return (int)Tokens.CONST; }
continue                     { return (int)Tokens.CONTINUE; }
default                      { return (int)Tokens.DEFAULT; }
do                           { return (int)Tokens.DO; }
double                       { return (int)Tokens.DOULBE; }
else                         { return (int)Tokens.ELSE; }
enum                         { return (int)Tokens.ENUM; }
extends                      { return (int)Tokens.EXTENDS; }
final                        { return (int)Tokens.FINAL; }
finally                      { return (int)Tokens.FINALLY; }
float                        { return (int)Tokens.FLOAT; }
for                          { return (int)Tokens.FOR; }
if                           { return (int)Tokens.IF; }
goto                         { return (int)Tokens.GOTO; }
implements                   { return (int)Tokens.IMPLEMENTS; }
import                       { return (int)Tokens.IMPORT; }


[ \n]								{ lines++; }
[ \t\r]								{}
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

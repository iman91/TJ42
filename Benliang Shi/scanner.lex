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
boolean                      { return (int)Tokens.ABSTRACT; }
break                        { return (int)Tokens.ABSTRACT; }
byte                         { return (int)Tokens.ABSTRACT; }
case                         { return (int)Tokens.ABSTRACT; }
catch                        { return (int)Tokens.ABSTRACT; }
char                         { return (int)Tokens.ABSTRACT; }
class                        { return (int)Tokens.ABSTRACT; }
const                        { return (int)Tokens.ABSTRACT; }
continue                     { return (int)Tokens.ABSTRACT; }
default                      { return (int)Tokens.ABSTRACT; }
do                           { return (int)Tokens.ABSTRACT; }
double                       { return (int)Tokens.ABSTRACT; }
else                         { return (int)Tokens.ABSTRACT; }
enum                         { return (int)Tokens.ABSTRACT; }
extends                      { return (int)Tokens.ABSTRACT; }
final                        { return (int)Tokens.ABSTRACT; }
finally                      { return (int)Tokens.ABSTRACT; }
float                        { return (int)Tokens.ABSTRACT; }
for                          { return (int)Tokens.ABSTRACT; }
if                           { return (int)Tokens.ABSTRACT; }
goto                         { return (int)Tokens.ABSTRACT; }
implements                   { return (int)Tokens.ABSTRACT; }
import                       { return (int)Tokens.ABSTRACT; }


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
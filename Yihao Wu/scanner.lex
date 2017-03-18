%namespace GPLexTutorial

%%
/* Keywords 2 by Yihao Wu */
instanceof                        { return (int)Tokens.INSTANCEOF; }
int                               { return (int)Tokens.INT; }
interface                         { return (int)Tokens.INTERFACE; }
native                            { return (int)Tokens.NATIVE; }
new                               { return (int)Tokens.NEW; }
package                           { return (int)Tokens.PACKAGE; }
private                           { return (int)Tokens.PRIVATE; }
protected                         { return (int)Tokens.PROTECTED; }
public                            { return (int)Tokens.PUBLIC; }
return                            { return (int)Tokens.RETURN; }
short                             { return (int)Tokens.SHORT; }
static                            { return (int)Tokens.STATIC; }
strictfp                          { return (int)Tokens.STRICTFP; }
super                             { return (int)Tokens.SUPER; }
switch                            { return (int)Tokens.SWITCH; }
synchronized                      { return (int)Tokens.SYNCHRONIZED; }
this                              { return (int)Tokens.THIS; }
throw                             { return (int)Tokens.THROW; }
throws                            { return (int)Tokens.THROWS; }
transient                         { return (int)Tokens.TRANSIENT; }
try                               { return (int)Tokens.TRY; }
void                              { return (int)Tokens.VOID; }
volatile                          { return (int)Tokens.VOLATILE; }
while                             { return (int)Tokens.WHILE; }



[ \r\n\t]                    /* ingore the white space */ 

%%

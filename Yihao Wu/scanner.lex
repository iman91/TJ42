%namespace GPLexTutorial

%%
/* Keywords by Yihao Wu */
if                           { return (int)Tokens.IF; }
else                         { return (int)Tokens.ELSE; }
int                          { return (int)Tokens.INT; }
bool                         { return (int)Tokens.BOOL; }

[ \r\n\t]                    /* ingore the white space */ 

%%

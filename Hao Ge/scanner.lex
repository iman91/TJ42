%namespace GPLexTutorial

Operator						(=|>|<|!|~|?|:|->|==|>=|<=|!=|&&||\||++|--|+|-|*|/|&|||^|%|<<|>>|>>>|+=|-=|*=|/=|&=||=|^=|%=|<<=|>>=|>>>=)
Separator						(\(|\)|\{|\}|\[|\]|;|,|\.|\.\.\.|@|::)

%%

/* Operators & Separators by Hao Ge */
{Operator}							{ yylval.oper = yytext; return (int)Tokens.Operators; }
{Separator}							{ yylval.separ = yytext; return (int)Tokens.Separators; }

.									{}
%%

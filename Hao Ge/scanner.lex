%namespace GPLexTutorial


%%

/* Operators & Separators by Hao Ge */
";"								           	{ return ';'; }
"{"							        	  	{ return '{'; }
"}"								          	{ return '}'; }
","								          	{ return ','; }
":"								          	{ return ':'; }
"="							          		{ return '='; }
"("								           	{ return '('; }
")"								          	{ return ')'; }
"["							  	        	{ return '['; }
"]"							           		{ return ']'; }
"."							           		{ return '.'; }
"&"							          		{ return '&'; }
"!"						          			{ return '!'; }
"~"							          		{ return '~'; }
"-"							            	{ return '-'; }
"+"									          { return '+'; }
"*"								          	{ return '*'; }
"/"								          	{ return '/'; }
"%"								          	{ return '%'; }
"<"								          	{ return '<'; }
">"								          	{ return '>'; }
"^"								          	{ return '^'; }
"|"								          	{ return '|'; }
"?"								          	{ return '?'; }
"@"								          	{ return '@'; }
"::"							          	{ return (int)Tokens.DOUBLECOLON; }
">>>"							          	{ return (int)Tokens.UNSIGNRIGHT; }
"..."							          	{ return (int)Tokens.ELLIPSIS; }
">>="							          	{ return (int)Tokens.RIGHT_ASSIGN; }
"<<="							          	{ return (int)Tokens.LEFT_ASSIGN; }
"+="								          { return (int)Tokens.ADD_ASSIGN; }
"-="							          	{ return (int)Tokens.SUB_ASSIGN; }
"*="							          	{ return (int)Tokens.MUL_ASSIGN; }
"/="						  	        	{ return (int)Tokens.DIV_ASSIGN; }
"%="						  	        	{ return (int)Tokens.MOD_ASSIGN; }
"&="							          	{ return (int)Tokens.AND_ASSIGN; }
"^="							          	{ return (int)Tokens.XOR_ASSIGN; }
"|="							            { return (int)Tokens.OR_ASSIGN; }
">>"					          			{ return (int)Tokens.RIGHT_OP; }
"<<"				            			{ return (int)Tokens.LEFT_OP; }
"++"				          				{ return (int)Tokens.INC_OP; }
"--"				          				{ return (int)Tokens.DEC_OP; }
"->"					          			{ return (int)Tokens.PTR_OP; }
"&&"				          				{ return (int)Tokens.AND_OP; }
"||"					          			{ return (int)Tokens.OR_OP; }
"<="					          			{ return (int)Tokens.LE_OP; }
">="					          			{ return (int)Tokens.GE_OP; }
"=="						           		{ return (int)Tokens.EQ_OP; }
"!="						          		{ return (int)Tokens.NE_OP; }

.									            {}
%%

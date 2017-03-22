%namespace GPLexTutorial
%union
{
    public int num;
    public string name;
}

%token INT SHORT BYTE LONG CHAR
%token <name> StringLiteral BooleanLiteral Identifier



%%

Block:
	'{' BlockStatements_opt '}'
	| /* empty */
	;
BlockStatements_opt:
	BlockStatements
	| /* empty */
	;
BlockStatements:
	BlockStatement 
	| BlockStatement BlockStatements
	;
BlockStatement:
	LocalVariableDeclarationStatement
	| Statement
	| /* fixme */
	;
Statement:
	/* fixme */
	;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration ';'
	;
LocalVariableDeclaration:
	VariableModifiers UnannType VariableDeclaratorList
	;
VariableModifiers:
	/* empty */
	| /* fixme */
	;
UnannType:
	UnannPrimitiveType
	| /* fixme */
	;
UnannPrimitiveType:
	NumericType
	| /* fixme */
	;
NumericType:
	IntegralType
	| /* fixme */
	;
IntegralType:
	 BYTE
	| SHORT
	| INT
	| LONG
	| CHAR
	;
VariableDeclaratorList:
	VariableDeclarators
	;
VariableDeclarators:
	VariableDeclarator
	| VariableDeclarator ',' VariableDeclarators
	;
VariableDeclarator:
	VariableDeclaratorId equal_opt
	;
equal_opt:
	'=' VariableInitializer
	| /* empty */
	;
VariableInitializer:
	/* fixme */
	;
VariableDeclaratorId:
	Identifier Dims_opt
	;
Dims_opt:
	/* empty */
	| /* fixme */
	;



%%

public Parser(Scanner scanner) : base(scanner)
{
}

%namespace GPLexTutorial
%union

{
    public string num;
    public string ident;
}

%token <num> IntergerLiteral
%token <ident> Identifier
%token <comme> Comment
%token <flo> FloatingPointLiteral
%token CLASS PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICTFP VOID
%token IF ELSE INT BOOL EQ_OP GE_OP LE_OP OR_OP AND_OP PTR_OP NE_OP 
%token DOUBLECOLON UNSIGNRIGHT ELLIPSIS RIGHT_ASSIGN LEFT_ASSIGN ADD_ASSIGN SUB_ASSIGN 
%token MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN AND_ASSIGN XOR_ASSIGN OR_ASSIGN 
%token RIGHT_OP LEFT_OP INC_OP DEC_OP

%%

Statement:
	StatementWithoutTrailingSubstatement
	| /* fixme */
	;

StatementWithoutTrailingSubstatement
	Block
	|ExpressionStatement
	| /* fixme */
	;

ExpressionStatement
	StatementExpression ';'
	;

StatementExpression
	Assignment
	| /* fixme */
	;

Assignment
	LeftHandSide AssignmentOperator Expression
	| /* fixme */
	;

LeftHandSide
	ExpressionName
	| /* fixme */
	;

ExpressionName
	Identifier
	| /* fixme */
	;

Identifier
	x
	| /* fixme */
	;

AssignmentOperator
	=
	| /* fixme */
	;

%%

public Parser(Scanner scanner) : base(scanner)
{
}

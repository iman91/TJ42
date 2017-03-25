%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <name> Identifier
%token IF ELSE BOOL EQ_OP GE_OP LE_OP OR_OP AND_OP PTR_OP NE_OP 
%token DOUBLECOLON UNSIGNRIGHT ELLIPSIS RIGHT_ASSIGN LEFT_ASSIGN ADD_ASSIGN SUB_ASSIGN 
%token MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN AND_ASSIGN XOR_ASSIGN OR_ASSIGN 
%token RIGHT_OP LEFT_OP INC_OP DEC_OP

%%

LastFormalParameter
		: /*fixme*/ 
		| FormalParameter
		;

FormalParameter
		: VariableModifiers UnannType VariableDeclaratorId
		;

VariableModifiers
		: /*fixme*/
		;

UnannType
		: /*fixme*/
		| UnannReferenceType
		;

UnannReferenceType
		: /*fixme*/
		| /*fixme*/
		| UnannArrayType
		;

UnannArrayType
		: /*fixme*/
		| /*fixme*/
		| UnannTypeVariable Dims
		;

UnannTypeVariable
		: Identifier
		;

Dims
		: /*fixme*/
		;

VariableDeclaratorId
		: Identifier Dims_opt
		;

Dims_opt
		: /*fixme*/
		;

Throw_opt
		: /*empty*/
		;

MethodBody
		: Block
		;

%%

public Parser(Scanner scanner) : base(scanner)
{
}

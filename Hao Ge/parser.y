%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <name> Identifier

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

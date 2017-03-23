%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <name> Identifier
%token public protected private abstract static final synchronized native strictfp void

%%

MethodDeclaration
		: MethodModifiers MethodHeader MethodBody
		;

MethodModifiers
		: /*fixme*/
		| public 
		| protected
		| private
		| abstract
		| static
		| final
		| synchronized
		| native
		| strictfp
		;

MethodHeader
		: Result MethodDeclarator Throws_opt
		| /*fixme*/
		;

Result
		: /*fixme*/ 
		| void
		;

MethodDeclarator
		: Identifier '(' FormalParameterList_opt ')' Dims_opt
		;

FormalParameterList_opt
		: /*fixme*/ 
		| /*fixme*/ 
		| LastFormalParameter
		;

%%

public Parser(Scanner scanner) : base(scanner)
{
}


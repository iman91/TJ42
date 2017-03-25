%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
    public float flo;
}

%token <name> Identifier
%token PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID
%token <flo> FloatingPointLiteral

%%

MethodDeclaration
		: MethodModifiers MethodHeader MethodBody
		;

MethodModifiers
		: /*fixme*/
		|PUBLIC 
		|PROTECTED 
		|PRIVATE 
		|ABSTRACT 
		|STATIC 
		|FINAL 
		|SYNCHRONIZED 
		|NATIVE 
		|STRICFFP
		;

MethodHeader
		: Result MethodDeclarator Throws_opt
		| /*fixme*/
		;

Result
		: /*fixme*/ 
		| VOID
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


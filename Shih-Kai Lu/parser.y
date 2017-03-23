%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <name> Identifier
%token public protected private abstract static final synchronized native strictfp

%%

CompilationUnit
		: PackageDeclaration_opt ImportDeclarations TypeDeclarations
		;

PackageDeclaration_opt
		: /*fixme*/
		| /*empty*/
		;

ImportDeclarations
		: /*fixme*/
		| /*empty*/
		;

TypeDeclarations
		: ClassDeclaration
		| InterfaceDeclaration
		; 
		
ClassDeclaration
		: NormalClassDeclaration 
		| EnumDeclaration
		;

NormalClassDeclaration
		: ClassModifiers class Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody
		;

ClassModifiers
		: /*fixme*/ 
		| public 
		| protected 
		| private 
		| abstract 
		| static 
		| final 
		| strictfp
		;

TypeParameters_opt
		: /*fixme*/
		| /*empty*/
		;

Superclass_opt
		: /*fixme*/
		| /*empty*/
		;

Superinterfaces_opt
		: /*fixme*/
		| /*empty*/
		;

ClassBody
		: '{' ClassBodyDeclarations '}'
		;

ClassBodyDeclarations
		: ClassMemberDeclaration 
		| /*fixme*/
		| /*fixme*/
		| /*fixme*/
		;

ClassMemberDeclaration
		: /*fixme*/
		| MethodDeclaration 
		| /*fixme*/
		| /*fixme*/
		;

%%

public Parser(Scanner scanner) : base(scanner)
{
}

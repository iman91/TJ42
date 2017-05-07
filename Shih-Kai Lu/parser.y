%namespace GPLexTutorial

%{
//public static AST.Statement root;
%}

%union
{
    public int num;
    public string name;
	public AST.CompilationUnit CU;
	public AST.List<TypeDeclarations> TDs;
	public AST.ClassDeclaration CD;
	public AST.List<ClassModifiers> CMs;
}

%token <num> IntergerLiteral
%token <name> StringLiteral BooleanLiteral Identifier
%token INT SHORT BYTE LONG CHAR PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID

%type <CU> CompilationUnit
%type <TDs> TypeDeclarations
%type <CD> ClassDeclaration
%type <CMs> ClassModifiers

%left '='
%nonassoc '<'
%left '+'

%%
Node
		: CompilationUnit	{ $$ = $1; }
		;

/* ShihKai Lu */
CompilationUnit
		: PackageDeclaration_opt ImportDeclarations TypeDeclarations	{ $$ = new AST.CompilationUnit($3); }
		;

PackageDeclaration_opt
		: /*fixme*/
		;

ImportDeclarations
		: /*fixme*/
		;

TypeDeclarations
		: TypeDeclaration	{ $$ = new AST.List<TypeDeclarations>($1); }
		;

TypeDeclaration
		: ClassDeclaration	{ $$ = $1; }
		| /*fixme*/
		; 

ClassDeclaration
		: NormalClassDeclaration { $$ = new AST.ClassDeclaration($1); }
		| /*fixme*/ 
		;

NormalClassDeclaration
		: ClassModifiers CLASS Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody { $$ = $1, $7; }
		;

ClassModifiers
		: ClassModifier { $$ = new AST.List<ClassModifiers>($1); }
		;

ClassModifier
		: PUBLIC	{ $$ = $1; }
		| /*fixme*/
		;

TypeParameters_opt
		: /*fixme*/
		;

Superclass_opt
		: /*fixme*/
		;

Superinterfaces_opt
		: /*fixme*/
		;

ClassBody
		: '{' ClassBodyDeclarations '}' { $$ = $2; }
		;

ClassBodyDeclarations
		: ClassBodyDeclaration	{ $$ = $1; }
		;

ClassBodyDeclaration
		: ClassMemberDeclaration { $$ = $1; }
		| /*fixme*/
		;

ClassMemberDeclaration
		: MethodDeclaration	{ $$= new List<MethodDeclarations>($1); }
		| /*fixme*/
		;

/* Ze Chen */
MethodDeclaration
		: MethodModifiers MethodHeader MethodBody 
		;
		
MethodModifiers
		: MethodModifier	
		;

MethodModifier
		: PUBLIC	
		| STATIC	
		;

MethodHeader
		: Result MethodDeclarator Throws_opt	
		;

Result
		: VOID	
		| /*fixme*/
		;

MethodDeclarator
		: Identifier '(' FormalParameterList_opt ')' Dims_opt	
		;
		
FormalParameterList_opt
		: LastFormalParameter	
		| /*fixme*/
		;

/* Hao Ge*/
LastFormalParameter
		: FormalParameter	
		| /*fixme*/
		;

FormalParameter
		: VariableModifiers UnannType VariableDeclaratorId 
		;

VariableModifiers
		: VariableModifier
		;

VariableModifier
		: /*fixme*/ 
		;

UnannType
		: UnannPrimitiveType 
		| UnannReferenceType 
		; 

UnannPrimitiveType
		: NumericType	
		| /*fixme*/
		; 

NumericType
		: IntegralType	
		| /*fixme*/
		;
		 

IntegralType
		: INT	
		;

UnannReferenceType
		: UnannArrayType 
		| /*fixme*/
		;

UnannArrayType
		: UnannTypeVariable Dims	
		| /*fixme*/
		;

UnannTypeVariable
		: Identifier
		;	

Dims
		: Annotations '[' ']' '{'Annotations '[' ']''}' 
		; 

Annotations
		: Annotation
		;

Annotation
		: /*fixme*/
		;

VariableDeclaratorId
		: Identifier Dims_opt	
		;
		 
Dims_opt
		: Dims
		;

/* Mir Iman Naslpak */
MethodBody
		: Block
		;
		
Block
		: '{' BlockStatements_opt '}'
		;

BlockStatements_opt
		: BlockStatement BlockStatements
		;
		
BlockStatement
		: LocalVariableDeclarationStatement
		| ClassDeclaration 
		| Statement
		;

LocalVariableDeclarationStatement
		: LocalVariableDeclaration 
		; 

LocalVariableDeclaration
		: VariableModifiers UnannType VariableDeclaratorList
		;
		
VariableDeclaratorList
		: VariableDeclarator '{'',' VariableDeclarator'}'
		;
		
VariableDeclarator
		: VariableDeclaratorId '[''=' VariableInitializer']'
		;
		
VariableInitializer
		: /*fixme*/
		;

/* Benliang Shi */
Statement
		: StatementWithoutTrailingSubstatement
		| /*fixme*/
		;

StatementWithoutTrailingSubstatement
		: ExpressionStatement
		| /*fixme*/
		;

ExpressionStatement
		: StatementExpression ';'
		;
		
StatementExpression
		: Assignment
		| /*fixme*/
		;

Assignment
		: LeftHandSide AssignmentOperator Expression
		;

LeftHandSide
		: ExpressionName
		| /*fixme*/
		;

ExpressionName
		: Identifier
		;

AssignmentOperator
		: '='
		;

/* Yihao Wu */
Expression
		: AssignmentExpression
		| /*fixme*/
		;

AssignmentExpression
		: ConditionalExpression
		;

ConditionalExpression
		: ConditionalOrExpression
		| /*fixme*/
		;

ConditionalOrExpression
		: ConditionalAndExpression
		| /*fixme*/
		;

ConditionalAndExpression
		: InclusiveOrExpression
		| /*fixme*/
		;

InclusiveOrExpression
		: ExclusiveOrExpression
		| /*fixme*/
		;

ExclusiveOrExpression
		: AndExpression
		| /*fixme*/
		;

AndExpression
		: EqualityExpression
		| /*fixme*/
		;

EqualityExpression
		: RelationalExpression
		| /*fixme*/
		;

RelationalExpression
		: ShiftExpression
		| /*fixme*/
		;

ShiftExpression
		: AdditiveExpression
		| /*fixme*/
		;

AdditiveExpression
		: MultiplicativeExpression
		| /*fixme*/
		;

MultiplicativeExpression
		: UnaryExpression
		| /*fixme*/
		;

UnaryExpression
		: UnaryExpressionNotPlusMinus 
		| /*fixme*/
		;

UnaryExpressionNotPlusMinus
		: PostfixExpression
		| /*fixme*/
		;

PostfixExpression
		: Primary
		| /*fixme*/
		;

Primary
		: PrimaryNoNewArray
		| /*fixme*/
		;

PrimaryNoNewArray
		: Literal
		| /*fixme*/
		;

Literal
		: IntegerLiteral
		| /*fixme*/
		;

%%

int yywrap()
{
    return 1;
}

public Parser(Scanner scanner) : base(scanner)
{
}

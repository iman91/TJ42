%namespace GPLexTutorial

%{
//public static AST.Statement root;
%}

%union
{
    public int num;
    public string name;
	public AST.List<MethodDeclarations> MDs;
	public AST.MethodDeclaration MD;
	public AST.List<MethodModifers> MMs;
}

%token <num> IntergerLiteral
%token <name> StringLiteral BooleanLiteral Identifier
%token INT SHORT BYTE LONG CHAR PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID

%type <MDs> MethodDeclarations
%type <MD> MethodDeclaration
%type <MMs> MethodModifiers


%left '='
%nonassoc '<'
%left '+'

%%
Node
		: CompilationUnit	
		;

/* ShihKai Lu */
CompilationUnit
		: PackageDeclaration_opt ImportDeclarations TypeDeclarations	
		;

PackageDeclaration_opt
		: /*fixme*/
		;

ImportDeclarations
		: /*fixme*/
		;

TypeDeclarations
		: TypeDeclaration	
		;

TypeDeclaration
		: ClassDeclaration	
		| /*fixme*/
		; 

ClassDeclaration
		: NormalClassDeclaration 
		| /*fixme*/ 
		;

NormalClassDeclaration
		: ClassModifiers CLASS Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody 
		;

ClassModifiers
		: ClassModifier 
		;

ClassModifier
		: PUBLIC	
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
		: '{' ClassBodyDeclarations '}' 
		;

ClassBodyDeclarations
		: ClassBodyDeclaration	
		;

ClassBodyDeclaration
		: ClassMemberDeclaration 
		| /*fixme*/
		;

ClassMemberDeclaration
		: MethodDeclaration	
		| /*fixme*/
		;

/* Ze Chen */
MethodDeclaration
		: MethodModifiers MethodHeader MethodBody { $$ = new AST.MethodDeclaration($1,$2,$3); }
		;
		
MethodModifiers
		: MethodModifier	{ $$ = new AST.List<MethodModifiers>($1); }
		;

MethodModifier
		: PUBLIC	{ $$= $1; }
		| STATIC	{ $$= $1; }
		;

MethodHeader
		: Result MethodDeclarator Throws_opt	{ $$ = $1; }
		;

Result
		: VOID	{ $$ = $1; }
		| /*fixme*/
		;

MethodDeclarator
		: Identifier '(' FormalParameterList_opt ')' Dims_opt	{ $$ = $1, $3; }
		;
		
FormalParameterList_opt
		: LastFormalParameter	{ $$= new AST.List<FormalParameters>($1); }
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

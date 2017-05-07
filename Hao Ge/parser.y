%namespace GPLexTutorial

%{
//public static AST.Statement root;
%}

%union
{
    public int num;
    public string name;
	public AST.List<FormalParameters> FPs；
	public AST.FormalParameter FP；
	public AST.ArrayType AT；
	public AST.NamedType NT；
}

%token <num> IntergerLiteral
%token <name> StringLiteral BooleanLiteral Identifier
%token INT SHORT BYTE LONG CHAR PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID

%type <FPs> FormalParameters
%type <FP> FormalParameter
%type <AT> ArrayType
%type <NT> NamedType

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
		: FormalParameter	{ $$= $1; }
		| /*fixme*/
		;

FormalParameter
		: VariableModifiers UnannType VariableDeclaratorId { $$ = new AST.FormalParameter($2,$3); }
		;

VariableModifiers
		: VariableModifier
		;

VariableModifier
		: /*fixme*/ 
		;

UnannType
		: UnannPrimitiveType { $$ = new AST.ArrayType($1); }
		| UnannReferenceType { $$ = $1; }
		; 

UnannPrimitiveType
		: NumericType	{ $$ = $1; }
		| /*fixme*/
		; 

NumericType
		: IntegralType	{ $$ = $1; }
		| /*fixme*/
		;
		 

IntegralType
		: INT	{ $$ = $1; }
		;

UnannReferenceType
		: UnannArrayType { $$ = new AST.ArrayType($1); }
		| /*fixme*/
		;

UnannArrayType
		: UnannTypeVariable Dims	{ $$ = new AST.NamedType($1); }
		| /*fixme*/
		;

UnannTypeVariable
		: Identifier	{ $$ = $1; }

Dims
		: Annotations '[' ']' '{'Annotations '[' ']''}' { $$ = $2,$3; }
		; 

Annotations
		: Annotation
		;

Annotation
		: /*fixme*/
		;

VariableDeclaratorId
		: Identifier Dims_opt	{ $$ = $1; }
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

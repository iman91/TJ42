%namespace GPLexTutorial
%union
{
	public AST.Type type;
    public int num;
    public string name;
}
%type <type> UnannType IntegralType NumericType UnannPrimitiveType
%token INT SHORT BYTE LONG CHAR PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID SWITCH CASE DEFAULT
%token <name> StringLiteral BooleanLiteral Identifier 
%token <num> IntegerLiteral




%%
/* Shih-Kai Lu */
CompilationUnit
		: PackageDeclaration_opt ImportDeclarations TypeDeclarations
		;

PackageDeclaration_opt
		: /*fixme*/
		| PackageDeclaration
		;

PackageDeclaration:
		/* fixme */
		;

ImportDeclarations
		: /*fixme*/
		| /*empty*/
		;

TypeDeclarations
		:  /* empty */
		| TypeDeclarations TypeDeclaration
		; 
TypeDeclaration:
	ClassDeclaration
	| InterfaceDeclaration
	;

InterfaceDeclaration:
		/*fixme*/
		;
ClassDeclaration
		: NormalClassDeclaration 
		| EnumDeclaration
		;

EnumDeclaration:
	/* fixme */
	;

NormalClassDeclaration
		: ClassModifiers CLASS Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody
		;

ClassModifiers
		: /* empty */ 
		| ClassModifier ClassModifiers
		;
ClassModifier:
		PUBLIC 
		|PROTECTED 
		|PRIVATE 
		|ABSTRACT 
		|STATIC 
		|FINAL 
		|SYNCHRONIZED 
		|NATIVE 
		|STRICFFP
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
		: ClassBodyDeclaration
		| /* empty */
		;
ClassBodyDeclaration:
		ClassMemberDeclaration
		| /* fixme */ 
		;

ClassMemberDeclaration
		: 
		 MethodDeclaration
		| /*fixme*/
		;


		/* Ze Chen */
MethodDeclaration
		: MethodModifiers MethodHeader MethodBody
		;
MethodModifiers:
	/* empty */
	| MethodModifier	MethodModifiers
	;
MethodModifier
		: PUBLIC 
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
Throws_opt:
	/* empty */
	| Throws
	;
Throws: 
	/* fixme */
	;
Result
		: /*fixme*/ 
		| VOID
		;

MethodDeclarator
		: Identifier '(' FormalParameterList_opt ')' Dims_opt
		;
Dims_opt:
		/* empty */
		| Dims
		;
Dims: 
	'[' ']'
	|/* fixme */ 
	;
FormalParameterList_opt
		: /* empty */
		| FormalParameterList
		;
FormalParameterList:
		LastFormalParameter
		| /* fixme */
		;

		/* Hao Ge */
LastFormalParameter
		: /*fixme*/ 
		| FormalParameter
		;

FormalParameter
		: VariableModifiers UnannType VariableDeclaratorId
		;

VariableModifiers
		: /* empty */
		| VariableModifier
		;
VariableModifier:
	/* fixme */
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


VariableDeclaratorId
		: Identifier Dims_opt
		;

/* Mir Iman Naslpak */
MethodBody:
	Block					{$$=$1;}
	;
Block:
	'{' BlockStatements_opt '}'						{$$=$1;}
	| /* empty */
	;
BlockStatements_opt:
	BlockStatements							{$$=$1;}
	| /* empty */
	;
BlockStatements:
	BlockStatement						{$$=$1;}
	|BlockStatements  BlockStatement	{$$ = $1; $$.Add($2); }
	;
BlockStatement:
	LocalVariableDeclarationStatement	{$$=$1;}
	| Statement							{$$=$1;}
	| /* fixme */
	;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration ';'	{$$=$1;}
	;
LocalVariableDeclaration:
	VariableModifiers UnannType VariableDeclaratorList			{$$ = new AST.LocalVariableDeclaration($2,$3);}
	;
VariableModifiers:
	/* empty */
	| /* fixme */
	;
UnannType:
	UnannPrimitiveType				{$$=$1;}
	| /* fixme */
	;
UnannPrimitiveType:
	NumericType				{$$=$1;}
	| /* fixme */
	;
NumericType:
	IntegralType			{$$=$1;}
	| /* fixme */
	;
IntegralType:
	 BYTE
	| SHORT
	| INT					{$$=AST.IntType();}
	| LONG
	| CHAR
	;
VariableDeclaratorList:
	VariableDeclarators			{$$=$1;}
	;
VariableDeclarators:
	VariableDeclarator									{$$=$1;}
	| VariableDeclarator ',' VariableDeclarators		
	;
VariableDeclarator:
	VariableDeclaratorId equal_opt	{$$=$1;}
	;
equal_opt:
	'=' VariableInitializer
	| /* empty */
	;
VariableInitializer:
	/* fixme */
	;

	/* Benliang Shi */
Statement:
	StatementWithoutTrailingSubstatement
	| /* fixme */
	;

StatementWithoutTrailingSubstatement:
	 ExpressionStatement
	| SwitchStatement
	| /* fixme */
	;

ExpressionStatement:
	StatementExpression ';'
	;

StatementExpression:
	Assignment
	| /* fixme */
	;

Assignment:
	LeftHandSide AssignmentOperator Expression
	| /* fixme */
	;

LeftHandSide:
	ExpressionName
	| /* fixme */
	;

ExpressionName:
	Identifier
	| /* fixme */
	;

AssignmentOperator:
	'='
	| /* fixme */
	;

	/* Yihao Wu */
Expression
		: AssignmentExpression
                | /*fixme*/
		;

AssignmentExpression
		: ConditionalExpression
		| /*fixme*/
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

		/* sumair singh */
RelationalExpression: 
                ShiftExpression
				 | /* fixme */
				 ;

ShiftExpression:
              AdditiveExpression
			   | /* fixme */
			   ;

AdditiveExpression:
                 MultiplicativeExpression
				  | /* fixme */
				  ;

MultiplicativeExpression:
                 UnaryExpression
				  | /* fixme */
				  ;

UnaryExpression:
                UnaryExpressionNotPlusMinus
				 | /* fixme */
				 ;

UnaryExpressionNotPlusMinus:
                 PostFixExpression
				  | /* fixme */
				  ;

PostFixExpression:
                Primary
				 | /* fixme */
				 ;

Primary:
       PrimaryNoNewArray
		| /* fixme */
		;

PrimaryNoNewArray:
               Literal
				| /* fixme */
				;

Literal:
       IntegerLiteral
		| /* fixme */
		;


		/*  Iman - switch - start */
SwitchStatement:
	SWITCH '(' Expression ')' SwitchBlock
	;
SwitchBlock:
	'{' SwitchBlockStatementGroups SwitchLabels_opt '}' 
	;
SwitchBlockStatementGroups:
	/* empty */
	| SwitchBlockStatementGroup SwitchBlockStatementGroups
	;
SwitchLabels_opt:
	/* empty */
	| SwitchLabels
	;
SwitchBlockStatementGroup:
	SwitchLabels BlockStatements
	;
SwitchLabels:
	SwitchLabel
	| SwitchLabel SwitchLabels
	;
SwitchLabel:
	CASE ConstantExpression ':'
	| CASE EnumConstantName ':'
	| DEFAULT ':'
	;
ConstantExpression:
	Expression
	;
EnumConstantName:
	Identifier
	;
	/* Iman - switch - end */
%%

public Parser(Scanner scanner) : base(scanner)
{
}

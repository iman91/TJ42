/*Sumair singh*/
%namespace GPLexTutorial
%union
{
    public int num;
    public string name;
}

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
	Block
	;
Block:
	'{' BlockStatements_opt '}'
	| /* empty */
	;
BlockStatements_opt:
	BlockStatements
	| /* empty */
	;
BlockStatements:
	BlockStatement 
	|BlockStatements  BlockStatement 
	;
BlockStatement:
	LocalVariableDeclarationStatement
	| Statement
	| /* fixme */
	;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration ';'
	;
LocalVariableDeclaration:
	VariableModifiers UnannType VariableDeclaratorList
	;
VariableModifiers:
	/* empty */
	| /* fixme */
	;
UnannType:
	UnannPrimitiveType
	| /* fixme */
	;
UnannPrimitiveType:
	NumericType
	| /* fixme */
	;
NumericType:
	IntegralType
	| /* fixme */
	;
IntegralType:
	 BYTE
	| SHORT
	| INT
	| LONG
	| CHAR
	;
VariableDeclaratorList:
	VariableDeclarators
	;
VariableDeclarators:
	VariableDeclarator
	| VariableDeclarator ',' VariableDeclarators
	;
VariableDeclarator:
	VariableDeclaratorId equal_opt
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
	StatementWithoutTrailingSubstatement | IfThenStatement | IfThenElseStatement
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
                ShiftExpression               {$$=$1;}
				 | /* fixme */
				 ;

ShiftExpression:
              AdditiveExpression               {$$=$1;}
			   | /* fixme */
			   ;

AdditiveExpression:
                 MultiplicativeExpression             {$$=$1;}
				  | /* fixme */
				  ;

MultiplicativeExpression:
                 UnaryExpression                    {$$=$1;}
				  | /* fixme */
				  ;

UnaryExpression:
                UnaryExpressionNotPlusMinus             {$$=$1;}
				 | /* fixme */
				 ;

UnaryExpressionNotPlusMinus:
                 PostFixExpression               {$$=$1;}
				  | /* fixme */
				  ;

PostFixExpression:
                Primary                         {$$=$1;}
				 | /* fixme */
				 ;

Primary:
       PrimaryNoNewArray                      {$$=$1;}
		| /* fixme */
		;

PrimaryNoNewArray:
               Literal                       {$$=$1;}
				| /* fixme */
				;

Literal:
       IntegerLiteral                      {$$=$1;}
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
/* Sumair- IfThenStatement and IfThenElseStatement */

IfThenStataement:
              if '(' Expression ')' Statement
               ;
IfThenElseStatement:
              if '(' Expression ')' StatementNoShortIf else Statement
              ;
IfThenElseStatementNoShortIf:
              if '(' Expression ')' StatementNoShortIf else StatementNoShortIf
              ;
/* Sumair- IfThenStatement and IfThenElseStatement- ends */
               
%%
public Parser(Scanner scanner) : base(scanner)
{
}

%namespace GPLexTutorial
%{
public static AST.Node root;
%}
%union
{
    public int num;
    public string name;
	public AST.CompilationUnit CU;
	public List<AST.TypeDeclaration> TDs;
	public AST.TypeDeclaration TD;
	public AST.ClassDeclaration CD;
	public List<AST.ClassModifier> classmodifiers;
	public AST.ClassModifier classmodifier;
	public List<AST.MethodDeclaration> MDs;
	public AST.MethodDeclaration MD;
	public List<AST.MethodModifier> methodmodifiers;
	public AST.MethodModifier methodmodifier;
	public AST.MethodHeader methodheader;
	public List<AST.Statements> stms;
	public AST.Statements stm;
	public AST.MethodDeclarator methoddeclarator;
	public AST.VoidType voidtype; 
	public AST.FormalParameter formalparameter;
	public AST.Type type;
	public AST.VariableDeclaratorId VDID;
	public AST.LocalVariableDeclaration LVD;
	public AST.Expression exp;
	public AST.ExpressionName ExN;
	public AST.AssignmentOperator AO;

}

%token INT SHORT BYTE LONG CHAR PUBLIC PROTECTED PRIVATE ABSTRACT STATIC FINAL SYNCHRONIZED NATIVE STRICFFP CLASS VOID
%token <name> StringLiteral BooleanLiteral Identifier	
%token <num> IntergerLiteral

%type <CU> CompilationUnit
%type <TDs> TypeDeclarations
%type <TD> TypeDeclaration
%type <CD> ClassDeclaration NormalClassDeclaration
%type <classmodifiers> ClassModifiers
%type <classmodifier> ClassModifier
%type <MDs> ClassBody ClassBodyDeclarations	ClassBodyDeclaration	ClassMemberDeclaration MethodDeclarations
%type <MD> MethodDeclaration
%type <methodmodifiers> MethodModifiers
%type <methodmodifier> MethodModifier
%type <methodheader> MethodHeader
%type <stms> MethodBody	Block	BlockStatements_opt	BlockStatements
%type <stm> BlockStatement	LocalVariableDeclarationStatement	Statement	LocalVariableDeclaration	ExpressionStatement	StatementWithoutTrailingSubstatement
%type <methoddeclarator> MethodDeclarator	
%type <voidtype> Result
%type <formalparameter>FormalParameterList_opt	FormalParameterList	LastFormalParameter FormalParameter
%type <type> UnannType	UnannReferenceType	UnannArrayType	UnannTypeVariable	UnannPrimitiveType	NumericType	IntegralType
%type <VDID> VariableDeclaratorId	VariableDeclaratorList	VariableDeclarators	VariableDeclarator
%type <LVD>	LocalVariableDeclaration
%type <exp>	StatementExpression	Assignment	LeftHandSide  Expression AssignmentExpression	 ConditionalExpression  ConditionalOrExpression   ConditionalAndExpression  InclusiveOrExpression ExclusiveOrExpression AndExpression EqualityExpression RelationalExpression ShiftExpression	 AdditiveExpression MultiplicativeExpression UnaryExpression UnaryExpressionNotPlusMinus PostFixExpression Primary PrimaryNoNewArray Literal
%type <ExN> ExpressionName
%type <AO> AssignmentOperator


%%
/* Shih-Kai Lu */
CompilationUnit
		: PackageDeclaration_opt ImportDeclarations TypeDeclarations				{ root = new AST.CompilationUnit($3); }
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
		: 
		 TypeDeclarations TypeDeclaration   { $$ = $1; $$.Add($2); }
		| /* empty */			{ $$ = new List<AST.TypeDeclaration>(); }
		; 
TypeDeclaration:
	ClassDeclaration				{ $$ = $1; }
	| InterfaceDeclaration			
	;

InterfaceDeclaration:
		/*fixme*/
		;
ClassDeclaration
		: NormalClassDeclaration		{ $$ = $1; }
		| EnumDeclaration
		;

EnumDeclaration:
	/* fixme */
	;

NormalClassDeclaration
		: ClassModifiers CLASS Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody		{ $$= new AST.ClassDeclaration($1,$3,$7); }
		;

ClassModifiers
		:
		 ClassModifier ClassModifiers { $$ = $2; $$.Add($1); }
		| /* empty */	{ $$ = new List<AST.ClassModifier>(); }
		;
ClassModifier:
		PUBLIC			{$$= AST.ClassModifier.Public;}
		|PROTECTED 
		|PRIVATE 
		|ABSTRACT 
		|STATIC			{$$= AST.ClassModifier.Static;}
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
		: '{' ClassBodyDeclarations '}'			{ $$ = $2; }
		;

ClassBodyDeclarations
		: ClassBodyDeclaration					{$$=$1;}
		| /* empty */
		;
ClassBodyDeclaration:
		ClassMemberDeclaration					{ $$=$1;}
		| /* fixme */ 
		;

ClassMemberDeclaration
		: 
		 MethodDeclarations				{$$=$1;}
		| /*fixme*/
		;
MethodDeclarations:
		MethodDeclarations MethodDeclaration	{ $$ = $1; $$.Add($2); }
		| /* empty */		{ $$ = new List<AST.MethodDeclaration>(); }
		;

		/* Ze Chen */
MethodDeclaration
		: MethodModifiers MethodHeader MethodBody	{$$ = new AST.MethodDeclaration($1,$2,$3);}
		;
MethodModifiers:
	 MethodModifier	MethodModifiers		 { $$ = $2; $$.Add($1); }
	|/* empty */	{ $$ = new List<AST.MethodModifier>(); }
	;
MethodModifier
		: PUBLIC			{$$= AST.MethodModifier.Public;}
		|PROTECTED 
		|PRIVATE 
		|ABSTRACT 
		|STATIC				{$$= AST.MethodModifier.Static;}
		|FINAL 
		|SYNCHRONIZED 
		|NATIVE 
		|STRICFFP
		;
MethodHeader
		: Result MethodDeclarator Throws_opt		{$$ = new AST.MethodHeader($1,$2);}
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
		| VOID		{$$ = new AST.VoidType();}
		;

MethodDeclarator
		: Identifier '(' FormalParameterList_opt ')' Dims_opt	{$$ = new AST.MethodDeclarator($1,$3);}
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
		| FormalParameterList	{$$=$1;}
		;
FormalParameterList:
		LastFormalParameter	{$$=$1;}
		| /* fixme */
		;

		/* Hao Ge */
LastFormalParameter
		: /*fixme*/ 
		| FormalParameter	{$$=$1;}
		;

FormalParameter
		: VariableModifiers UnannType VariableDeclaratorId	{$$ = new AST.FormalParameter($2,$3);}
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
		| UnannReferenceType	{$$ = $1;}
		;

UnannReferenceType
		: /*fixme*/
		| /*fixme*/
		| UnannArrayType	{$$ = $1;}
		;

UnannArrayType
		: /*fixme*/
		| /*fixme*/
		| UnannTypeVariable Dims	{$$ = $1;}
		;

UnannTypeVariable
		: Identifier	{$$ = new AST.ArrayType($1);}
		;


VariableDeclaratorId
		: Identifier Dims_opt	{$$= new AST.VariableDeclaratorId($1);}
		;

/* Mir Iman Naslpak */
MethodBody:
	Block {$$=$1;}
	;
Block:
	'{' BlockStatements_opt '}'	{$$=$2;}
	| /* empty */
	;
BlockStatements_opt:
	BlockStatements	{$$=$1;}
	| /* empty */
	;
BlockStatements:
	 BlockStatements BlockStatement	{$$ = $1; $$.Add($2); }
	|	{ $$ = new List<AST.Statements>(); }
	;
BlockStatement:
	LocalVariableDeclarationStatement {$$ = $1;}
	| Statement			{$$ = $1;}
	| /* fixme */
	;

LocalVariableDeclarationStatement:
	LocalVariableDeclaration ';'		{$$ = $1;}
	;
LocalVariableDeclaration:
	VariableModifiers UnannType VariableDeclaratorList	{$$ = new AST.LocalVariableDeclaration($2,$3);}
	;
VariableModifiers:
	/* empty */
	| /* fixme */
	;
UnannType:
	UnannPrimitiveType	{$$ = $1;}
	| /* fixme */	
	;
UnannPrimitiveType:
	NumericType		{$$ = $1;}
	| /* fixme */
	;
NumericType:
	IntegralType		{$$ = $1;}
	| /* fixme */
	;
IntegralType:
	 BYTE
	| SHORT
	| INT			{$$ = new AST.IntType();}
	| LONG
	| CHAR
	;
VariableDeclaratorList:
	VariableDeclarators	{$$=$1;}
	;
VariableDeclarators:
	VariableDeclarator	{$$=$1;}
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
	StatementWithoutTrailingSubstatement {$$=$1;}
	| /* fixme */
	;

StatementWithoutTrailingSubstatement:
	ExpressionStatement		{$$=$1;}
	| /* fixme */
	;

ExpressionStatement:
	StatementExpression ';'	{$$ = new AST.ExpressionStatement($1);}
	;

StatementExpression:
	Assignment	{$$=$1;}
	| /* fixme */
	;

Assignment:
	LeftHandSide AssignmentOperator Expression	{$$ = new AST.AssignmentExpression($1,$2,$3);}
	| /* fixme */
	;

LeftHandSide:
	ExpressionName		{$$ = $1;}
	| /* fixme */
	;

ExpressionName:
	Identifier		{$$ = new AST.ExpressionName($1);}
	| /* fixme */
	;

AssignmentOperator:
	'='					{$$ = new AST.AssignmentOperator("equal");}
	| /* fixme */
	;

	/* Yihao Wu */
Expression
		: AssignmentExpression			{$$=$1;}
                | /*fixme*/
		;

AssignmentExpression
		: ConditionalExpression			{$$=$1;}
		| /*fixme*/
		;

ConditionalExpression
		: ConditionalOrExpression		{$$=$1;}
		| /*fixme*/
		;

ConditionalOrExpression
		: ConditionalAndExpression		{$$=$1;}
		| /*fixme*/
		; 
		
ConditionalAndExpression
		: InclusiveOrExpression		{$$=$1;}
		| /*fixme*/
		;

InclusiveOrExpression
		: ExclusiveOrExpression		{$$=$1;}
		| /*fixme*/
		;

ExclusiveOrExpression
		: AndExpression			{$$=$1;}
		| /*fixme*/
		;
AndExpression
		: EqualityExpression		{$$=$1;}
		| /*fixme*/
		;

EqualityExpression
		: RelationalExpression		{$$=$1;}
		| /*fixme*/
		;

		/* sumair singh */
RelationalExpression: 
                ShiftExpression		{$$=$1;}
				 | /* fixme */
				 ;

ShiftExpression:
              AdditiveExpression		{$$=$1;}
			   | /* fixme */
			   ;

AdditiveExpression:
                 MultiplicativeExpression		{$$=$1;}
				  | /* fixme */
				  ;

MultiplicativeExpression:
                 UnaryExpression		{$$=$1;}
				  | /* fixme */
				  ;

UnaryExpression:
                UnaryExpressionNotPlusMinus		{$$=$1;}
				 | /* fixme */
				 ;

UnaryExpressionNotPlusMinus:
                 PostFixExpression		{$$=$1;}
				  | /* fixme */
				  ;

PostFixExpression:
                Primary			{$$=$1;}
				 | /* fixme */
				 ;

Primary:
       PrimaryNoNewArray		{$$=$1;}
		| /* fixme */
		;

PrimaryNoNewArray:
               Literal		{$$=$1;}
				| /* fixme */
				;

Literal:
       IntergerLiteral		{$$ = new AST.PrimaryExpression($1);}
		| /* fixme */
		;

%%
public Parser(Scanner scanner) : base(scanner)
{
}
%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <num> Number

%%

Expression
		: AssignmentExpression
                | /*empty*/
		;

AssignmentExpression
		: ConditionalExpression
		| /*empty*/
		;

ConditionalExpression
		: ConditionalOrExpression
		| /*empty*/
		;

ConditionalOrExpression
		: ConditionalAndExpression
		| /*empty*/
		; 
		
ConditionalAndExpression
		: InclusiveOrExpression
		| /*empty*/
		;

InclusiveOrExpression
		: ExclusiveOrExpression
		| /*empty*/
		;

ExclusiveOrExpression
		: AndExpression
		| /*empty*/
		;
AndExpression
		: EqualityExpression
		| /*empty*/
		;

EqualityExpression
		: RelationalExpression
		| /*empty*/
		;



%%
public Parser(Scanner scanner) : base(scanner)
{
}

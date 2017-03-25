%namespace GPLexTutorial
%union
{
    public int num;
    public string name;
}


%token <num> IntegerLiteral




%%

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
        IntergerLiteral
		| /* fixme */
		;


%%

public Parser(Scanner scanner) : base(scanner)
{
}

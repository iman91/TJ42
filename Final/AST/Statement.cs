using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial.AST
{
    public abstract class Statements : Node { };
    public  class ExpressionStatement : Statements {
        private Expression expr;

        public ExpressionStatement(Expression expr)
        {
            this.expr = expr;
        }
        public override bool ResolveNames()
        {
            return true;
        }
        public override void TypeCheck()
        {
        
        }
    }

}

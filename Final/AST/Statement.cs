using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace GPLexTutorial.AST
{
    public abstract class Statements : Node {
        
    };
    public  class ExpressionStatement : Statements {
        private Expression expr;

        public ExpressionStatement(Expression expr)
        {
            this.expr = expr;
        }
        public override bool ResolveNames(LexicalScope scope)
        {
            return expr.ResolveNames(scope);
        }
        public override void TypeCheck()
        {
        
        }
        public override void GenCode(StreamWriter testfile)
        {
            expr.GenCode(testfile);
        }
    }

}

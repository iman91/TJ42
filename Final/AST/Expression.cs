using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace GPLexTutorial.AST
{
    public abstract class Expression : Node { public Type type;
        public abstract void GenStoreCode(StreamWriter testfile);
    };

    public class AssignmentExpression : Expression
    {
        private Expression lhs;
        private AssignmentOperator AO;
        private Expression rhs;
        public AssignmentExpression(Expression lhs, AssignmentOperator AO, Expression rhs)
        { this.AO = AO; this.lhs = lhs; this.rhs = rhs; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return lhs.ResolveNames(scope) && rhs.ResolveNames(scope);
        }
        public override void TypeCheck()
        {
            lhs.TypeCheck();
            rhs.TypeCheck();
            if (!rhs.type.Compatible(lhs.type))
            {
                Console.WriteLine("type error in assignment \n");
            }
        }
        public override void GenCode(StreamWriter testfile)
        {
            lhs.GenCode(testfile);
            rhs.GenCode(testfile);
            lhs.GenStoreCode(testfile); 
        }
        public override void GenStoreCode(StreamWriter testfile)
        {

        }
    }
    public class AssignmentOperator : Node
    {
        private string AO;
        public AssignmentOperator(string AO)
        { this.AO = AO;}
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {
            
        }
        public override void GenCode(StreamWriter testfile)
        {
         
        }
    }
    public class PrimaryExpression : Expression
    {
        private int ValueOfPE;
        public PrimaryExpression(int ValueOfPE) { this.ValueOfPE = ValueOfPE; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {
            type = Type.intType;
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.WriteLine(" {0}" ,ValueOfPE);
        }
        public override void GenStoreCode(StreamWriter testfile)
        {
       
        }
        
    }
    public class ExpressionName : Expression
    {
        private string Identifier;
        //private Declaration declaration;
        public ExpressionName(string Identifier) { this.Identifier = Identifier; }
        public override bool ResolveNames(LexicalScope scope)
        {
           /* if (scope != NULL)
                declaration = scope.Resolve(name);

            if (declaration == NULL)
                Console.WriteLine(stderr, "Error: Undeclared identifier %s\n", name.c_str());

            return declaration != NULL;*/
            return true;
        }
        public override void TypeCheck()
        {
            //type = declaration.GetType();
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write("ldc.i4  ");
        }
             public override void GenStoreCode(StreamWriter testfile)
        {
            testfile.WriteLine("stloc.0");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AST
{
    public abstract class Node
    {
        void Indent(int n)
        {
            for (int i = 0; i < n; i++)
                Console.Write("    ");
        }

        public void DumpValue(int indent)
        {
            Indent(indent);
            Console.WriteLine("{0}", GetType().ToString());

            Indent(indent);
            Console.WriteLine("{");

            foreach (var field in GetType().GetFields(System.Reflection.BindingFlags.NonPublic |
                                                                           System.Reflection.BindingFlags.Instance))
            {
                object value = field.GetValue(this);
                Indent(indent + 1);
                if (value is Node)
                {
                    Console.WriteLine("{0}:", field.Name);
                    ((Node)value).DumpValue(indent + 2);
                }
                else
                    Console.WriteLine("{0}: {1}", field.Name, value);
            }

            Indent(indent);
            Console.WriteLine("}");
        }
    };
    public class CompilationUnit : Node
    {
        private List<TypeDeclaration> typedeclaration;
        public CompilationUnit(List<TypeDeclaration> typedeclaration) { this.typedeclaration = typedeclaration; }
    }
    public abstract class TypeDeclaration : Node { };
    public enum ClassModifier { Static, Public, }
    public class ClassDeclaration : TypeDeclaration
    {
        private List<ClassModifier> classmodifier;
        private string NameOfClass;
        private List<MethodDeclaration> methoddeclaration;
        public ClassDeclaration(List<ClassModifier> classmodifier, string NameOfClass, List<MethodDeclaration> methoddeclaration)
        { this.classmodifier = classmodifier; this.NameOfClass = NameOfClass; this.methoddeclaration = methoddeclaration; }
    }
    public enum MethodModifier { Static, Public, }
    public class FormalParameter
    {
        private string NameOfFP;
        private string TypeOfFP;
        public FormalParameter(string TypeOfFP, string NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }

    }
    public abstract class Statement : Node { };
    public class MethodDeclaration
    {
        private List<MethodModifier> methodmodifer;
        private string TypeOfMethod;
        private string NameOfMethod;
        private List<FormalParameter> formalparameters;
        private List<Statement> statement;
        public MethodDeclaration(List<MethodModifier> methodmodifer, string TypeOfMethod, string NameOfMethod,
            List<FormalParameter> formalparameters, List<Statement> statement)
        {
            this.methodmodifer = methodmodifer; this.TypeOfMethod = TypeOfMethod; this.NameOfMethod = NameOfMethod;
            this.formalparameters = formalparameters; this.statement = statement;
        }
    }
    public class LocalVariableDeclaration : Statement
    {
        private string TypeOfLVD;
        private string NameOfLVD;
        public LocalVariableDeclaration(string TypeOfLVD, string NameOfLVD)
        { this.TypeOfLVD = TypeOfLVD; this.NameOfLVD = NameOfLVD; }
    }
    public abstract class ExpressionStatement : Statement { };
    public abstract class Expression : Node { };
    public class AssignmentExpression : ExpressionStatement
    {
        private string ExpressionName;
        private int AssignmentOperator;
        private Expression expression;
        public AssignmentExpression(string ExpressionName, int AssignmentOperator, Expression expression)
        { this.ExpressionName = ExpressionName; this.AssignmentOperator = AssignmentOperator; this.expression = expression; }
    }
    public class PrimaryExpression : Expression
    {
        private int ValueOfPE;
        public PrimaryExpression(int ValueOfPE) { this.ValueOfPE = ValueOfPE; }
    }

    public class program
    {
        static void Main()
        {
            var program = new CompilationUnit(new List<TypeDeclaration> { new ClassDeclaration(new List<ClassModifier> {ClassModifier.Public},          
                "HelloWorld",new List<MethodDeclaration> {new MethodDeclaration( new List<MethodModifier> { MethodModifier.Public, MethodModifier.Static }, "void", "main",
                new List<FormalParameter> {new FormalParameter("string","args") }, new List<Statement> {new LocalVariableDeclaration("int","x"),
                    new AssignmentExpression("x",2, new PrimaryExpression(42))}) })});
            program.DumpValue(1);
        }
    }
}

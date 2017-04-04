using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

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

            var fields = GetType().GetFields(System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance).ToArray();

            foreach (var field in GetType().GetFields(System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance))
            {
                object value = field.GetValue(this);
                Indent(indent + 1);
                if (value is Node)
                {
                    Console.WriteLine("{0}:", field.Name);
                    ((Node)value).DumpValue(indent + 2);
                }
                else if (value is IEnumerable && !(value is String))
                {
                    var e = (IEnumerable)value;
                    Console.WriteLine("{0}: [", field.Name);
                    foreach (var item in e)
                    {
                        if (item is Node)
                            ((Node)item).DumpValue(indent + 2);
                        else
                        {
                            Indent(indent + 2);
                            Console.WriteLine(item);
                        }
                    }
                    Indent(indent + 1);
                    Console.WriteLine("]");
                }
                else
                    Console.WriteLine("{0}:{1}", field.Name, value);

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
    public abstract class Type : Node
    {
    }
    public class ArrayType : Type
    {
        private Type ElementType;
        public ArrayType(Type ElementType) { this.ElementType = ElementType; }
    }
    public class NamedType : Type
    {
        private string TypeName;
        public NamedType(string TypeName) { this.TypeName = TypeName; }
    }
    public class FormalParameter : Node
    {
        private Type TypeOfFP;
        private string NameOfFP;

        public FormalParameter(Type TypeOfFP, string NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }

    }
    public abstract class Statements : Node { };
    public class MethodDeclaration : Node
    {
        private List<MethodModifier> methodmodifer;
        private string TypeOfMethod;
        private string NameOfMethod;
        private List<FormalParameter> formalparameters;
        private List<Statements> statement;
        public MethodDeclaration(List<MethodModifier> methodmodifer, string TypeOfMethod, string NameOfMethod,
            List<FormalParameter> formalparameters, List<Statements> statement)
        {
            this.methodmodifer = methodmodifer; this.TypeOfMethod = TypeOfMethod; this.NameOfMethod = NameOfMethod;
            this.formalparameters = formalparameters; this.statement = statement;
        }
    }
    public class NumericType : Type
    {
        private     
    }
    public class LocalVariableDeclaration : Statements
    {
        private Type TypeOfLVD;
        private string NameOfLVD;
        public LocalVariableDeclaration(Type TypeOfLVD, string NameOfLVD)
        { this.TypeOfLVD = TypeOfLVD; this.NameOfLVD = NameOfLVD; }
    }
    public abstract class ExpressionStatement : Statements { };
    public abstract class Expression : Node { };
    public class AssignmentExpression : ExpressionStatement
    {
        private int AssignmentOperator;
        private Expression lhs, rhs;
        public AssignmentExpression(Expression lhs, int AssignmentOperator,, Expression rhs)
        { this.AssignmentOperator = AssignmentOperator; this.lhs = lhs; this.rhs = rhs; }
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
                new List<FormalParameter> {new FormalParameter(new ArrayType(new NamedType("String Array")),"args") }, new List<Statements> {new LocalVariableDeclaration(,"x"),
                    new AssignmentExpression( ,'+', new PrimaryExpression(42))})})});
            program.DumpValue(1);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial.AST
{
    class ast
    {
        interface Declaration
        {

        }
        public abstract class Node
        {
            public abstract void TypeCheck ();
            public abstract bool ResolveNames();
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

            private List<TypeDeclaration> typedeclarations;
            public CompilationUnit(List<TypeDeclaration> typedeclaration) { this.typedeclarations = typedeclarations; }
            public override bool ResolveNames()
            {
                foreach (TypeDeclaration typedeclaration in typedeclarations)
                {
                    if (!typedeclaration.ResolveNames())
                        return false;
                }
                return true;
            }
            public override void TypeCheck()
            {
                foreach (TypeDeclaration typedeclaration in typedeclarations)
                {
                    typedeclaration.TypeCheck();
                }
            }
        }
        public abstract class TypeDeclaration : Node, Declaration { };
        public enum ClassModifier { Static, Public, }
        public class ClassDeclaration : TypeDeclaration
        {
            private List<ClassModifier> classmodifier;
            private string NameOfClass;
            private List<MethodDeclaration> methoddeclarations;
            public ClassDeclaration(List<ClassModifier> classmodifier, string NameOfClass, List<MethodDeclaration> methoddeclaration)
            { this.classmodifier = classmodifier; this.NameOfClass = NameOfClass; this.methoddeclarations = methoddeclarations; }
            public override bool ResolveNames()
            {
                foreach (MethodDeclaration methoddeclaration in methoddeclarations)
                {
                    if (!methoddeclaration.ResolveNames())
                        return false;
                }
                return true;
            }
            public override void TypeCheck()
            {
                foreach (MethodDeclaration methoddeclaration in methoddeclarations)
                {
                    methoddeclaration.TypeCheck();
                }
            }
        }
        public enum MethodModifier { Static, Public, }
        public abstract class Type : Node
        {
        }
        public class ArrayType : Type
        {
            private Type ElementType;
            public ArrayType(Type ElementType) { this.ElementType = ElementType; }
            public override bool ResolveNames()
            {
                return true;
            }
            public override void TypeCheck()
            {
                ElementType.TypeCheck();
            }
        }
        public class NamedType : Type
        {
            private string TypeName;
            public NamedType(string TypeName) { this.TypeName = TypeName; }
            public override bool ResolveNames()
            {
                return true;
            }

        }

        public class FormalParameter : Node
        {
            private Type TypeOfFP;
            private string NameOfFP;

            public FormalParameter(Type TypeOfFP, string NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }
            public override bool ResolveNames()
            {
                return TypeOfFP.ResolveNames();
            }
        }
        public abstract class Statements : Node { };
        public class MethodDeclaration : Node, Declaration
        {
            private List<MethodModifier> methodmodifer;
            private string TypeOfMethod;
            private string NameOfMethod;
            private List<FormalParameter> formalparameters;
            private List<Statements> statements;
            public MethodDeclaration(List<MethodModifier> methodmodifer, string TypeOfMethod, string NameOfMethod,
                List<FormalParameter> formalparameters, List<Statements> statements)
            {
                this.methodmodifer = methodmodifer; this.TypeOfMethod = TypeOfMethod; this.NameOfMethod = NameOfMethod;
                this.formalparameters = formalparameters; this.statements = statements;
            }
            public override bool ResolveNames()
            {
                foreach (Statements statement in statements)
                {
                    if (!statement.ResolveNames())
                        return false;
                }
                return true;
            }
        }

        public class LocalVariableDeclaration : Statements, Declaration
        {
            private Type TypeOfLVD;
            private string NameOfLVD;
            public LocalVariableDeclaration(Type TypeOfLVD, string NameOfLVD)
            { this.TypeOfLVD = TypeOfLVD; this.NameOfLVD = NameOfLVD; }
            public override bool ResolveNames()
            {
                return TypeOfLVD.ResolveNames();
            }
        }
        public abstract class ExpressionStatement : Statements { };
        public abstract class Expression : Node { };
        public class AssignmentExpression : ExpressionStatement
        {
            private int AssignmentOperator;
            private Expression lhs, rhs;
            public AssignmentExpression(Expression lhs, int AssignmentOperator, Expression rhs)
            { this.AssignmentOperator = AssignmentOperator; this.lhs = lhs; this.rhs = rhs; }
            public override bool ResolveNames()
            {
                return lhs.ResolveNames() && rhs.ResolveNames();
            }
        }
        public class PrimaryExpression : Expression
        {
            private int ValueOfPE;
            public PrimaryExpression(int ValueOfPE) { this.ValueOfPE = ValueOfPE; }
            public override bool ResolveNames()
            {
                return true;
            }
        }

        public class ExpressionName : Expression
        {
            private string Identifier;
            private Declaration declaration;
            public ExpressionName(string Identifier) { this.Identifier = Identifier; }
            public override bool ResolveNames(LexicalScope scope)
            {
                if (scope != NULL)
                    declaration = scope.Resolve(name);

                if (declaration == NULL)
                    Console.WriteLine(stderr, "Error: Undeclared identifier %s\n", name.c_str());

                return declaration != NULL;
            }
        }

    }
}

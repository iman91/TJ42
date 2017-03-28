using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AST
{
    public abstract class Node { };
    public class CompilationUnit : Node
    {
        private List<TypeDeclaration> typedeclaration;
        public CompilationUnit(List<TypeDeclaration> typedeclaration) { this.typedeclaration = typedeclaration; }
    }
    public abstract class TypeDeclaration: Node { };
    public enum ClassModifier { Static, Public, }
    public class ClassDeclaration : TypeDeclaration
    {
        private List<ClassModifier> classmodifier;
        private string NameOfClass;
        public ClassDeclaration(List<ClassModifier> classmodifier, string NameOfClass)
        { this.classmodifier = classmodifier; this.NameOfClass = NameOfClass; }
    }
    public enum MethodModifier { Static, Public, }
    public class FormalParameter
    {
        private string NameOfFP;
        private string TypeOfFP;
        public FormalParameter(string NameOfFP, string TypeOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }

    }
    public abstract class Statement: Node{};
    public class MethodDeclaration
    {
        private List<MethodModifier> methodmodifer;
        private string TypeOfMethod;
        private string NameOfMethod;
        private List<FormalParameter> formalparameters;
        private List<Statement> statement; 
        public MethodDeclaration(List<MethodModifier> methodmodifer, string TypeOfMethod, string NameOfMethod, 
            List<FormalParameter> formalparameters, List<Statement> statement)
        { this.methodmodifer = methodmodifer; this.TypeOfMethod = TypeOfMethod; this.NameOfMethod = NameOfMethod;
            this.formalparameters = formalparameters;this.statement = statement;
        }
    }
    public class LocalVariableDeclaration: Statement
    {
        private string TypeOfLVD;
        private string NameOfLVD;
        public LocalVariableDeclaration(string TypeOfLVD, string NameOfLVD)
        { this.TypeOfLVD = TypeOfLVD;this.NameOfLVD = NameOfLVD; }
    }
    public abstract class ExpressionStatement: Statement { };
    public abstract class Expression: Node { };
    public class AssignmentExpression: ExpressionStatement
    {
        private string ExpressionName;
        private int AssignmentOperator;
        private Expression expression;
        public AssignmentExpression(string ExpressionName, int AssignmentOperator, Expression expression)
        { this.ExpressionName = ExpressionName;this.AssignmentOperator = AssignmentOperator;this.expression = expression; }
    }
    public class PrimaryExpression: Expression
    {
        private string TypeOfPE;
        public PrimaryExpression(string TypeOfPE) { this.TypeOfPE = TypeOfPE; }
    }
}

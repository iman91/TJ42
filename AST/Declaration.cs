using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial.AST
{
    interface Declaration
    {

    }
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
    public class FormalParameter : Node
    {
        private Type TypeOfFP;
        private string NameOfFP;

        public FormalParameter(Type TypeOfFP, string NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }
        public override bool ResolveNames()
        {
            return TypeOfFP.ResolveNames();
        }
        public override void TypeCheck()
        {
            TypeOfFP.TypeCheck();
        }
    }

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
        public override void TypeCheck()
        {
            foreach (Statements statement in statements)
            {
                statement.TypeCheck();
            }
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
        public override void TypeCheck()
        {
            TypeOfLVD.TypeCheck();
        }
    }
}

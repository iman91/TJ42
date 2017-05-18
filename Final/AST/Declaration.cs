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
        public CompilationUnit(List<TypeDeclaration> typedeclarations) { this.typedeclarations = typedeclarations; }
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
    public enum ClassModifier { Static, Public}
    public class ClassDeclaration : TypeDeclaration
    {
        private List<ClassModifier> classmodifier;
        private string NameOfClass;
        private List<MethodDeclaration> methoddeclarations;
        public ClassDeclaration(List<ClassModifier> classmodifier, string NameOfClass, List<MethodDeclaration> methoddeclarations)
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
        private VariableDeclaratorId NameOfFP;

        public FormalParameter(Type TypeOfFP, VariableDeclaratorId NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }
        public override bool ResolveNames()
        {
            return TypeOfFP.ResolveNames();
        }
        public override void TypeCheck()
        {
            TypeOfFP.TypeCheck();
        }
    }
    public class VariableDeclaratorId : Node
    {
        private string NameOfFP;

        public VariableDeclaratorId( string NameOfFP) { this.NameOfFP = NameOfFP;  }
        public override bool ResolveNames()
        {
            return true;
        }
        public override void TypeCheck()
        {
            
        }
    }
    public class MethodDeclaration : Node, Declaration
    {
        private List<MethodModifier> methodmodifer;
        private MethodHeader methodheader;
        private List<Statements> statements;

        public MethodDeclaration(List<MethodModifier> methodmodifer, MethodHeader methodheader, List<Statements> statements)
        {
            this.methodmodifer = methodmodifer; this.methodheader = methodheader; this.statements = statements;
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
    public class MethodHeader : Node, Declaration
    {
        private VoidType TypeOfMethod;
        private MethodDeclarator methoddeclarator;
        public MethodHeader(VoidType TypeOfMethod, MethodDeclarator methoddeclarator)
        {
          this.TypeOfMethod = TypeOfMethod; this.methoddeclarator= methoddeclarator;
        }
        public override bool ResolveNames()
        {
        
            return true;
        }
        public override void TypeCheck()
        {
         
        }
    }
    public class MethodDeclarator : Node, Declaration
    {
        private string NameOfMethod;
        private FormalParameter formalparameter;
        public MethodDeclarator(string NameOfMethod,
            FormalParameter formalparameter)
        {
           this.NameOfMethod = NameOfMethod;
            this.formalparameter = formalparameter;;
        }
        public override bool ResolveNames()
        {
            return true;
        }
        public override void TypeCheck()
        {
        }
    }
    public class LocalVariableDeclaration : Statements, Declaration
    {
        private Type TypeOfLVD;
        private VariableDeclaratorId NameOfLVD;
        public LocalVariableDeclaration(Type TypeOfLVD, VariableDeclaratorId NameOfLVD)
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

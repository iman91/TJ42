using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace GPLexTutorial.AST
{
    interface Declaration
    {
        
    }
    public class CompilationUnit : Node
    {

        private List<TypeDeclaration> typedeclarations;
        public CompilationUnit(List<TypeDeclaration> typedeclarations) { this.typedeclarations = typedeclarations; }
        public override bool ResolveNames(LexicalScope scope)
        {
            foreach (TypeDeclaration typedeclaration in typedeclarations)
            {
                if (!typedeclaration.ResolveNames(scope))
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
        public override void GenCode(StreamWriter testfile)
        {
            testfile.WriteLine(".assembly GPLexTutorial{}");
            foreach (TypeDeclaration typedeclaration in typedeclarations)
            {
                typedeclaration.GenCode(testfile);
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
        public override bool ResolveNames(LexicalScope scope)
        {
            foreach (MethodDeclaration methoddeclaration in methoddeclarations)
            {
                if (!methoddeclaration.ResolveNames(scope))
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
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(".class");
            foreach (ClassModifier classmodifier in classmodifier)
            {
                testfile.Write(" {0}", classmodifier);
            }
            testfile.WriteLine(" {0}",NameOfClass);
            testfile.WriteLine("{");
            foreach (MethodDeclaration methoddeclarations in methoddeclarations)
            {
                methoddeclarations.GenCode(testfile);
            }
            testfile.Write("}");
        }
    }
    public enum MethodModifier { Static, Public, }
    public class FormalParameter : Node
    {
        private Type TypeOfFP;
        private VariableDeclaratorId NameOfFP;

        public FormalParameter(Type TypeOfFP, VariableDeclaratorId NameOfFP) { this.NameOfFP = NameOfFP; this.TypeOfFP = TypeOfFP; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return TypeOfFP.ResolveNames(scope);
        }
        public override void TypeCheck()
        {
            TypeOfFP.TypeCheck();
        }
        public override void GenCode(StreamWriter testfile)
        {
            TypeOfFP.GenCode(testfile);
            NameOfFP.GenCode(testfile);
        }
    }
    public class VariableDeclaratorId : Node
    {
        private string NameOfFP;

        public VariableDeclaratorId( string NameOfFP) { this.NameOfFP = NameOfFP;  }
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {
            
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(" {0}",NameOfFP);
      
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
        public override bool ResolveNames(LexicalScope scope)
        {
            foreach (Statements statement in statements)
            {
                if (!statement.ResolveNames(scope))
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
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(".method");
            foreach (MethodModifier methodmodifer in methodmodifer)
            {
                testfile.Write(" {0}", methodmodifer);
            }
            methodheader.GenCode(testfile);
            testfile.WriteLine("{");
            testfile.WriteLine(".entrypoint");
            foreach (Statements statements in statements)
            {
                statements.GenCode(testfile);
            }
            testfile.WriteLine("ret");
            testfile.WriteLine("}");
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
        public override bool ResolveNames(LexicalScope scope)
        {
        
            return true;
        }
        public override void TypeCheck()
        {
         
        }
        public override void GenCode(StreamWriter testfile)
        {
            TypeOfMethod.GenCode(testfile);
            methoddeclarator.GenCode(testfile);
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
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(" {0}",NameOfMethod);
            testfile.Write("(");
            formalparameter.GenCode(testfile);
            testfile.WriteLine(")");
        }
    }
    public class LocalVariableDeclaration : Statements, Declaration
    {
        private Type TypeOfLVD;
        private VariableDeclaratorId NameOfLVD;
        public LocalVariableDeclaration(Type TypeOfLVD, VariableDeclaratorId NameOfLVD)
        { this.TypeOfLVD = TypeOfLVD; this.NameOfLVD = NameOfLVD; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return TypeOfLVD.ResolveNames(scope);
        }
        public override void TypeCheck()
        {
            TypeOfLVD.TypeCheck();
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(".locals init ([0] ");
            TypeOfLVD.GenCode(testfile);
            NameOfLVD.GenCode(testfile);
            testfile.WriteLine(")");
        }
    }
}

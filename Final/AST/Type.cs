using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.IO;

namespace GPLexTutorial.AST
{
    public abstract class Type : Node
    {
        public static Type intType = new NamedType("int");

        public bool Compatible(Type other)
        {
            return Equal(other);
     
        }
        public abstract bool Equal(Type other);
    }
    public class ArrayType : Type
    {
        private string ElementType;
        public ArrayType(string ElementType) { this.ElementType = ElementType; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {
            //ElementType.TypeCheck();
        }
        public override bool Equal(Type other)
        {
            return true;
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(ElementType);
            testfile.Write("[]");
        }
    }
    public class NamedType : Type
    {
        private string TypeName;
        public NamedType(string TypeName) { this.TypeName = TypeName; }
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {

        }
        public override bool Equal(Type other)
        {
            return true;
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write("TypeName");

        }
    }
    public class VoidType : Type
    {
        public VoidType()
        {

        }
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {

        }
        public override bool Equal(Type other)
        {
            return true;
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write(" void");
        }


    }
    public class IntType : Type
    {
      
        public override bool ResolveNames(LexicalScope scope)
        {
            return true;
        }
        public override void TypeCheck()
        {

        }
        public override bool Equal(Type other)
        {
            return true;
        }
        public override void GenCode(StreamWriter testfile)
        {
            testfile.Write("int32");
            
        }
    }

}

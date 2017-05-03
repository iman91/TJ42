using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

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
        public override bool Equal(Type other)
        {
            return true;
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
        public override void TypeCheck()
        {

        }
        public override bool Equal(Type other)
        {
            return true;
        }
    }
    public class IntType : Type
    {
        private int TypeValue;
        public IntType(int TypeValue) { this.TypeValue = TypeValue; }
        public override bool ResolveNames()
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
    }

}

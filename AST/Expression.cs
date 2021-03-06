﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GPLexTutorial.AST
{
    public abstract class Expression : Node { public Type type; };

    public class AssignmentExpression : Expression
    {
        private int AssignmentOperator;
        private Expression lhs, rhs;
        public AssignmentExpression(Expression lhs, int AssignmentOperator, Expression rhs)
        { this.AssignmentOperator = AssignmentOperator; this.lhs = lhs; this.rhs = rhs; }
        public override bool ResolveNames()
        {
            return lhs.ResolveNames() && rhs.ResolveNames();
        }
        public override void TypeCheck()
        {
            lhs.TypeCheck();
            rhs.TypeCheck();
            if (!rhs.type.Compatible(lhs.type))
            {
                Console.WriteLine("type error in assignment/n");
            }
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
        public override void TypeCheck()
        {
            type = Type.intType;
        }
    }
    public class ExpressionName : Expression
    {
        private string Identifier;
        private Declaration declaration;
        public ExpressionName(string Identifier) { this.Identifier = Identifier; }
        public override bool ResolveNames(/*LexicalScope scope*/)
        {
            /*if (scope != NULL)
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
    }
}

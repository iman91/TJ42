using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial
{
    public enum Tokens
    {
        StringLiteral = 300,
        BooleanLiteral = 256,
        EOF = 264
    };

    public struct MyValueType
    {
        public int num;
        public string name;
    };

    public abstract class ScanBase
    {
        public MyValueType yylval;
        public abstract int yylex();
        protected virtual bool yywrap() { return true; }
    }


    class Program
    {
        static void Main(string[] args)
        {
            Scanner scanner = new Scanner(
    new System.IO.FileStream(args[0], System.IO.FileMode.Open));


            Tokens token;
            do
            {
                token = (Tokens)scanner.yylex();
                switch (token)
                {
                    case Tokens.StringLiteral:         
                        Console.WriteLine("StringLiteral ({0})", scanner.yylval.name);
                        break;
                    case Tokens.BooleanLiteral:
                        Console.WriteLine("BooleanLiteral ({0})", scanner.yylval.name);
                        break;
                    case Tokens.EOF:
                        Console.WriteLine("EOF");
                        break;
                    default:
                        Console.WriteLine("'{0}'", (char)token);
                        break;
                }
            }
            while (token != Tokens.EOF);

        }
    }
}


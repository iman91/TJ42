using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial
{
    public struct MyValueType
    {
        public string num;
        public string flo;
    };

    public enum Tokens
    {
        IntergerLiteral,
        FloatingPointLiteral,
        EOF
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

            try
            {

                using (var input = System.IO.File.OpenRead(args[0]))
                {
                    Scanner scanner = new Scanner(input);

                    Tokens token;
                    do
                    {
                        token = (Tokens)scanner.yylex();
                        switch (token)
                        {
                            case Tokens.IntergerLiteral:
                                Console.WriteLine("IntergerLiteral ({0})", scanner.yylval.num);
                                break;
                            case Tokens.FloatingPointLiteral:
                                Console.WriteLine("FloatingPointLiteral ({0})", scanner.yylval.flo);
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
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}

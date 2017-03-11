using System;

namespace GPLexTutorial
{
    public struct MyValueType
    {
        public string oper;
        public string separ;
    };

    public enum Tokens
    {
        OPERATORS,
        SEPARATORS,
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
                            case Tokens.OPERATORS:
                                Console.WriteLine("OPERATORS ({0})", scanner.yylval.oper);
                                break;
                            case Tokens.SEPARATORS:
                                Console.WriteLine("SEPARATORS ({0})", scanner.yylval.separ);
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


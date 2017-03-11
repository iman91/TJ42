using System;

namespace GPLexTutorial
{
    public struct MyValueType
    {
        public string ident;
        public string comme;
    };

    public enum Tokens
    {
        IDENTIFIER,
        COMMENTS,
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
                            case Tokens.IDENTIFIER:
                                Console.WriteLine("IDENTIFIER ({0})", scanner.yylval.ident);
                                break;
                            case Tokens.COMMENTS:
                                Console.WriteLine("COMMENTS ({0})", scanner.yylval.comme);
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


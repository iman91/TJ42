using System.IO;
using System;

namespace GPLexTutorial
{
    class Program
    {
        static void Main(string[] args)
        {
            Scanner scanner = new Scanner(
                new FileStream(args[0], FileMode.Open));
            Parser parser = new Parser(scanner);
            parser.Parse();
            Console.ReadKey();
        }
    }
}/*

    
public struct MyValueType
{
    public string num;
    public string flo;
    public string ident;
    //public string oper;
    //public string separ;
    //public string comme;
};

public enum Tokens
{
    IntergerLiteral,
    Identifier,
    Comment,
    FloatingPointLiteral,
    Operator,
    Separator,
    IF, ELSE, INT, BOOL, EQ_OP, GE_OP, LE_OP, OR_OP, AND_OP, PTR_OP, NE_OP, 
    DOUBLECOLON, UNSIGNRIGHT, ELLIPSIS, RIGHT_ASSIGN, LEFT_ASSIGN, ADD_ASSIGN, SUB_ASSIGN, 
    MUL_ASSIGN, DIV_ASSIGN, MOD_ASSIGN, AND_ASSIGN, XOR_ASSIGN, OR_ASSIGN, 
    RIGHT_OP, LEFT_OP, INC_OP, DEC_OP,
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
                //Parser parser = new Parser(scanner);
                //parser.Parse();

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
                        case Tokens.Identifier:
                            Console.WriteLine("Identifiers ({0})", scanner.yylval.ident);
                            break;/*
                        case Tokens.Comment:
                            Console.WriteLine("'{0}'", scanner.yylval.comme);
                            break;
                        case Tokens.Operator:
                            Console.WriteLine("'{0}'", scanner.yylval.oper);
                            break;
                        case Tokens.Separator:
                            Console.WriteLine("'{0}'", scanner.yylval.separ);
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
        Console.ReadKey();
    }
}
}*/


using System.IO;
using System;

namespace GPLex
{
    class Program
    {
        static void Main(string[] args)
        {
            var filename = args[0];
            var file = new FileStream(args[0], FileMode.Open);
            Scanner scanner = new Scanner(file);
            Parser parser = new Parser(scanner);
            parser.Parse();
            Console.ReadKey();
        }
    }
}

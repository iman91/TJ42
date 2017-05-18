using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace GPLexTutorial
{
   

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Starting...");
            Scanner scanner = new Scanner(
            new System.IO.FileStream(args[0], System.IO.FileMode.Open));
            Parser parser = new Parser(scanner);
            Console.WriteLine("Parsing...");
            parser.Parse();
            Parser.root.DumpValue(0);
            Console.WriteLine("Finished...");
            Console.ReadLine();
        }
    }
}


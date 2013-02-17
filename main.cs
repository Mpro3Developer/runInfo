using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mpro;

namespace TesteTimeCS
{
    class main
    {
        static void Main(string[] args)
        {
            runInfo run = new runInfo();
            for (int i = 0; i < 50000; i++)
            {
                Console.Out.WriteLine("Printa");
            }
            Console.Out.WriteLine(run.endRun());
            Console.ReadKey();
        }
    }
}

using System;

namespace ConflictPractice
{
    class Program
    {
        // Main application entry point
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Conflict Resolution Practice!");
            Console.WriteLine("Version: 1.0 - PRODUCTION");
            Console.WriteLine("=================================");
            
            // Simple calculator
            int a = 10;
            int b = 5;
            
            Console.WriteLine($"Addition: {a} + {b} = {a + b}");
            Console.WriteLine($"Subtraction: {a} - {b} = {a - b}");

            Console.WriteLine("\nThank you for using our calculator!");
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
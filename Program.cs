using System;

namespace ConflictPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Conflict Resolution Practice!");
            Console.WriteLine("Version: 2.0 - Division Support");
            
            // Simple calculator with division
            double a = 15;
            double b = 3;
            
            Console.WriteLine($"Addition: {a} + {b} = {a + b}");
            Console.WriteLine($"Subtraction: {a} - {b} = {a - b}");
            Console.WriteLine($"Division: {a} / {b} = {a / b}");

            // Division by zero check
            if (b != 0)
            {
                Console.WriteLine($"Safe Division Result: {SafeDivide(a, b)}");
            }
        }

        static double SafeDivide(double numerator, double denominator)
        {
            if (denominator == 0)
            {
                Console.WriteLine("Error: Division by zero!");
                return 0;
            }
            return numerator / denominator;
        }
    }
}

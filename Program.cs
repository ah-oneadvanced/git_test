using System;

namespace ConflictPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Conflict Resolution Practice!");
            Console.WriteLine("Version: 1.1 - With Multiplication");
            
            // Enhanced calculator
            int a = 20;
            int b = 5;
            
            Console.WriteLine($"Addition: {a} + {b} = {a + b}");
            Console.WriteLine($"Subtraction: {a} - {b} = {a - b}");
            Console.WriteLine($"Multiplication: {a} * {b} = {a * b}");
            
            // New feature: Calculate area
            Console.WriteLine($"\nArea of rectangle: {a} x {b} = {CalculateArea(a, b)}");
        }
        
        static int CalculateArea(int length, int width)
        {
            return length * width;
        }
    }
}
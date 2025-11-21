using System;
using System.IO;

namespace ConflictPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            WriteLog("Application started");
            Console.WriteLine("Welcome to Conflict Resolution Practice!");
            Console.WriteLine("Version: 1.0 with Logging");
            
            // Simple calculator
            int a = 10;
            int b = 5;
            
            Console.WriteLine($"Addition: {a} + {b} = {Add(a, b)}");
            Console.WriteLine($"Subtraction: {a} - {b} = {Subtract(a, b)}");
            
            WriteLog("Application ended");
        }
        
        static int Add(int x, int y)
        {
            int result = x + y;
            WriteLog($"Added {x} + {y} = {result}");
            return result;
        }
        
        static int Subtract(int x, int y)
        {
            int result = x - y;
            WriteLog($"Subtracted {x} - {y} = {result}");
            return result;
        }
        
        static void WriteLog(string message)
        {
            string logMessage = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] {message}";
            Console.WriteLine($"LOG: {logMessage}");
            // In real app, write to file
        }
    }
}
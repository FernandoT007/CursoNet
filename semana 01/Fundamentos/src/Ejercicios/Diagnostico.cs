using System.Diagnostics;

namespace Ejercicios
{
    public class Diagnostico
    {
        static void Main()
        {
            Debug.WriteLine("Este es un mensaje de depuración");
            Trace.TraceInformation("Este es un mensaje de información de traza");

            Console.WriteLine("Mensajes de depuración y traza escritos");
        }
    }
}

namespace Ejercicios
{
    public class Archivos
    {
        static void Main4(string[] args)
        {
            var path = "ejemplo.txt";

            using(StreamWriter sw = new StreamWriter(path))
            {
                sw.WriteLine("Hola .NET 8!!");
            }

            using(StreamReader sr = new StreamReader(path))
            {
                string contenido = sr.ReadToEnd();
                Console.WriteLine("El contenido del archivo es:");
                Console.WriteLine(contenido);
            }
        }
    }
}
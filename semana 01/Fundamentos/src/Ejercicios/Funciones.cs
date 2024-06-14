namespace Ejercicios
{
    public class Funciones
    {
        static  void Main2()
        {
            Console.WriteLine(Sumar(1,2));
            Console.WriteLine(Saludar("Fernando"));
            ImprimirMensaje();
            
            int a = 10;
            int b = 20;

            int suma = Sumar(a,b);
            Console.WriteLine(suma);
            Console.WriteLine(Multiplicar(a,b));
        }

        static int Sumar(int a, int b)
        {
            return a + b;
        }
        static string Saludar(string nombre)
        {
            return "Hola " + nombre + "!!";
        }

        static void ImprimirMensaje()
        {
            Console.WriteLine("Este es un mensaje :)");
        }

        static int Multiplicar(int x, int y)
        {
            return x * y;
        }
        
    }

}
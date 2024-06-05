
namespace Ejercicios
{
    public class Linq
    {
        static void Main7()
        {
            List<int> numeros = new List<int>{1,2,3,4,5,6,7,8,9,10};

            var numerosFiltrados = numeros.Where(x => x > 5).OrderBy( x => x);

            Console.WriteLine("Los numeros mayores a 5 son:");
            foreach (var item in numerosFiltrados)
            {
                Console.WriteLine(item);
            }
        }
    }
}
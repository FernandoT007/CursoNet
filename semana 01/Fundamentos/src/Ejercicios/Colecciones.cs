namespace Ejercicios
{
    public class Colecciones
    {
        static void Main3()
        {
            List<int> numeros = new List<int>{ 1,2,3,4,5 };
            numeros.Add(6);

            Dictionary<string,int> estudiantes = new Dictionary<string,int>
            {
                  {"Juan",25},
                  {"Maria",30}
            };

            estudiantes["Pedro"] = 35;

            Console.WriteLine("Numeros de la lista:");
            foreach (var item in numeros)
            {
                Console.WriteLine(item);
            }           
            Console.WriteLine("\nEstudiantes en el diccionario:");
            foreach (var item in estudiantes)
            {
                Console.WriteLine($"{item.Key} : {item.Value}");
            }
        }
    }

}

namespace Ejercicios
{
    public class Tareas
    {
        static async Task Main8()
        {
            await TareaAsincronica();
            Console.WriteLine("Tarea asincronica completada.");
        }

        static async Task TareaAsincronica()
        {
            Console.WriteLine("Esperando 10 segundos");
            await Task.Delay(10000);
            Console.WriteLine("Han pasado 10 segundos!");
        }
    }
}
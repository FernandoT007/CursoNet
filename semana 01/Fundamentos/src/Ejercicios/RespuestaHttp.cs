
namespace Ejercicios
{
    public class RespuestaHttp
    {
        static async Task Main5()
        {
            var url = "https://jsonplaceholder.typicode.com/posts";

            HttpClient cliente = new HttpClient();
            HttpResponseMessage respuesta = await cliente.GetAsync(url);

            respuesta.EnsureSuccessStatusCode();
            string cuerpoDeRespuesta = await respuesta.Content.ReadAsStringAsync();

            Console.WriteLine("La respuesta HTTP es:");
            Console.WriteLine(cuerpoDeRespuesta);
        }
    }
}
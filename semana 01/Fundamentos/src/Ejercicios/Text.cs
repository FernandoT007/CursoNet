using System.Text; 

namespace Ejercicios // Ejemplo de StringBuilder
{
    /* 
     Comentario en bloque
    */
    public class Text
    {
        static void Main6()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Hola");
            sb.Append(',');
            sb.Append(".NET 8");

            Console.WriteLine("Contenido del StringBuilder");
            Console.WriteLine(sb.ToString());

            string text = "Hola, .NET 8";
            byte[] bytes = Encoding.UTF8.GetBytes(text);
            string textCodificado = Encoding.UTF8.GetString(bytes);

            Console.WriteLine("\nTexto codificado y decodificado");
            Console.WriteLine(textCodificado);

        } 
    }
}
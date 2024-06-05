namespace Ejercicios
{
    class TipoDato{
        static void Main1(string[] args)
        {
            DateTime dt1 = new DateTime(2015, 12, 20);
            DateTime dt2 = new DateTime(2015,12,30 , 5,10,20);
            TimeSpan time = new TimeSpan(10,5,25,50);

            Console.WriteLine(dt1 + time); // 2015, 12, 30 5,25,50
            Console.WriteLine(dt2 - dt1); // 10 y algo
            Console.WriteLine(dt1 == dt2); //false
            Console.WriteLine(dt1 != dt2); //true
            Console.WriteLine(dt1 > dt2); // false
            Console.WriteLine(dt1 < dt2); // true
            Console.WriteLine(dt1 >= dt2); // false
            Console.WriteLine(dt1 <= dt2); // true
        }
    }
}
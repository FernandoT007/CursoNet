namespace MiAPIMinima.Models
{
    public class Beer
    {
        public long Id { get; set; }
        public string? Name { get; set; }
        public string? Brewery { get; set; }
        public string? Type { get; set; }
        public double AlcoholContent { get; set; }
    }
}
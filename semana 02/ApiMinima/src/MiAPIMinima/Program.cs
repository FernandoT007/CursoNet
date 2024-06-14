using System.Collections.Concurrent;
using MiAPIMinima.Models;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

var beers = new ConcurrentDictionary<long, Beer>();
long currentId = 1;

app.MapGet("/api/beers", async () => await Task.FromResult(Results.Ok(beers.Values)));

app.MapGet("/api/beers/{id}", async (long id) =>
{
    return await Task.FromResult(beers.TryGetValue(id, out var beer)
     ? Results.Ok(beer)
     : Results.NotFound());
});

app.MapPost("/api/beers", async (Beer beer) =>
{
    beer.Id = currentId++;
    beers[beer.Id] = beer;

    EventManager.CreateBeer(beer); // evento de creacion
    return await Task.FromResult(Results.Created($"/api/beers/{beer.Id}", beer));
});


app.MapPut("/api/beers/{id}", async (long id, Beer updatedBeer) =>
{

    if (!beers.ContainsKey(id))
    {
        return await Task.FromResult(Results.NotFound());
    }

    updatedBeer.Id = id;
    beers[id] = updatedBeer;
    EventManager.UpdateBeer(updatedBeer);
    return await Task.FromResult(Results.NoContent());
});

app.Run();

EventManager.BeerCreated += (sender, beer) => //suscripcion al evento
{
    // accion que necesite.
    Console.WriteLine($"Nueva cerveza creada: {beer.Name} de {beer.Brewery}");
};


EventManager.BeerUpdated += (sender, beer) => //suscripcion al evento
{
    // accion que necesite.
    Console.WriteLine($"Cerveza actualizada: {beer.Name} de {beer.Brewery}");
};

public static class EventManager
{
    public static EventHandler<Beer>? BeerCreated;
    public static EventHandler<Beer>? BeerUpdated;

    public static void CreateBeer(Beer beer)
    {
        BeerCreated?.Invoke(null, beer);
    }

    public static void UpdateBeer(Beer beer)
    {
        BeerUpdated?.Invoke(null, beer);
    }
}
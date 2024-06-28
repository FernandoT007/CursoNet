using System.Text.Json;
using Docentes.Application.Services;
using StackExchange.Redis;

namespace Docentes.Infrastructure.Services;

public class CacheService : ICacheService
{
    private readonly IConnectionMultiplexer connetionMultiplexer;

    public CacheService(IConnectionMultiplexer connetionMultiplexer)
    {
        this.connetionMultiplexer = connetionMultiplexer;
    }

    public async Task<T?> GetCacheValueAsync<T>(string key)
    {
      var db = connetionMultiplexer.GetDatabase();
      var value = await db.StringGetAsync(key);

      if (value.IsNullOrEmpty)
      {
        return default;
      }
      return JsonSerializer.Deserialize<T>(value!);

    }

    public async Task SetCacheValueAsync<T>(string key, T value, TimeSpan? expirationTime = null)
    {
          var db = connetionMultiplexer.GetDatabase();
          var json = JsonSerializer.Serialize(value);

          await db.StringSetAsync(key,json,expirationTime);
    }
}
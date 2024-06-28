using Docentes.Application.Services;

namespace Docentes.Infrastructure.Services;

public class UsuariosService : IUsuariosService
{
    private readonly HttpClient _httpClient;

    public UsuariosService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<bool> UsuarioExistAsync(Guid usuarioId, CancellationToken cancellationToken)
    {
       var response = await  _httpClient.GetAsync($"usuarios/{usuarioId}", cancellationToken);
       return response.IsSuccessStatusCode;
    }
}
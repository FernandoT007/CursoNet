using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Usuarios.Application.Jwt;
using Usuarios.Domain.Usuarios;

namespace Usuarios.Infrastructure.Jwt;

public class AutorizacionService : IAutorizacionService
{

    private readonly IConfiguration _configuration;
    private readonly ApplicationDbContext _context;

    public AutorizacionService(IConfiguration configuration, ApplicationDbContext context)
    {
        _configuration = configuration;
        _context = context;
    }

    public async Task<AutorizacionResponse> DevolverToken(AutorizacionRequest autorizacion, CancellationToken cancellationToken )
    {
        var usuario = _context.Set<Usuario>().FirstOrDefaultAsync(
            x =>
                ((string)x.NombreUsuario!) == autorizacion.NombreUsuario &&
                ((string)x.Contrasenia!) == autorizacion.Clave,
                cancellationToken
        );

         if (usuario == null) { 
            return await Task.FromResult<AutorizacionResponse>(new AutorizacionResponse(string.Empty,false,"Usuario o contrasenia invalidos."));
        }

        string tokenCreado = GenerarToken(usuario.Id.ToString());


        return new  AutorizacionResponse(tokenCreado,true,"Token generado");

    }

    private string GenerarToken(string idUsuario)
    {
        var key = _configuration.GetSection("JwtSettings:key").Value;  
        var keyBytes = Encoding.ASCII.GetBytes(key!);

        var claims = new ClaimsIdentity();
        claims.AddClaim(new Claim(ClaimTypes.NameIdentifier, idUsuario));

        var credencialesToken = new SigningCredentials(
             new SymmetricSecurityKey(keyBytes),
             SecurityAlgorithms.HmacSha256Signature
         );

        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = claims,
            Expires = DateTime.UtcNow.AddMinutes(1),
            SigningCredentials = credencialesToken
        };

        var tokenHandler = new JwtSecurityTokenHandler();
        var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);

        string tokenCreado = tokenHandler.WriteToken(tokenConfig);

        return tokenCreado;
    }

}
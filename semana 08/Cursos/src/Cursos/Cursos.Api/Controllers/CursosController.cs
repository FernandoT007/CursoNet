using Cursos.Application.Cursos.CrearCursos;
using Cursos.Application.Cursos.ObtenerCursos;
using Cursos.Domain.Cursos;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Cursos.Api.Controllers;

[ApiController]
[Route("api/cursos")]
public class CursosController : ControllerBase
{
    private readonly ISender _sender;

    public CursosController(ISender sender)
    {
        _sender = sender;
    }

    [HttpGet()]
    public async Task<IActionResult> ObtenerCursos(
        CancellationToken cancellationToken
    )
    {
        var query = new GetCursosQuery();
        var resultado = await _sender.Send(query,cancellationToken);
        return resultado.IsSuccess ? Ok(resultado) : NotFound();
    }

      [HttpPost]
    public async Task<IActionResult> CrearCurso(
        CrearCursoRequest request,
        CancellationToken cancellationToken
    )
    {
        var command = new CrearCursosCommand
        (
            new NombreCurso(request.Nombre!),
            new DescripcionCurso(request.Descripcion!),
            new CapacidadCurso(request.Capacidad)
        );

        var resultado = await _sender.Send(command,cancellationToken);

        if (resultado.IsSuccess)
        {
            return CreatedAtAction(nameof(ObtenerCursos), new { id = resultado.Value } , resultado.Value );
        }
        return BadRequest(resultado.Error);
    }
}
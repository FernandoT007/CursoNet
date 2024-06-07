using Usuarios.Domain.Abstractions;
using Usuarios.Domain.Roles;
using Usuarios.Domain.Usuario.Events;

namespace Usuarios.Domain.Usuario;

public sealed class Usuario : Entity
{
    private Usuario(){}
    private Usuario(
          Guid id
        , NombreUsuario nombreUsuario
        , Contrasenia contrasenia
        , Rol rol
        , NombresPersona nombresPersona
        , ApellidoPaterno apellidoPaterno
        , ApellidoMaterno apellidoMaterno
        , Direccion direccion
        , DateTime fechaNacimiento
        , CorreoElectronico correoElectronico
        ) : base(id) {
            NombreUsuario = nombreUsuario;
            Contrasenia = contrasenia;
            Rol = rol;
            NombresPersona = nombresPersona;
            ApellidoPaterno = apellidoPaterno;
            ApellidoMaterno = apellidoMaterno;
            Direccion = direccion;
            FechaNacimiento = fechaNacimiento;
            CorreoElectronico = correoElectronico;
        }
    public NombreUsuario NombreUsuario { get; set; }
    public Contrasenia Contrasenia { get; set; }
    public Rol Rol { get; set; }
    public NombresPersona? NombresPersona { get; set; }
    public ApellidoPaterno? ApellidoPaterno { get; set; }
    public ApellidoMaterno? ApellidoMaterno { get; set; }
    public Direccion Direccion { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public CorreoElectronico CorreoElectronico { get; set; }

    public static Usuario Create(
          NombreUsuario nombreUsuario
        , Contrasenia contrasenia
        , Rol rol
        , NombresPersona nombresPersona
        , ApellidoPaterno apellidoPaterno
        , ApellidoMaterno apellidoMaterno
        , Direccion direccion
        , DateTime fechaNacimiento
        , CorreoElectronico correoElectronico
    )
    {
        var usuario = new Usuario(
            Guid.NewGuid(),
            nombreUsuario,
            contrasenia,
            rol,
            nombresPersona,
            apellidoPaterno,
            apellidoMaterno,
            direccion,
            fechaNacimiento,
            correoElectronico
        );

        usuario.RaiseDomainEvent(new UserCreateDomain(usuario.Id));

        return usuario;
    }


}

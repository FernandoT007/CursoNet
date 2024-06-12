namespace Usuarios.Domain.Usuario;

public record NombreUsuario
{
    public string Value { get; init; }

    private NombreUsuario(string _value)
    {
        Value = _value;
    }

    public static NombreUsuario Create(ApellidoPaterno apellido, NombresPersona nombres)
    {
        var nombreUsuario = nombres.Value.Trim().Substring(0,1) + apellido.Value.Trim().Replace(" ","");
        return new NombreUsuario(nombreUsuario.ToUpper());
    }

}

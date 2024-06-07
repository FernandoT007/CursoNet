namespace Usuarios.Domain.Usuario;

public record Direccion
(
    string Pais,
    string Departamento,
    string Provincia,
    string Ciudad,
    string Calle
);
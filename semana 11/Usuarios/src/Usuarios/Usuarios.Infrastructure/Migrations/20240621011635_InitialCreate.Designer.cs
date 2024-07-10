﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;
using Usuarios.Infrastructure;

#nullable disable

namespace Usuarios.Infrastructure.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20240621011635_InitialCreate")]
    partial class InitialCreate
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.6")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("Usuarios.Domain.Roles.Rol", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid")
                        .HasColumnName("id");

                    b.Property<string>("Descripcion")
                        .HasMaxLength(50)
                        .HasColumnType("character varying(50)")
                        .HasColumnName("descripcion");

                    b.Property<string>("NombreRol")
                        .HasMaxLength(20)
                        .HasColumnType("character varying(20)")
                        .HasColumnName("nombre_rol");

                    b.Property<uint>("Version")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate()
                        .HasColumnType("xid")
                        .HasColumnName("xmin");

                    b.HasKey("Id")
                        .HasName("pk_roles");

                    b.HasIndex("NombreRol")
                        .IsUnique()
                        .HasDatabaseName("ix_roles_nombre_rol");

                    b.ToTable("roles", (string)null);
                });

            modelBuilder.Entity("Usuarios.Domain.Usuarios.Usuario", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid")
                        .HasColumnName("id");

                    b.Property<string>("ApellidoMaterno")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)")
                        .HasColumnName("apellido_materno");

                    b.Property<string>("ApellidoPaterno")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)")
                        .HasColumnName("apellido_paterno");

                    b.Property<string>("Contrasenia")
                        .HasMaxLength(50)
                        .HasColumnType("character varying(50)")
                        .HasColumnName("contrasenia");

                    b.Property<string>("CorreoElectronico")
                        .HasMaxLength(50)
                        .HasColumnType("character varying(50)")
                        .HasColumnName("correo_electronico");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("estado");

                    b.Property<DateTime?>("FechaNacimiento")
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("fecha_nacimiento");

                    b.Property<DateTime?>("FechaUltimoCambio")
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("fecha_ultimo_cambio");

                    b.Property<string>("NombreUsuario")
                        .HasMaxLength(200)
                        .HasColumnType("character varying(200)")
                        .HasColumnName("nombre_usuario");

                    b.Property<string>("NombresPersona")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)")
                        .HasColumnName("nombres_persona");

                    b.Property<Guid?>("RolId")
                        .IsRequired()
                        .HasColumnType("uuid")
                        .HasColumnName("rol_id");

                    b.Property<uint>("Version")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate()
                        .HasColumnType("xid")
                        .HasColumnName("xmin");

                    b.HasKey("Id")
                        .HasName("pk_usuarios");

                    b.HasIndex("CorreoElectronico")
                        .IsUnique()
                        .HasDatabaseName("ix_usuarios_correo_electronico");

                    b.HasIndex("RolId")
                        .HasDatabaseName("ix_usuarios_rol_id");

                    b.ToTable("usuarios", (string)null);
                });

            modelBuilder.Entity("Usuarios.Domain.Usuarios.Usuario", b =>
                {
                    b.HasOne("Usuarios.Domain.Roles.Rol", "Rol")
                        .WithMany()
                        .HasForeignKey("RolId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_usuarios_roles_rol_id");

                    b.OwnsOne("Usuarios.Domain.Usuarios.Direccion", "Direccion", b1 =>
                        {
                            b1.Property<Guid>("UsuarioId")
                                .HasColumnType("uuid")
                                .HasColumnName("id");

                            b1.Property<string>("Calle")
                                .IsRequired()
                                .HasColumnType("text")
                                .HasColumnName("direccion_calle");

                            b1.Property<string>("Ciudad")
                                .IsRequired()
                                .HasColumnType("text")
                                .HasColumnName("direccion_ciudad");

                            b1.Property<string>("Departamento")
                                .IsRequired()
                                .HasColumnType("text")
                                .HasColumnName("direccion_departamento");

                            b1.Property<string>("Pais")
                                .IsRequired()
                                .HasColumnType("text")
                                .HasColumnName("direccion_pais");

                            b1.Property<string>("Provincia")
                                .IsRequired()
                                .HasColumnType("text")
                                .HasColumnName("direccion_provincia");

                            b1.HasKey("UsuarioId");

                            b1.ToTable("usuarios");

                            b1.WithOwner()
                                .HasForeignKey("UsuarioId")
                                .HasConstraintName("fk_usuarios_usuarios_id");
                        });

                    b.Navigation("Direccion");

                    b.Navigation("Rol");
                });
#pragma warning restore 612, 618
        }
    }
}

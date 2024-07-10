using Estudiantes.Api.Extensions;
using Estudiantes.Application;
using Estudiantes.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddApplication();
builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddMemoryCache();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.ApplyMigrations();

app.UseCustomExceptionHandler();

//app.UseRateLimiter(5,TimeSpan.FromMinutes(1));

app.MapControllers();

app.Run();

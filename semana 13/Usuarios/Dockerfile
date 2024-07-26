
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 7777
ENV ASPNETCORE_URLS=http://+:7777

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["Usuarios/src/Usuarios/Usuarios.Api/Usuarios.Api.csproj", "Usuarios/src/Usuarios/Usuarios.Api/"]
RUN dotnet restore "Usuarios/src/Usuarios/Usuarios.Api/Usuarios.Api.csproj"

COPY . .
WORKDIR "/src/Usuarios/src/Usuarios/Usuarios.Api"
RUN dotnet build "Usuarios.Api.csproj" -c Release -o /app/build

RUN dotnet publish "Usuarios.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Usuarios.Api.dll"]

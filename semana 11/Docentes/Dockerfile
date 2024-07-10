FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8888
ENV ASPNETCORE_URLS=http://+:8888

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["Docentes/src/Docentes/Docentes.Api/Docentes.api.csproj", "Docentes/src/Docentes/Docentes.Api/"]
RUN dotnet restore "Docentes/src/Docentes/Docentes.Api/Docentes.api.csproj"
COPY . .
WORKDIR "/src/Docentes/src/Docentes/Docentes.Api"
RUN dotnet build "Docentes.api.csproj" -c Release -o /app/build

RUN dotnet publish "Docentes.api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Docentes.api.dll"]

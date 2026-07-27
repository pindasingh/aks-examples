FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY src/Worker/Worker.csproj src/Worker/
RUN dotnet restore src/Worker/Worker.csproj
COPY src/Worker/ src/Worker/
RUN dotnet publish src/Worker/Worker.csproj -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app .
USER $APP_UID
ENTRYPOINT ["dotnet", "Worker.dll"]

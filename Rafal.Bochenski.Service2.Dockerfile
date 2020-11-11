FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY Rafal.Bochenski.Service2/ Rafal.Bochenski.Service2
COPY Rafal.Bochenski.Service2.Tests Rafal.Bochenski.Service2.Tests

WORKDIR Rafal.Bochenski.Service2/

RUN dotnet restore
RUN dotnet publish -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "Rafal.Bochenski.Service2.dll"]

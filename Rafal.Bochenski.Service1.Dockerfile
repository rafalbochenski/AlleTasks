FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY Rafal.Bochenski.Service1/ Rafal.Bochenski.Service1
COPY Rafal.Bochenski.Service1.Tests Rafal.Bochenski.Service1.Tests

WORKDIR Rafal.Bochenski.Service1/

RUN dotnet restore
RUN dotnet publish -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "Rafal.Bochenski.Service1.dll"]

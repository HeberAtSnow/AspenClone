FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . . 
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
RUN apt update && apt install -y curl
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "aspen_api.dll"]
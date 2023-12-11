# Base image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /wa-app
EXPOSE 80

# Copy csproj and restore as distinct layers
COPY ./wa-app/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./wa-app/ ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
ARG BUILD_NUMBER
ARG API_VERSION
# Set one or more individual labels
LABEL wa.api.version="${API_VERSION}" \
      wa.api.build="${BUILD_NUMBER}" \
      wa.api.vendor="WebAcademy" \
      wa.api.version.is-production="" \
      description="Simple REST-API WebAcademy"
WORKDIR /wa-app
COPY --from=build-env wa-app/out .
ENTRYPOINT ["dotnet", "wa-app.dll"]
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
#CMD dotnet wa-app.dll --urls "http://*:$PORT"
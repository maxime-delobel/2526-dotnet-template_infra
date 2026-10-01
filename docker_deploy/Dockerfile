FROM mcr.microsoft.com/dotnet/sdk:9.0

WORKDIR /app

COPY . .

EXPOSE 5001

ENTRYPOINT ["dotnet", "run", "--project", "/app/src/Rise.Server", "--urls", "http://0.0.0.0:5001"]

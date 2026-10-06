FROM mcr.microsoft.com/dotnet/sdk:9.0

WORKDIR /app

COPY . .

RUN dotnet tool install --global dotnet-ef --version 9.*
ENV PATH="$PATH:/root/.dotnet/tools"

EXPOSE 5001

ENTRYPOINT ["dotnet", "run", "--project", "/app/src/Rise.Server", "--urls", "http://0.0.0.0:5001"]

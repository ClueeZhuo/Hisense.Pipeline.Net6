#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Hisense.Pipeline.Net6.Web.Entry/Hisense.Pipeline.Net6.Web.Entry.csproj", "Hisense.Pipeline.Net6.Web.Entry/"]
COPY ["Hisense.Pipeline.Net6.Web.Core/Hisense.Pipeline.Net6.Web.Core.csproj", "Hisense.Pipeline.Net6.Web.Core/"]
COPY ["Hisense.Pipeline.Net6.Application/Hisense.Pipeline.Net6.Application.csproj", "Hisense.Pipeline.Net6.Application/"]
COPY ["Hisense.Pipeline.Net6.Core/Hisense.Pipeline.Net6.Core.csproj", "Hisense.Pipeline.Net6.Core/"]
RUN dotnet restore "Hisense.Pipeline.Net6.Web.Entry/Hisense.Pipeline.Net6.Web.Entry.csproj"
COPY . .
WORKDIR "/src/Hisense.Pipeline.Net6.Web.Entry"
RUN dotnet build "Hisense.Pipeline.Net6.Web.Entry.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Hisense.Pipeline.Net6.Web.Entry.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Hisense.Pipeline.Net6.Web.Entry.dll"]
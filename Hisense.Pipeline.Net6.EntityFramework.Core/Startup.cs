using Furion;
using Microsoft.Extensions.DependencyInjection;

namespace Hisense.Pipeline.Net6.EntityFramework.Core;

public class Startup : AppStartup
{
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddDatabaseAccessor(options =>
        {
            options.AddDbPool<DefaultDbContext>();
        }, "Hisense.Pipeline.Net6.Database.Migrations");
    }
}

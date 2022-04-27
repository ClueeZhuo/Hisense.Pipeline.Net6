using Furion.DatabaseAccessor;
using Microsoft.EntityFrameworkCore;

namespace Hisense.Pipeline.Net6.EntityFramework.Core;

[AppDbContext("Hisense.Pipeline.Net6", DbProvider.Sqlite)]
public class DefaultDbContext : AppDbContext<DefaultDbContext>
{
    public DefaultDbContext(DbContextOptions<DefaultDbContext> options) : base(options)
    {
    }
}

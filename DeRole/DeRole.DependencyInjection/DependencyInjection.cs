using DeRole.Data.Context;
using DeRole.Data.Repositories.UsersRepository;
using DeRole.Services;
using DeRole.Services.Mappings;
using DeRole.Services.Service.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace DeRole.DependencyInjection
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(
            this IServiceCollection services, 
            IConfiguration configuration)
        {
            services.AddDbContext<ApplicationDbContext>(options => options
            .UseNpgsql(configuration.GetConnectionString("Default")));

            services.AddScoped<IUserRepository, UserRepository>();

            return services;
        }

        public static IServiceCollection AddServices(
            this IServiceCollection services,
            IConfiguration configuration)
        {
            services.AddAutoMapper(typeof(DomainToDtoMap));
            services.AddScoped<IUserService, UserService>();

            return services;
        }
    }
}

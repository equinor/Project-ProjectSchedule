using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.AzureAD.UI;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using project.schedule.Data;
using project.schedule.Services.Authorization;
using ProjectSchedule.Services;
using System.Collections.Generic;

namespace ProjectSchedule
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddAuthentication(AzureADDefaults.BearerAuthenticationScheme)
                .AddAzureADBearer(options => Configuration.Bind("AzureAd", options));

            services.AddAuthorization(options =>
            {
                options.AddPolicy("Reader", policy => policy.Requirements.Add(new ScopeRequirement(new List<string> { "Project.Read" }, new List<string> { "Project.Reader" })));
            });

            services.AddSwaggerGen(c => c.SwaggerDoc("v1", new OpenApiInfo { Title = "Project Schedule", Version = "v1", Description = $"Maintained by {Configuration["EnterpriseAPI:TeamName"]} \n\n\n\n Authentication: \n\nUser delegated access requires scope: {Configuration["EnterpriseAPI:userdelegatedscope"]}\n\n Application access requires application role: {Configuration["EnterpriseAPI:applicationrole"]}\n\n\n\nSource Code and documentation at: {Configuration["EnterpriseAPI:github"]}" }));


            services.AddScoped<AuthenticationMockService>();
            services.AddTransient<IAuthorizationHandler, ScopeRequirementHandler>();
            services.AddDbContext<DatabaseContext>(options => options.UseSqlServer(Configuration["ConnectionString"]));

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseSwagger(c =>
            {
                c.PreSerializeFilters.Add((swagger, httpReq) =>
                {
                    swagger.Servers = new List<OpenApiServer> { new OpenApiServer { Url = $"{httpReq.Scheme}://{httpReq.Host.Value}" } };
                });
            });

            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Project Schedule"));

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}

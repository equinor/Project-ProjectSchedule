using Microsoft.Azure.Services.AppAuthentication;
using Microsoft.EntityFrameworkCore;
using project.schedule.Models.Database;
using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace project.schedule.Data
{
    public class DatabaseContext : DbContext
    {
        public DbSet<MarinePlanning> MarinePlanning { get; set; }
        public DatabaseContext()
        {
        }

        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
            var conn = (SqlConnection)Database.GetDbConnection();
            conn.AccessToken = new AzureServiceTokenProvider().GetAccessTokenAsync("https://database.windows.net/").Result;
        }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("enterprise");

            modelBuilder.Entity<MarinePlanning>(eb =>
            {
                eb.HasNoKey();
                eb.ToView("v_project_project_schedule_marine_planning_1_0");
            });
        }
    }
}

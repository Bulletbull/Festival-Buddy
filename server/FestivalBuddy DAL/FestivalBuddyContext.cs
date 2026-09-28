using FestivalBuddy_API.DTO;
using FestivalBuddy_Common.DTO;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_DAL
{
    public  class FestivalBuddyContext : DbContext
    {
        public FestivalBuddyContext(
        DbContextOptions<FestivalBuddyContext> options)
        : base(options)
        {

        }

        public DbSet<EventDTO> Events { get; set; }
        public DbSet<SyncMetadata> metaDatas { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EventDTO>().HasData(
                new EventDTO
                {
                    Id = 1,
                    Name = "Summer Festival",
                    Date = new DateTime(2026, 7, 15, 19, 0, 0, DateTimeKind.Utc)
                },
                new EventDTO
                {
                    Id = 2,
                    Name = "Music Night",
                    Date = new DateTime(2026, 7, 15, 20, 0, 0, DateTimeKind.Utc)
                }
            );
            modelBuilder.Entity<SyncMetadata>(entity =>
            {
                entity.HasKey(x => x.Key);

                entity.Property(x => x.Key)
                    .HasMaxLength(100)
                    .IsRequired();

                entity.Property(x => x.Version)
                    .IsRequired();
            });

            modelBuilder.Entity<SyncMetadata>().HasData(
                new SyncMetadata
                {
                    Key = "program",
                    Version = 0
                },
                new SyncMetadata
                {
                    Key = "map",
                    Version = 0
                }
            );
        }
    }
}

using System.Data.Entity;

namespace ClassActivity.Models
    {
    public class ListDbContext : DbContext
        {
        public DbSet<List> Lists { get; set; }
        public DbSet<ListItemType> ListItemTypes { get; set; }
        public DbSet<Priority> Priorities { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
            {
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            modelBuilder.Entity<ListItemType>()
                .HasMany(zz => zz.Lists)
                
                .WithOptional(zz => zz.ListItemType)
                .HasForeignKey(zz => zz.ListItemTypeID)
                .WillCascadeOnDelete(true);

            modelBuilder.Entity<Priority>()
                .HasMany(zz => zz.Lists)

                .WithOptional(zz => zz.Priority)
                .HasForeignKey(zz => zz.PriorityID)
                .WillCascadeOnDelete(true);

            base.OnModelCreating(modelBuilder);
            }
        }
    }
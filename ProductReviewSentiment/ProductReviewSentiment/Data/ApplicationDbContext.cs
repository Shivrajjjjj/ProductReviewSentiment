using Microsoft.EntityFrameworkCore;
using ProductReviewSentiment.Models;

namespace ProductReviewSentiment.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<Review> Reviews => Set<Review>();
    }
}

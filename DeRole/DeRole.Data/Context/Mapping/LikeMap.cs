using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Context.Mapping
{
    public class LikeMap : IEntityTypeConfiguration<Like>
    {
        public void Configure(EntityTypeBuilder<Like> builder)
        {
            builder.ToTable("EVENTO_USUARIO_LIKE");

            builder.HasKey(u => u.Id);

            builder.Property(u => u.UserId)
                .HasColumnName("USUARIO_ID");

            builder.Property(u => u.EventId)
                .HasColumnName("EVENTO_ID");

            builder.HasOne(e => e.User)
                .WithMany(u => u.Likes)
                .HasForeignKey(e => e.UserId);
        }
    }
}

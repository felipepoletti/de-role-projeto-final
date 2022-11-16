using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Context.Mapping
{
    public class LikeMap : IEntityTypeConfiguration<Like>
    {
        public void Configure(EntityTypeBuilder<Like> builder)
        {
            builder.ToTable("evento_usuario_like");

            builder.HasKey(u => u.Id);

            builder.Property(u => u.Id)
                .HasColumnName("evento_usuario_like_id")
                .UseIdentityColumn();

            builder.Property(u => u.UserId)
                .HasColumnName("usuario");

            builder.Property(u => u.EventId)
                .HasColumnName("evento_id");

            builder.HasOne(e => e.User)
                .WithMany(u => u.Likes)
                .HasForeignKey(e => e.UserId);

            builder.HasOne(e => e.Event)
                .WithMany(u => u.Likes)
                .HasForeignKey(e => e.EventId);

        }
    }
}

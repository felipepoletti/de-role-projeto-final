using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DeRole.Data.Context.Mapping
{
    public class UserMap : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("USUARIO");

            builder.HasKey(u => u.Id);

            builder.Property(u => u.Id)
                .HasColumnName("USUARIO_ID");

            builder.Property(u => u.Name)
                .HasColumnName("USUARIO_NOME");

            builder.Property(u => u.BirthDate)
                .HasColumnName("USUARIO_DATA_NASCIMENTO");

            builder.Property(u => u.Email)
                .HasColumnName("USUARIO_EMAIL");

            builder.Property(u => u.Password)
                .HasColumnName("USUARIO_SENHA");

            builder.HasMany(u => u.Events)
                .WithOne(e => e.User)
                .HasForeignKey(u => u.UserId);

            builder.HasMany(u => u.Likes)
                .WithOne(e => e.User)
                .HasForeignKey(u => u.UserId);
        }
    }
}

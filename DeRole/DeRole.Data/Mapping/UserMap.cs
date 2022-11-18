using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DeRole.Data.Context.Mapping
{
    public class UserMap : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("usuario");

            builder.HasKey(u => u.Id);

            builder.Property(u => u.Id)
                .HasColumnName("usuario_id")
                .UseIdentityColumn();

            builder.Property(u => u.Name)
                .HasColumnName("usuario_nome");

            builder.Property(u => u.Email)
                .HasColumnName("usuario_email");

            builder.Property(u => u.Password)
                .HasColumnName("usuario_senha");

            builder.HasMany(u => u.Events)
                .WithOne(x => x.User);
        }
    }
}

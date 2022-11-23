using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DeRole.Data.Context.Mapping
{
    public class EventMap : IEntityTypeConfiguration<Event>
    {
        public void Configure(EntityTypeBuilder<Event> builder)
        {
            builder.ToTable("evento");

            builder.HasKey(e => e.Id);

            builder.Property(e => e.Id)
                .HasColumnName("evento_id")
                .UseIdentityColumn();

            builder.Property(e => e.EventName)
                .HasColumnName("evento_name");

            builder.Property(e => e.Price)
                .HasColumnName("evento_preco");

            builder.Property(e => e.EventDescription)
                .HasColumnName("evento_descricao");

            builder.Property(e => e.Date)
                .HasColumnName("evento_data");

            builder.Property(e => e.Time)
                .HasColumnName("evento_hora");

            builder.Property(e => e.Address)
                .HasColumnName("evento_endereco");

            builder.Property(e => e.AddressNumber)
                .HasColumnName("evento_endereco_numero");

            builder.Property(e => e.AddressComplement)
                .HasColumnName("evento_endereco_complemento");

            builder.Property(e => e.EventType)
                .HasColumnName("evento_tipo");

            builder.Property(e => e.UserId)
                .HasColumnName("usuario_id");

            builder.HasOne(e => e.User)
                .WithMany(t => t.Events)
                .HasForeignKey(e => e.UserId);
        }
    }
}

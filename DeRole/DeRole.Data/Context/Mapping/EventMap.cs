using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DeRole.Data.Context.Mapping
{
    public class EventMap : IEntityTypeConfiguration<Event>
    {
        public void Configure(EntityTypeBuilder<Event> builder) 
        {
            builder.ToTable("EVENTO");

            builder.HasKey(e => e.Id);

            builder.Property(e => e.Id)
                .HasColumnName("EVENTO_ID");

            builder.Property(e => e.EventName)
                .HasColumnName("EVENTO_NAME");

            builder.Property(e => e.Price)
                .HasColumnName("EVENTO_PRECO");

            builder.Property(e => e.EventDescription)
                .HasColumnName("EVENTO_DESCRICAO");

            builder.Property(e => e.Date)
                .HasColumnName("EVENTO_DATA");

            builder.Property(e => e.Address)
                .HasColumnName("EVENTO_ENDERECO");

            builder.Property(e => e.AddressNumber)
                .HasColumnName("EVENTO_ENDERECO_NUMERO");

            builder.Property(e => e.AddressComplement)
                .HasColumnName("EVENTO_ENDERECO_COMPLEMENTO");

            builder.Property(e => e.EventTypeId)
                .HasColumnName("TIPO_EVENTO_ID");

            builder.Property(e => e.UserId)
                .HasColumnName("PESSOA_ID");

            builder.HasOne(e => e.User)
                .WithMany(t => t.Events);
        }
    }
}

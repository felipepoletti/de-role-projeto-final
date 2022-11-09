using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Context.Mapping
{
    public class EventTypeMap : IEntityTypeConfiguration<EventType>
    {
        public void Configure(EntityTypeBuilder<EventType> builder)
        {
            builder.ToTable("TIPO_EVENTO");

            builder.HasKey(u => u.EventTypeId);

            builder.Property(u => u.EventTypeId)
                .HasColumnName("TIPO_EVENTO_ID");

            builder.Property(u => u.EventTypeName)
                .HasColumnName("TIPO_EVENTO_NOME");
        }
    }
}

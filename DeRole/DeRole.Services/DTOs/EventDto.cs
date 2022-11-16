namespace DeRole.Services.DTOs
{
    public class EventDto
    {
        public int Id { get; private set; }
        public string EventName { get; private set; }
        public decimal Price { get; private set; }
        public string EventDescription { get; private set; }
        public DateTime Date { get; private set; }
        public string Address { get; private set; }
        public string AddressNumber { get; private set; }
        public string? AddressComplement { get; private set; }
        public int UserId { get; private set; }
        public int EventTypeId { get; private set; }
    }
}

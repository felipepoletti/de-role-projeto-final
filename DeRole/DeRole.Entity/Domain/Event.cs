using DeRole.Entity.Validations;

namespace DeRole.Entity.Domain
{
    public sealed class Event
    {
        public int Id { get; private set; }
        public string EventName { get; private set; }
        public decimal? Price { get; private set; }
        public DateTime Date { get; private set; }
        public string Address { get; private set; }
        public string AddressNumber { get; private set; }
        public string? AddressComplement { get; private set; }
        public int UserId { get; private set; }
        public int EventTypeId { get; private set; }

        public User User { get; private set; }
        public EventType EventType { get; private set; }

        public Event(string eventName,
            decimal price, DateTime date,
            string address, string addressNumber,
            string? addressComplement,
            int userId, int eventTypeId)
        {
            Validation(eventName, price, date, address, addressNumber, addressComplement, userId, userId);
        }

        public Event(int id, string eventName, 
            decimal price, DateTime date, 
            string address, string addressNumber, 
            string? addressComplement, 
            int userId, int eventTypeId)
        {
            EntityValidationException.When(Id < 0, "Id precisa ser informado");
            Id = id;

            Validation(eventName, price, date, address, addressNumber, addressComplement, userId, userId);
        }

        public void Validation(string eventName, decimal? price, DateTime? date, string address, string addressNumber, string? addressComplement, int eventTypeId, int userId)
        {
            EntityValidationException.When(string.IsNullOrEmpty(eventName), "O nome do evento deve ser informado.");
            EntityValidationException.When(price < 0, "O preço deve ser informado.");
            EntityValidationException.When(date.HasValue, "A data endereço deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(address), "O número endereço deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(addressNumber), "O número endereço deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(addressComplement), "O complemento endereço deve ser informado.");
            EntityValidationException.When(eventTypeId < 0 , "O tipo do evento deve ser informado.");
            EntityValidationException.When(userId < 0 , "O usuário deve ser informado.");

        }
    }
}

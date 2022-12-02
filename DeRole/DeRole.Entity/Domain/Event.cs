using DeRole.Entity.Validations;

namespace DeRole.Entity.Domain
{
    public sealed class Event
    {
        public int Id { get; private set; }
        public string EventName { get; private set; }
        public decimal Price { get; private set; }
        public string EventDescription { get; private set; }
        public string Date { get; private set; }
        public string Time { get; private set; }
        public string Address { get; private set; }
        public string AddressNumber { get; private set; }
        public string? AddressComplement { get; private set; }
        public string? AddressDistrict { get; private set; }
        public int UserId { get; private set; }
        public string EventType { get; private set; }

        public User User { get; set; }

        public Event(string eventName,
            decimal price, string eventDescription,
            string date, string time,
            string address, string addressNumber,
            string? addressComplement, string? addressDistrict,
            int userId, string eventType)
        {
            Validation(eventName, price, 
                eventDescription, date, time, 
                address, addressNumber,
                addressComplement, addressDistrict,
                eventType, userId);
        }

        public Event(int id, string eventName, 
            decimal price, string eventDescription, 
            string date, string time,
            string address, string addressNumber, 
            string? addressComplement,
            string? addressDistrict,
            int userId, string eventType)
        {
            EntityValidationException.When(Id < 0, "Id precisa ser informado");
            Id = id;

            Validation(eventName, price, eventDescription, date, time, address, addressNumber, addressComplement, addressDistrict, eventType, userId);
        }

        public void Validation(string eventName, decimal price, string eventDescription, string date, string time, string address, string addressNumber, string? addressComplement, string? addressDistrict, string eventType, int userId)
        {
            EntityValidationException.When(string.IsNullOrEmpty(eventName), "O nome do evento deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(eventDescription), "O nome do evento deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(date), "A data deve ser informada.");
            EntityValidationException.When(string.IsNullOrEmpty(time), "A hora deve ser informada.");
            EntityValidationException.When(string.IsNullOrEmpty(address), "O número endereço deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(addressNumber), "O número endereço deve ser informado.");
            EntityValidationException.When(string.IsNullOrEmpty(eventType), "O tipo do evento deve ser informado.");
            EntityValidationException.When(userId < 0 , "O usuário deve ser informado.");

            EventName = eventName;
            EventDescription = eventDescription;
            Price = price;
            Date = date;
            Time = time;
            Address = address;
            AddressNumber = addressNumber;
            AddressComplement = addressComplement;
            AddressDistrict = addressDistrict;
            EventType = eventType;
            UserId = userId;
        }
    }
}

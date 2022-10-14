using DeRole.Entity.Validations;

namespace DeRole.Entity.Domain
{
    public class EventType
    {
        public int EventTypeId { get; set; }
        public string EventTypeName { get; set; }

        public EventType(string eventTypeName)
        {
            Validation(eventTypeName);
        }

        public EventType(int eventTypeId, string eventTypeName)
        {
            EntityValidationException.When(eventTypeId < 0, "Id deve ser maior que zero!");
            EventTypeId = eventTypeId;
            
            Validation(eventTypeName);
        }

        private void Validation(string eventTypeName)
        {
            EntityValidationException.When(string.IsNullOrEmpty(eventTypeName), "Nome deve ser informado");

            EventTypeName = eventTypeName;
        }
    }
}
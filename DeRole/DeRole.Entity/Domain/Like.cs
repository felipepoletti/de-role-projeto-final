

using DeRole.Entity.Validations;
using System.Xml.Linq;

namespace DeRole.Entity.Domain
{
    public class Like
    {
        public int Id { get; private set; }
        public int EventId { get; private set; }
        public int UserId { get; private set; }
        public Event Event { get; private set; }
        public User User { get; private set; }

        public Like(int eventId, int userId)
        {
            Validation(eventId, userId);
        }

        public Like(int id, int eventId, int userId)
        {
            EntityValidationException.When(id < 0, "Id deve ser maior que zero");
            Id = id;

            Validation(eventId, userId);
        }

        private void Validation(int eventId, int userId)
        {
            EntityValidationException.When(eventId < 0, "Id deve ser maior que zero");
            EntityValidationException.When(userId < 0, "Id deve ser maior que zero");

            UserId = userId;
            EventId = eventId;
        }
    }
}

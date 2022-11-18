using DeRole.Entity.Validations;

namespace DeRole.Entity.Domain
{
    public sealed class User
    {
        public int Id { get; private set; }
        public string? Name { get; private set; }
        public string Email { get; private set; }
        public string Password { get; private set; }
        public ICollection<Event> Events { get; set; }

        public User(string name, string email, string password)
        {
            Validation(name, email, password);
            Events = new List<Event>();
        }

        public User(int id, string name, string email, string password)
        {
            EntityValidationException.When(id < 0, "Id deve ser maior que zero!");
            Id = id;

            Validation(name, email, password);
        }

        private void Validation(string name, string email, string password)
        {
            EntityValidationException.When(string.IsNullOrEmpty(email), "E-mail deve ser informado");
            EntityValidationException.When(string.IsNullOrEmpty(password), "Senha deve ser informada");

            Name = name;
            Email = email;
            Password = password;
        }
    }
}

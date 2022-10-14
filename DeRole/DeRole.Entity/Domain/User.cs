using DeRole.Entity.Validations;

namespace DeRole.Entity.Domain
{
    public sealed class User
    {
        public int Id { get; private set; }
        public string Name { get; private set; }
        public DateTime BirthDate { get; private set; }
        public string Email { get; private set; }
        public string Password { get; private set; }
        public ICollection<Event> Events { get; private set; }   
        public ICollection<Like> Likes { get; private set; }   

        public User(string name, DateTime birthDate, string email, string password)
        {
            Validation(name, email, password, birthDate);
        }

        public User(int id, string name, DateTime birthDate, string email, string password)
        {
            EntityValidationException.When(id < 0, "Id deve ser maior que zero!");
            Id = id;

            Validation(name, email, password, birthDate);
        }

        private void Validation(string name, string email, string password, DateTime? birthDate)
        {
            EntityValidationException.When(string.IsNullOrEmpty(name), "Nome deve ser informado");
            EntityValidationException.When(string.IsNullOrEmpty(email), "E-mail deve ser informado");
            EntityValidationException.When(string.IsNullOrEmpty(password), "Senha deve ser informada");
            EntityValidationException.When(!birthDate.HasValue, "A data deve ser informada");

            Name = name;
            Email = email;
            Password = password;
            BirthDate = birthDate.Value;
        }
    }
}

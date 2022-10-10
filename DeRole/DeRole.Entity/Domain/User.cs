using EntityValidations = DeRole.Entity.Validations.EntityValidationException;

namespace DeRole.Entity.Domain
{
    public sealed class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public User(string name, DateTime birthDate, string email, string password)
        {
            Validation(name, email, password);
        }

        public User(int id, string name, DateTime? birthDate, string email, string password)
        {
            EntityValidations.When(id < 0, "Id deve ser maior que zero!");
            Id = id;

            Validation(name, email, password);
        }

        private void Validation(string name, string email, string password)
        {
            EntityValidations.When(string.IsNullOrEmpty(name), "Nome deve ser informado");
            EntityValidations.When(string.IsNullOrEmpty(email), "E-mail deve ser informado");
            EntityValidations.When(string.IsNullOrEmpty(password), "Senha deve ser informada");

            Name = name;
            Email = email;
            Password = password;
        }
    }
}

using DeRole.Entity.Domain;

namespace DeRole.Data.Authentication
{
    public interface ITokenGenerator
    {
        dynamic Generator(User user);
    }
}

namespace DeRole.Entity.Validations
{
    public class EntityValidationException : Exception
    {
        public EntityValidationException(string error) : base(error)
        { }

        public static void When(bool hasError, string errorMessage)
        {
            if (hasError)
                throw new EntityValidationException(errorMessage);
        }
    }
}

using DeRole.Services.Service.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DeRole.Api.Controllers
{
    [ApiController]
    [Route("derole/[controller]")]
    public class LoginController : ControllerBase
    {
        private readonly IUserService _userService;

        public LoginController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        [Route("token")]
        public async Task<ActionResult> PostAuthorizationAsync([FromForm] string email, string senha)
        {
            var result = await _userService.GenerateTokenAsync(email, senha);

            if (result.IsSuccess)
                return Ok(result.Data);

            return BadRequest(result);
        }
    }
}

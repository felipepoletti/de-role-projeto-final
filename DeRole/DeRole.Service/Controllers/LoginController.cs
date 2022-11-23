using DeRole.Services.DTOs;
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
        [Route("authenticate")]
        public async Task<ActionResult> PostAuthorizationAsync([FromBody] LoginDto loginDto)
        {
            var result = await _userService.GenerateTokenAsync(loginDto);

            if (result.IsSuccess)
                return Ok(result.Data);

            return BadRequest(result);
        }
    }
}

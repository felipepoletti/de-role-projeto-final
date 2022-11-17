using DeRole.Services.DTOs;
using DeRole.Services.Service.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DeRole.Api.Controllers
{
    [ApiController]
    [Route("derole/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] UserDto userDto)
        {
            var result = await _userService.CreateAsync(userDto);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }
    }
}

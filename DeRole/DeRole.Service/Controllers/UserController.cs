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
        public async Task<ActionResult> PostAsync([FromBody] UserDto userDto)
        {
            var result = await _userService.CreateAsync(userDto);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        public async Task<ActionResult> GetAsync()
        {
            var result = await _userService.GetUsersAsync();

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetByIdAsync(int id)
        {
            var result = await _userService.GetUsersByIdAsync(id);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpPut]
        public async Task<ActionResult> UpdateAsync([FromBody] UserDto userDto)
        {
            var result = await _userService.UpdateUserAsync(userDto);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpDelete]
        [Route("{id}")]
        public async Task<ActionResult> DeleteAsync(int id)
        {
            var result = await _userService.DeleteUserAsync(id);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }
    }
}

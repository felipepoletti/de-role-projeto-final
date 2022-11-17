using DeRole.Services.DTOs;
using DeRole.Services.Service.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DeRole.Api.Controllers
{
    [ApiController]
    [Route("derole/[controller]")]
    public class EventController : ControllerBase
    {
        private readonly IEventService _eventService;

        public EventController(IEventService eventService)
        {
            _eventService = eventService;
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] EventDto eventDto)
        {
            var result = await _eventService.CreateAsync(eventDto);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }
    }
}

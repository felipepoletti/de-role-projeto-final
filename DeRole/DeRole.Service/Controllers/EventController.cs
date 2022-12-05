using DeRole.Services.DTOs;
using DeRole.Services.Service.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DeRole.Api.Controllers
{
    [Authorize]
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

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetByIdAsync(int id)
        {
            var result = await _eventService.GetEventByIdAsync(id);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        public async Task<ActionResult> GetAsync()
        {
            var result = await _eventService.GetEventsAsync();

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        } 

        [HttpPut]
        public async Task<ActionResult> UpdateAsync([FromBody] EventDto eventDto)
        {
            var result = await _eventService.UpdateEventAsync(eventDto);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpDelete]
        [Route("{id}")]
        public async Task<ActionResult> DeleteAsync(int id)
        {
            var result = await _eventService.DeleteEventAsync(id);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        [Route("filter/{eventType}")]
        public async Task<ActionResult> GetByEventTypeAsync(string eventType)
        {
            var result = await _eventService.GetEventsByEventTypeAsync(eventType);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        [Route("search/{eventName}")]
        public async Task<ActionResult> GetByEventNameAsync(string eventName)
        {
            var result = await _eventService.GetEventsByNameAsync(eventName);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }

        [HttpGet]
        [Route("users/{id}")]
        public async Task<ActionResult> GetByUserIdAsync(int id)
        {
            var result = await _eventService.GetEventsByUserIdAsync(id);

            if (result.IsSuccess)
                return Ok(result);

            return BadRequest(result);
        }
    }
}

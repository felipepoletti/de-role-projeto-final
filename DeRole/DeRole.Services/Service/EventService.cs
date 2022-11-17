using AutoMapper;
using DeRole.Data.Repositories.EventsRepository;
using DeRole.Entity.Domain;
using DeRole.Services.DTOs;
using DeRole.Services.DTOs.Validations;
using DeRole.Services.Service.Interfaces;

namespace DeRole.Services.Service
{
    public class EventService : IEventService
    {
        private readonly IEventRepository _eventRepository;
        private readonly IMapper _mapper;

        public EventService(IEventRepository eventRepository, IMapper mapper)
        {
            _eventRepository = eventRepository;
            _mapper = mapper;
        }

        public async Task<ResultService<EventDto>> CreateAsync(EventDto eventDto)
        {
            if (eventDto == null)
                return ResultService.Fail<EventDto>("O objeto deve ser informado!");

            var result = new EventDtoValidator().Validate(eventDto);

            if (!result.IsValid)
                return ResultService.RequestError<EventDto>("Não foi possível validar o objeto.", result);

            var events = _mapper.Map<Event>(eventDto);
            var data = await _eventRepository.CreateAsync(events);

            return ResultService.Ok<EventDto>(_mapper.Map<EventDto>(data));
        }
    }
}

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

        public async Task<ResultService> DeleteEventAsync(int id)
        {
            var eventToDelete = await _eventRepository.GetEventByIdAsync(id);

            if (eventToDelete == null)
                return ResultService.Fail("Evento não encontrado!");

            await _eventRepository.DeleteAsync(eventToDelete);
            return ResultService.Ok("Evento deletado.");
        }

        public async Task<ResultService<EventDto>> GetEventByIdAsync(int id)
        {
            var eventById = await _eventRepository.GetEventByIdAsync(id);

            if (eventById == null)
                return ResultService.Fail<EventDto>("Evento não encontrada!");

            return ResultService.Ok(_mapper.Map<EventDto>(eventById));
        }

        public async Task<ResultService<ICollection<EventDto>>> GetEventsAsync()
        {
            var events = await _eventRepository.GetAllEventsAsync();
            return ResultService.Ok<ICollection<EventDto>>(_mapper.Map<ICollection<EventDto>>(events));
        }

        public async Task<ResultService> UpdateEventAsync(EventDto eventDto)
        {
            if (eventDto == null)
                return ResultService.Fail("O evento deve ser informado.");

            var validation = new EventDtoValidator().Validate(eventDto);

            if (!validation.IsValid)
                return ResultService.RequestError("Erro ao validar os campos.", validation);

            var eventToUpdate = await _eventRepository.GetEventByIdAsync(eventDto.Id);

            if (eventToUpdate == null)
                return ResultService.Fail("Evento não encontrado");

            eventToUpdate = _mapper.Map<EventDto, Event>(eventDto, eventToUpdate);
            await _eventRepository.EditAsync(eventToUpdate);

            return ResultService.Ok("Evento editado!");
        }
    }
}

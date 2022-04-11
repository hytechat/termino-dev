package at.bmdw.teamtermino.termino.jpa.mapper;

import at.bmdw.teamtermino.termino.assembler.DateAssembler;
import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MeetingEntityMapper extends AbstractEntityMapper<MeetingDto, Meeting> {

    @Autowired
    private DateAssembler dateAssembler;
    @Autowired
    private OptionEntityMapper optionEntityMapper;

    @Override
    protected Meeting updateEntity(Meeting entity, MeetingDto dto) {
        entity.setTitle(dto.getTitle());
        entity.setPlace(dto.getPlace());
        entity.setDescription(dto.getDescription());
        entity.setOrganizerName(dto.getOrganizerName());
        entity.setOrganizerEmail(dto.getOrganizerEmail());
        entity.setVoteAnonymous(dto.isVoteAnonymous());
        entity.setMailMandatory(dto.isMailMandatory());
        entity.setMaybeable(dto.isMaybeable());
        entity.setClosed(dto.isClosed());
        entity.setCreatedAt(dateAssembler.assemble(dto.getCreatedAt()));
        entity.setClosedAt(dateAssembler.assemble(dto.getClosedAt()));
        List<Option> options = Lists.newArrayList();
        dto.getOptions().forEach(optionDto -> {
            options.add(optionEntityMapper.assemble(optionDto));
        });
        entity.setOptions(options);
        return entity;
    }

    @Override
    protected void afterInserting(Meeting entity, MeetingDto dto) {
        entity.getOptions().forEach(option -> option.setMeeting(entity));
    }
}

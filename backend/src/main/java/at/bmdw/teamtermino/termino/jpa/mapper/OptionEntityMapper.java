package at.bmdw.teamtermino.termino.jpa.mapper;

import at.bmdw.teamtermino.termino.assembler.DateAssembler;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class OptionEntityMapper extends AbstractEntityMapper<OptionDto, Option> {

    @Autowired
    private DateAssembler dateAssembler;
    @Autowired
    private MeetingRepository meetingRepository;

    @Override
    protected Option updateEntity(Option entity, OptionDto dto) {
        if (StringUtils.isNoneBlank(dto.getMeetingId())) {
            entity.setMeeting(meetingRepository.getById(UUID.fromString(dto.getMeetingId())));
        }
        entity.setStartDate(dto.getStartDate());
        entity.setEndDate(dto.getEndDate());
        return entity;
    }
}

package at.bmdw.teamtermino.termino.assembler;

import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.entity.Meeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class MeetingAssembler extends AbstractAssembler<Meeting, MeetingDto>{

@Autowired
private OptionAssembler optionAssembler;
    @Override
    public MeetingDto assemble(Meeting source) {
        return MeetingDto
                .builder()
                .id(source.getId().toString())
                .title(source.getTitle())
                .place(source.getPlace())
                .description(source.getDescription())
                .organizerName(source.getOrganizerName())
                .organizerEmail(source.getOrganizerEmail())
                .isVoteAnonymous(source.isVoteAnonymous())
                .isMailMandatory(source.isMailMandatory())
                .isMaybeable(source.isMaybeable())
                .isClosed(source.isClosed())
                .createdAt(source.getCreatedAt()== null ? "" : source.getCreatedAt().toString())
                .closedAt(source.getClosedAt() == null ? "" : source.getClosedAt().toString())
                .options(optionAssembler.assemble(source.getOptions()))
                .build();
    }

    @Override
    protected List<MeetingDto> applySort(List<MeetingDto> list) {
        return list.stream()
                .sorted(Comparator.comparing(MeetingDto::getTitle))
                .collect(Collectors.toList());
    }
}

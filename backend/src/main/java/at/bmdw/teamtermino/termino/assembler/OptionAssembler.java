package at.bmdw.teamtermino.termino.assembler;

import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.entity.Option;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class OptionAssembler extends AbstractAssembler<Option, OptionDto>{

    @Autowired
    private VoteAssembler voteAssembler;

    @Override
    public OptionDto assemble(Option source) {
        return OptionDto
                .builder()
                .id(source.getId().toString())
                .meetingId(source.getMeeting().getId().toString())
                .startDate(source.getStartDate())
                .endDate(source.getEndDate())
                .voteDtos(voteAssembler.assemble(source.getVotes()))
                .build();
    }

    @Override
    protected List<OptionDto> applySort(List<OptionDto> list) {
        return list.stream()
                .sorted(Comparator.comparing(OptionDto::getStartDate))
                .collect(Collectors.toList());
    }
}

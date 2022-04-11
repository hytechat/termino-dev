package at.bmdw.teamtermino.termino.assembler;

import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.entity.Vote;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;

@Component
public class VoteAssembler extends AbstractAssembler<Vote, VoteDto> {


    @Override
    public VoteDto assemble(Vote source) {
        return VoteDto
                .builder()
                .id(source.getId().toString())
                .optionId(source.getOption().getId().toString())
                .choice(source.getChoice().toString())
                .participantName(source.getParticipantName())
                .participantEmail(source.getParticipantEmail())
                .build();
    }


}

package at.bmdw.teamtermino.termino.jpa.mapper;

import at.bmdw.teamtermino.termino.assembler.ChoiceAssembler;
import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.entity.Vote;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class VoteEntityMapper extends AbstractEntityMapper<VoteDto, Vote> {

    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private ChoiceAssembler choiceAssembler;

    @Override
    protected Vote updateEntity(Vote entity, VoteDto dto) {
        if (StringUtils.isNoneBlank(dto.getOptionId())) {
            entity.setOption(optionRepository.getById(UUID.fromString(dto.getOptionId())));
        }
        entity.setChoice(choiceAssembler.assemble(dto.getChoice()));
        entity.setParticipantName(dto.getParticipantName());
        entity.setParticipantEmail(dto.getParticipantEmail());
        return entity;
    }
}

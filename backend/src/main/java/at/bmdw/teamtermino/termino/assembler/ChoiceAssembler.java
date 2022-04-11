package at.bmdw.teamtermino.termino.assembler;

import at.bmdw.teamtermino.termino.entity.Choice;
import org.springframework.stereotype.Component;

@Component
public class ChoiceAssembler extends AbstractAssembler<String, Choice> {

    @Override
    public Choice assemble(String source) {
        if (source == null) {
            return null;
        }
        return Choice.valueOf(source);
    }
}

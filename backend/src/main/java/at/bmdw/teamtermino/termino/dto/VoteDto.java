package at.bmdw.teamtermino.termino.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public class VoteDto extends AbstractDto {

    private String optionId;
    private String choice;
    private String participantName;
    private String participantEmail;


}

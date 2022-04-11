package at.bmdw.teamtermino.termino.dto;

import at.bmdw.teamtermino.termino.entity.Meeting;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Data
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public class OptionDto extends AbstractDto {

    private String meetingId;
    private Date startDate;
    private Date endDate;
    @JsonIgnore
    private List<VoteDto> voteDtos;


}

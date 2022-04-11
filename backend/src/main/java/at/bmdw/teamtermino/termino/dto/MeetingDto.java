package at.bmdw.teamtermino.termino.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.common.collect.Lists;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class MeetingDto extends AbstractDto {

    private String title;
    private String place;
    private String description;
    private String organizerName;
    private String organizerEmail;
    @JsonProperty("isVoteAnonymous")
    private boolean isVoteAnonymous;
    @JsonProperty("isMailMandatory")
    private boolean isMailMandatory;
    @JsonProperty("isMaybeable")
    private boolean isMaybeable;
    @JsonProperty("isClosed")
    private boolean isClosed;
    private String createdAt;
    private String closedAt;

    private List<OptionDto> options = Lists.newArrayList();

}

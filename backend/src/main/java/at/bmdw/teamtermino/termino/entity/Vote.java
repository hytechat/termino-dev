package at.bmdw.teamtermino.termino.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;

@Entity
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class Vote extends  AbstractEntity{


    @ManyToOne
    @JoinColumn(name = "FK_MEETING_DATE")
    private Option option;

    private Choice choice;

    @ManyToOne
    @JoinColumn(name = "FK_USER")
    private User user;
    @Column(name = "PARTICIPANT_NAME")
    private String participantName;
    @Column(name = "PARTICIPANT_EMAIL")
    private String participantEmail;

}

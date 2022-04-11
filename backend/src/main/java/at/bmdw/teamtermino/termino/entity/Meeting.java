package at.bmdw.teamtermino.termino.entity;

import com.google.common.collect.Lists;
import lombok.*;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@SuperBuilder
public class Meeting extends AbstractEntity {



    @ManyToOne
    @JoinColumn(name = "FK_PERSON")
    private User organizer;
    @Column(name = "ORGANIZER_NAME")
    private String organizerName;
    @Column(name = "ORGANIZER_EMAIL")
    private String organizerEmail;

    @OneToOne
    @JoinColumn(name = "FK_FIXED_MEETING_DATE")
    private Option option;

    @NonNull
    private String title;

    private String place;
    @Column(name = "MEETING_DESCRIPTION")
    private String description;

    private boolean isVoteAnonymous;
    private boolean isMailMandatory;
    private boolean isMaybeable;

    private boolean isClosed;

    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "CLOSED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date closedAt;

    @OneToMany(mappedBy = "meeting", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Option> options = Lists.newArrayList();


}

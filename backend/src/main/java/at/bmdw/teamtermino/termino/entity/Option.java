package at.bmdw.teamtermino.termino.entity;

import com.google.common.collect.Lists;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Option extends  AbstractEntity{


    @ManyToOne
    @JoinColumn(name = "FK_MEETING")
    private Meeting meeting;

    @NonNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;

    @NonNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    @OneToMany(mappedBy = "option", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Vote> votes = Lists.newArrayList();

}

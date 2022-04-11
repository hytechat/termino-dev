package at.bmdw.teamtermino.termino.entity;

import lombok.*;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@SuperBuilder
@Table(name = "PERSON")
public class User extends AbstractEntity{


    private String name;

    @NonNull
    private String email;

    @NonNull
    private String pw;

}

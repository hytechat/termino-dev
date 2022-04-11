package at.bmdw.teamtermino.termino.jpa;

import at.bmdw.teamtermino.termino.entity.Option;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;


public interface OptionRepository extends JpaRepository <Option, UUID> {

}

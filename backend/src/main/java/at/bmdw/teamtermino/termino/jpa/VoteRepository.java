package at.bmdw.teamtermino.termino.jpa;

import at.bmdw.teamtermino.termino.entity.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface VoteRepository extends JpaRepository <Vote, UUID>{

}

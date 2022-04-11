package at.bmdw.teamtermino.termino.jpa;

import at.bmdw.teamtermino.termino.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {




}

package at.bmdw.teamtermino.termino.mapper;

import at.bmdw.teamtermino.termino.dto.VoteDto;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class VoteMapperTest {

    @Test
    public void testCreateVoteEntity() {

        VoteDto voteDto = VoteDto.builder()
                .choice("YES")
                .participantName("Mr.Potato")
                .participantEmail("pot@to.com")
                .build();
    }
}

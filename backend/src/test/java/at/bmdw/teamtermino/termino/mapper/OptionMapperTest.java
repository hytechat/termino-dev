package at.bmdw.teamtermino.termino.mapper;


import at.bmdw.teamtermino.termino.TestDates;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class OptionMapperTest {

    private TestDates testDates;

    @Autowired
    OptionRepository optionRepository;

    @Test
    public void testCreateOptionEntity()  {
        OptionDto optionDto = OptionDto.builder()
//                .startDate(TestDates.MONDAY_8.asString())
//                .endDate(TestDates.FRIDAY_11.asString())
                .build();
    }

}

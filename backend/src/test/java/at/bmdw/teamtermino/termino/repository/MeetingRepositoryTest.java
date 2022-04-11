package at.bmdw.teamtermino.termino.repository;

import at.bmdw.teamtermino.termino.TestDates;
import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import com.google.common.collect.Lists;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SpringBootTest
@Transactional
public class MeetingRepositoryTest {

    @Autowired
    private MeetingRepository meetingRepository;
    @Autowired
    private OptionRepository optionRepository;

    @Test
    public void testCreateMeetingEntity() {
        List<Option> options = Lists.newArrayList(Option.builder()
                        .startDate(TestDates.MONDAY_8.asDate())
                        .endDate(TestDates.MONDAY_10.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.WEDNESDAY_13.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.FRIDAY_9.asDate())
                        .endDate(TestDates.FRIDAY_11.asDate())
                        .build()
        );
        options.forEach(optionRepository::save);
        Meeting meeting = Meeting.builder()
                .title("Coding-Session")
                .description("Model")
                .options(options)
                .build();

        meetingRepository.save(meeting);

    }


}

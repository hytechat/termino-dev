package at.bmdw.teamtermino.termino;

import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import at.bmdw.teamtermino.termino.service.MeetingService;
import com.google.common.collect.Lists;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.List;

@SpringBootTest
@Transactional
public class TestMockData {

    @Autowired
    private MeetingService meetingService;
    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private MeetingRepository meetingRepository;

    @Test
    //@BeforeEach
    public void mockDataDance() {

        List<Option> options1 = Lists.newArrayList(
                Option.builder()
                        .startDate(TestDates.MONDAY_8.asDate())
                        .endDate(TestDates.WEDNESDAY_13.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.MONDAY_8.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.WEDNESDAY_13.asDate())
                        .endDate(TestDates.FRIDAY_16.asDate())
                        .build()
        );
        Meeting meeting1 = Meeting.builder()
                .title("Coding-Session")
                .description("Model")
                .options(options1)
                .build();

        meetingRepository.save(meeting1);
        options1.forEach(option -> option.setMeeting(meeting1));
        options1.forEach(optionRepository::save);

        List<Option> options2 = Lists.newArrayList(
                Option.builder()
                        .startDate(TestDates.FRIDAY_9.asDate())
                        .endDate(TestDates.FRIDAY_11.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.MONDAY_8.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.WEDNESDAY_13.asDate())
                        .endDate(TestDates.FRIDAY_16.asDate())
                        .build()
        );
        Meeting meeting2 = Meeting.builder()
                .title("Therapy Session")
                .description("share your depression")
                .options(options2)
                .build();
        meetingRepository.save(meeting2);
        options2.forEach(option -> option.setMeeting(meeting2));
        options2.forEach(optionRepository::save);

        List<Option> options3 = Lists.newArrayList(
                Option.builder()
                        .startDate(TestDates.MONDAY_15.asDate())
                        .endDate(TestDates.FRIDAY_11.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.MONDAY_8.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate())
                        .build(),
                Option.builder()
                        .startDate(TestDates.FRIDAY_9.asDate())
                        .endDate(TestDates.MONDAY_10.asDate())
                        .build()
        );
        Meeting meeting3 = Meeting.builder()
                .title("Sit at home")
                .description("ready for another exciting day at home")
                .options(options3)
                .build();
        meetingRepository.save(meeting3);
        options3.forEach(option -> option.setMeeting(meeting3));
        options3.forEach(optionRepository::save);

        meetingRepository.findByTitle("Sit at home");
    }


    public enum TestDates {
        MONDAY_8, MONDAY_10, MONDAY_15, MONDAY_16, WEDNESDAY_13, WEDNESDAY_14, FRIDAY_9, FRIDAY_11, FRIDAY_16, FRIDAY_17;

        static DateFormat df = new SimpleDateFormat("dd.MM.yyyy");

        public Date asDate() {
            String s = name();
            String day = s.substring(0, s.indexOf("_"));
            String hour = s.substring(s.indexOf("_") + 1);
            LocalDateTime ldt = LocalDate.now().with(TemporalAdjusters.next(DayOfWeek.valueOf(day))).atTime(Integer.parseInt(hour), 0);
            return Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
        }

        public String asString() {
            return df.format(asDate());
        }
    }
}



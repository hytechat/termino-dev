package at.bmdw.teamtermino.termino.service;

import at.bmdw.teamtermino.termino.TestDates;
import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import com.google.common.collect.Lists;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

import static org.hamcrest.MatcherAssert.*;

@SpringBootTest
@Transactional
public class MeetingServiceTest {

    @Autowired
    private MeetingService meetingService;
    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private MeetingRepository meetingRepository;

    @BeforeEach
    @Test
    public void createMockMeetingsAndOptions() {
        List<Option> options1 = Lists.newArrayList(
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
        options1.forEach(optionRepository::save);
        Meeting meeting1 = Meeting.builder()
                .title("Coding-Session")
                .description("Model")
                .options(options1)
                .build();
        meetingRepository.save(meeting1);

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
        options2.forEach(optionRepository::save);
        Meeting meeting2 = Meeting.builder()
                .title("Therapy Session")
                .description("share your depression")
                .options(options2)
                .build();
        meetingRepository.save(meeting2);

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
        options3.forEach(optionRepository::save);
        Meeting meeting3 = Meeting.builder()
                .title("Sit at home")
                .description("ready for another exciting day at home")
                .options(options3)
                .build();
        meetingRepository.save(meeting3);

        System.out.println(meeting1.toString()+ "\n" +
                meeting2.toString()+ "\n" +
                meeting3.toString());
    }



    @Test
    public void testCreateMeetingPoll() {
        List<OptionDto> options = Lists.newArrayList(
                OptionDto.builder().startDate(TestDates.WEDNESDAY_13.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate()).build(),
                OptionDto.builder().startDate(TestDates.FRIDAY_9.asDate())
                        .endDate(TestDates.FRIDAY_11.asDate()).build()
        );
        MeetingDto meeting = MeetingDto.builder().title("testmeeting").options(options).build();
        meetingService.saveMeetingPoll(meeting);

        List<Meeting> meetingEntityList = meetingRepository.findByTitle("testmeeting");


        assertThat("meetingEntityList.size() == 1", meetingEntityList.size() == 1);
        Meeting meetingEntity = meetingEntityList.get(0);
        assertThat("options size should be 2", meetingEntity.getOptions().size() == 2);
        assertThat("", Objects.equals(meetingEntity.getOptions().get(0).getStartDate(), TestDates.WEDNESDAY_13.asDate()));
        assertThat("", Objects.equals(meetingEntity.getOptions().get(0).getEndDate(), TestDates.WEDNESDAY_14.asDate()));
        assertThat("", Objects.equals(meetingEntity.getOptions().get(1).getStartDate(), TestDates.FRIDAY_9.asDate()));
        assertThat("", Objects.equals(meetingEntity.getOptions().get(1).getEndDate(), TestDates.FRIDAY_11.asDate()));
    }


    @Test
    public void testSaveVote() {

        List<OptionDto> options = Lists.newArrayList(
                OptionDto.builder().startDate(TestDates.WEDNESDAY_13.asDate())
                        .endDate(TestDates.WEDNESDAY_14.asDate()).build(),
                OptionDto.builder().startDate(TestDates.FRIDAY_9.asDate())
                        .endDate(TestDates.FRIDAY_11.asDate()).build()
        );
        MeetingDto meeting = MeetingDto.builder().title("testmeeting").options(options).build();

        meetingService.saveMeetingPoll(meeting);

        VoteDto voteDto = VoteDto.builder()
                .optionId("1")
                .choice("YES")
                .participantName("Mr.Potato")
                .participantEmail("pot@to.com")
                .build();

        meetingService.saveVote(voteDto);

        List<Meeting> meetingEntityList = meetingRepository.findByTitle("testmeeting");
        Meeting meetingEntity = meetingEntityList.get(0);
        meetingEntity.getOptions().forEach(System.out::println);
        meetingEntity.getOptions().get(0).getVotes().forEach(System.out::println);
    }
}

package at.bmdw.teamtermino.termino.mapper;

import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import at.bmdw.teamtermino.termino.jpa.mapper.MeetingEntityMapper;
import at.bmdw.teamtermino.termino.service.MeetingService;
import com.google.common.collect.Lists;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@SpringBootTest
@Transactional
public class MeetingMapperTest {

    @Autowired
    private MeetingRepository meetingRepository;
    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private MeetingEntityMapper meetingEntityMapper;
    @Autowired
    private MeetingService meetingService;

 //   @BeforeEach
    public void testCreateMeetingEntity() {

        MeetingDto meetingDto = MeetingDto.builder()
                .title("Coding Session")
                .build();
        List<OptionDto> options = Lists.newArrayList();
        meetingService.saveMeetingPoll(meetingDto);


    }

    @Test
    public void testNewMeeting() {
        MeetingDto meetingDto = MeetingDto.builder()
                .title("Coding Session 2")
                .build();
        List<OptionDto> options = Lists.newArrayList();
        meetingService.saveMeetingPoll(meetingDto);

        System.out.println(meetingRepository.findAll().size());
        meetingRepository.findAll().forEach(System.out::println);

    }
    @Test
    public void testUpdateMeeting() {
        meetingRepository.findAll().forEach(System.out::println);

        UUID meetingId = meetingRepository.findByTitle("Coding Session").get(0).getId();
        MeetingDto meetingDto = meetingService.getMeetingById(meetingId);
        meetingDto.setTitle("After Work Beer");
        List<OptionDto> options = Lists.newArrayList();
        meetingService.saveMeetingPoll(meetingDto);

        System.out.println(meetingRepository.findAll().size());
        meetingRepository.findAll().forEach(System.out::println);
    }



}

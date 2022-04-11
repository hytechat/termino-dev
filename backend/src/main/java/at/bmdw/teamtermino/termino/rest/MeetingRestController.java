package at.bmdw.teamtermino.termino.rest;

import at.bmdw.teamtermino.termino.MockData;
import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.service.MeetingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;

@RestController
@Slf4j
@CrossOrigin(origins = "*")
@RequestMapping(value = "meetings")
public class MeetingRestController {

    @Autowired
    private MeetingService meetingService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public MeetingDto saveMeeting(@RequestBody MeetingDto meetingDto) {
        log.info("saving " + meetingDto);
        meetingService.saveMeetingPoll(meetingDto);
        return meetingDto;
    }

    @GetMapping
    @ResponseStatus(HttpStatus.CREATED)
    public  MeetingDto getMeetingById(@RequestParam("id") String id) {
        log.info("searching for meeting with id: " + id);
        return meetingService.getMeetingById(UUID.fromString(id));
    }

}

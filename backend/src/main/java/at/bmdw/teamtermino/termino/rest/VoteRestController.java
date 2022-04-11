package at.bmdw.teamtermino.termino.rest;

import at.bmdw.teamtermino.termino.MockData;
import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.service.MeetingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@CrossOrigin(value = "*")
@RequestMapping(value = "votes")
public class VoteRestController {

    @Autowired
    private MeetingService meetingService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public VoteDto saveVote(@RequestBody VoteDto voteDto) {
        log.info("saving " + voteDto);
        meetingService.saveVote(voteDto);
        return voteDto ;
    }
}

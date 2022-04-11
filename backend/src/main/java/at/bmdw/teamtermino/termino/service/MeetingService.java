package at.bmdw.teamtermino.termino.service;

import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.entity.Vote;

import java.util.Collection;
import java.util.UUID;

public interface MeetingService {

    void saveMeetingPoll(MeetingDto meetingDto);

    MeetingDto getMeetingById(UUID id);

    void saveVote(VoteDto voteDto);



}

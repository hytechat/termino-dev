package at.bmdw.teamtermino.termino.service;

import at.bmdw.teamtermino.termino.assembler.*;
import at.bmdw.teamtermino.termino.dto.MeetingDto;
import at.bmdw.teamtermino.termino.dto.OptionDto;
import at.bmdw.teamtermino.termino.dto.VoteDto;
import at.bmdw.teamtermino.termino.entity.Meeting;
import at.bmdw.teamtermino.termino.entity.Option;
import at.bmdw.teamtermino.termino.entity.Vote;
import at.bmdw.teamtermino.termino.jpa.MeetingRepository;
import at.bmdw.teamtermino.termino.jpa.OptionRepository;
import at.bmdw.teamtermino.termino.jpa.VoteRepository;
import at.bmdw.teamtermino.termino.jpa.mapper.MeetingEntityMapper;
import at.bmdw.teamtermino.termino.jpa.mapper.VoteEntityMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Service
@Slf4j
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    private MeetingRepository meetingRepository;

    @Autowired
    private MeetingAssembler meetingAssembler;

    @Autowired
    private VoteEntityMapper voteEntityMapper;
    @Autowired
    private MeetingEntityMapper meetingEntityMapper;

    @Override
    public void saveMeetingPoll(MeetingDto meetingDto) {
        meetingEntityMapper.assemble(meetingDto);
    }

    @Override
    public MeetingDto getMeetingById(UUID id) {
        return meetingAssembler.assemble(meetingRepository.getById(id));
    }

    @Override
    public void saveVote(VoteDto voteDto) {
        voteEntityMapper.assemble(voteDto);
    }

}

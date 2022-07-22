package com.project.donate_prj.service;

import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.repository.DonateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DonateService {

    private final DonateMapper mapper;

    public boolean saveService(DonateBoard board) {
        return mapper.save(board);
    }

    public List<DonateBoard> findAllService(DonateBoard board) {
        return mapper.findAll();
    }

    public boolean removeService(Long boardNo) {
        return mapper.remove(boardNo);
    }

    public DonateBoard findOneService(Long boardNo) {
        return mapper.findOne(boardNo);
    }

    public boolean modifyService(DonateBoard board) {
        return mapper.modify(board);
    }
}

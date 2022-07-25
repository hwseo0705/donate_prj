package com.project.donate_prj.service;

import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.repository.DonateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DonateService {

    private final DonateMapper mapper;

    public boolean saveService(DonateBoard board) {
        return mapper.save(board);
    }

    public Map<String, Object> findAllService(Search search) {

        List<DonateBoard> DBList = mapper.findAll(search);
        Long totalCnt = mapper.getTotalCnt(search);

        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);

        return map;
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

    public void upLikeService(Long boardNo) { mapper.upLikeCnt(boardNo); }

    public void upCashService(Long userId, Long money) {
        mapper.upCash(userId, money);
    }
}

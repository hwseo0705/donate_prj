package com.project.donate_prj.service;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.repository.DonateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DonateService {

    private final DonateMapper mapper;


    @Transactional
    public boolean saveService(DonateBoard board) {
        boolean flag = mapper.save(board);

        List<String> thumbnailFileNames = board.getThumbnailFileList();

        for (String file : thumbnailFileNames) {
            mapper.addFile(file);
        }

        return flag;
    }

    public Map<String, Object> findAllWrite(String writer, Page page) {

        List<DonateBoard> DBList = mapper.findAllWrite(writer, page);
        Long totalCnt = mapper.getMyTotalCnt(writer);

        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
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
        DonateBoard board = mapper.findOne(boardNo);

        List<String> files = mapper.findFiles(boardNo);

        board.setThumbnailFileList(files);

        return board;
    }

    public boolean modifyService(DonateBoard board) {
        return mapper.modify(board);
    }

    public void upLikeService(Long boardNo) {
        mapper.upLikeCnt(boardNo);
    }

    // 플러스 해주는 서비스
    public void plusDonationService(long boardNo, long currentMoney) {

        mapper.plusDonation(boardNo, currentMoney);
    }


//    public void upCashService(Long userId, Long money) {
//        mapper.upCash(userId, money);
//    }
}

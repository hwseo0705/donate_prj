package com.project.donate_prj.krdjk.repository;

import com.project.donate_prj.krdjk.domain.DonateBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class DonateMapperTest {

    @Autowired
    DonateMapper mapper;


    @Test
    @DisplayName("등록된 모금 글이 전부 조회되어야 한다")
    void findAllTest() {
        mapper.findAll().forEach(System.out::println);
    }

    @Test
    @DisplayName("특정 게시물 번호를 입력하면 해당하는 모금 글이 조회되어야 한다.")
    void findOneTest() {
        DonateBoard board = mapper.findOne(3);
        System.out.println("board = " + board);
    }

    @Test
    @DisplayName("등록된 모금 글이 총 몇개인지를 알려줘야 한다")
    void getTotalCntTest() {
        int totalCnt = mapper.getTotalCnt();

        assertTrue(totalCnt == 3);
    }

    @Test
    @DisplayName("특정 번호를 주면 해당 모금 글의 like_cnt가 올라가야 한다.")
    void upLikeCntTest() {
        mapper.upLikeCnt(2);

        DonateBoard board = mapper.findOne(2);

        assertTrue(board.getLikeCnt() == 1);
    }
}
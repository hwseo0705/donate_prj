package com.project.donate_prj.repository;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;

import java.text.ParseException;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class DonateMapperTest {

    @Autowired
    DonateMapper mapper;


    @Test
    @DisplayName("등록된 모금 글이 전부 조회되어야 한다")
    void findAllTest() {
        mapper.findAll(new Search()).forEach(System.out::println);
    }

    @Test
    @DisplayName("특정 게시물 번호를 입력하면 해당하는 모금 글이 조회되어야 한다.")
    void findOneTest() {
        DonateBoard board = mapper.findOne(3L);
        System.out.println("board = " + board);
    }

    @Test
    @DisplayName("등록된 모금 글이 총 몇개인지를 알려줘야 한다")
    void getTotalCntTest() {
        Search search = new Search();
        //search.setType("title");
        search.setKeyword("donation");
        Long totalCnt = mapper.getTotalCnt(search);

        assertTrue(totalCnt == 3);
    }

    @Test
    @DisplayName("특정 번호를 주면 해당 모금 글의 like_cnt가 올라가야 한다.")
    void upLikeCntTest() {
        mapper.upLikeCnt(2L);

        DonateBoard board = mapper.findOne(2L);

        assertTrue(board.getLikeCnt() == 1);
    }

    @Test
    @DisplayName("20개의 게시물을 삽입해야 한다.")
    void bulkInsert() throws ParseException {
        DonateBoard donate;
        for (int i = 1; i <= 20; i++) {
            donate = new DonateBoard();
            donate.setTitle("제목" + i);
            donate.setWriter("글쓴이" + i);
            donate.setThumbnail("/img/example" + i);
            donate.setContent("내용입니다~~" + i);
            donate.setTargetMoney((long) (i * 10000000));
            donate.setStartDate("22-07-01");
            donate.setEndDate("22-08-17");
            mapper.save(donate);
        }
    }

    @Test
    @DisplayName("특정 게시물을 삭제하고 해당 글이 조회되지 않아야 한다.")
    void removeTest() {
        boolean remove = mapper.remove(17L);
        assertTrue(remove);
        assertThrows(DataAccessException.class, () -> mapper.findOne(17L));
    }

    @Test
    @DisplayName("특정 게시물을 수정하고 해당 글을 조회했을 때 수정된 제목이 일치해야 한다.")
    void modifyTest() {
        // given
        DonateBoard donate = new DonateBoard();
        donate.setBoardNo(4L);
        donate.setTitle("제목1");
        donate.setWriter("글쓴이 수정");
        donate.setThumbnail("/img/example1");
        donate.setContent("수정 내용");
        donate.setTargetMoney(2000000L);
        donate.setStartDate("22-07-04");
        donate.setEndDate("22-08-20");
        mapper.save(donate);

        // when
        boolean modify = mapper.modify(donate);
        DonateBoard board = mapper.findOne(donate.getBoardNo());

        // then
        assertTrue(modify);
        assertEquals("글쓴이 수정", board.getWriter());
    }
}
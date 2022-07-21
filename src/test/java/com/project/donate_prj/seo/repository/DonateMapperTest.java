package com.project.donate_prj.seo.repository;

import com.project.donate_prj.seo.domain.Donate;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class DonateMapperTest {

    @Autowired
    DonateMapper mapper;

    @Test
    @DisplayName("20개의 게시물을 삽입해야 한다.")
    void bulkInsert() throws ParseException {
        Donate donate;
        for (int i = 1; i <= 20; i++) {
            donate = new Donate();
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
        boolean remove = mapper.remove(15L);
        assertTrue(remove);
        assertThrows(DataAccessException.class, () -> mapper.findOne(15L));
    }

    @Test
    @DisplayName("특정 게시물을 수정하고 해당 글을 조회했을 때 수정된 제목이 일치해야 한다.")
    void modifyTest() {
        // given
        Donate donate = new Donate();
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
        Donate board = mapper.findOne(donate.getBoardNo());

        // then
        assertTrue(modify);
        assertEquals("글쓴이 수정", board.getWriter());
    }

}
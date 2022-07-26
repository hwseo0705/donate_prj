package com.project.donate_prj.repository;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.domain.QnaBoard;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
@SpringBootTest
class QnaMapperTest {

    @Autowired
    QnaMapper mapper;

    @Test
    @DisplayName("일단 조회 ")
    void findOneTest() {
        QnaBoard one = mapper.findOne(3);
        System.out.println(one);
    }

    @Test
    @DisplayName("모두 불러오기 ")
    void findAllTest() {

    }

    @Test
    @DisplayName("save test ")
    void saveTest() {
        boolean save = mapper.save("a3", "안녕하세요 모금좀");
        assertTrue(save);
    }

    @Test
    @DisplayName("delete test")
    void removeTest() {
        boolean remove = mapper.remove(6);
        assertTrue(remove);

    }

    @Test
    @DisplayName("modify")
    void modifyTest() {
        boolean s = mapper.modify(2, "음하하하하핳하하");
        assertTrue(s);
    }


    @Test
    @DisplayName("게시물 수 새는 test")
    void qnaTotalCntTest() {
        long l = mapper.qnaTotalCnt();
        System.out.println(l);
    }


}
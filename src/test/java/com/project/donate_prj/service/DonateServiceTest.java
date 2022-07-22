package com.project.donate_prj.service;

import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.service.LoginService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@Log4j2
class DonateServiceTest {

    @Autowired
    LoginService service;


    @Test
    @DisplayName("아이디가 있냐 없냐 알아보는 메서드 ") // 통과
    void findIdTest(){

        boolean flag = service.findIdService("a10");
        System.out.println(flag);// true , false 값이 나옴
        assertTrue(flag);

    }

    @Test
    @DisplayName(" 비밀번호 찾기 ")
    void findPasswordServiceTest(){
        String pw = service.findPasswordService("a8");

        System.out.println(pw);
//        log.info("pw - {} ",pw);

    }

    @Test
    @DisplayName(" 저장 잘 되는지 확인 ")
    void saveServiceTest(){
//        DonateUser d = new DonateUser("a1","22","12","qwe",1000);
//        int i = service.saveService(d);
//        assertEquals(1 ,i);  이 경우 성공함
                DonateUser d = new DonateUser("b3","22","12","qwe",1000);
        int i = service.saveService(d);
        assertEquals(2 ,i); // 이것도 성공함
    }







}
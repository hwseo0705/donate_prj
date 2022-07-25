package com.project.donate_prj.service;

import com.project.donate_prj.domain.DonateUser;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class LoginServiceTest {

    @Autowired
    LoginService loginService;



    @Test
    @DisplayName("아이디가 있냐 없냐 알아보는 메서드 ") // 통과
    void findIdServiceTest(){

//        boolean flag = loginService.findIdService("a10");
//        System.out.println(flag);// true , false 값이 나옴
//        assertTrue(flag);
        boolean flag = loginService.findIdService("ㄲㄱ");
        System.out.println(flag);// true , false 값이 나옴
        assertTrue(flag);


    }

    @Test
    @DisplayName(" 비밀번호 찾기 ")
    void findPasswordServiceTest(){
        String pw = loginService.findPasswordService("a8");

        System.out.println(pw);
//        log.info("pw - {} ",pw);

    }


    @Test
    @DisplayName("a1 돈 찾는 서비스 ")
    void findMoneyServiceTest(){
        long a1 = loginService.findMoneyService("a1");
        System.out.println(a1);
    }
    @Test
    @DisplayName("a1 이 가진 돈 보다 많이 넣으면 false , ")
    void minusMoneyServiceTest(){
        long a1 = loginService.findMoneyService("a1");
        System.out.println(a1);
        loginService.minusMoneyService("a1",9954);
        // 정상작동

    }


}
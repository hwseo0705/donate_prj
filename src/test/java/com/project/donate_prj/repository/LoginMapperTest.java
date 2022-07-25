package com.project.donate_prj.repository;

import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.repository.LoginMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
@SpringBootTest
class LoginMapperTest {

    @Autowired
    LoginMapper donateMapper;

    @Test
    @DisplayName("잘 들어갔는지 확인 ")
    void saveTest() {
        DonateUser donateUser = new DonateUser();
//        VALUES( #{userId}, #{password}, #{name}, #{email}, {money});
        for (int i = 5; i < 11; i++) {
            donateUser.setUserId("a"+i);
            donateUser.setPassword("b"+i);
            donateUser.setName("고구마"+i);
            donateUser.setEmail("email"+i+"@naver.com");
            donateUser.setMoney(50000+i);
//            donateMapper.save(donateUser);
        }
    }

    @Test
    @DisplayName("모두 출력되는지 확인 ")
    void findAllTest(){
        List<DonateUser> all = donateMapper.findAll();
        for (DonateUser du : all) {
            System.out.println(du);
        }
    }

    @Test
    @DisplayName("a1 이라는 아이디를 가진 사람 찾기 ")
    void findOneTest(){
        DonateUser a8 = donateMapper.findOne("a8");
        System.out.println("a8 = " + a8);
//        assertEquals("b1",a1.getPassword());
    }

    @Test
    @DisplayName("a3 아이디를 가진 사람이 지워짐 ")
    void removeTest(){
        boolean remove = donateMapper.remove("a3");
        assertTrue(remove);
    }

    @Test
    @DisplayName("수정 하기 ")
    void modifyTest(){
//        UPDATE donate_user
//        SET password=#{password}, name=#{name} , email=#{email}
//        WHERE user_id=#{userId}

        DonateUser a8 = donateMapper.findOne("a8");
        a8.setPassword("1234");
        a8.setName("홍길동");
        a8.setEmail("abc123@naver.com");
       donateMapper.modify(a8);

    }

    @Test
    @DisplayName("아이디가 있으면 1 로 리턴 / 없으면 0 으로 리턴") // 통과
    void findIdTest(){
        int a8 = donateMapper.findId("a8");
        System.out.println(a8);
    }


    @Test
    @DisplayName("a4에 돈 20000원 넣기 결과는 70000만원") // 통과
    boolean plusMoneyTest(){
        boolean a4 = donateMapper.plusMoney("a4", 20000);
//
//        DonateUser a4 = donateMapper.findOne("a4");
//        assertTrue(a4.getMoney()==70000);
    return a4;
    }

    @Test
    @DisplayName(" a1 돈 찾기 ")
    void  findMoney(){
        long a1 = donateMapper.findMoney("a1");
        System.out.println(a1);
    }

    @Test
    @DisplayName(" a1이 가진 금액 만큼 넣으면, 안넣으면  테스트 ")
    void minusMoneyTest(){
        donateMapper.minusMoney("a1",50500);
    }


}
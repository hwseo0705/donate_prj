package com.project.donate_prj.repository;

import com.project.donate_prj.domain.DonateUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LoginMapper {

    // 회원가입 기능
    boolean save(String userId, String password , String name, String email);

    // 회원 전체 조회
    List<DonateUser> findAll();

    // 아이디 찾기 아이갯수가 0 이면  false , 1이면  true
    int findId(String userId);

    // 비밀번호 찾기 비밀번호가 맞는지 안맞는지 확인하는 메서드
    String findPassword(String userId);

    // 회원 한명 조회
    DonateUser findOne(String userId);

    // 아이디 삭제
    boolean remove(String userId);

    // 개인정보 수정
    boolean modify(DonateUser donateUser);

    // 돈 증가
    boolean plusMoney(String userId , long money);


    // 기부하는 메서드
    // 1. 내가 가진 금액 찾기
    long findMoney(String useId);

    // 2. 내가 가진 금액에서 - 기부하기
    // 마이너스
    void minusMoney(@Param("userId") String userId , @Param("money") long money);





    void upLikeCnt(Long boardNo);

    int isLike(Long boardNo, String userId);

    void likeCheck(Long boardNo, String userId);

    void upCash(String userId, Long money);

}

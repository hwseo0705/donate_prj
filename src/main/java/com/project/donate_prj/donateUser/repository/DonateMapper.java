package com.project.donate_prj.donateUser.repository;

import com.project.donate_prj.donateUser.domain.DonateUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DonateMapper {

    // 회원가입 기능
    boolean save(DonateUser donateUser);

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

    // 돈 마이너스
    boolean minusMoney(String userId , long money);

    // 아이디 찾기
    // 가입한 이메일로 찾기
    // 가입한 이름으로 찾기
    // return 아이디

    // 비밀번호 찾기
    // 아이디 + 가입한 이메일로 찾기
    // 아이디 + 가입한 이름으로 찾기
    // return 비밀번호

//
//    // 전체 게시물 수 조회
//    int getTotalCount();
//
//    // 조회수 상승 처리
//    void upViewCount();



}

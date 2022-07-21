package com.project.donate_prj.krdjk.repository;

import com.project.donate_prj.krdjk.domain.DonateBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DonateMapper {

    // 게시물 전체 조회
    List<DonateBoard> findAll();

    // 게시물 상세 조회
    DonateBoard findOne(int boardNo);

    // 전체 게시물 수 조회 ( 페이징 목적 )
    int getTotalCnt();

    // 응원하기 클릭시 like_cnt 숫자 상승 시켜서 db에 저장할 메서드
    void upLikeCnt(int boardNo);

}

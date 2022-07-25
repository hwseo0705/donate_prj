package com.project.donate_prj.repository;

import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DonateMapper {

    boolean save(DonateBoard donate);

    boolean remove(Long donateNo);

    boolean modify(DonateBoard donate);

    // 기부하면 현재 금액 올라가는 메서드
    void plusDonation(@Param("boardNo")long boardNo, @Param("currentMoney") long currentMoney);



    // 게시물 전체 조회
    List<DonateBoard> findAll(Search search);

    // 게시물 상세 조회
    DonateBoard findOne(Long boardNo);

    // 전체 게시물 수 조회 ( 페이징 목적 )
    Long getTotalCnt(Search search);

    // 응원하기 클릭시 like_cnt 숫자 상승 시켜서 db에 저장할 메서드
    void upLikeCnt(Long boardNo);

//    void upCash(Long userId, Long money);

    // 캐시충전 클릭시 얼마 충전할지 입력하고 보유금액 상승


}

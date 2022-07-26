package com.project.donate_prj.repository;


import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.domain.QnaBoard;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnaMapper {

     // QnA 올리기
    boolean save(String userId ,String content);

    // 게시물 전체 조회
    List<QnaBoard> findAll(Page page);

    // 게시물 하나 조회
     QnaBoard findOne(long qnaNo);

    // 게시물 지우기
    boolean remove(long qnaNo);

    // 게시물 수정
    boolean modify(@Param("qnaNo") long qnaNo,@Param("content") String content);

    long qnaTotalCnt();










}

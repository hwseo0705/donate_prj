package com.project.donate_prj.repository;

import com.project.donate_prj.domain.BoardInfo;
import com.project.donate_prj.domain.DonateInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardInfoMapper {


    boolean save(BoardInfo boardInfo);

    List<BoardInfo> findAll(String userId);
}

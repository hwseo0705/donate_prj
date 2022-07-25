package com.project.donate_prj.repository;

import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.domain.DonateInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DonateInfoMapper {

    boolean save(DonateInfo donateInfo);

    boolean modify(DonateInfo donateInfo);

    List<DonateInfo> findAllDonation(String userId);

}

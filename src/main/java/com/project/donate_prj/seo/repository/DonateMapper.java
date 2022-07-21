package com.project.donate_prj.seo.repository;

import com.project.donate_prj.seo.domain.Donate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DonateMapper {

    boolean save(Donate donate);

    boolean remove(Long donateNo);

    boolean modify(Donate donate);

    List<Donate> findAll();

    Donate findOne(Long donateNo);

    int getTotalCount();

    void upLikeCount(Long donateNo);
}

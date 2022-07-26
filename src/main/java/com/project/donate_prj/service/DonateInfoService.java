package com.project.donate_prj.service;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.domain.DonateInfo;
import com.project.donate_prj.repository.DonateInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DonateInfoService {

    private final DonateInfoMapper mapper;

    public Map<String, Object> findAllDonation(String userId, Page page) {

        List<DonateInfo> DBList = mapper.findAllDonation(userId, page);
        Long totalCnt = mapper.getMyTotalCnt(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }
}

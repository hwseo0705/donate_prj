package com.project.donate_prj.service;

import com.project.donate_prj.domain.DonateInfo;
import com.project.donate_prj.repository.DonateInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DonateInfoService {

    private final DonateInfoMapper mapper;

    public List<DonateInfo> findAll(String userId) {
        return mapper.findAllDonation(userId);
    }
}

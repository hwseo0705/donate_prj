package com.project.donate_prj.service;

import com.project.donate_prj.domain.BoardInfo;
import com.project.donate_prj.domain.DonateInfo;
import com.project.donate_prj.repository.BoardInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardInfoService {

    private final BoardInfoMapper mapper;

    public List<BoardInfo> findAll(String userId) {
        return mapper.findAll(userId);
    }
}

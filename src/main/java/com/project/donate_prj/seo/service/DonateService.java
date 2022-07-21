package com.project.donate_prj.seo.service;

import com.project.donate_prj.seo.repository.DonateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DonateService {

    private final DonateMapper mapper;
}

package com.project.donate_prj.seo.controller;

import com.project.donate_prj.seo.service.DonateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/donate")
public class DonateController {

    private final DonateService service;


}

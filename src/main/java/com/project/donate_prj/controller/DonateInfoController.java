package com.project.donate_prj.controller;

import com.project.donate_prj.service.DonateInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping
public class DonateInfoController {
    @Autowired
    private final DonateInfoService service;

    @GetMapping("/mydonation/{userId}")
    public String myDonation(@PathVariable String userId, Model model) {
        log.info("into mypage/mydonation");
        model.addAttribute("dList", service.findAll(userId));
        return "mypage/mydonation";
    }
}

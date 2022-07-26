package com.project.donate_prj.controller;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.paging.PageMaker;
import com.project.donate_prj.service.DonateInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping
public class DonateInfoController {
    @Autowired
    private final DonateInfoService service;

    @GetMapping("/mydonation/{userId}")
    public String myDonation(@PathVariable String userId, Model model, Page page) {
        log.info("into mypage/mydonation");

        Map<String, Object> findAllMap = service.findAllDonation(userId, page);
        //  페이지 정보 생성용
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Long) findAllMap.get("tc"));

        model.addAttribute("dList", findAllMap.get("dbList"));
        model.addAttribute("pm", pm);
        return "mypage/mydonation";
    }
}

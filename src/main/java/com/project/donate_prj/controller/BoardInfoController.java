package com.project.donate_prj.controller;

import com.project.donate_prj.service.BoardInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
@Log4j2
public class BoardInfoController {

    private final BoardInfoService service;


    @GetMapping("/myboard/{userId}")
    public String myBoard(@PathVariable String userId, Model model) {
        log.info("into mypage/myboard");
        model.addAttribute("dList", service.findAll(userId));
        return "mypage/myboard";
    }
}

package com.project.donate_prj.controller;


import com.project.donate_prj.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
@Log4j2
public class QnaController {

    private final QnaService service;

    // qna 가는길
    @GetMapping("/qna")
    public String intoQna(){
        log.info("qna request ");
        return "qna/qnaList";
    }




}

package com.project.donate_prj.controller;


import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.paging.PageMaker;
import com.project.donate_prj.domain.QnaBoard;
import com.project.donate_prj.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@Log4j2
public class QnaController {

    private final QnaService service;

    // qna 가는길 // 이거 성공
    @GetMapping("/qna")
    public String intoQna(Page page, Model model){
        System.out.println("\n============\n");
        log.info("qna request ");

        Map<String, Object> allService = service.findAllService(page);
        PageMaker qnacnt = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (long) allService.get("qnacnt"));

        System.out.println("\n============\n");
        log.info("allService list = {}",allService.get("qList"));

        model.addAttribute("qnaList",allService.get("qList"));
        model.addAttribute("pm",qnacnt);
        return "qna/qnaList";
    }


    // qwrite 가는길 // 이거 잘 이동이 안됨
    @GetMapping("/qwrite")
    public String qWrite(){
        log.info("qna write");
        return "qna/qnaWrite";
    }

    // Qna 한거 저장소에 넣는곳
    @PostMapping("/qwrite")
    public String qWrite(String userId, String content, RedirectAttributes ra){
        log.info("push your question Id = {} , content = {}",userId,content); // 여기 까지는 들어옴
        boolean b = service.saveService(userId, content);
        log.info("success push your question");
        if (b) ra.addFlashAttribute("success","saveSuccess");

        return "redirect:/qna";

    }


    // remove 삭제하는 것
    @GetMapping("/qdelete")
    public String qDelete(long qnaNo){
        log.info("delete success");
        service.removeService(qnaNo);
        return "qna/qnaList";
    }


    // qna 하나 보여주는거
    @GetMapping("/qdetail/{qnaNo}") // findOne
    public String qDetail(@PathVariable long qnaNo, Model model){
        log.info("qnaNo request{}",qnaNo);
        QnaBoard one = service.findOneService(qnaNo);
        model.addAttribute("you",one); // 전달
        return "qna/qnaDetail";
    }

    // 수정 하는 페이지
    @GetMapping("qmodi/{qnaNo}")
    public String qModi(@PathVariable long qnaNo,Model model){
        log.info("come your {} to modify" , qnaNo);
        QnaBoard one = service.findOneService(qnaNo);
        model.addAttribute("moid",one);

        return "수정하는 창 띄우기 ";
    }

    @PostMapping("qmodi/{qnaNo}")
    public String qModi(long qnaNo ,String qContent){
        log.info("your {} , content {}",qnaNo,qContent);
        service.modifyService(qnaNo,qContent);
        return "/qna/qnaList"; // 리스트로 가기
    }


















}

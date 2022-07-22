package com.project.donate_prj.controller;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.paging.PageMaker;
import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.service.DonateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
public class DonateController {

    private final DonateService service;

    // index : 메인페이지 화면 요청 - 모금글 전부 출력 (페이징)
    @GetMapping("/main")
    public String list(Search search, Model model) {
        log.info("controller request / GET - {}, {}", search, search.getPageNum());

        Map<String, Object> findAllMap = service.findAllService(search);

        //  페이지 정보 생성용
        PageMaker pm = new PageMaker(new Page(search.getPageNum(), search.getAmount()), (Long) findAllMap.get("tc"));


        model.addAttribute("dbList", findAllMap.get("dbList"));
        model.addAttribute("pm",pm);
        return "index";
    }

    // write get
    @GetMapping("/write")
    public String write() {
        //ㅋㅋ
        log.info("controller request /write GET!");
        return "donate-write";
    }

    // write post
    @PostMapping("/write")
    public String write(DonateBoard board, RedirectAttributes ra) {
        log.info("controller request /write POST! - {}", board);
        boolean flag = service.saveService(board);
        if (flag) ra.addFlashAttribute("msg", "reg-success");
        return "redirect:/";
    }

    // remove get
    @GetMapping("/remove")
    public String remove(Long boardNo, RedirectAttributes ra) {
        log.info("controller request /remove GET! - {}", boardNo);
        boolean flag = service.removeService(boardNo);
        if (flag) ra.addFlashAttribute("msg", "remove-success");
        return "redirect:/";
    }

    // detail get
    @GetMapping("/detail/{boardNo}")
    public String detail(@PathVariable Long boardNo, Model model) {
        log.info("controller request /detail GET! - {}", boardNo);
        DonateBoard board = service.findOneService(boardNo);
        model.addAttribute("b", board);
        return "donate-detail";
    }

    // modify get
//    @GetMapping("/modify")
    @GetMapping("/modify/{boardNo}")
    public String modify(@PathVariable Long boardNo, /*Long boardNo,*/ Model model) {
        log.info("controller request /modify GET! - bno: {}", boardNo);
        DonateBoard board = service.findOneService(boardNo);
        model.addAttribute("b", board);
        return "donate-modify";
    }

    // modify post
    @PostMapping("/modify")
    public String modify(DonateBoard board, RedirectAttributes ra) {
        log.info("controller request /modify POST! - {}", board);
        boolean flag = service.modifyService(board);
        if (flag) ra.addFlashAttribute("msg", "modification-success");
        return "redirect:/";
    }


    // login get
    @GetMapping("/login")
    public String login() {
        log.info("controller request /login GET! ");

        return "donate-login";
    }


    // login post : 기원이형!! 로그인이 되면 어떤 로직들이 실행되어야 하는지 하단부 주석 작성해주세요!!
//    @PostMapping("/login")
//    public String login( id, pw 별로 검증이 필요해서 커맨드 객체보다 따로 받는게 나으려나?? 여긴 형 스타일대로~~ ) {
//        log.info("controller request /login POST! - {}", 로그 꼭 확인하세요!! );

//        return "";
//    }


    // register get
    @GetMapping("/register")
    public String register() {
        log.info("controller request /register GET! ");

        return "donate-register";
    }


    // register post : To 기원이형!!
//    @PostMapping("/register")
//    public String register() {
//        log.info("controller request /register POST! - {}", 매개변수들 잘 들어왔는지 확인 잘 해주세요~~);
//
//        return "redirect:/"; // 로그인 성공했으면 메인 화면으로 가야할듯요!
//    }


}

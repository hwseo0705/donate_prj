package com.project.donate_prj.controller;

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
    @GetMapping("/")
    public String list(DonateBoard board, Model model) {
        log.info("controller request / GET - {}", board);
        service.findAllService(board);

        model.addAttribute("bList", service.findAllService(board));
        return "donate-list";
    }

    // write get
    @GetMapping("/write")
    public String write() {
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
    @GetMapping("/modify")
    public String modify(Long boardNo, Model model) {
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
}

package com.project.donate_prj.controller;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.common.paging.PageMaker;
import com.project.donate_prj.common.search.Search;
import com.project.donate_prj.domain.DonateBoard;
import com.project.donate_prj.service.DonateService;
import com.project.donate_prj.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
public class DonateController {

    private final DonateService service;
//    private LoginService Uservice;

    private static final String UPLOAD_PATH = "E:\\sl_Haewon_Seo\\upload";


    // index : 메인페이지 화면 요청 - 모금글 전부 출력 (페이징)
    @GetMapping("/main")
    public String list(Search search, Model model) {
        log.info("controller request / GET - {}, {}", search, search.getPageNum());

        Map<String, Object> findAllMap = service.findAllService(search);

        //  페이지 정보 생성용
        PageMaker pm = new PageMaker(new Page(search.getPageNum(), search.getAmount()), (Long) findAllMap.get("tc"));


        model.addAttribute("dbList", findAllMap.get("dbList"));
        model.addAttribute("pm", pm);
        return "board/index";
    }

    // write get
    @GetMapping("/write")
    public String write() {
        //ㅋㅋ
        log.info("controller request /write GET!");
        return "board/donate-write";
    }

    // write post
    @PostMapping("/write")
    public String write(DonateBoard board, MultipartFile file, RedirectAttributes ra) {
        log.info("controller request /write POST! - {}", board);
        log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! - {}", file);

        String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH);
        board.setThumbnail(fullPath);

        boolean flag = service.saveService(board);
        if (flag) ra.addFlashAttribute("msg", "reg-success");


        return "redirect:/main";
    }

    // remove get
    @GetMapping("/remove")
    public String remove(Long boardNo, RedirectAttributes ra) {
        log.info("controller request /remove GET! - {}", boardNo);
        boolean flag = service.removeService(boardNo);
        if (flag) ra.addFlashAttribute("msg", "remove-success");
        return "redirect:/main";
    }

    // detail get
    @GetMapping("/detail/{boardNo}")
    public String detail(@PathVariable Long boardNo, Model model) {

        log.info("controller request /detail GET! - {}", boardNo);
        DonateBoard board = service.findOneService(boardNo);
        model.addAttribute("b", board);
        return "board/donate-detail";
    }

    // modify get
//    @GetMapping("/modify")
    @GetMapping("/modify/{boardNo}")
    public String modify(@PathVariable Long boardNo, /*Long boardNo,*/ Model model) {
        log.info("controller request /modify GET! - bno: {}", boardNo);
        DonateBoard board = service.findOneService(boardNo);
        model.addAttribute("b", board);
        return "board/donate-modify";
    }

    // modify post
    @PostMapping("/modify")
    public String modify(DonateBoard board, MultipartFile file, RedirectAttributes ra) {
        log.info("controller request /modify POST! - {}", board);

        log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! - {}", file);

        String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH);
        board.setThumbnail(fullPath);

        boolean flag = service.modifyService(board);
        if (flag) ra.addFlashAttribute("msg", "modification-success");
        return "redirect:/main";
    }

    //    @PostMapping("/upCash/{userId}/{money}")
//    public String upCash(@PathVariable Long userId, @PathVariable Long money) {
//        service.upCashService(userId, money);
//        return "redirect:/myinfo";
//    }
    @GetMapping("/myboard/{writer}")
    public String myBoard(@PathVariable String writer, Model model, Page page) {
        log.info("into mypage/myboard");

        Map<String, Object> findAllMap = service.findAllWrite(writer, page);
        //  페이지 정보 생성용
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Long) findAllMap.get("tc"));

        model.addAttribute("dList", findAllMap.get("dbList"));
        model.addAttribute("pm", pm);

        return "mypage/myboard";
    }
}


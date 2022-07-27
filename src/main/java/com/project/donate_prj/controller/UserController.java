package com.project.donate_prj.controller;


import com.project.donate_prj.domain.DonateInfo;
import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.service.DonateService;
import com.project.donate_prj.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping
public class UserController {


    private final LoginService service;

    private final DonateService donateService;


    // 로그인 요청 들어옴
    @GetMapping("/login")
    public String login() {
        log.info(" login success  ");
        return "donate-login";

//        login/login-detail // 남기원 만든 페이지
    }

    // 요청 입력하면 확인하고 돌려보냄
    @PostMapping("/login")

    public String login(String userId, String password, HttpServletResponse response, HttpServletRequest request, RedirectAttributes ra, Model model
            , HttpSession session) {

        log.info("userId : {} , password : {}", userId, password);
        int i = service.loginCookieService(userId, password, request, response);
        log.info("result: {}", i);
        switch (i) {
            case 1:
                ra.addFlashAttribute("msg", 1);
                return "redirect:/login";
            // 여기까진 성공 `
            case 2:
                ra.addFlashAttribute("msg", 2);
                return "redirect:/login";
            //  여기까지도 성공
            case 3:
                DonateUser info = service.findOneService(userId);

                session.setAttribute("y", info);
//                ra.addFlashAttribute("y",info); // 진화 2
//                model.addAttribute("y", info); // 진화 1

                return "redirect:/main";


        }
        // 1 아이디 없음
        // 2 비밀번호 틀렸음
        // 3 로그인 성공
        return null;
    }


    // 회원 정보 삭제  // 탈퇴
    @PostMapping("/delUser/{userId}")
    public String delete(@PathVariable String userId, String password, RedirectAttributes ra) {
        boolean flag = service.verification(userId, password);
        if (flag) { // 삭제 성공한 경우
            ra.addFlashAttribute("delUser", true);
            boolean flag2 = service.delBoard(userId);
            service.deleteUser(userId);
            return "redirect:/myinfo/" + userId;
        } else {
            ra.addFlashAttribute("delUser", false);
            return "redirect:/myinfo/" + userId;
        }
    }


    @PostMapping("/modiUser")
    public String modify(DonateUser donateUser) {
        log.info("modify POST - {}", donateUser);
        boolean b = service.modifyService(donateUser);
        return "redirect:/myinfo/" + donateUser.getUserId();

    }

    @GetMapping("/hello")

    public String hello(HttpServletRequest request, HttpSession session) {

        if (session.getAttribute("y") == null) {
        }

        log.info("hello!!");

        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        log.info("{}", loginCookie);
        if (loginCookie != null) {
            // 쿠키가 null 이 아니면
            // 로그인 헬로 ~
            return "login/hello";
        }
        return "redirect:/login";
    }

    @GetMapping("/logout")

    public String logout(HttpServletResponse response, HttpServletRequest request, HttpSession session) {
        session.invalidate(); // == 로그아웃 !

        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        if (loginCookie != null) {
            Cookie cookie = new Cookie("loginCookie", "out");
            cookie.setMaxAge(0);
            response.addCookie(cookie);

        }
        return "redirect:/main";
    }

    //
//    // register get
    @GetMapping("/register")
    public String register() {
        log.info("controller request /register GET!");
        log.info("register success");

        return "donate-register";
    }


    // register post
    @PostMapping("/register")
    public String register(String userId, String password, String name, String email, RedirectAttributes ra) {
        log.info("DonateUser info- {},{},{},{}", userId, password, name, email);
        int i = service.saveService(userId, password, name, email);
        log.info("savePoint = {}", i);
        switch (i) {
            case 1:
                ra.addFlashAttribute("msg", 1);
                ra.addFlashAttribute("register", userId);
                // 중복 아이디
                return "redirect:/register";
            case 2:
                ra.addFlashAttribute("msg", 2);
//                ra.addFlashAttribute("register",i);
                return "redirect:/main";
        }

        return null;
    }


    @GetMapping("/myinfo/{userId}")
    public String myInfo(@PathVariable String userId, Model model) {
        log.info("mypage/myinfo - {}", userId);
        DonateUser user = service.findOneService(userId);
        model.addAttribute("my", user);
        return "mypage/myinfo";
    }

    @GetMapping("/uplike/{boardNo}/{userId}")
    public String upLike(@PathVariable Long boardNo, @PathVariable String userId, RedirectAttributes ra) {
        log.info("UserController request /uplike GET! - {}, {}", boardNo, userId);

        boolean flag = service.likeCheckService(boardNo, userId);

        if (flag) {
            ra.addFlashAttribute("likeResult", true);
        } else {
            ra.addFlashAttribute("likeResult", false);
        }
        return "redirect:/detail/" + boardNo;
    }


    @GetMapping("/upCash/{userId}/{money}")
    public String upCash(@PathVariable String userId, @PathVariable Long money) {
        service.upCashService(userId, money);
        return "redirect:/myinfo/" + userId;
    }


    // 새로 추가할 메서드


    @PostMapping("/donateMoney/{boardNo}")
    public String donateMoney(@PathVariable Long boardNo, long money, String userId, String title, RedirectAttributes ra) {
        log.info("{},{},{}", boardNo, money, userId);
        if (service.findMoneyService(userId) < money){
            ra.addFlashAttribute("no", 1);
            return "redirect:/detail/{boardNo}";
        }
        donateService.plusDonationService(boardNo, money); // 기부 금액 증가
        boolean b = service.minusMoneyService(userId, money); // 기부 금액 차감
        ra.addFlashAttribute("user", userId); // 님이 기부하셨습니다.

        // DonateInfo에 내가 기부한 정보 세이브
        DonateInfo di = new DonateInfo();
        di.setDonateMoney(money);
        di.setUserId(userId);
        di.setBoardNo(boardNo);
        di.setTitle(title);
        service.saveDonateInfo(di);
        return "redirect:/detail/{boardNo}";

    }


}







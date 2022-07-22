package com.project.donate_prj.controller;


import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private final LoginService service;
//
//    controller url mapping
//
// / : index 페이지 화면 요청(모금글 전부(페이징 기능된) 출력해야함)
//
//            / write (get) : 모금글 등록 화면 요청
//
// / write (post) : 모금글 작성 후 등록 요청
//
// / remove (get) : 본인이 작성한 글 아니면 삭제 안되도록 검증 후 삭제
//
// / detail (get) : 모금글 상세정보 화면 요청
//
// / modify (get) : 모금글 수정 화면 요청
//
// / modify (post) : 모금글 수정 완료 후 반영 요청
//
// / login (get) : 로그인 화면 요청
//
// / login (post) : id, pw 작성 후 로그인 요청
//    입력받은 id랑 db 회원 정보 테이블에 있는 id가 겹치는게 있으면
//    id 검증이 되면 비번도 검증 둘 다 만족해야 로그인!
//
//            / register (get) : 회원가입 화면 요청
//
// / register (post) : id 중복확인 후 이미 등록된 id가 없다면 회원가입!
//    주의! db에서 걸어놓은 byte 제한을 넘지 않도록 검증도 해줘야 함
//
// / mypage (get) : 내 정보 화면 요청
//            ( 내가 어디 기부했는지 까지도 포함(but 페이징 기능 써서)하는 모든 정보 )
//
//            / mypage / delete (get) : 회원 탈퇴 화면 요청
//
// / mypage / delete (post) : 비밀번호 입력 받고 검증 통해 일치하면 정상 탈퇴!


    // 로그인 요청 들어옴
    @GetMapping("/login")
    public String login() {
        log.info(" 로그인 화면으로 들어가는 페이지 ");
        return "login/login-detail";
    }

    // 요청 입력하면 확인하고 돌려보냄
    @PostMapping("/login")
    public String login(String userId, String password, HttpServletResponse response, HttpServletRequest request, RedirectAttributes ra, Model model) {
        int i = service.loginCookieService(userId, password, request, response);
        log.info("result: {}", i);
        switch (i) {
            case 1:
                ra.addFlashAttribute("msg", 1);
                return "redirect:/login";
            case 2:
                ra.addFlashAttribute("msg", 2);
                return "redirect:/login";
            case 3:
                DonateUser info = service.findOneService(userId);
                model.addAttribute("y", info);
                return "board/board-list";
        }
        // 1 아이디 없음
        // 2 비밀번호 틀렸음
        // 3 로그인 성공
        return null;
    }

    // 회원가입 요청 페이지
    @GetMapping("/save")
    public String signUp() {
        log.info("login request page ");
        return "/login/login-save";
    }

    // 회원 가입 통과면 저장된 정보를 가지고 가져가라 ~
    @PostMapping("/save")
    public String signUp(DonateUser donateUser, Model model, RedirectAttributes ra) {
        int i = service.saveService(donateUser);
        if (i == 1) {
            ra.addFlashAttribute("msg2", 1);
            return "redirect:/save";
        } else {
            model.addAttribute("save", i);
            return "board/board-list";
        }


    }

    // 개인정보 보기
    @GetMapping("/login/detail")
    public String detail(String userId, Model model) {
        log.info("/login/detail GET request - {}", userId);
        DonateUser one = service.findOneService(userId);
        model.addAttribute(one);
        return "login/login-detail";
    }


    // 회원 정보 삭제  // 탈퇴
    @GetMapping("/login/remove")
    public String delete(String userId) {
        service.deleteService(userId);
        return "board/board-list";
    }

    // 회원 정보 수정
    @GetMapping("/modify")
    public String modify(String userId, Model model) {
        // 수정전 파일을 소환
        DonateUser one = service.findOneService(userId);
        // 수정전 파일을 모델 객체에 넣어서 전달
        model.addAttribute("one", one);
        return "/login/login-modify";

    }

    @PostMapping("/modify")
    public String modify(DonateUser donateUser) {
        boolean b = service.modifyService(donateUser);
        return "redirect:/board/boardList";

    }

    @GetMapping("/hello")
    public String hello(HttpServletRequest request) {
        log.info("hello!!");

        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        log.info("{}", loginCookie);
        if (loginCookie != null) {
            return "login/hello";
        }
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public void logout(HttpServletResponse response , HttpServletRequest request) {
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        if (loginCookie != null) {
            Cookie cookie = new Cookie("loginCookie", "out");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }



//        finishCookie(response, "memberId");
//        return "redirect:/";

//    private void finishCookie(HttpServletResponse response, String cookieName) {
//        log.info("cookieName == {}",cookieName);
//        Cookie cookie = new Cookie(cookieName, "s");
//        cookie.setMaxAge(0);
//        response.addCookie(cookie);
//    }
    // 쿠키를 0 인놈으로 주면
    // 기존에 있던애는 어떻게 되는걸까 ?

}




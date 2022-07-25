package com.project.donate_prj.service;

import com.project.donate_prj.domain.DonateUser;
import com.project.donate_prj.repository.LoginMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class LoginService {

    @Autowired
    private final LoginMapper mapper;

    // 회원 가입 서비스 // 아이디 중복 검사 완로
    public int saveService(String userId, String password , String name, String email) {
        log.info("saveService ~~ donateUser = {},{},{},{}", userId,password , name,  email);
        if (findIdService(userId)) {
            // 아이디 찾는 서비스 하나라도 나온다면 true 이기 때문에
            log.info("joungbok");
            return 1;
        }
        log.info("saveService success");
        mapper.save(userId,password,name,email);
        return 2 ;
    }

    // 모두 불러오기
    public List<DonateUser> findAllService() {
        log.info("findAllService - {} ");
        return mapper.findAll();
    }

    // 한명만 불러오기
    public DonateUser findOneService(String userId) {
        return mapper.findOne(userId);
    }

    // 삭제 하기 회원 탈퇴
    public boolean deleteService(String userId) {
        if (!findIdService(userId)) {
            log.info("삭제할 id가 없습니다", userId);
            return false;
        }
        return mapper.remove(userId);
    }

    // 개인정보 수정
    public boolean modifyService(DonateUser donateUser) {
        return mapper.modify(donateUser);
    }

    @Transactional
    public int loginCookieService(String userId, String password, HttpServletRequest request, HttpServletResponse response) {
        log.info("your id  = {} your password = {} ", userId, password);
        if (findIdService(userId)) {
            log.info("id pass");
            String dbpass = findPasswordService(userId);
            if (password.equals(dbpass)) {
                // 비밀번호가
                // 아이디가 일치하는 비밀번호를 가져왔을때 그 비밀번호가 들어온 스트링 값이랑 같으면
                // 로그인 성공 이니까 여기서 쿠키를 준다


                Cookie cookie = new Cookie("loginCookie", userId);
                cookie.setMaxAge(60 * 60); // 한시간짜리 쿠키
                cookie.setPath("/");
                // 로그인 하면 어디든 다닐수 있어야 하니까 전체폴더로 잡았어요
                response.addCookie(cookie);

                return 3;
            } else {
                System.out.println("비밀번호가 틀렸습니다.");
                return 2;
            }
        } else {
            return 1;
        }

    }


    public boolean findIdService(String userId) {
        // 아이디가 있으면 1 아이디가 없으면 0 이 나오는 메서드
        // 1이면 true , 0이면  false
        log.info("findId service start - {}", userId);
        int id = mapper.findId(userId);
        return id == 1;
    }

    // 잘 나옴
    public String findPasswordService(String userId) {
        String pw = mapper.findPassword(userId);
        return pw;
    }


//    Cookie foundCookie = WebUtils.getCookie(request, "b" + boardNo);


    // 응원하기 관련 서비스
    public boolean likeCheckService(Long boardNo, String userId) {

        boolean flag = mapper.isLike(boardNo, userId);
        if (flag) {
            mapper.likeCheck(boardNo, userId);
            mapper.upLikeCnt(boardNo);
            return true;
        }
        return false;
    }


}

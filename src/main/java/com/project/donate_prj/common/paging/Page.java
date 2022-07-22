package com.project.donate_prj.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@ToString @Getter
@AllArgsConstructor
public class Page {

    private Long pageNum; // 현재 페이지 정보

    private int amount; // 한 페이지에서 출력할 게시물 수


    // 커맨드 객체에 스프링 컨테이너가 기본생성자를 통해 넣어줄텐데
    // 아무것도 입력하지 않았을 시에 기본값으로 가질 값 세팅.
    public Page() {
        this.pageNum = 1L;
        this.amount = 9;
    }

    public void setPageNum(Long pageNum) {
        // url을 통한 이상한 get 요청 걸러내기
        if (pageNum < 1) {
            this.pageNum = 1L;
            return;
        }
        this.pageNum = pageNum;
    }

    public void setAmount(int amount) {
        // url을 통한 이상한 get 요청 걸러내기
        if (amount < 9 || amount > 100) {
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }
}

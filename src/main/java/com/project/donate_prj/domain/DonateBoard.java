package com.project.donate_prj.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DonateBoard {

    private Long boardNo;
    private String title;
    private String writer;
    private String thumbnail;
    private String content;
    private Long targetMoney;
    private Long currentMoney;
    private String startDate;
    private String endDate;
    private int likeCnt;
}

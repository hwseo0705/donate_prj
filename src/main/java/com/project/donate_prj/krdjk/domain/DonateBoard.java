package com.project.donate_prj.krdjk.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class DonateBoard {

    private int boardNo;
    private String title;
    private String writer;
    private String thumbnail;
    private String content;
    private int targetMoney;
    private int currentMoney;
    private String startDate;
    private String endDate;
    private int likeCnt;

}

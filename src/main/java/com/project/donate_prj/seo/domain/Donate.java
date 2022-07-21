package com.project.donate_prj.seo.domain;

import lombok.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Donate {

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

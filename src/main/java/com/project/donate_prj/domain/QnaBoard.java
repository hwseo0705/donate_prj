package com.project.donate_prj.domain;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class QnaBoard {

    private long qnaNo;
    private String userId;
    private String content;
    private Date questionDate;

    // 포멧하는 데이터
    private String convertDate; // questionDate 를 보기좋게 바꿔서 넣을





}

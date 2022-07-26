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




}

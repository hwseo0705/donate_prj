package com.project.donate_prj.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DonateInfo {

    private Long boardNo;
    private String userId;
    private Long donateMoney;
}

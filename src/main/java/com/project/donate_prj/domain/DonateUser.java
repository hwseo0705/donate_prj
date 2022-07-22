package com.project.donate_prj.domain;


import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class DonateUser {

    private String userId; //  유저 아이디
    private String password; // 유저 비밀번호
    private String name;  // 이름
    private String email;  // 이메일
    private long money ; // 소지금





}

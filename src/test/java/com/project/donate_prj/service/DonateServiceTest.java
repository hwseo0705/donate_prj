package com.project.donate_prj.service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
@SpringBootTest
class DonateServiceTest {


    @Autowired
    DonateService service;

    @Test
    @DisplayName("21 값 올리기 ")
    void plusDonationServiceTest(){
        service.plusDonationService(21,12345);
    }



}
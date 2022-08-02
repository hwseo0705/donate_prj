package com.project.donate_prj.controller;

import com.project.donate_prj.util.FileUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
public class UploadController {

    private static final String UPLOAD_PATH = "E:\\sl_basic\\upload\\donate_prj";


    @PostMapping("/ajax-upload")
    @ResponseBody
    public ResponseEntity<List<String>> ajaxUpload(List<MultipartFile> files) {

        log.info("/ajax-upload POST!!! - {}", files.get(0).getOriginalFilename());
//        log.info("/ajax-upload POST!!! - {}", files);


        // 클라이언트에게 전송할 파일경로 리스트
        List<String> fileNames = new ArrayList<>();


        // 클라이언트가 전송한 파일 업로드하기
        for (MultipartFile file : files) {

            String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH);

            fileNames.add(fullPath);
        }


        return new ResponseEntity<>(fileNames, HttpStatus.OK);
    }



    // 파일 데이터 로드 요청 처리
    /*
        비동기 통신 응답시 ResponseEntity를 쓰는 이유는
        이 객체는 응답 body 정보 이외에도 header 정보를 포함할 수 있고
        추가로 응답 상태코드도 제어할 수 있다. (404, 500, 200 등등)
    */
    @GetMapping("/loadFile")
    @ResponseBody
    // fileName = /2022/08/01/ 반환된 파일명 => 이게 들어온다.
    public ResponseEntity<byte[]> loadFile(String fileName) { // 클라이언트 사이드에서 파일의 진짜 데이터를 요청하고 있다.

        log.info("/loadFile GET - {}", fileName);


        // 클라이언트가 요청하는 파일의 찐 바이트 데이터를 갖다줘야 함.

        // 1. 요청 파일 찾아서 file 객체로 포장해야 한다.
        File f = new File(UPLOAD_PATH + fileName);

        if (!f.exists()) { // 파일을 경로에서 찾아봤는데 존재하지 않는다면 404를 의도해서 띄울 수 있다.
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }


        // 2. 해당 파일을 InputStream을 통해 불러온다.
        try (FileInputStream fis = new FileInputStream(f)) { // 서버의 이미지 저장소에서 끌어오자. 내보내줘야 하니까!!!

            // 3. 클라이언트에게 순수 이미지를 응답해야 하므로 MIME TYPE을 응답헤더에 설정한다.
            // ex) image/jpeg, image/png, image/gif 이런 식으로 써서 알려줘야 한다.
            // 확장자를 추출해야 함.

            String ext = FileUtils.getFileExtension(fileName);

            //  "image/" + ext(jpeg, png, gif 등의 이미지 확장자)를 응답 헤더에 세팅해야 하는데 jpg면.. jpeg라고 해야한다.. 부들..
            MediaType mediaType = FileUtils.getMediaType(ext);


            // 응답 헤더에 미디어 타입 설정
            HttpHeaders headers = new HttpHeaders();

            if (mediaType != null) { // 이미지라면
                headers.setContentType(mediaType); // 'content-type' : 'image/jpeg 이런 식으로 헤더에 세팅해줌.
            }

            else { // 이미지가 아니라면 응답 헤더에 이게 다운로드 가능한 파일이라는 표시를 해줘야 한다.
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // application / octet_stream

                // 파일명을 원래대로 복구 (앞에 뗄거 다 떼고 상어.jpg 이런 식으로!)
                fileName = fileName.substring(fileName.indexOf("_") + 1);


                // 파일명이 한글인 경우 인코딩 재설정
                String encoding = new String(
                        fileName.getBytes("UTF-8"), "ISO-8859-1");


                // 헤더에 위 내용을 추가
                headers.add("Content-Disposition", "attachment; fileName=\"" + encoding +"\"");
            }


            // 4. 첨부파일의 순수 데이터를 바이트 배열에 저장.
            byte[] rawData = IOUtils.toByteArray(fis);


            // 5. 비동기 통신에서 데이터 응답할 때!! 무조건 ResponseEntity 객체를 사용하라!!!!
            return new ResponseEntity<>(rawData, headers, HttpStatus.OK); // 클라이언트에 파일 데이터 응답

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}

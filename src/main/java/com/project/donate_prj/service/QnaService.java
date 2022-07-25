package com.project.donate_prj.service;

import com.project.donate_prj.domain.QnaBoard;
import com.project.donate_prj.repository.QnaMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaService {

    private final QnaMapper mapper;


    // 저장소
    public boolean saveSevice(String userId ,String qContent){
        boolean save = mapper.save(userId, qContent);
        return save;
    }
    // 모두 불러오기
    public List<QnaBoard> findAllService(){
        List<QnaBoard> all = mapper.findAll();
        return all;
    }
    // qna 하나 불러오기
    public QnaBoard findOneService(long qnaNo){
        QnaBoard one = mapper.findOne(qnaNo);
        return one;
    }
    // 삭제 결과
    public boolean removeService(long qnaNo){
        boolean remove = mapper.remove(qnaNo);
            return remove;
    }

    // 수정 결과
    public boolean modifyService(long qnaNo,String qContent){
        boolean modify = mapper.modify(qnaNo, qContent);
        return modify;
    }












}

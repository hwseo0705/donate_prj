package com.project.donate_prj.service;

import com.project.donate_prj.common.paging.Page;
import com.project.donate_prj.domain.QnaBoard;
import com.project.donate_prj.repository.QnaMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaService {

    private final QnaMapper mapper;


    // 저장소
    public boolean saveService(String userId ,String content){
        boolean save = mapper.save(userId, content);
        return save;
    }
    // 모두 불러오기
    public Map<String ,Object> findAllService(Page page){
        // 페이지와 총 갯수를 담은 맵을 반환하는
        // // 파인드 올 서비스
        List<QnaBoard> all = mapper.findAll(page);
        process(all);

        log.info("all : {}",all);

        long l = mapper.qnaTotalCnt();

        log.info("totalCnt :{}", l);

        Map<String ,Object> map = new HashMap<>();
        map.put("qList",all);
        map.put("qnacnt",l);

        return map;
    }
    // qna 하나 불러오기
    public QnaBoard findOneService(long qnaNo){
        QnaBoard one = mapper.findOne(qnaNo);
        convertDate(one);
        return one;
    }
    // 삭제 결과
    public boolean removeService(long qnaNo){
        boolean remove = mapper.remove(qnaNo);
            return remove;
    }

    // 수정 결과
    public boolean modifyService(long qnaNo,String content){
        boolean modify = mapper.modify(qnaNo, content);
        return modify;
    }

    // 전체 페이지수 가져오는 메서드
    public long qnaTotalCntService(){
        long l = mapper.qnaTotalCnt();
        return l;
    }

    public void process(List<QnaBoard> list){
        for (QnaBoard q : list) {
            convertDate(q);
            subStringQ(q);
        }
    }
    // 5자리만 나오고 나머지는 ... 으로 만듬
    public void subStringQ(QnaBoard q){
        String ct = q.getContent();
        String sb = ct.substring(0, 3);
        q.setContent(sb+"...");
    }
    public void convertDate(QnaBoard q){
        Date qd = q.getQuestionDate();
        SimpleDateFormat sf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        q.setConvertDate(sf.format(qd));
    }













}

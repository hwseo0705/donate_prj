<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        form {
            width: 50%;
            margin: auto;
        }


        .main-title {

            margin: 40px 0;
        }

        .invalid-feedback {
            display: none;
        }
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <form id="modify-form" action="/modify" method="post">

        <input type="hidden" name="boardNo" value="${b.boardNo}">

        <h1 class="main-title">${b.boardNo}번 게시물</h1>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input type="text" class="form-control input-title" id="exampleFormControlInput1" placeholder="제목" name="title"
                value="${b.title}" maxlength="90">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <input hidden type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
            value="${y.userId}">

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">썸네일</label>
            <select class="form-select" name="thumbnail" id="thumbnail">
                <option value="/img/example1.jpg">유니세프</option>
                <option value="/img/example2.jpg">세이브 더 칠드런</option>
                <option value="/img/example3.jpg">굿네이버스</option>
                <option value="/img/example4.jpg">월드비전</option>
                <option value="/img/example5.jpg">도네이션 박스 사진</option>
                <option value="/img/example6.jpg">기부 하트 클립아트</option>
                <option value="/img/example7.jpg">기부 하트 사진</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <textarea name="content" class="form-control" id="exampleFormControlTextarea1"
                rows="10">${b.content}</textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">목표 모금액</label>

            <input type="text" class="form-control input-targetM" id="exampleFormControlInput1" placeholder="목표 모금액을 입력하세요." name="targetMoney"
                value="${b.targetMoney}" maxlength="10">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">시작일</label>
            <input type="text" class="form-control input-startD" id="exampleFormControlInput1" placeholder="yy-mm-dd"
                name="startDate" value="${b.startDate}" maxlength="8">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">종료일</label>
            <input type="text" class="form-control input-endD" id="exampleFormControlInput1" placeholder="yy-mm-dd" name="endDate"
                value="${b.endDate}" maxlength="8">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>


        <div class="btn-group btn-group-lg custom-btn-group" role="group">
            <button id="mod-btn" type="button" class="btn btn-danger">완료</button>
            <button type="button" class="to-main btn btn-dark">목록</button>
        </div>

    </form>

    </div>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

    <script>
        // input창들 제대로 입력 안했으면 통과시키지 않기
        const $modForm = document.getElementById('modify-form');
        const $inputTitle = document.querySelector('.input-title'); // 제목 체크
        const $inputTargetM = document.querySelector('.input-targetM'); // 목표 모금액 체크
        const $inputStartD = document.querySelector('.input-startD'); // 시작일자 체크
        const $inputEndD = document.querySelector('.input-endD'); // 마감일자 체크

        const checkArr = [true, true, true, true];

        const $modBtn = document.getElementById('mod-btn');

        function modifyRequestEvent() {

            $modBtn.onclick = e => {
                if ($inputTitle.value.trim() === '') {
                    $inputTitle.nextElementSibling.style.display = 'block';
                    checkArr[0] = false;
                } else {
                    $inputTitle.nextElementSibling.style.display = 'none';
                    checkArr[0] = true;
                }

                if ($inputTargetM.value.trim() === '') {
                    $inputTargetM.nextElementSibling.style.display = 'block';
                    checkArr[1] = false;
                } else {
                    $inputTargetM.nextElementSibling.style.display = 'none';
                    checkArr[1] = true;
                }

                if ($inputStartD.value.trim() === '') {
                    $inputStartD.nextElementSibling.style.display = 'block';
                    checkArr[2] = false;
                } else {
                    $inputStartD.nextElementSibling.style.display = 'none';
                    checkArr[2] = true;
                }

                if ($inputEndD.value.trim() === '') {
                    $inputEndD.nextElementSibling.style.display = 'block';
                    checkArr[3] = false;
                } else {
                    $inputEndD.nextElementSibling.style.display = 'none';
                    checkArr[3] = true;
                }
                
                for (let c of checkArr) {
                    if (c === false) {
                        return;
                    }
                }
                $modForm.submit();
            };
        }


        function toMain() {
            const $toMain = document.querySelector('.to-main');

            $toMain.onclick = e => {
                location.href = '/main'
            }
        }


        // 실행부
        (function() {
            modifyRequestEvent();
            toMain();
        }) ();

    </script>

</body>

</html>
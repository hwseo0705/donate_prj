<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        #write-form {
            width: 50%;
            margin: auto;
        }


        .invalid-feedback {
            display: none;
        }

    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <form id="write-form" action="/write" method="post" enctype="multipart/form-data">

        <input type="hidden" name="boardNo" value="${b.boardNo}">

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input type="text" class="form-control input-title" id="exampleFormControlInput1" placeholder="제목"
                name="title" maxlength="90">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <input hidden type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
            value="${y.userId}">

        <div id="upload-form" class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">썸네일</label>
            <input type="file" name="file">
        </div>


        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">목표 모금액</label>

            <input type="text" class="form-control input-targetM" id="exampleFormControlInput1"
                placeholder="목표모금액을 입력하세요." name="targetMoney" maxlength="10">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">시작일</label>
            <input type="text" class="form-control input-startD" id="exampleFormControlInput1" placeholder="yy-mm-dd"
                name="startDate" maxlength="8">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">종료일</label>
            <input type="text" class="form-control input-endD" id="exampleFormControlInput1" placeholder="yy-mm-dd"
                name="endDate" maxlength="8">
            <div class="invalid-feedback">
                필수입력 항목입니다.
            </div>
        </div>


        <div class="btn-group btn-group-lg custom-btn-group" role="group">
            <button id="mod-btn" type="button" class="btn btn-danger">완료</button>
            <button type="button" class="to-main btn btn-dark">목록</button>
        </div>

    </form>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


    <script>
        // input창들 제대로 입력 안했으면 통과시키지 않기
        const $writeForm = document.getElementById('write-form');
        const $inputTitle = document.querySelector('.input-title'); // 제목 체크
        const $inputTargetM = document.querySelector('.input-targetM'); // 목표 모금액 체크
        const $inputStartD = document.querySelector('.input-startD'); // 시작일자 체크
        const $inputEndD = document.querySelector('.input-endD'); // 마감일자 체크

        const checkArr = [true, true, true, true];

        const $writeBtn = document.getElementById('mod-btn');

        function writeRequestEvent() {

            $writeBtn.onclick = e => {
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

                $writeForm.submit();

            };
        }

        function toMain() {
            const $toMain = document.querySelector('.to-main');

            $toMain.onclick = e => {
                location.href = '/main'
            }
        }

        // 실행부
        (function () {
            writeRequestEvent();
            toMain();
        })();
    </script>



</body>

</html>
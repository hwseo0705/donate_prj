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


        .preview {
            display: none;
        }

        .thumb {
            width: 50%;
            height: 225px;
            margin: 0 auto;
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

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">썸네일 (첨부한 파일이 없으면 기본 이미지로 대체됩니다.)</label>
            <!-- <select class="form-select" name="thumbnail" id="thumbnail">
                <option value="/img/example1.jpg">유니세프 로고</option>
                <option value="/img/example2.jpg">세이브 더 칠드런 로고</option>
                <option value="/img/example3.jpg">굿네이버스 로고</option>
                <option value="/img/example4.jpg">월드비전 로고</option>
                <option value="/img/example5.jpg">도네이션 박스 사진</option>
                <option value="/img/example6.jpg">기부 하트 클립아트</option>
                <option value="/img/example7.jpg">기부 하트 사진</option>
            </select> -->
            <input id="exampleFormControlInput1" class="form-control inputThumbnail" type="file" name="thumbnailImage">
            <div class="preview form-control">
                <ul> 썸네일 미리보기
                    <li id="preview-img">
                        <!-- 사용자가 올린 이미지 파일이 비동기로 나올 곳 -->
                    </li>
                </ul>
            </div>
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

    </div>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


    <!-- 파일 업로딩 관련 스크립트 영역 -->
    <script>
        function isImageFile(originFileName) {
            //정규표현식
            const pattern = /jpg$|gif$|png$/i; // jpg로 끝나거나~ gif로 끝나거나~ png로 끝나면 true를 리턴하라.

            return originFileName.match(pattern); // 패턴하고 매치되면 true다.
        }


        function checkExt(fileName) {

            let originFileName = fileName.substring(fileName.indexOf('_') + 1);

            if (isImageFile(originFileName)) {

                const $preivew = document.querySelector('.preview');
                $preivew.style.display = 'block';

                const $img = document.createElement('img');
                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);
                $img.classList.add('thumb');


                const $hiddenInput = document.createElement('input');
                $hiddenInput.setAttribute('type', 'hidden');
                $hiddenInput.setAttribute('name', 'thumbnailFileNames');
                $hiddenInput.setAttribute('value', fileName);


                document.getElementById('write-form').appendChild($hiddenInput);


                const $li = document.getElementById('preview-img');
                
                if ($li.children.length > 0) {
                    $li.removeChild($li.firstElementChild);
                    $li.appendChild($img);
                } else {
                    $li.append($img);
                }
            }
        }


        function makePreviewDOM(fileNames) {
            for (let fileName of fileNames) {
                checkExt(fileName);
            }
        }


        (function () {



            const $inputThumbnail = document.querySelector('.inputThumbnail');

            $inputThumbnail.onchange = e => {


                console.log($inputThumbnail.files[0]);


                const formData = new FormData();

                for (let files of $inputThumbnail.files) {
                    formData.append('files', files);
                }

                const Obj = {
                    method: 'POST',
                    body: formData
                }


                fetch('/ajax-upload', Obj)
                    .then(res => res.json())
                    .then(fileNames => {
                        makePreviewDOM(fileNames);
                    }).catch(err => {
                        alert('썸네일 미리보기 화면 요청(비동기) 처리를 위한 서버와의 통신 실패:', err);
                    })

            };
        })();
    </script>


    <!-- 프로젝트 당시 썼던 스크립트 영역 -->
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
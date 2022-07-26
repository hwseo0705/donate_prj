<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        .qDetail {
            width: 60%;
            margin-left: 40px;
            margin-top: 70px;
        }

        .qDetail .list {
            margin-top: 30px;
            border-top: 1px solid #000;
            margin-bottom: 30px;
        }

        .qDetail .list .group {
            width: 30%;
        }


        .qDetail .list .group label {
            margin-top: 30px;
            font-size: 30px;
            width: 100%;
        }

        .qDetail .list .group li {
            margin-top: 10px;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <div class="qDetail">
        <h1> Q&A </h1>

        <div class="list">
            <div class="group">
                <label for="">작성자 id</label>
                <div class="li">${you.userId}</div>
            </div>
            <div class="group">

                <label for="">작성일</label>
                <div class="li">${you.questionDate}</div>
            </div>
            <div class="group">
                <label for="">질문 </label>
                <div class="li">${you.content}</div>
            </div>

        </div>
        <button type="button" class="btn btn-warning" id="qna-modify"> 수정 </button>

        <button type="button" class="btn btn-danger" id="qna-remove"> 삭제 </button>

        <button type="button" class="btn btn-dark" id="qna-list"> 목록 </button>

    </div>


    <script>
        function modiButton() {
            const $modi = document.getElementById('qna-modify');
            // 수정하는 이벤트 
            $modi.onclick = e => {
                location.href = '/qmodi';
            }

        }


        function reomButton() {
            // 제거하는 이벤트 
            const $remo = document.getElementById('qna-remove');

            $remo.onclick = e => {
                location.href = '/qdelete';
            }

        }


        function listButton() {
            // 리스트로 돌아가는 이벤트 
            const $list = document.getElementById('qna-list');

            $list.onclick = e => {
                location.href = '/qna';
            }

        }

        (function () {
            modiButton();
            reomButton();
            listButton();
        })();
    </script>
</body>



</html>
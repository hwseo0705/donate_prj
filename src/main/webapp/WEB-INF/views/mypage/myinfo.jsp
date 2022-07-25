<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        /* reset */
        a {
            color: inherit;
            text-decoration: none;
        }


        .top-banner {
            background: rgb(227, 223, 223);
        }


        .top-banner .my-section {
            width: 40%;
            margin: auto;
            display: flex;
            text-align: center;
        }


        .top-banner .my-section div {
            padding: 20px;
            box-sizing: border-box;
        }

        .top-banner .my-section div:hover {
            border-bottom: 1px solid #000;

        }

        .top-banner .my-section .mypage {
            flex: 1;
            text-align: center;
            padding: 20px;
        }

        .top-banner .my-section .mydonation {
            flex: 1;
        }

        .top-banner .my-section .myboard {
            flex: 1;
        }

        .my-info {
            width: 60%;
            margin-left: 30px;
        }
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>



    <div class="section">

        <div class="top-banner">

            <div class="my-section">
                <div class="mypage"><a href="/myinfo/${my.userId}">내정보</a></div>
                <div class="mydonation"><a href="/mydonation/${my.userId}">내기부</a></div>
                <div class="myboard"><a href="/myboard/${my.userId}">나의글</a></div>
            </div>
        </div>

        <div class="my-info">
            <h1>회원정보</h1>

            <form action="/modiUser" method="post">

                <input type="hidden" name="boardNo" value="${b.boardNo}">


                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">아이디</label>
                    <input disabled type="text" class="form-control" id="exampleFormControlInput1" placeholder="아이디"
                        name="userId" value="${my.userId}">
                </div>

                <input hidden type="password" name="password" value="${my.password}">

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">이름</label>
                    <input disabled type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름"
                        name="name" value="${my.name}">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">이메일</label>
                    <input disabled type="text" class="form-control" id="exampleFormControlInput1" placeholder="이메일"
                        name="email" value="${my.email}">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">보유금액</label>
                    <input disabled type="text" class="form-control" id="exampleFormControlInput1" placeholder="보유금액"
                        name="money" value="${my.money}">
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="cash-btn" type="button" class="btn btn-success">캐시충전</button>
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button hidden id="done-btn" type="submit" class="btn btn-secondary">수정완료</button>
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="del-btn" type="button" class="btn btn-danger">탈퇴</button>
                </div>

            </form>

        </div>


    </div>


    <script>
        // 회원정보 수정 이벤트
        function modifyEvent() {
            const $modify = document.querySelector('#mod-btn');
            const $form = document.querySelectorAll('.form-control')
            const $done = document.getElementById('done-btn');

            // 수정 누르면 수정완료 버튼 생성, disabled remove
            $modify.onclick = e => {

                console.log('clicked');

                for (let i = 0; i < $form.length - 1; i++) {
                    $form[i].removeAttribute('disabled');
                }

                $done.removeAttribute('hidden');

            };

            // // 수정 완료 버튼 누르면 다시 disabled
            // $done.onclick = e => {
            //     $done.hidden = true;
            //     for (let i = 0; i < $form.length; i++) {
            //         // $form[i].disabled = true;
            //     }

            //     //location.href = '/mypage';
            // }
        }

        // 캐시충전 이벤트 (미완성)
        function cashEvent() {
            const $cashBtn = document.getElementById('cash-btn');

            // cash amount 입력 받는 창
            $cashBtn.onclick = e => {
                console.log('cash event clicked');
                var cash = +prompt("캐시를 얼마 충전하시겠습니까?");
                location.href = '/upCash/' + '${my.userId}/' + cash;

            }
        }

        // 회원탈퇴 이벤트 (미완성)
        function deleteEvent() {
            const $delBtn = document.getElementById('del-btn');

            $delBtn.onclick = e => {
                var proceed = confirm("정말로 탈퇴하시겠습니까?");

                if (proceed) {
                    location.href = '/delUser/' + '${my.userId}';
                }
            }
        }

        (function () {
            modifyEvent();
            cashEvent();
            deleteEvent();
        })();
    </script>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        .wrap {
            width: 90%;
        }


        .inputbtn {
            margin-top: 30px;

        }

        .lnr-heart {
            margin-right: 5px;
            color: red;
        }

        .pink {
            background: rgb(174, 16, 111);
            border: 1px solid rgb(174, 16, 111);
        }

        .pink:hover {
            background: rgb(131, 2, 79);
            border: 1px solid rgb(131, 2, 79);

        }
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>


    <div class="wrap">
        <div class="main-detail">
            <h1 class="title">${b.title}</h1>
            <p class="writer">${b.writer}</p>
            <p class="date">${b.startDate} ~ ${b.endDate}</p>
            <p class="content"> ${b.content}</p>
        </div>

        <div class="money-detail">
            <div class="current">
                <p>${b.currentMoney}원</p>
            </div>
            <div class="target">
                <p>${b.targetMoney} 목표</p>

            </div>
        </div>

        <div class="btn-group" role="group" aria-label="Basic example">
            <button type="button" id="like-btn" class="pink btn btn-primary"><small class="text-muted"><span
                        class="lnr lnr-heart"></span></small>응원 ${b.likeCnt}</button>
            <button type="button" id="share-btn" class="pink btn btn-primary">공유</button>
            <button type="button" id="donate-btn" class="pink btn btn-primary">기부하기</button>
        </div>
        <div class="inputbtn">
            <form hidden action="/donateMoney/${b.boardNo}?userId=${y.userId}&title=${b.title}" method="post"
                id="inputdonation">
                <input type="number" name="money">
                <div class="invalid-feedback">
                    비정상적 입력입니다.
                </div>
                <button type="button" class="btn btn-primary donate">기부확인</button>
            </form>
        </div>

        <div id="hidden-btn" class="btn-group" role="group" aria-label="Basic example">

            <button hidden type="button" id="mod-btn" class="btn btn-primary">수정하기</button>
            <button hidden type="button" id="del-btn" class="btn btn-primary">삭제하기</button>
        </div>


    </div>


    <script>
        function hiddenBtn() {
            // const $hiddenBtn = document.getElementById('hidden-btn');
            if ('${b.writer}' === '${y.userId}') {
                modButton();
                delButton();
            }
        }

        function modButton() {
            const $modBtn = document.getElementById('mod-btn');

            $modBtn.hidden = false;

            $modBtn.onclick = e => {
                location.href = '/modify/${boardNo}';
            }
        }

        function delButton() {
            const $delBtn = document.getElementById('del-btn');


            $delBtn.hidden = false;

            $delBtn.onclick = e => {
                var proceed = confirm("정말로 삭제하시겠습니까?");
                if (proceed) {
                    location.href = '/remove?boardNo=${boardNo}';
                }
            }
        }


        function upLikeResult() {
            // console.log('lr:', '${likeResult}');
            if ('${likeResult}' === 'true') {
                alert('${b.boardNo}번 게시물을 응원하였습니다.');
            } else if ('${likeResult}' === 'false') {
                alert('이미 응원하고 있는 게시물입니다.');
            }
        }


        function upLikeCnt() {
            const $likeBtn = document.getElementById('like-btn');
            if ('${y.userId}' !== '') {

                $likeBtn.onclick = e => {
                    console.log('like clicked');

                    location.href = '/uplike/' + '${b.boardNo}/' + '${y.userId}';
                }
            }

        }

        function donate() {
            const $donateBtn = document.getElementById('donate-btn');
            // 히든인 인풋창 가져옴 
            const $donationinput = document.getElementById('inputdonation');
            if ('${y.userId}' !== '') {

                $donateBtn.onclick = e => {

                    // 히든을 지움 
                    $donationinput.hidden = false;
                    // console.log('donate clicked');
                    // location.href='/donate'

                    console.log('donate clicked');
                    // location.href = '/donate'

                }
            }
        }

        const $dBtn = document.querySelector('.donate');
        $dBtn.addEventListener('click', e => {
            const $dMoney = $dBtn.previousElementSibling.previousElementSibling.value;
            if ($dMoney < 1) {
                $dBtn.previousElementSibling.style.display = 'block';
                return;
            }
            $dBtn.parentElement.submit();
        });

        const no = '${no}';
        console.log(no);
        if (no === '1') {
            alert('현재 잔액이 부족합니다. 잔액을 확인해 주세요.')
        }

        (function () {
            upLikeCnt();
            donate();
            upLikeResult();
            hiddenBtn();
        })();
    </script>



    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>
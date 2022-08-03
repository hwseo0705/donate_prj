<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>

    <style>
        .wrapper {
            /* width: 70%; */
            /* background: tomato; */
            margin: 0 auto;
        }
        section.main {
            width: 70%;
            margin: 0 auto;
        }

        .center-list {
            margin-top: 100px;
            /* background: yellowgreen; */
        }

        .list-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .list-bottom .paging {
            flex: 9;
            padding-left: 50px;
        }

        .list-bottom .btn-write {
            flex: 1;
            display: flex;
            justify-content: flex-end;
        }

        .hidden {
            display: none !important;
        }

        .bd-placeholder-img:hover {
            cursor: pointer;
        }

        .lnr-heart {
            margin-right: 5px;
            color: #ff0000;
            font-weight: 700;
        }
    </style>
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <div class="wrapper">
        <section class="main">
            <div class="center-list">

                <!-- 최신순, 오래된 순 정렬 기능 -->


                <!-- 모금글 -->
                <ul class="list row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                    <c:forEach var="db" items="${dbList}">
                        <div class="col">
                            <div class="card shadow-sm">
                                <div class="hidden">${db.boardNo}</div>
                                <img data-bno="${db.boardNo}" class="thumbnail bd-placeholder-img card-img-top" width="100%" height="225"
                                    src="${db.thumbnail}" role="img" aria-label="Placeholder: Thumbnail"
                                    preserveAspectRatio="xMidYMid slice" focusable="false">
                                <title>Placeholder</title>
                                <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                                    dy=".3em"></text></img>

                                <div class="card-body">
                                    <p class="card-text">${db.title}</p>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <div class="btn-group">
                                                <p># 목표 모금액 : ${db.targetMoney}</p>
                                            </div>

                                            <br>

                                            <div class="btn-group">
                                                <p># 현재 모금액 : ${db.currentMoney}</p>
                                            </div>
                                        </div>


                                        <small class="text-muted"><span class="lnr lnr-heart"></span>${db.likeCnt}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </ul>
            </div>


            <div class="list-bottom">
                <!-- 페이지 버튼 -->
                <div class="paging">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-lg pagination-custom">

                            <c:if test="${pm.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/main?pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}&keyword=${search.keyword}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/main?pageNum=${n}&amount=${pm.getPage().getAmount()}&keyword=${search.keyword}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/main?pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}&keyword=${search.keyword}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>


                <!-- 글쓰기 버튼 영역 -->
                <div class="btn-write">
                    <a class="btn btn-outline-danger btn-lg">글쓰기</a>
                </div>
            </div>
        </section>
    </div>


    <%@ include file="../include/footer.jsp" %>


    <script>

        function ajaxLoadingThumbnail() {
            
            // 한 페이지에 로딩된 썸네일 이미지들을 다 잡아오자.
            const $thumbImgList = document.querySelectorAll('.thumbnail');

            for (let $img of $thumbImgList) {
                const filePath = $img.getAttribute('src');
                
                let originFileName = filePath.substring(filePath.indexOf('_') + 1);
                
                if (filePath.trim() === '') {
                    $img.setAttribute('src', '/img/defaultThumbnail.jpg');
                    $img.setAttribute('alt', '기본 썸네일');

                } else {
                    $img.setAttribute('src', '/loadFile?fileName=' + filePath);
                    $img.setAttribute('alt', originFileName);
                }
            }

        }

        function detailRequestEvent() {
            //상세보기 요청 이벤트
            const $ul = document.querySelector(".list");

            // 테이블 자체에 한번 걸어서 자식 태그들이 버블링으로 자동으로 이벤트가 적용되게끔!!
            $ul.addEventListener('click', e => {
                console.log('e.target - ', e.target);

                if (!e.target.matches('img')) return; // td 구역이 아닌 곳(th 구간) 을 클릭하면 작동하지 않게 함.

                console.log('썸네일 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.textContent; //
                console.log('글번호: ' + bn);

                location.href = '/detail/' + bn + '?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}';
            });
        }

        function noLoginNoWrite() {
            const $writeBtn = document.querySelector('.btn-write');

            $writeBtn.addEventListener('click', e => {
                if ('${y.userId}' === '') {
                    alert('로그인이 필요한 서비스입니다.');
                } else {
                    location.href = '/write';
                }
            });
        }


        // 즉시 실행 함수
        (function () {
            detailRequestEvent();
            noLoginNoWrite();
            ajaxLoadingThumbnail();
        }) ();


    </script>

</body>

</html>
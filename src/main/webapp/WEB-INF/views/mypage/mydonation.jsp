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

        .my-donation {
            width: 60%;
        }

        .my-donation {
            width: 60%;
        }

        .my-donation h1 {
            margin: 40px 0 40px 30px;
        }

        .my-donation .table {
            margin-left: 20px;
        }

        /* paging */
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

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <div class="section">

        <div class="top-banner">

            <div class="my-section">
                <div class="mypage"><a href="/myinfo/${y.userId}">내정보</a></div>
                <div class="mydonation"><a href="/mydonation/${y.userId}">내기부</a></div>
                <div class="myboard"><a href="/myboard/${y.userId}">나의글</a></div>
            </div>
        </div>

        <div class="my-donation">
            <h1>내가 기부한 목록</h1>
            <table class="table table-striped table-hover articles">
                <tr>
                    <th>기부 번호</th>
                    <th>기부 이름</th>
                    <th>기부자</th>
                    <th>기부액</th>
                </tr>
                <c:forEach var="d" items="${dList}">
                    <tr>
                        <td>${d.boardNo}</td>
                        <td>${d.title}</td>
                        <td>${d.userId}</td>
                        <td>${d.donateMoney}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="list-bottom">
            <!-- 페이지 버튼 -->
            <div class="paging">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg pagination-custom">

                        <c:if test="${pm.prev}">
                            <li class="page-item"><a class="page-link"
                                    href="/mydonation?pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}">Prev</a>
                            </li>
                        </c:if>

                        <!-- step=1인 경우,, 생략 가능!! -->
                        <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li data-page-num="${n}" class="page-item"><a class="page-link"
                                    href="/mydonation?pageNum=${n}&amount=${pm.getPage().getAmount()}">${n}</a>
                            </li>
                        </c:forEach>


                        <c:if test="${pm.next}">
                            <li class="page-item"><a class="page-link"
                                    href="/mydonation?pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>

    </div>

    <script>
        function detailEvent() {
            //상세보기 요청 이벤트
            const $table = document.querySelector(".articles");

            $table.addEventListener('click', e => {


                if (!e.target.matches('.articles td')) return;

                console.log('tr 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.textContent;
                console.log('글번호: ' + bn);
                location.href = '/detail/' + bn;
            });
        }
        (function () {
            detailEvent();
        })();
    </script>



    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>
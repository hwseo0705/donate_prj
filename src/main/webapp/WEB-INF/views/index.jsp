<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="include/static-head.jsp" %>

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
    </style>
</head>

<body>

    <%@ include file="include/header.jsp" %>

    <div class="wrapper">
        <section class="main">
            <div class="center-list">

                <!-- 최신순, 오래된 순 정렬 기능 -->


                <!-- 모금글 -->
                <ul class="list row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                    <c:forEach var="db" items="${dbList}">
                        <div class="col">
                            <div class="card shadow-sm">
                                <img class="bd-placeholder-img card-img-top" width="100%" height="225"
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
                                                # 목표 모금액
                                                <button type="button"
                                                    class="btn btn-sm btn-outline-secondary">${db.targetMoney}</button>
                                            </div>
                                            
                                            <br>

                                            <div class="btn-group">
                                                # 현재 모금액
                                                <button type="button"
                                                    class="btn btn-sm btn-outline-secondary">${db.currentMoney}</button>
                                            </div>
                                        </div>

                                        <small class="text-muted">좋아요 수??</small>

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
                    <a class="btn btn-outline-danger btn-lg" href="/write">글쓰기</a>
                </div>
            </div>
        </section>
    </div>


    <%@ include file="include/footer.jsp" %>


</body>

</html>
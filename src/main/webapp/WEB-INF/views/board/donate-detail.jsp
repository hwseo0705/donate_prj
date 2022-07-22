<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        .body {
            height: 1000px;
        }

        .wrap {
            width: 90%;
        }
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>


    <div class="wrap">
        <div class="main-detail">
            <h1 class="title">${b.title}</h1>
            <p class="writer">${b.  writer}</p>
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
            <button type="button" class="like-cnt btn btn-primary">응원 ${b.likeCnt}</button>
            <button type="button" class="share btn btn-primary">공유</button>
            <button type="button" class="donate btn btn-primary">기부하기</button>
        </div>

    </div>

    <script>

        // 기부하기 onclick -> 기부하기 페이지

    </script>


    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="include/static-head.jsp" %>

    <style>

        .wrap {
            width: 80%;
        }

        .board-list {
            width: 70%;
            margin: 230px auto 0;
        }

        .board-list .articles {
            margin: 10px auto 100px;
            border-collapse: collapse;
            font-size: 1.5em;
            border-radius: 10px;
        }


    </style>
</head>

<body>

    <div class="wrap">

        <table class="table table-dark table-striped table-hover articles">
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>응원수</th>
                <th>시작일</th>
                <th>종료일</th>
            </tr>

            <c:forEach var="b" items="${bList}">
                <tr>
                    <td>${b.boardNo}</td>
                    <td>${b.writer}</td>
                    <td title="${b.title}">
                        ${b.title}
                    </td>
                    <td>${b.likeCnt}</td>
                    <td>${b.startDate}</td>
                    <td>${b.endDate}</td>
                </tr>
            </c:forEach>
        </table>


    </div>


</body>

</html>
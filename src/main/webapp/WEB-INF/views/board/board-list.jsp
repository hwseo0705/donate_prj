<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>

<body>

    <h1>들어왔네 </h1>
    <c:choose>
        <c:when test="${not empty y}">

            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2">${y.name}님 안녕하세요 </button>
                <button type="button" class="btn btn-warning">logout</button>
            </div>
        </c:when>
        <c:when test="${empty y}">
            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2">login</button>
                <button type="button" class="btn btn-warning">Sign-up</button>
            </div>
        </c:when>
    </c:choose>

    <!-- <c:choose>
        <c:when test="${1 > hobbys2.size()}">
            빈 리스트 입니다.
            <br>
        </c:when>
    </c:choose> -->


    <ul>
        <li>
            ${y.name} 님 안녕하세요 !
        </li>
        <li>
            ${save.name} 님이 가입하셧습니다.!
        </li>
    </ul>
</body>

</html>
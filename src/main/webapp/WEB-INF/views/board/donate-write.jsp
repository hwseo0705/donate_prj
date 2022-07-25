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
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <form action="/write" method="post">

        <input type="hidden" name="boardNo" value="${b.boardNo}">

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name="title">
        </div>

        <input hidden type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer" value="${y.userId}">

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">썸네일</label>
            <select class="form-select" name="thumbnail" id="thumbnail">
                <option value="/img/example1.jpg">유니세프 로고</option>
                <option value="/img/example2.jpg">세이브 더 칠드런 로고</option>
                <option value="/img/example3.jpg">굿네이버스 로고</option>
                <option value="/img/example4.jpg">월드비전 로고</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">목표 모금액</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="목표모금액을 입력하세요" name="targetMoney">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">시작일</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="yy-mm-dd"
                name="startDate">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">종료일</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="yy-mm-dd" name="endDate">
        </div>


        <div class="btn-group btn-group-lg custom-btn-group" role="group">
            <button id="mod-btn" type="submit" class="btn btn-danger">완료</button>
            <button type="button" class="btn btn-dark">목록</button>
        </div>

    </form>

    </div>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>
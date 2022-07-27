<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        .qnaSection {
            width: 60%;
            margin-left: 30px;
            margin-top: 30px;
        }

        .qnaSection h2 {
            margin: 20px 0;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>



    <!-- {modi.qnaNo}  여기의 글 번호 -->

    <div class="qnaSection">
        <h2> ${y.name} 님의 고충을 적어주세요 </h2>
        <form action="/qmodi/${modi.qnaNo}" method="post">
            <input type="hidden" name="userId" value="${y.userId}">
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">사용자 이름</label>
                <input disabled type="text" class="form-control" id="formGroupExampleInput2" placeholder="${y.name}"
                    name="name" value="${y.name}">
            </div>

            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">건의 사항 </label>
                <textarea required type="text" class="form-control" id="formGroupExampleInput2" name="content"
                    minlength="5"></textarea>

            </div>

            <button type="submit" id="qna-write">내용 수정 완료 </button>
        </form>

    </div>

</body>



</html>
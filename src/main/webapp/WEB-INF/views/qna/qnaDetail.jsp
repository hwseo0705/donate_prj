<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>


</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>


    <h1> 디테일 나오는 곳이야 ~ </h1>

    <ul>
        <label for="">작성자 id</label>
        <li>${you.userId}</li>
        <label for="">질문 </label>
        <li>${you.content}</li>
    </ul>

    <button type="button" id="qna-modify"> 수정  </button>

    <button type="button" id="qna-remove"> 삭제  </button>

    <button type="button" id="qna-list"> 목록 </button>

    

    <script>


        function modiButton() {
            const $modi = document.getElementById('qna-modify');
                // 수정하는 이벤트 
            $modi.onclick = e => {
                location.href = '/qmodi';
            }
           
        }
        
          
        function reomButton() {
            // 제거하는 이벤트 
            const $remo = document.getElementById('qna-remove');

            $remo.onclick = e => {
                location.href = '/qdelete';
            }
      
        }

            
        function listButton() {
            // 리스트로 돌아가는 이벤트 
            const $list = document.getElementById('qna-list');

            $list.onclick = e => {
                location.href = '/qna';
            }
      
        }

        (function () {
            modiButton();
            reomButton();
            listButton();
        })();



    </script>


</body>



</html>
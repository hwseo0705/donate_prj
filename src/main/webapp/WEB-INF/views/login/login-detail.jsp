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

        <h1>들어왔냐 </h1>
        <form action="/login" method="post">
                <!-- action="/board/list" 정보가 갈곳 -->

                <input type="text" name="userId" id="123">
                <input type="text" name="password" id="456">

                <button type="submit">로그인</button>
            
        </form>


        <script>
                const msg = '${msg}';
                console.log(msg);
                if (msg === '1') {
                        alert('아이디가 없어')
                } else if (msg === '2') {
                        alert('비번틀렸어');
                }
        </script>


</body>
</html>
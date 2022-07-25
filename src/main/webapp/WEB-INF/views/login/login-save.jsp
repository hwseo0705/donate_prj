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

        <h1>회원 가입하자 </h1>
        <form action="/login/save" method="post">
                <!-- action="/board/list" 정보가 갈곳 -->
                

                아이디   : <input type="text" name="userId"  maxlength="25">
                <br>
                비밀번호 : <input type="text" name="password" maxlength="50">
                <br>
                이름     :<input type="text" name="name" maxlength="25">
                <br>
                이메일   :<input type="text" name="email"  maxlength="25">
                <br>
                돈       :<input type="text" name="money"  maxlength="10">


                <button type="submit">회원 가입</button>
            
        </form>




        <script>
                const msg = '${msg2}';
                console.log(msg);
                if (msg === '1') {
                        alert('이미 있는 아이디야 ')
                } 
        </script>


</body>
</html>
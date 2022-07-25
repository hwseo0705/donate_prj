<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="include/static-head.jsp" %>

    <style>
        body {
            height: 100vh;
        }

        .wrapper {
            position: relative;
            width: 70%;
            height: 80vh;
            margin: 0 auto;
        }

        .wrapper .target {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }


        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

</head>

<body>

    <div class="wrapper text-center">
        <section class="target form-signin w-100 m-auto">
            <form action="/login/login" method="post"> 
                <!-- 경로 주의 나중에 /login로 바꿔야됨  -->
                <img class="mb-4" src="/img/logo2.jpg" alt="" width="150" height="150">
                <h1 class="h3 mb-3 fw-normal">Please Login</h1>

                <div class="form-floating">
                    <input type="id" class="form-control" id="floatingInput" placeholder="kim1234" name="userId">
                    <label for="floatingInput">ID</label>

                </div>


                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password"
                        name="password">
                    <label for="floatingPassword">Password</label>

                </div>


                <div class="checkbox mb-3">
                    <label>
                        <!-- 자동 로그인 또는 id 부분 자동 기억 기능 부분인듯 -->
                        <!-- <input type="hidden" value="remember-me"> 내 ID 기억하기 -->
                    </label>
                </div>


                <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2022 Donate Project SL ACADEMY Team2</p>

            </form>
        </section>
    </div>


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
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
    /* .container2 .search-join .wrap {
        background-color: aqua;
    }

    .container2 .search-join .btn-outline-light {
        background: green;
        position: relative;
    }

    .container2 .search-join .btn-outline-light:hover {}

    .container2 .search-join .list-box {
        width: 100px;
        height: 100px;
        float: left;
        position: absolute;
         텍스트 중앙정렬 
        line-height: 100px;
        text-align: center;
        background: yellow;

    }

    .container2 .search-join .btn-warning {
        float: right;
    } */
</style>

<header class="p-3">
    <div class="container2">

        <h1 class="logo">
            <a href="/main">
                <!-- 경로 수정 -->
                <img id="logo" src="/img/logo2.jpg" alt="로고이미지">
            </a>
        </h1>
        <ul class="nav">
            <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 text-white">Donate</a></li>
            <li><a href="#" class="nav-link px-2 text-white">Community</a></li>
            <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
            <li><a href="#" class="nav-link px-2 text-white">About</a></li>
        </ul>

        <div class="search-join">
            <form class="/" role="search">
                <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..."
                    aria-label="Search" name="keyword">
            </form>

            <c:choose>
     
                <c:when test="${not empty y}">
                    <div class="wrap">
                        <div class="text-end">
                            <button type="button" class="btn btn-outline-light me-2">${y.name}님 안녕하세요
                            </button>
                            <div class="list-box">
                                <ul>
                                    <li><a href="">1</a></li>
                                    <li><a href="">2</a></li>
                                    <li><a href="">3</a></li>
                                </ul>
                            </div>
                            <button type="button" class="btn btn-warning"><a href="login/logout">logout</a></button>
                        </div>
                    </div>
                </c:when>

                <c:when test="${empty y}">
                    <div class="text-end">
                        <button type="button" class="btn btn-outline-light me-2"><a
                                href="login/login">login</a></button>
                        <button type="button" class="btn btn-warning"><a href="login/register">Sign-up</a></button>
                    </div>
                </c:when>
            </c:choose>



        </div>

    </div>

    <script>
        // 로그인 버튼 클릭 이벤트
        function loginRequestEvent() {
            // 로그인 화면 요청이 들어가야함

            const $loginBtn = document.querySelector('.text-end').firstElementChild;

            $loginBtn.addEventListener('click', e => {

                location.href = '/login';
            });
        }

        // 회원가입 버튼 클릭 이벤트
        function signUpRequestEvent() {
            // 회원가입 화면 요청이 들어가야 함

            const $signUpBtn = document.querySelector('.text-end').lastElementChild;

            $signUpBtn.addEventListener('click', e => {

                location.href = '/register';
            });
        }


        // 함수 실행부
        (function () {
            loginRequestEvent();
            signUpRequestEvent();


        })();
    </script>
</header>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="include/static-head.jsp" %>

    <style>

        .invalid-feedback {
            /* display: block; */
        }

    </style>

</head>

<body class="bg-light">

    <div class="container">
        <section>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="/img/logo2.jpg" alt="" width="150" height="100">
                <h2>회원가입 하기</h2>
                <p class="lead">아래 화면의 항목을 빠짐없이 입력해주세요.</p>
            </div>

            <!-- <div class="col-md-7 col-lg-8"> -->
            <div class="col-12 center">

                <form id="reg-form" action="/register" method="post" class="needs-validation" novalidate>
                    <div>
                        <!-- class="row g-3" -->
                        <!-- <div class="col-sm-6"> -->


                        <div class="col-12">
                            <label for="userId" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="userId" id="userId" placeholder="로그인시 사용할 id를 입력하세요."
                                value="" required maxlength="15">
                            <!-- required = 필수값이란뜻  -->
                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>

                        <br>

                        <div class="col-12">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="10글자 이내로 작성하세요."
                                required maxlength="15">

                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>

                        <br>

                        <div class="col-12">
                            <label for="name" class="form-label">이름</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="성함을 입력하세요." required maxlength="5">
                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>

                        <br>

                        <div class="col-12">
                            <!-- <span class="text-muted">(Optional)</span> -->
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="you@example.com" maxlength="25">
                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>

                        <br>

                        <!-- <div class="col-12">
                
                  <label for="email" class="form-label">money</label>
                  <input type="number" class="form-control" id="email" placeholder="100000">
                  <div class="invalid-feedback">
                    필수입력 항목입니다.
                  </div>
                </div>
     -->


                        <!-- <div class="col-md-5">
                  <label for="country" class="form-label">Country</label>
                  <select class="form-select" id="country" required>
                    <option value="">Choose...</option>
                    <option>United States</option>
                  </select>
                  <div class="invalid-feedback">
                    Please select a valid country.
                  </div>
                </div>
    
                <div class="col-md-4">
                  <label for="state" class="form-label">State</label>
                  <select class="form-select" id="state" required>
                    <option value="">Choose...</option>
                    <option>California</option>
                  </select>
                  <div class="invalid-feedback">
                    Please provide a valid state.
                  </div>
                </div> -->

                    </div>


                    <hr class="my-4">

                    <button type="button" class="w-100 btn btn-primary btn-lg register-btn">회원가입</button>
                </form>
            </div>
    </div>
    </section>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2022 Donate Project SL ACADEMY Team2</p>
    </footer>
    </div>
</body>


<script>
    const msg = '${msg}';
    const regtister = '${register}';
    console.log(msg);
    if (msg === '1') {
        alert('${register}는 있는 아아디 입니다.')
    } else if (msg === '2') {
        alert('가입에 성공하셨습니다.');
    }


    // 회원가입시 입력사항들 다 입력했는지 확인하고 넘기기
    const $registerBtn = document.querySelector('.register-btn');

    $registerBtn.addEventListener('click', e => {
        for (let c of checkArr) {
            if (c === false) {
                return;
            }
        }

        $regForm.submit();

    });

    

    const $regForm = document.getElementById('reg-form');
    const $inputGroup = $regForm.querySelectorAll('input');
    
    const checkArr = [false, false, false, false];

    $regForm.onkeyup = e => {

        // console.log('keyup: ', e.target.value);


        // 검증
        const [$id, $pw, $name, $email] = [...$inputGroup];

        // 1. id가 공란인지 확인
        if ($id.value.trim() === '') {
            $id.nextElementSibling.style.display='block';
            checkArr[0] = false;
        } else {
            $id.nextElementSibling.style.display='none';
            checkArr[0] = true;
        }

        // 2. pw가 공란인지 확인
        if ($pw.value.trim() === '') {
            $pw.nextElementSibling.style.display='block';
            checkArr[1] = false;
        } else {
            $pw.nextElementSibling.style.display='none';
            checkArr[1] = true;
        }

        // 3. name이 공란인지 확인
        if ($name.value.trim() === '') {
            $name.nextElementSibling.style.display='block';
            checkArr[2] = false;
        } else {
            $name.nextElementSibling.style.display='none';
            checkArr[2] = true;
        }


        // 4. email이 공란인지 확인
        if ($email.value.trim() === '') {
            $email.nextElementSibling.style.display='block';
            checkArr[3] = false;
        } else {
            $email.nextElementSibling.style.display='none';
            checkArr[3] = true;
        }
    };
    

    // 즉시 실행 함수
    (function() {

    })();

</script>



</html>
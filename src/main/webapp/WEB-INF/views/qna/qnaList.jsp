<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        .faq {
            width: 60%;
        }

        .faq {
            width: 60%;
        }

        .faq h1 {
            margin: 40px 0 40px 30px;
        }

        .faq .table {
            margin-left: 20px;
        }

                /* paging */
                .list-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .list-bottom .paging {
            flex: 9;
            padding-left: 50px;
        }

        .list-bottom .btn-write {
            flex: 1;
            display: flex;
            justify-content: flex-end;
        }

        .hidden {
            display: none !important;
        }

        .bd-placeholder-img:hover {
            cursor: pointer;
        }

        #qna-btn {
            margin-left: 20px;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <div class="faq">
        <h1> QnA </h1>

        <table class="table table-striped table-hover articles">
            <tr>
                <th> 글 번호 </th>
                <th> 작성자 </th>
                <th> 내용 </th>
                <th> 작성시간 </th>
            </tr>

            <c:forEach var="q" items="${qnaList}">
                <tr>
                    <td>${q.qnaNo}</td>
                    <td>${q.userId}</td>
                    <td>${q.content}</td>
                    <td>${q.convertDate}</td>
                </tr>
            </c:forEach>
        </table>
        <div class="list-bottom">
            <!-- 페이지 버튼 -->
            <div class="paging">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg pagination-custom">

                        <c:if test="${pm.prev}">
                            <li class="page-item"><a class="page-link"
                                    href="/qna?pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}">Prev</a>
                            </li>
                        </c:if>

                        <!-- step=1인 경우,, 생략 가능!! -->
                        <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li data-page-num="${n}" class="page-item"><a class="page-link"
                                    href="/qna?pageNum=${n}&amount=${pm.getPage().getAmount()}">${n}</a>
                            </li>
                        </c:forEach>


                        <c:if test="${pm.next}">
                            <li class="page-item"><a class="page-link"
                                    href="/qna?pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>

        <button type="button" class="btn btn-secondary" id="qna-btn"> 질문 하기 </button>

    </div>

    <script>
        function detailEvent() {
            //상세보기 요청 이벤트
            const $table = document.querySelector(".articles");
            // querySelector = 태그를 가져옴 (.articles) = class 안에 articles이라는 값이 잇는 이라는 뜻 

            $table.addEventListener('click', e => { // 버블링 테이블 태그에 전체 다 클릭이벤트 걸어버림 


                if (!e.target.matches('.articles td')) return;
                // ! = 반대  //e.target = 내가 클릭한게 , matches = 매치가 되면  ,
                // .articles td = 클래스 articles 안에있는 td == .td 가 아니고 td 라서 태그를 가져온것 ! 
                console.log('tr 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.textContent;
                // bn 은 = e.target(클릭한놈의)parentElement(부모의)firstElementChild(첫번째자식의)textContent(내용이)다 
                console.log('글번호: ' + bn);

                location.href = '/qdetail/' + bn + "?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}";
                // 이렇게 하면 /qna/qnaDetail/ 이주소에  bn  값 들고가고 파라미터 pageNum 이랑 , amount 양도 함께 들고감 
                // 
            });
        }




        function writeButton() {
            const $qnaBtn = document.getElementById('qna-btn');

            
            $qnaBtn.onclick = e => {
                if('${y.userId}'===''){
                    location.href = '/login';
                    alert("로그인이 필요한 서비스입니다.")
                }
                else{
                    location.href = '/qwrite';
                }
            }
          
        }

        (function () {
            writeButton();
            detailEvent();
        })();
    </script>


</body>



</html>
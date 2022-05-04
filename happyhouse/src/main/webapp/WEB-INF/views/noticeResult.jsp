<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
    />
    <title>Happy House | 회원 정보</title>
</head>

<body>
<%@ include file= "/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">
    $(()=>{
        $("#delete-Btn").on("click", () => {
            location.href = "${root}/notice/delete/" + ${notice.articleNo};
        })
         $("#modify-Btn").on("click", () => {
            location.href = "${root}/notice/modify/" + ${notice.articleNo};
        })
        
    })
</script>
<div
        class="banner"
        style="
        background-image: url('http://happyhouse.jaen.kr/images/mainbg1.jpg');
        background-position: 50% 32%;
        background-size: cover;
      "
>
    <div class="banner-text">
        <h2 class="happyhouse">Happy House</h2>
        <hr style="color: white" />
        <!-- <div class="separator hc-element-invisible mt-10 animated hc-element-visible fadeIn" data-animation-effect="fadeIn" data-effect-delay="100"></div> -->
        <div style="color: white">행복한 우리집</div>
    </div>
</div>
<!-- //////////////////////// -->
<div class="signup-container">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li>&nbsp;> 회원 정보</li>
        </ol>
    </div>
</div>
<div
        class="main-container dark-translucent-bg"
        style="background-image: url('http://happyhouse.jaen.kr/images/background-img-6.jpg')"
>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-auto">
                <div
                        class="main hc-element-invisible"
                        data-animation-effect="fadeInUpSmall"
                        data-effect-delay="100"
                        style="color: black"
                >
                    <div class="form-block p-30 light-gray-bg border-clear" style="width: 1000px">
                        <h1 class="title" id="userinfo-title" style="color: gray">${notice.title}</h1>
                        <div style="font-size : 25px">
                            ${notice.text}
                        </div>
                        <c:if test="${!empty userinfo && userinfo.ID == 'admin'}">
                        <div>
                        	<button id = "delete-Btn" type="button" class="btn btn-danger">삭제</button>
                        	<button id = "modify-Btn" type="button" class="btn btn-primary">수정</button>
                    	</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //////////////////////// -->
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

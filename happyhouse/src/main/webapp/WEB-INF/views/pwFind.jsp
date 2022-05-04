<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <title>Happy House | 회원 가입</title>
</head>

<body>
   	<%@ include file= "/WEB-INF/views/include/header.jsp" %>
    <div class="banner" style="
        background-image: url('http://happyhouse.jaen.kr/images/mainbg1.jpg');
        background-position: 50% 32%;
      ">
        <div class="banner-text">
            <h2 class="happyhouse">Happy House</h2>
            <hr style="color: white" />
            <!-- <div class="separator hc-element-invisible mt-10 animated hc-element-visible fadeIn" data-animation-effect="fadeIn" data-effect-delay="100"></div> -->
            <div style="color: white">행복한 우리집</div>
        </div>
    </div>
    <div class="signup-container">
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li>&nbsp;> 비밀번호 찾기</a></li>
            </ol>
        </div>
    </div>

    <div class="main-container dark-translucent-bg"
        style="background-image: url('http://happyhouse.jaen.kr/images/background-img-6.jpg');">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <div class="main hc-element-invisible" data-animation-effect="fadeInUpSmall" data-effect-delay="100"
                        style="color: black;">
                        <div class="form-block p-30 light-gray-bg border-clear">
                            <h2 class="title" id="signup-title" style="color: gray;">비밀번호 찾기</h2>
					
                            <form class="form-horizontal" method = "post" action="${root}/user/pwFind">
                                <div class="form-group has-feedback row">
                                    <label for="inputUserName"
                                        class="col-md-3 control-label text-md-right col-form-label">이름
                                        <span class="text-danger small">*</span>
                                    </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="inputUserName"
                                            placeholder="User Name" required name="username" />
                                    </div>
                                </div>

                                <div class="form-group has-feedback row">
                                    <label for="inputId" class="col-md-3 control-label text-md-right col-form-label">아이디
                                        <span class="text-danger small">*</span>
                                    </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="inputId" placeholder="" required
                                            name="ID" />
                                    </div>
                                </div>
                                <div class="form-group has-feedback row">
                                    <label for="inputColNum"
                                        class="col-md-3 control-label text-md-right col-form-label">전화번호
                                        <span class="text-danger small">*</span>
                                    </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="inputColNum"
                                            placeholder="010-xxx-xxxx" required name="phone" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="ml-md-auto col-md-9">
                                        <button type="submit" id="sign-button"
                                            class="btn btn-group btn-warning btn-animated">비밀번호 찾기</button>
                                    </div>
                                </div>
                                
                                <c:if test = "${!empty FindedPw}">
                                	<div>비밀번호 : ${FindedPw}</div>
                                </c:if>
                            </form>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>

</html>
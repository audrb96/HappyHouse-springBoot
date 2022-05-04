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
    <title>Happy House | 공지 사항</title>
</head>

<body>
<%@ include file= "/WEB-INF/views/include/header.jsp" %>
<div
        class="banner"
        style="
        background-image: url('http://happyhouse.jaen.kr/images/mainbg1.jpg');
        background-position: 50% 32%;
      "
>
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
            <li><a href="${root}/">Home</a></li>
            <li>&nbsp;> 공지사항</li>
            <li> > 게시글 등록 </li>
        </ol>
    </div>
</div>
<div style="display: flex; justify-content: center; margin-top: 20px">
    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="sky">글쓰기</mark></h2>
            <form id="writeform" class="text-left mb-3" method="post" enctype="multipart/form-data" action="${root}/notice/registNotice">
                <div class="form-group">
                    <label for="subject" style="font-size: 20px">제목:</label>
                    <input type="text" class="form-control" id="subject" name="title" placeholder="제목...">
                </div>
                <div class="form-group">
                    <label for="content" style="font-size: 20px">내용:</label>
                    <textarea style="width: 100%; height: 800px;" class="form-control" rows="30" id="content" name="text"></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" id="registerBtn" class="btn btn-outline-primary">글작성</button>
                </div>
            </form>
        </div>
    </div>

</div>


<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

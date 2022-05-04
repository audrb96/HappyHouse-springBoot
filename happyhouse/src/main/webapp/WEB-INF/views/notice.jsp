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
<script>
    $(() => {
        $.ajax({
            url: "${root}/notice/noticeList",
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: (response) => {
                let NoticeList = ``;
                for (let i = 0; i < response.length; i++) {
                    // NoticeList += `<li><a class="dropdown-item">\${response.regcodes[i].name}</a></li>`;

                    let date = new Date(response[i].createTime);
                    let dateTime =  date.getUTCFullYear()+"." + (date.getUTCMonth()+1)+ "." + date.getUTCDate() + " " + date.getUTCHours() + ":" + date.getUTCMinutes() + ":" +date.getUTCSeconds();
                    console.log(response[i].createTime);
                    NoticeList += `
                    <tr style="cursor: pointer"  id="\${response[i].articleNo}" ><td id="\${response[i].articleNo}">\${response[i].articleNo}</td>
                        <td id="\${response[i].articleNo}" >\${response[i].title}</td>
                        <td id="\${response[i].articleNo}" >\${response[i].userId}</td>
                        <td id="\${response[i].articleNo}" >\${dateTime}</td>
                        <td id="\${response[i].articleNo}" >\${response[i].views}</td></tr>`
                }
                $("#table-body").empty().append(NoticeList);
            },
            error: (e) => {
                console.log(e);
            },
        });
        $(document).on("click", "#table-body > tr", (e) => {
            console.log(e.target);
            let articleNo = e.target.id;
            console.log(articleNo);
           location.href = "${root}/notice/mvResult/" + articleNo;

        } )

    });

</script>
<div
        class="banner"
        style="
        background-image: url('http://happyhouse.jaen.kr/images/mainbg1.jpg');
        background-position: 50% 32%;
      "
>
    <div class="banner-text">d
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
            <li> > 공지사항</li>
        </ol>
    </div>
</div>

    <div style="display: flex; justify-content: center; margin-top: 20px">
        <table class="table table-striped table-bordered table-hover" style="width: 60%">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody id="table-body">

            </tbody>
        </table>
    </div>
<c:if test="${!empty userinfo && userinfo.ID == 'admin'}">
    <div style="display: flex; justify-content: center">
        <div style="width: 60%">
            <a href="${root}/notice/mvRegist"><button type="button" class="btn btn-primary">등록</button></a>
        </div>
    </div>

</c:if>





<%--<div class="main-container dark-translucent-bg"--%>
<%--     style="background-image: url('http://happyhouse.jaen.kr/images/background-img-6.jpg');">--%>
<%--</div>--%>


<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

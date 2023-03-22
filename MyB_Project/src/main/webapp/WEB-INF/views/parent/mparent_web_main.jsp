<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">>
    <title>mwebmain</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/m_web_main.css">    
</head>
<body>
    <div class ="header_wrap">
    </div>

    <div class="profile_box"> 
        <div class="profile_icon"><img id="porfile_img" src="image/img.jpg"></div>
        <div class="child_name">   
            김수아
        </div>
        <div class="kindergarten_name">
            일일어린이집
        </div>
        <div class="kindergarten_class">
            개나리반
        </div>
    </div>

    <div class="parentmain_wrap">
        <div>
            <div id="noticebox_title">공지사항</div>
            <div class="notice_box">
                <table>
                    <thead>
                        <tr>
                            <td scope="col">제목</td>
                            <td scope="col">날짜</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row">제목입니다</td>
                            <td scope="row">230317</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="notice_list">더보기</div>
        </div>

        <div>
            <button type="button" class="gorequest_btn">요청사항 작성</button>
            <br>
            <button type="button" class="gorequestcheck_btn">요청사항 확인</button>
        </div>
    </div>
</body>

</html>
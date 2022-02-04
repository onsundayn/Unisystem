<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/webMail/mailboxes.css" rel="stylesheet">
<style>
    /*열 서식*/
    .check-area{
        width: 2px;
    }
    .important{
        width:1px;
    }
    .read-status{
        width: 1px;
    }
    .from{
        width: 300px;
        text-align: center;
    }
    .title{
        width: 500px;
        text-align: center;
    }
    .date{
        width: 200px;
        text-align: center;
    }
    .read-date{
		width: 200px;
		text-align: right;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name">수신확인</div>
                <div id="mail-count">
                	| <span> &nbsp;65</span>
                </div>
                <button id="redo"><i class="fas fa-redo fa-xs"></i></button>
                <div id="tools">
                    <div id="tools-left">
                        <input type="checkbox" class="checkbox">
                        <button style="margin-left: 10px;"><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
                        <button>전달</button>
                        <button style="margin-left: -4px;">다시보내기</button>
                    </div>
                    <div id="tools-right" align="right">
                        <select name="" id="search-option">
                            <option value="">전체</option>
                            <option value="">제목+내용</option>
                            <option value="">보낸사람</option>
                        </select>
                        <input type="search" name="" id="">
                        <button><i class="fas fa-search fa-sm" id="mail-search-btn"></i></button>
                    </div>
                </div>
            </header>
            <article>
                <table class="table table-hover" id="list">
                    <tbody>
                        <tr>
                            <td class="check-area"><input type="checkbox" class="checkbox"></td>
                            <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                            <td class="read-status"><i class="far fa-envelope-open"></i></td>
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from">김땡땡 교수님</td>
                            <td class="title">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                            <td class="read-date"><i class="far fa-envelope-open">&nbsp;&nbsp;2022-01-19 18:00</td>
                        </tr>
                        <tr>
                            <td class="check-area"><input type="checkbox" class="checkbox"></td>
                            <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                            <td class="read-status"><i class="far fa-envelope-open"></i></td>
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from">김땡땡 교수님</td>
                            <td class="title">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                            <td class="read-date"><i class="far fa-envelope-open">&nbsp;&nbsp;2022-01-19 18:00</td>
                        </tr>
                        <tr>
                            <td class="check-area"><input type="checkbox" class="checkbox"></td>
                            <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                            <td class="read-status"><i class="far fa-envelope-open"></i></td>
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from">김땡땡 교수님</td>
                            <td class="title">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                            <td class="read-date"><i class="far fa-envelope-open">&nbsp;&nbsp;2022-01-19 18:00</td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                  </div>

            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link href="resources/css/webMail/mailboxes.css" rel="stylesheet">
<style>
	#list{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="modals.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name"><i class="fa fa-address-book fa-lg" aria-hidden="true"></i>&nbsp;&nbsp; 주소록</div>
                <br>
                <div id="tools">
                    <div id="tools-left">
                        <button data-toggle="modal" data-target="#addContact"><span style="color:navy">+</span>&nbsp;추가</button>
                        <button data-toggle="modal" data-target="#deleteContact"><span style="color:red">-</span>&nbsp;삭제</button>
                        <button data-toggle="modal" data-target="#editContact">수정</button>
                        <button style="margin-left: -4px;">메일쓰기</button>
                    </div>
                    <div id="tools-right" align="right">
                        <select name="" id="search-option">
                            <option value="">전체</option>
                            <option value="">이름</option>
                            <option value="">연락처</option>
                        </select>
                        <input type="search" name="" id="">
                        <button><i class="fas fa-search fa-sm" id="mail-search-btn"></i></button>
                    </div>
                </div>
            </header>
            <article>
                <table class="table table-hover" id="list">
                    <tbody>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th><input type="checkbox" class="checkbox"></th>
                    		<th>No.</th>
                    		<th>이름</th>
                    		<th>이메일 주소</th>
                    		<th>연락처</th>
                    	</tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
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
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>
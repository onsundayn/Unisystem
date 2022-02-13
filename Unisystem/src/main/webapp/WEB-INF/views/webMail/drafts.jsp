<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/webMail/mailboxes.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name">임시 보관함</div>
                <div id="mail-count">
                	| <span> &nbsp;65</span>
                </div>
                <button id="redo"><i class="fas fa-redo fa-xs"></i></button>
                <div id="tools">
                    <div id="tools-left">
                        <input type="checkbox" class="checkbox">
                        <button style="margin-left: 10px;"><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
                        <button>전달</button>
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
                    	
                    </tbody>
                </table>
                
                <div class="container">
                	<ul class="pagination justify-content-center">

                    </ul>
                  </div>

            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			selectDraftList(1);
		});
		
		function selectDraftList(cPageNo){
			$.ajax({
				url:"webMail.selectDraftList",
				data:{currentPage:cPageNo, userNo:'${loginUser.userNo}'},
				success:function(result){
					
					let value = "";
					for(let i in result.list){
						value += "<tr>"
							   + 	"<input type='hidden' value='" + result.list[i].mailNo + "'>"
							   +	"<td class='check-area'><input type='checkbox' class='checkbox'></td>"
                    		   +	"<td class='read-status'><i class='far fa-envelope-open'></i></td>"
                    		   +	"<td class='att'><i class='fa fa-paperclip fa-sm' aria-hidden='true'></i></td>";
                    	if(result.list[i].userToNo == " "){
                    		value += "<td class='from overflow'>(받는이 없음)</td>"; 
                    	}else{
                    		value += "<td class='from overflow'>" + result.list[i].userToNo + "</td>";
                    	}
                    		   
 						value +=	"<td class='title'>" + result.list[i].title + "</td>"
 							   +	"<td class='date'>" + result.list[i].sendDate + "</td>"
 							   + "</tr>";
					}
				
					$("#list").html(value);
					
					let piValue = "";
					
					if(result.pi.currentPage == 1){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' href='webMail.draft?cpage=" + result.pi.currentPage-1 + "'>&lt;</a></li>";
					}
                    
					for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
						
						if(p == result.pi.currentPage){
							piValue += "<li class='page-item disabled active'><a class='page-link' href='webMail.draft?capge=" + p + "'>" + p + "</a></li>";
						}else{
							piValue += "<li class='page-item disabled'><a class='page-link' href='webMail.draft?capge=" + p + "'>" + p + "</a></li>";
						}
						
					}
	            	
					if(result.pi.currentPage == result.pi.maxPage){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
					}else{
						piValue += "<li class='page-item disabled'><a class='page-link' href='webMail.draft?cpage=" + result.pi.currentPage + 1 + "'>&gt;</a></li>"
					}
					
					$(".pagination").html(piValue);
					
				},error:function(){
					console.log("임시보관함 목록 조회용 ajax 통신 실패");
				}
				
			});
		}
	</script>
	
	<script>
		$(function(){
			$(document).on("click", "tr", function(){
				location.href = "webMail.writeForm?mNo=" + $(this).children("input").val();
				console.log($(this).children("input").val());
			})
		})
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>
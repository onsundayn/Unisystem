<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>

<style>
.sidewrap {
	float: left;
}

.bo_content {
	width: 1270px;
	float: left;
	background-color: white;
	margin-left: 30px;
	padding-bottom: 50px;
	float: right;
}

.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 207px;
}

#condition {
	width: 110px;
	display: inline-block;
	height: 30px;
}

#condition {
	width: 110px;
	display: inline-block;
	position: relative;
	left: 329px;
	top: -26px;
}

#condition .ctg {
	font-size: 13px;
	margin-left: 10px;
}

.grayWrap {
	width: 850px;
	height: 120px;
	background-color: rgb(224, 224, 224);
	margin: auto;
}

.grayWrap input {
	border: 1px solid lightgray;
	background-color: rgb(224, 224, 224);
	color: black;
	margin-top: 20px;
	margin-left: 20px;
	width: 420px;
	height: 42px;
}

.grayWrap span {
	font-weight: 700;
	color: rgb(52, 152, 219);
	margin-left: 20px;
	margin-top: 10px;
}

.grayWrap select {
	float: left;
	margin-left: 10px;
	position: relative;
	top: 5px;
}

.custom-select {
	border: 1px solid lightgray;
	height: 25px;
	border-radius: 3px;
}

.ctg-area {
	font-size: 16px;
	display: inline-block;
	width: 800px;
	margin-top: 11px;
}

.bo_content {
	position: relative;
	top: 0px;
}

.b_write {
	border: none;
	float: right;
	margin-right: 212px;
	background-color: rgb(15, 43, 80);
	color: white;
	height: 35px;
	width: 90px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
	top: -20px;
}

.board-content textarea {
	resize: none;
	width: 850px;
	margin: auto;
	height: 650px;
	margin-left: 210px;
	margin-top: 20px;
}

.b-count {
	font-size: 16px;
	display: inline-block;
	float: right;
	position: relative;
	left: 34px;
	top: -10px;
}

#bfile {
	margin-left: 126px;
	margin-top: 10px;
}

.upload-area {
	margin: auto;
	margin-left: 210px;
	margin-top: 10px;
}

.updel {
	height: 24px;
	margin-right: 212px;
	font-size: 15px;
}

.updel a {
	text-decoration: none;
	color: black;
	float: right;
}

.bdel {
	margin-right: 4px;
}

.replyDiv {
	width: 869px;
	margin: auto;
	margin-top: 36px;
	margin-right: 195px;
	position: relative;
	right: 10px;
}
</style>

<body>



	<jsp:include page="../common/links.jsp" />
	<!-- header.jsp ?????? -->
	<jsp:include page="../common/header.jsp" />

	<!-- sidebar.jsp ?????? 
		  ????????? ??????????????? pmySidebar
		  ????????? ??????????????? smySidebar -->


	<div
		style="background-color: rgb(235, 242, 252); width: 1500px; margin: auto; margin-top: 30px;">
			
			<div class="sidewrap">
				<c:choose>
					<c:when test="${loginUser.userDiv eq 1 }">
						<jsp:include page="../student/smySidebar.jsp" />
					</c:when>
					<c:when test="${loginUser.userDiv eq 2 }">
						<jsp:include page="../professor/pmySidebar.jsp" />
					</c:when>
					<c:when test="${loginUser.userDiv eq 3 }">
						<jsp:include page="../common/adminSidebar.jsp" />
					</c:when>
				</c:choose>
			</div>

			<script>
			      $(document).ready(function(){
			         let $len = $(".bo_content").height();
			         $(".wrap_sidebar").css('height', $len + 50);
			      })
		   	</script>
 
		<div class="bo_content">
			<!-- title -->
			<div class="page_title">????????????</div>

			<c:if
				test="${ loginUser != null && (loginUser.userNo eq b.userNo) }">
				<div class="updel">
					<a onclick="postFormSubmit(1);">??????</a> 
					<a class="bdel" onclick="postFormSubmit(2);">??????</a>
				</div>
			</c:if>

			<div class="grayWrap">
				<input type="text" name="boardTitle" value="${ b.boardTitle }" readonly />
				
				<br> 
				
				<input type="hidden" value="${loginUser.userNo}" name="userNo" />

				<div class="ctg-area">
					<span>??????</span> ${ b.createDate } 
					<span>?????????</span> ${b.boardWriter} 
					<span>????????????</span>
					
					<c:choose>
					<c:when test="${ b.subCategory eq 5}">
					??????
					</c:when>
					<c:when test="${ b.subCategory eq 6}">
					??????
					</c:when>
					<c:when test="${ b.subCategory eq 7}">
					????????????
					</c:when>
					</c:choose>

					<div class="b-count">
						<b style="color: rgb(231, 76, 60); font-size: 16px;">?????????</b> ${ b.boCount }
					</div>
				</div>
			</div>



			<div class="board-content">
				<textarea name="boardContent" readonly>${ b.boardContent }</textarea>
			</div>

			<div class="upload-area">
				<c:choose>
					<c:when test="${ empty  at.originName }">
	                    		??????????????? ????????????.
	                    	</c:when>
					<c:otherwise>
						<a href="${at.path}" download="${at.originName}">${at.originName}</a>
					</c:otherwise>
				</c:choose>

				<form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ b.boardNo }"> <input
						type="hidden" name="filePath" value="${at.path}">
				</form>

				<script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // ???????????? ?????????
	            			$("#postForm").attr("action", "updateForm.bo").submit();
	            		}else{ // ???????????? ?????????
	            			$("#postForm").attr("action", "delete.bo").submit();
	            		}
	            	}
	            </script>

				<button onclick="location.href='list.bo';" class="b_write">????????????</button>



				<!-- ajax ???????????? -->
				<div class="replyDiv">
					<table id="replyArea" class="table">
						<thead>
							<c:choose>
								<c:when test="${ empty loginUser }">
									<th colspan="2"><textarea class="form-control" cols="55"
											rows="2" style="resize: none; width: 100%" readonly>???????????? ???????????? ??????????????? ??????????????????. ????????? ??? ??????????????????.</textarea>
									</th>
									<th style="vertical-align: middle"><button
											class="btn btn-secondary" disabled>????????????</button></th>
								</c:when>
								
								
								<c:otherwise>
									<th colspan="2"><textarea class="form-control" id="msg" cols="55" rows="2" style="resize: none; width: 100%"></textarea></th>
									<th style="vertical-align: middle"><button type="button" id="btnSend" class="btn btn-secondary" onclick="addReply();">????????????</button></th>
								</c:otherwise>
							</c:choose>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<br> <br>




				<script>
				$(document).ready(function(){
					
				    $('#btnSend').on('click', function(evt) {
					  evt.preventDefault();
				  if (socket.readyState !== 1) return;
				    	  let msg = $('input#msg').val();
				    	  socket.send(msg);
				    });
				});
				</script>

				<script>
				let ruserNo = '${loginUser.userNo}';
				let boardNo = ${b.boardNo};
			    
			$(function(){
	    		selectReplyList();
	    		
	    		$(document).on("click", ".close", function(){
					let replyNo = $(this).children("span[name=close]").val();
					replyDelete();
					})
	    	})
	     
			//?????????????????? -> ????????? ???????????????  success??? ??????????????? ???????????????. 
	    	function addReply(){
	    		if($("#msg").val().trim().length != 0){
	    			
	    			$.ajax({
	    				url:"rinsert.bo",
	    				data:{
	    					rboardNo : ${b.boardNo},
	    					replyContent:$('#msg').val(),
	    					ruserNo:'${loginUser.userNo}'
	    				}, success:function(status){
	    					if(status =="success"){
	    						//websocket??? ?????????(??????????????? ?????????????????? ?????????)
	    						console.debug("socket",socket)
		    						if(socket != null){ 
		    							let socketMsg = "reply,"+ '${loginUser.userNo}' +","+ '${b.userNo}' +","+'${b.boardWriter}';
		    							//????????? ????????? ??????????????? ????????????
		    							
			    						console.debug("jsp::socket>",socketMsg)
		    							socket.send(socketMsg);
			    						
			    						selectReplyList();
			    						$('#msg').val("");
		    						}
	    						}
	    					}, error:function(){
	    					console.log("??????????????? ajax ????????????");
	    				}
	    			})
	    			
	    		}else{
	    			alert('?????? ?????? ??? ????????????????????????!');
	    		}
	    	}
	    	
			function selectReplyList(){
	    		$.ajax({
	    			url:"rlist.bo",
	    			data:{bno:${b.boardNo}},
	    			success:function(list){
	    				console.log(list);
	    				let value="";
	    				
	    				for(let i in list){
	    					value += "<tr>"
	    						  + "<th>" + list[i].replyWriter +"</th>"
	    						  + "<td>" + list[i].replyContent + "</td>"
	    						  + "<td>" + list[i].createDate; 
	    						  
	    						  if(list[i].ruserNo == ruserNo){
	    							value += "<span name='close' class='close'>x</span>";
	    						  }
	    						  
	    					value += "</td>"
	    						  + "<input type='hidden' value='"+list[i].replyNo+"' name='replyNo' id='replyNo'/>"
	    						  + "</tr>";
	    						  
	    				}
	    				$("#replyArea tbody").html(value);
	    				$("#rcount").text(list.length);
	    			},
	    			error:function(){
	    				console.lof("??????????????? ????????? ajax ????????????");
	    			}
	    		});
	    	}
			
			
			function replyDelete(){
				if(!confirm("????????? ?????????????????????????"))
 				{
 					return false;
 				}else{
 					
 				$.ajax({
 				  type: 'POST',  
 				  dataType:'json',
 				  url: "replyDelete",
 				  data: {replyNo: $('#replyNo').val()},
 				  success:
 					function(result){
 					   if(result == 1){
 						alert('?????????????????????.');
 						window.location.reload();
 						
 						}
 				  }
 				});
 				}
			}
			
	    	</script>
 
			</div>
		</div>
	</div>
	<!--???????????? ??????????????? ??????????????? ????????????-->
	</div>



	<br clear="both">

	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>
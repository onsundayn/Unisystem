<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    #wrap{
        height: 900px;
        width: 1500px;
        margin: auto;
    }
    /* page header 영역 */
    #content_header{
        margin-top: 30px;
        margin-left: 30px;
        font-size: 24px;
        font-weight: 900;
    }
    #content_header>span{font-size: 17px; color: lightgrey;}
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 785px;
        background-color: white;
        padding-top: 50px;
        padding-left: 30px;
        padding-right: 30px;
    }
    #contentBox_title{
    	display:inline-block;
        width: auto;
        background-color: rgb(15, 43, 80);
        color: white;
        padding: 10px 25px;
    }
    #underLine{
        width: 1230px;
        border-bottom: 2px solid lightgray;
        margin-bottom: 20px;
    }
    #stu_info_outer{
        border: 1px solid lightgray;
        height: 130px;
        padding-top: 10px;
    }
    #stu_info{
        width: 1210px;
        margin: auto;
        text-align: center;
    }
    #stu_info th{background-color: #eeeeee; width: 200px;}
    #stu_info th, #stu_info td{padding: 5px 0;}
    #stu_info tr:first-child{border-top: 2px solid lightgray; border-bottom: 1px solid lightgray;}
    #stu_info tr:last-child{border-top: 1px solid lightgray; border-bottom: 2px solid lightgray;}

    #table_outer{
        border: 1px solid lightgray;
        height: 490px;
        margin-top: 20px;
        padding-top: 10px;
        padding-left: 15px;
    }
    #attendance_table{width: 1195px;text-align: center;}
    #attendance_table tr:first-child{border-top: 2px solid lightgray;background-color: #eeeeee; width: 200px;}
    #attendance_table tr{border-bottom: 1px solid lightgray;}
    #attendance_table tr:last-child{border-bottom: 2px solid lightgray;}
    #attendance_table th:first-child{width: 50px;}
    #attendance_table th:nth-child(3){width: 140px;}
    #attendance_table th:nth-child(4){width: 60px;}
    #attendance_table th, #attendance_table td{padding: 2px 0;}
    
    /*페이징바*/
    .container{
        margin-top: 50px;
    }
    .page-link{
        color:RGB(26,86,162)!important;
        border: none!important;
        border-radius: 200px!important;
    }
    .page-item.active .page-link {
        color: #fff !important;
        background: RGB(26,86,162)!important;
    }
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
    <div id="wrap">
        
        <div style="float: left;">
			<!-- sidebar 영역 -->
            <!-- 로그인한 계정이 학생일 경우 -->
            <jsp:include page="../student/sclassSidebar.jsp" />
            
        </div>

        <div id="wrap_content" style="float: left;">

            <article id="content_header"><span>성적/출석관리 > </span>온라인 출석부</article>

            <div id="contentBox">
	            <form id="postForm" action="" method="post">
	            	   <input type="hidden" name="userNo" value="${loginUser.userNo}" id="userNo"/>
	            </form>
                
                <div id="contentBox_title">[${ classInfo.classKorName }] 출석현황</div>
                <div id="underLine"></div>
                
                <div id="stu_info_outer">
                    <table id="stu_info">
                    	<tbody>
                    	
                    	</tbody>
                    </table>
                </div>
				
                <div id="table_outer">
                    <div style="font-size: 15px;">*출석 요건 : 기간 내 출석 인정 요구 시간 이상을 학습할 경우</div>
                    <div style="margin-bottom: 10px; font-size: 15px;">출석-[○], 지각=[▲], 결석-[X]</div>
                    <table id="attendance_table">
                        <tr>
                            <th>번호</th>
                            <th>강의 제목</th>
                            <th>수업일자</th>
                            <th>출석</th>
                        </tr>
                       	
                       	<c:forEach var="l" items="${ list }">
	                        <tr>
	                            <td>${ l.rownum }</td>
	                            <td>${ l.classTitle }</td>
	                            <td>${ l.attendanceDateA }</td>	                         
	                            <td>
	                            	<c:if test="${ l.attendanceStatus eq '출석'}">
	                            		○
	                            	</c:if>
	                            	<c:if test="${ l.attendanceStatus eq '지각'}">
	                            		X
	                            	</c:if>
	                            	<c:if test="${ l.attendanceStatus eq '결석'}">
	                            		▲
	                            	</c:if>                           	
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>

                    <div class="container">
                        <ul class="pagination justify-content-center">
                        
                    		<c:choose>
                    			<c:when test="${ pi.currentPage eq 1 }">
		                        	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    			</c:when>
                    			<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="lectureAtt.stu?cpage=${ pi.currentPage - 1 }&userNo=${ loginUser.userNo }&classCode=${ classInfo.classCode }">&lt;</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    		
                    		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            	<li class="page-item"><a class="page-link" href="lectureAtt.stu?cpage=${ p }&userNo=${ loginUser.userNo }&classCode=${ classInfo.classCode }">${ p }</a></li>	
                    		</c:forEach>
                    		
                    		<c:choose>
                    			<c:when test="${ pi.currentPage eq pi.maxPage }">
		                        	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    			</c:when>
                    			<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="lectureAtt.stu?cpage=${ pi.currentPage + 1 }&userNo=${ loginUser.userNo }&classCode=${ classInfo.classCode }">&gt;</a></li>
                    			</c:otherwise>
                    		</c:choose>
                    		
                        </ul>
                        
                     </div>
                </div>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
    
	<script>
			
		$(function(){
			// 페이지상에 모든 요소들이 다 만들어지고 로그인한 학생 정보를 조회해오는 함수 호출
			selectLoginStuInfo();
		})
		
			// 로그인한 학생 정보를 가져오는 ajax
			function selectLoginStuInfo(){
			
				var userNo = $("#userNo").val();
		
				$.ajax({
					url:"LoginStuInfo.stu",
					data:{userNo:userNo},
					success:function(user){
						
						let value = "";

                           	value += "<tr>"
                           	 +			"<th>학번</th>"
                           	 +			"<td>" + user.userNo + "</td>"
                           	 +		 "</tr>"
                           	 +		 "<tr>"
                           	 +			"<th>이름</th>"
                           	 +			"<td>" + user.korName + "</td>"
                           	 +		 "</tr>"
                           	 +		 "<tr>"
                           	 +			"<th>휴대전화</th>"
                           	 +			"<td>" + user.phone + "</td>"
                           	 +		 "</tr>";
                           			                            		
           			$("#stu_info tbody").html(value);

					}, error:function(){
						
					}
					
				})
		}
		
	</script>
</body>
</html>
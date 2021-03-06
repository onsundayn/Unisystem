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
        height: 1150px;
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
        height: 950px;
        background-color: white;
        padding-top: 50px;
        padding-left: 30px;
        padding-right: 30px;
    }
    #contentBox>div:first-child{
        background-color: rgb(15, 43, 80);
        color: white;
        padding: 10px 25px;
        width: 115px;
    }
    #contentBox>div:nth-child(2){
        width: 1230px;
        border-bottom: 2px solid lightgray;
        margin-bottom: 20px;
    }
    #contentBox>div:nth-child(3){
        border: 1px solid lightgray;
        height: 130px;
        padding-top: 10px;
    }
    #stu_info{
        width: 1210px;
        margin: auto;
        text-align: center;
        margin-top: 17px;
    }
    #stu_info th{background-color: #eeeeee; width: 200px;}
    #stu_info th, #stu_info td{padding: 5px 0;}
    #stu_info tr:first-child{border-top: 2px solid lightgray; border-bottom: 1px solid lightgray;}
    #stu_info tr:last-child{border-top: 1px solid lightgray; border-bottom: 2px solid lightgray;}

    #contentBox>div:nth-child(4){
        border: 1px solid lightgray;
        height: 650px;
        margin-top: 20px;
        padding-top: 10px;
        padding-left: 15px;
    }
    #attendance_table{width: 1195px;text-align: center;}
    #attendance_table thead tr:first-child{border-top: 2px solid lightgray;background-color: #eeeeee; width: 200px;}
    #attendance_table tr{border-bottom: 1px solid lightgray;}
    #attendance_table thead tr{border-bottom: 1px solid lightgray;}
    #attendance_table tr:last-child{border-bottom: 2px solid lightgray;}
    #attendance_table th:first-child{width: 30px;}
    #attendance_table th:nth-child(2){width: 50px;}
    #attendance_table th:nth-child(3){width: 80px;}
    #attendance_table th:nth-child(4){width: 60px;}
    #attendance_table th:nth-child(5){width: 60px;}
    #attendance_table th:nth-child(6){width: 200px;}
    #attendance_table th, #attendance_table td{padding: 4px 0;}
    .attend, .absence, .tardiness{
        border: none;
        border-radius: 5px;
        padding: 4px 10px;
        font-size: 13px;
        margin: 0px 5px;
    }
    .attend:focus, .absence:focus, .tardiness:focus{outline: none;}
    .attend{background-color: rgb(21, 62, 115); color: white;}
    .absence{background-color: rgb(192, 57, 43); color: white;}
    .tardiness{background-color: rgb(22, 160, 133); color: white;}
    #cancle_submit_button{margin-left: 500px; margin-top: 40px;}
    #cancle_submit_button button{
        border: none;
        border-radius: 5px;
        font-size: 18px;
        padding: 3px 20px;
    }
    #cancle_submit_button button:focus{outline: none;}
    #cancle_submit_button>button:last-child{margin-left: 20px; background-color: rgb(21, 62, 115); color: white;}
    #class_title{
        font-size: 25px;
        font-weight: 900;
        margin-left: 450px;
        margin-bottom: 10px;
    }
    #StudentCount>span{color: #F39C12; font-weight: 900;}
    
    /* 스크롤바 */
	.flex{
	  display:flex;
	}	
	.scroll{
	    width: 1200;
	    padding: 0px 13px 0px 13px;
	    overflow-y: scroll;
	    overflow-x: hidden;
	    height: 400px;
	    box-sizing: border-box;
	    color: black;
	    font-family: 'Nanum Gothic';
	    background-color: white;
	    margin-right: 50px;
	}
	/* 스크롤바 설정*/
	.type2::-webkit-scrollbar{
	    width: 6px;
	}	
	/* 스크롤바 막대 설정*/
	.type2::-webkit-scrollbar-thumb{
	    height: 17%;
	    background-color: rgb(21, 62, 115);
	    border-radius: 10px;  
	}	
	/* 스크롤바 뒷 배경 설정*/
	.type2::-webkit-scrollbar-track{
	    background-color: #d1d9ff;
	}
	.type2{width:1190px}
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
    <div id="wrap">
        
        <div style="float: left;">
			<!-- sidebar 영역 -->
            <!-- 로그인한 계정이 교수일 경우 -->
            <jsp:include page="../professor/pclassSidebar.jsp" />

        </div>

        <div id="wrap_content" style="float: left;">

            <article id="content_header"><span>성적/출석관리 > </span>출결 관리</article>

            <div id="contentBox">
                
                <div>출석현황</div>
                <div></div>

                <div>
                    <table id="stu_info">
                        <tr>
                            <th>강의명</th>
                            <td>${ classInfo.classKorName }</td>
                        </tr>
                        <tr>
                            <th>수강인원</th>
                            <td>${ classInfo.currStud }명</td>
                        </tr>
                    </table>
                </div>

                <div>
                    <div style="font-size: 15px;">*출석 요건 : 기간 내 출석 인정 요구 시간 이상을 학습할 경우</div>
                    <div style="margin-bottom: 10px; font-size: 15px;">출석-[○], 지각=[▲], 결석-[X]</div>

                    <div id="class_title">${ title }</div>
                    <div id="StudentCount">
                        총 <span>${ classInfo.currStud }</span>명
                    </div>
                    
                    <form action="insertAttDetail.lec" method="post" >
                    <input type="hidden" id="classCode" name="classCode" value="${ list[0].classCode }" />
		            <input type="hidden" id="classNo" name="classNo" value="${ list[0].classNo }" />
                    <input type="hidden" id="attendanceDateB" name="attendanceDateB" value="${ list[0].attendanceDateB }" />
                    <div class="scroll type2">
	                    <table id="attendance_table">
	                    	<thead>
		                        <tr>
		                            <th>번호</th>
		                            <th>학년</th>
		                            <th>학번</th>
		                            <th>이름</th>
		                            <th>구분</th>
		                            <th>출결</th>
		                        </tr>
	                        </thead>
	                        
	                       
	                        	                
			                        <tbody>
				                     <!-- ajax로 데이터값 뿌려주는 영역 -->   
				                     
			                        </tbody>
		
		                    </table>
	
	                    </div>
	
				                    <div id="cancle_submit_button">
				                        <button>초기화</button>
				                        <button type="submit" id="submitBtn">제출</button>
				                    </div>
	                        
	                        </form>

    <script>      
    	$(function(){
    		
	        $(document).on("click", "#statusBtnA", function btnFunctionA(){ // 출석
	        	$(this).parent().siblings(".status").children(".statusInput").attr("value", "출석");
	        })
	        
	        $(document).on("click", "#statusBtnB", function btnFunctionB(){ // 결석
	        	$(this).parent().siblings(".status").children(".statusInput").attr("value", "결석");
	        })
	        
	        $(document).on("click", "#statusBtnC", function btnFunctionC(){ // 지각
	        	$(this).parent().siblings(".status").children(".statusInput").attr("value", "지각");
	        })
	        
	        
	        inputAttList();
	        
    	});	
    	
	    	//$(document).on("click", "#submitBtn", function(){
	    		//console.log($("input[name='ggg']").val());
	    		//console.log($("input[name='attStatusList']").val());
	   		//})
    	
	 		function inputAttList(){
	     		
	     		var classCode = $("#classCode").val();
	     		var attendanceDateB = $("#attendanceDateB").val();
	     		
	     		$.ajax({
	     			url:"selectStuList.lec",
	     			data:{
	     				  classCode:classCode,
	     				  attendanceDateB:attendanceDateB
	     			},
	     			success:function(list){
	     				
	     				let value="";
	     				let totalSemester="";
	     				let status="";
	     				
	    				for(let i in list){
	    					
	    					if(list[i].totalSemester == 0 || list[i].totalSemester == 1){
	    						totalSemester = "1학년";
	    					} else if(list[i].totalSemester == 2 || list[i].totalSemester == 3){
	    						totalSemester = "2학년";
	    					} else if(list[i].totalSemester == 3 || list[i].totalSemester == 4){
	    						totalSemester = "3학년";
	    					} else {
	    						totalSemester = "4학년";
	    					}
	    					
	    					if(list[i].attendanceStatus == null || list[i].attendanceStatus == 'undefined'){
	    						status = "";
	    					} else{
	    						status = list[i].attendanceStatus;
	    					}
	    					
                            value += "<input type='hidden' class='studNo' name='studsNo[" + i + "].studNo' value='" + list[i].studNo + "' />"
		                            + "<tr>"
		                          +    "<td>" + list[i].rownum + "</td>"
		                          +    "<td>" + totalSemester + "</td>"
		                          +    "<td>" + list[i].studNo + "</td>"
		                          +    "<td>" + list[i].korName + "</td>"
		                          +    "<td class='status'>"                                              
		                          +       "<input type='text' class='statusInput' name='studsNo[" + i + "].attendanceStatus' value='" + status + "' />"          
		                          +    "</td>"
		                          +    "<td>"
		                          +       "<button class='attend' id='statusBtnA' type='button' name='attend'>출석</button>"
		                          +       "<button class='absence' id='statusBtnB' type='button' name='absence'>결석</button>"
		                          +       "<button class='tardiness' id='statusBtnC' type='button' name='tardiness'>지각</button>"
		                          +     "</td>"
		                          +  "</tr>";
	                   			
	                   			//"<input type='text' name='attStatusList[" + i + "].attendanceStatus' + value='' />";	   					
	    				}                   		
	    				$("#attendance_table>tbody").html(value);
	    				
	     			}, error:function(){
	     				console.log("해당 수강중인 학생의 리스트 조회용 ajax 통신 실패");
	     			}
	     		
	     		})	
	     	}
	    	
	    	/*
	 		$(document).on("click", "#submitBtn", function(){
	    		
	    		let attendanceStatus = $("input[name=attendanceStatus]").val();
	    		let studNo = $("input[name=studsNo]").val();
	     		let classCode = $("#classCode").val();
	     		let attendanceDateB = $("#attendanceDateB").val();
	    
	    		$.ajax({
	    			
	    			url:"insertAttDetail.lec",
	    			data:{
	    				attendanceStatus:attendanceStatus,
	    				studNo:studNo,
	    				classCode:classCode,
	    				attendanceDateB:attendanceDateB
	    			},
	    			success:function(data){
	    				alert("success");
	    				console.log(data);
	    			}, error:function(){
	    				console.log("ajax 데이터 전송 실패")
	    			}
	    		})
	    	
	    })
	    */	
	    	
	    	
	    	
	    	
	    	
	    	// 모든 학생의 출결값이 작성되어있지 않을경우 alert창 알림, 아닐경우 제출 버튼의 disabled 속성 제거하는 함수
	    	function checkAlltd(){
	    		
	    		const status = $(".statusInput").val();

	    		if(status.length == 0){
	    			alertify.alert("모든 학생의 출결상태값을 입력해야합니다.");
	    			
	    			return false;
	    		} 
	    		
	    	}
	    	
    </script>
                </div>

            </div>

        </div>
    </div>
    

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>

    
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	.appList{
		margin:20px;
	}
	#content label{
		font-size:23px;
		margin-bottom:12px;
	}
	.btnBox{
		width:200px;
		margin-left:1070px;
		margin-bottom:14px;
	}
	/* ajax - 개설 신청 */
	.createClass{
		padding:10px 20px;
		border:1px solid lightgray;
		margin:20px;
		padding:20px;
	}
	.secBox{
		 padding-left:50px;
	}
	.secBox>div{
		height:200px;
		margin-top:20px;
	}
	.secBox p{
		font-size:18px;
		font-weight:600;
		padding:0px; 
		margin:0px;
		margin-bottom:10px;
	}
	.secBox input{
		width:100px;
		text-align:center;
	}
	.plan{
		width:290px;
		height:140px;
	}
	.plan>p{
		width:100px;
		margin:0;
	}
	.plan-top{
	    padding-left:70px;
	}
	.plan-top>button{
		border:0;
	}
	/*
	.plan-top>*{
		float:left;
	}
	*/
	.pdfBox{
		width:230px;
		height:86px;
		border:1px solid lightgray;
		margin-top:16px;
	}
	.timetable{
		width:230px;
		margin:0px;
		padding-left:10px;
		margin-left:70px;
	}
	.table2{
		width:480px;
		height:80px;
		padding-left:60px;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin:auto;
	    border-radius:7px;
	}
	.submitBtn>p{
  		width:100%;
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.appList>table{
		width:1090px;
		margin:auto;
	}
	.textarea {
		height:20px;
		width:100%;
	    overflow-y: hidden;
	    border: none;
	}
	.input{
		width:100%;
		border:none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="pmySidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
			<div class="pageName"><p>마이페이지&nbsp;>&nbsp;강의&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;강의 관리</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<input type="text" placeholder="년도별 조회">
					<button type="button">검색</button>
				</div>
				
					<div class="appList">
						<div style="float:left">
							<label>* 교과목 신청 목록</label>
						</div>
					<div class="btnBox">
						<button class="btn btn-sm btn-outline-secondary">취소</button>
						<button class="btn btn-sm btn-outline-primary" onclick="createClass();">강의 개설</button>
					</div>
					
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>순번</th>
								<th>신청번호</th>
								<th>신청일자</th>
								<th>과목명</th>
								<th>신청상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<!-- 시작 -->
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							
							<!-- 끝 -->
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
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			<!-- 강의 개설 -->
			<div id="createClass" style="display:">
				<br>
				<div class="createClass">
					<label>* 교과목 개설 신청</label>
					
					<form action="" method="post">
						<div align="center">
							<table class="table1 table table-bordered" style="width:1090px">
								<tr>
									<th width="200px">개설년도</th>
									<td width="200px"><input class="input" name=""></td>
									<th width="200px">학기</th>
									<td width="200px"><input class="input" name=""></td>
									<th width="200px">수업유형</th>
									<td width="200px"><input class="input" name=""></td>
								</tr>
								<tr>
									<th colspan="2">교과목</th>
									<td colspan="4"><input class="input" name=""></td>
								</tr>
								<tr>
									<th colspan="2">과목명(한글)</th>
									<td colspan="4"><input class="input" name=""></td>
								</tr>	
								<tr>
									<th colspan="2">과목명(영문)</th>
									<td colspan="4"><input class="input" name=""></td>
								</tr>
								<tr>
									<th colspan="2">개요(한글)</th>
									<td colspan="4"><textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- <textarea class="textarea" name="" cols="95px" style="height:20px; border:none;"></textarea> 공학입문 설계 교과목의 목표는 공학문제를 설계문제로 정의하고 이를 해결하는 설계과정을 계획하고 문제의 해를 도출할 수 있는 문제해결 능력을 제공하는 데 있다. 또한 팀웍과 다양한 공학문제 해결 도구에 익숙하도록 하는데 교과목의 목표가 있다. 공학문제 해결 과정을 이해하고, 이에 대한 최선의 해를 도출하기 위한 체계적인 문제해결방법의 원리 및 이론을 공부한다. 설계문제의 정식화를 공부하며 정식화된 설계문제를 체계적으로 해결하기 위한 방법을 공부한다. -->
								</tr>
								<tr>
									<th colspan="2">개요(영문)</th>
									<td colspan="4"><textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- To provide students with the use of problem-solving skills for solving realistic engineering problems using problem-based learning techniques, including definition of problem, creative problem solving, design of experiments, and optimization. To familiarize students with experience working as a member of an engineering work team, with experience using several modern tools and techniques to solve engineering problems. This course will help you develop the skills necessary to solve the real engineering problems facing engineers today. You will learn underlying principles an master techniques to solve engineering problems. --></td>
								</tr>
								<tr>
									<th colspan="2">수업목표</th>
									<td colspan="4"><textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									</td>
								</tr>
								<tr>
									<th>학위과정</th>
									<td><input class="input" name=""></td>
									<th>전공</th>
									<td><input class="input" name=""></td>
									<th>정원</th>
									<td><input class="input" name=""></td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td><input class="input" name=""></td>
									<th>학점</th>
									<td><input class="input" name=""></td>
									<th>강의실</th>
									<td><input class="input" name=""></td>
								</tr>
								<tr>
									<th>주관교수</th>
									<td><input class="input" name=""></td>
									<th>연락처</th>
									<td><input class="input" name=""></td>
									<th>교수실</th>
									<td><input class="input" name=""></td>
								</tr>
							</table>
						</div>
						
						
						
						<div class="secBox">
							<div style="float:left;">
								<p>* 항목별 점수비율(100%)</p>
							<table class="table2 table table-bordered" style="width:300px">
									<tr>
										<th>출석</th>
										<th>과제</th>
										<th>중간</th>
										<th>기말</th>
									</tr>
									<tr>
										<td><input type="number" class="input" name=""></td>
										<td><input type="number" class="input" name=""></td>
										<td><input type="number" class="input" name=""></td>
										<td><input type="number" class="input" name=""></td>
									</tr>
								</table>
							</div>
							
							
							<div class="plan" style="float:left">
								<div class="plan-top">
									<p>* 강의계획서</p>
									<button class="button btn-sm btn-basic" style="margin-left:30px">파일첨부</button>
								<div class="pdfBox"></div>
								</div>
							</div>
							
							<div class="timetable" style="float:left">
								<table class="table table-bordered">
									<tr>
										<th colspan="2">시간표</th>
									</tr>
									<tr>
										<th width="80">요일</th>
										<td width="100"><input class="input" name=""></td>
									</tr>
									<tr>
										<th>교시</th>
										<td><input class="input" name=""></td>
									</tr>
									<tr>
										<th>시간</th>
										<td><input class="input" name=""></td>
									</tr>
								</table>
							</div>
						</div>
						
							<br clear="both">
							<div class="submitBtn">
								<p>강의 개설 신청</p>
							</div>
							
					</form>
				</div>
			</div>		
					
			
			
			
		</div>	<!-- content -->
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	
	<script>
	
		$(function(){
			sidebar();
			
			
			
			
		})
	
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
			console.log($len);
			if($len > 750){
				$(".wrap_sidebar").css('height', $len);
			}else{
				$(".wrap_sidebar").css('height', 270);
				document.getElementById("content").style.marginBottom = "250px";
			}
		}
		
		function createClass(num){
			$("#createClass").toggle();	
			sidebar();
		}
	
		function resize(obj) {
		    obj.style.height = (0 + obj.scrollHeight) + 'px';
		}
	</script>
		
	
	
</body>
</html>
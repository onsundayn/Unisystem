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
	.lineBar{
		margin-top:30px;
		clear:both;
		width:100%;
		height:70px;
		border-top:3px solid rgb(26, 86, 162);
		border-bottom:3px solid rgb(26, 86, 162);
		text-align:center;
	}
	.lineBar>span{
		margin:25px;
		line-height:65px;
		
	}
	.lineBar a{
		font-size:20px;
		color:gray;	
	}
	.lineBar a:hover{
		text-decoration:none;
		color:#0275d8;
	}
	#studyRoom{
		font-weight:700;
		color:rgb(26, 86, 162);
	}
	.timetableBox{
		width:1100px;
		height:auto;
		margin:auto;
	}
	.timetableBox>div{
		margin-top:50px;
		float:left;
		margin-bottom:30px;
	}
	.inputBox{
		margin-right:40px;
		width:380px;
		padding:0px 20px;
	}
	#rsvdInfo>.table{
		width:340px;
	}
	.table th{
		background:red;
		background:rgb(235, 235, 235);
		text-align:center;
	}
	#rswdInfo th, td{
		padding:8px 12px!important; 
		font-size:18px;
	}
	.timetable{
		width:650px;
	}
	.blueLabel{
		width:340px;
		height:8px;
		background:rgb(15, 43, 80);
	}
	#map{
		width:340px;
		border:1px solid lightgray;
		margin-bottom: 20px;
	}
	#map>img{
		width:100%;
	    transition: all 0.2s linear;
	}
	#map:hover img {
  	transform: scale(1.4);
	}
	.timetableBox th, td{
		border:1px solid lightgray !important;
	}
	.btnBox{
		width:100%;
		height:250px;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin-top:10px;
	    border-radius:7px;
		border:none;	
	}
	.submitBtn>p{
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.select{
		width:100%;
		border:none;
		
	}
	.select>option{
		color:black;
	}
	#today{
		width:100px;
		border:none;
		margin-left:10px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />
		
	<div id="wrap">
		<div id="sidebar" style="float:left"><jsp:include page="../student/smySidebar.jsp" /></div>
		<div id="content" style="float:left">
			<div class="topBox">
				<div class="pageName"><p>???????????????&nbsp;>&nbsp;????????? ??????&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;???????????? ??????</p></div>
			</div>
			<div class="lineBar">
				<span id="readingRoom"><a href="rsvdReading">????????? ??????</a></span><span id="studyRoom"><a>???????????? ??????</a></span>
			</div>
			
		<div class="timetableBox">
				<div class="inputBox">
					<div class="blueLabel"></div>	
					<div id="map">
						<img src="resources/images/studyRoom.png">
					</div>
		 			<form id="studyForm" action="insert.sr">
					<div id="rsvdInfo">			
						<div class="blueLabel"></div>	
						<table class="table table-bordered">
							<tr>
								<th width="100">????????????</th>
								<td width="150">
									<select name="rsvdNum" class="select">
										<option value="1">1???</option>
										<option value="2">2???</option>
										<option value="3">3???</option>
										<option value="4">4???</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>????????????</th>
								<td style="text-align:left"><input id="today" type="text" disabled></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td> 
									<select id="room" name="rsvdSpace" class="select">
										<option value="A">A Room</option>
										<option value="B">B Room</option>
										<option value="C">C Room</option>
										<option value="D">D Room</option>
									</select>
								</td>
							</tr>
							<tr>
								<th rowspan="2">????????????</th>
								<td>
									<select id="useTime" name="rsvdStart" class="select">
										<!-- ???????????? ???????????? ?????? ?????? ?????? -->
									</select>
								</td>
							</tr>
							<tr>
								<td style="">
									<input type="hidden" name="rsvdEnd">
									<input id="1" type="radio" name="time" value="1"><label for="1">&nbsp;1??????</label>
									&nbsp;&nbsp;
									<input id="2" type="radio" name="time" value="2"><label for="2">&nbsp;2??????</label>
								
								</td>
							</tr>
						</table>
					</div>
					
					<input type="hidden" name="rsvdNo" value="0">
					<input type="hidden" name="studNo" value="${ loginUser.studNo }">
					<div class="btnBox">
					<button type="submit" class="submitBtn" onclick="return checkRadio();">
						<p>???????????? ??????</p>
					</button>
				</div>
				</form>
			</div>
				<div class="timetable">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="140"></th>
								<th width="140">A Room</th>
								<th width="140">B Room</th>
								<th width="140">C Room</th>
								<th width="140">D Room</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>6:00</th>
								<td><input type="hidden" name=cells value="A06"></td>
								<td><input type="hidden" name=cells value="B06"></td>
								<td><input type="hidden" name=cells value="C06"></td>
								<td><input type="hidden" name=cells value="D06"></td>
							</tr>
							<tr>
								<th>7:00</th>
								<td><input type="hidden" name=cells value="A07"></td>
								<td><input type="hidden" name=cells value="B07"></td>
								<td><input type="hidden" name=cells value="C07"></td>
								<td><input type="hidden" name=cells value="D07"></td>
							</tr>
							<tr>
								<th>8:00</th>
								<td><input type="hidden" name=cells value="A08"></td>
								<td><input type="hidden" name=cells value="B08"></td>
								<td><input type="hidden" name=cells value="C08"></td>
								<td><input type="hidden" name=cells value="D08"></td>
							</tr>
							<tr>
								<th>9:00</th>
								<td><input type="hidden" name=cells value="A09"></td>
								<td><input type="hidden" name=cells value="B09"></td>
								<td><input type="hidden" name=cells value="C09"></td>
								<td><input type="hidden" name=cells value="D09"></td>
							</tr>
							<tr>
								<th>10:00</th>
								<td><input type="hidden" name=cells value="A10"></td>
								<td><input type="hidden" name=cells value="B10"></td>
								<td><input type="hidden" name=cells value="C10"></td>
								<td><input type="hidden" name=cells value="D10"></td>
							</tr>
							<tr>
								<th>11:00</th>
								<td><input type="hidden" name=cells value="A11"></td>
								<td><input type="hidden" name=cells value="B11"></td>
								<td><input type="hidden" name=cells value="C11"></td>
								<td><input type="hidden" name=cells value="D11"></td>
							</tr>
							<tr>
								<th>12:00</th>
								<td><input type="hidden" name=cells value="A12"></td>
								<td><input type="hidden" name=cells value="B12"></td>
								<td><input type="hidden" name=cells value="C12"></td>
								<td><input type="hidden" name=cells value="D12"></td>
							</tr>
							<tr>
								<th>13:00</th>
								<td><input type="hidden" name=cells value="A13"></td>
								<td><input type="hidden" name=cells value="B13"></td>
								<td><input type="hidden" name=cells value="C13"></td>
								<td><input type="hidden" name=cells value="D13"></td>
							</tr>
							<tr>
								<th>14:00</th>
								<td><input type="hidden" name=cells value="A14"></td>
								<td><input type="hidden" name=cells value="B14"></td>
								<td><input type="hidden" name=cells value="C14"></td>
								<td><input type="hidden" name=cells value="D14"></td>
							</tr>
							<tr>
								<th>15:00</th>
								<td><input type="hidden" name=cells value="A15"></td>
								<td><input type="hidden" name=cells value="B15"></td>
								<td><input type="hidden" name=cells value="C15"></td>
								<td><input type="hidden" name=cells value="D15"></td>
							</tr>
							<tr>
								<th>16:00</th>
								<td><input type="hidden" name=cells value="A16"></td>
								<td><input type="hidden" name=cells value="B16"></td>
								<td><input type="hidden" name=cells value="C16"></td>
								<td><input type="hidden" name=cells value="D16"></td>
							</tr>
							<tr>
								<th>17:00</th>
								<td><input type="hidden" name=cells value="A17"></td>
								<td><input type="hidden" name=cells value="B17"></td>
								<td><input type="hidden" name=cells value="C17"></td>
								<td><input type="hidden" name=cells value="D17"></td>
							</tr>
							<tr>
								<th>18:00</th>
								<td><input type="hidden" name=cells value="A18"></td>
								<td><input type="hidden" name=cells value="B18"></td>
								<td><input type="hidden" name=cells value="C18"></td>
								<td><input type="hidden" name=cells value="D18"></td>
							</tr>
							<tr>
								<th>19:00</th>
								<td><input type="hidden" name=cells value="A19"></td>
								<td><input type="hidden" name=cells value="B19"></td>
								<td><input type="hidden" name=cells value="C19"></td>
								<td><input type="hidden" name=cells value="D19"></td>
							</tr>
							<tr>
								<th>20:00</th>
								<td><input type="hidden" name=cells value="A20"></td>
								<td><input type="hidden" name=cells value="B20"></td>
								<td><input type="hidden" name=cells value="C20"></td>
								<td><input type="hidden" name=cells value="D20"></td>
							</tr>
							<tr>
								<th>21:00</th>
								<td><input type="hidden" name=cells value="A21"></td>
								<td><input type="hidden" name=cells value="B21"></td>
								<td><input type="hidden" name=cells value="C21"></td>
								<td><input type="hidden" name=cells value="D21"></td>
							</tr>
							<tr>
								<th>22:00</th>
								<td><input type="hidden" name=cells value="A22"></td>
								<td><input type="hidden" name=cells value="B22"></td>
								<td><input type="hidden" name=cells value="C22"></td>
								<td><input type="hidden" name=cells value="D22"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
		$(function(){
			
			sidebar();
			reserved();
			ableTime('A');
			
			// ??????????????? ?????? ????????? ?????? ?????? ajax
			$("#room").on("change", function(){
				let room = $(this).val();
				ableTime(room);
			})
			
			// ????????? ??????
			var today = new Date();
			
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);

			var todate = year + '-' + month + '-' + day;
			// ????????? ?????? ????????????	
			$("#today").val(todate);
			
			// ???????????? ?????? ?????? ????????? 2?????? ?????? 1????????? ????????? ??? ?????? ??????
			$("#useTime").on("change", function(){
				// ????????? ?????? ?????? ????????? ?????? ?????? ????????? ???????????? ??????????????? ???????????????
				$("input[name=time]").prop("checked", false);
				
				if($(this).val() == '22'){
					$("#2").attr("disabled", true);
				}else{
					$("#2").attr("disabled", false);
				}
				
			})
				
			// ????????? ???????????? ???????????? ?????? ????????? ???????????? ??? ?????? ????????? ???????????? hidden rsvdEnd??? ??????
			$("input[name=time]").click(function(){
				let startTime = $("#useTime").val();
				let endTime = Number(startTime) + Number($(this).val())
				$("input[name=rsvdEnd]").val(endTime);
				
			})
			
		})
		
		
		// ????????? ???????????? ?????? ????????? ???????????? ????????? ?????? && ????????? ???????????? ?????? ??????????????? ??????
		function checkRadio(){
				let studyForm = document.getElementById('studyForm');
				let checkTime = $("input[name=time]:checked").val();
				let status = $(".submitBtn>p").text();
				console.log(status);
				
				if(status == "?????? ??????"){
					studyForm.action = "cancel.sr";
					
				}else if(status == "?????? ?????? ??????"){
					alertify.alert("??????????????? ????????? ????????? ????????? ??? ????????????.");
						return false;
				}else if(checkTime == undefined){
					if($("input[name=rsvdNo]").val() == 0){
						alert("????????? ????????? ????????? ?????????!");
						return false;
					}
				}
			}
				
		
		// ???????????? ?????? ??????
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
				
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else{
					$(".wrap_sidebar").css('height', 270);
					document.getElementById("content").style.marginBottom = "280px";
				}
			}
		
		
		// ???????????? ?????? ??????
		function reserved(){
			// ???????????? ????????? ??????
			const login = $("input[name=studNo]").val();
			
			$.ajax({
				url:"selectStudy",
				success:(data) => {
					
					$(data).each(function(i, obj){
						
						// ????????? ????????? ?????? 
						 let sno = data[i].studNo;
						 // ????????? ??????
						 let space = data[i].rsvdSpace;
						 // ?????? ??????
						 let start = data[i].rsvdStart;
						 // ?????? ??????
						 let end = data[i].rsvdEnd; 
						 
						 // ?????? 2????????? ??????????????? +1??? ?????? ??????
						 let startMore = 0;
						 
						 let time = Number(end) - Number(start);
						 // ???????????? - ???????????? = ????????? ??????
						 
						 let cells = space+start;
						 
						 if(login == sno) {
							 let start = data[i].rsvdStart;
								// ???????????? hidden => ????????? ?????? ??????????????? ????????? ?????? ????????? ??? (???????????? ????????? ????????????)
								$("input[name=rsvdNo]").val(data[i].rsvdNo);
							 
							 	$("input[value="+cells+"]").closest('td').css("background", "#fc6");
							 
							 	if(time == 2){
									startMore = Number(data[i].rsvdStart) + 1;
										if(startMore < 10){
											startMore = "0" + startMore;
										}
									
									cells = space + startMore;
									// ????????? ????????? ????????? ??????????????? ?????????	
									$("input[value="+cells+"]").closest('td').css("background", "#fc6");
								 }
							 	
								$(".submitBtn>p").text("?????? ??????");
									
							 	
							 	// ?????? ????????? ????????? ?????? ????????? ???????????? ?????? ????????? ????????? ??????
							 	let hours = new Date().getHours();
							 	if(hours > start){
							 		$(".submitBtn>p").text("?????? ?????? ??????");
							 	}
							 	
						 }else{
							 // ?????? ???????????? ?????? ?????? 
							 $("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)"); 
							 
							 if(time == 2){
								startMore = Number(data[i].rsvdStart) + 1;
									if(startMore < 10){
										startMore = "0" + startMore;
									}
								cells = space + startMore;
								$("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)");
							 }
							 
						 }
						 
					})
					
				},error: () => {
					console.log("???????????? ?????? ????????? ?????? ??????!");
				}
				
			})
			
		}
		
		
		function ableTime(room){
			
			$.ajax({
				url:"selectTime",
				data:{room:room}
			  , success:data => {
				  
				  let options = "";
				  
				  let noTime = [];
				  // ?????? ???????????? ????????? ?????? ??????
				  
				  $(data).each(function(i, obj){
					  for(let n=obj.rsvdStart; n<obj.rsvdEnd; n++){
						  noTime.push(Number(n));
					  }
				  })
				  // data??? ?????? ???????????? ?????? ???????????? ????????? ?????? ????????? ???????????? ???????????? ????????? ????????? ???! 
				  
				  var hours = new Date().getHours();
				  
				  if(hours <= 4 || hours > 22){
					  options += "<option>?????? ???????????? ???????????????.</option>";
				  }
				  
				  for(let t=6; t<=22; t++){
					  // ??????.indexOf??? ?????? ????????? ?????? ?????? t??? ???????????? ????????? -1??? ?????????!
					  if(hours < t || hours == 5){
						  
						  if(noTime.indexOf(t) == -1){
							  if(t < 10){
								  t = "0" + t;
							  }
							  if(t < 12){
								  // AM
								  options += "<option value="+t+">" + t + ":00 AM </option>";
							  }else{
								  // PM
								  options += "<option value="+t+">" + t + ":00 PM </option>";
							  }  
						  }
					  }
					  
				  }
				  
					  
				  $("#useTime").html(options);
				
			  },error:() => {
				  console.log("?????? ?????? ?????? ?????? ??????!");
			  }
			
			})
			
		}
			
	</script>

</body>
</html>
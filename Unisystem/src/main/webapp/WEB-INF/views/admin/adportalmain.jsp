<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<style>

.container1 {
	display: grid;
	grid-gap: 10px;
	grid-template-columns: 590px 292px 292px;
	grid-template-rows: 210px;
	grid-template-areas: 'class mail room';
	margin-bottom: 10px;
}

.container1>div {
	background-color: white;
	padding: 20px;
	align-items: center;
	display: grid;
	font-size:15px;
}
.container1 h4{font-weight:700;font-size:20px;}
.container2 h4{font-weight:700;font-size:20px;}
.container2 {
	display: grid;
	grid-gap: 10px;
	height:460px;
	grid-template-columns: 292px 592px 292px;
	grid-template-rows: 256px 170px 130px;
	grid-template-areas: 
	'inform baro calendar' 
	'weather notice calendar'
	'weather unischedule resite' ;
}

.gridWrap{
 	display: grid;
  	place-items: center;
	margin-top:50px;
}

.container2>div {
	background-color: white;
	padding: 20px;
	align-items: center;
	display: grid;
	font-size:15px;
}

.class {
	grid-area: class;
	border-top: 2px solid #153e73;
	border-bottom: 1px solid #153e73;
}

.class b{
	color:#787878;
}
.class li{
list-style:none;
font-weight:600;
font-size:14px;
}

.room {
	grid-area: room;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
}

.inform {
	grid-area: inform;
	background-color:rgb(17, 75, 148) !important;
	color:white;
	text-align:left;
}
.inform a{
color: white;
}
.inform a:hover{
color:white;
font-weight:800;
text-decoration:none;
}
.badge-pill{
	border:2px solid RGB(26,86,162);
	color:RGB(26,86,162);
	width:45px;
	height:25px;
	margin-right:10px;
}
.baro{
	position:relative;
}
.baro div{
	width:212px;
	display:block;
	float:left;
	margin-right:100px;
	cursor:pointer;
	font-size:18px;
	font-weight:600;
}
#num1{
	position:absolute;
	left:40px;
	top:80px;
}
#num2{
	position:absolute;
	left:40px;
	top:140px;
}
#num3{
	position:absolute;
	left:40px;
	top:200px;
}
#num4{
	position:absolute;
	left:330px;
	top:80px;
}
#num5{
	position:absolute;
	left:330px;
	top:140px;
}
#num6{
	position:absolute;
	left:330px;
	top:200px;
}
#baro-title{
	font-weight:700;
	font-size: 20px;
	position:absolute;
	left:20px;
	top:20px;
}
.baro {
	grid-area: baro;
}

.calendar {
	grid-area: calendar;
}

.calendar a{
text-decoration:none;
color:black;
}

.calendar a:hover{
text-decoration:none;
color:black;
font-weight:600;
}

.notice {
	grid-area: notice;
}
.notice li{
	font:15px;
}
.notice a{
text-decoration:none;
color:black;
 }

.notice a:hover{
text-decoration:none;
color:black;
font-weight:700;
}

#group{
background-color:rgb(41, 128, 185);
border:none;
height:50px;
color:white;
font-size:16px;
width: 245px;
}

a{
text-decoration:none;
}

/*?????????*/
.mail {
	grid-area: mail;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
	position:relative;
}
.mail>h4{
	position:absolute;
	top:15px;
	left:17px;
}
#inbox{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:23px;
	top:52px;
	cursor:pointer;
}
#inbox-title{
	position:absolute;
	left:10px;
	top:115px;
	font-size:16px;
}
#inbox>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
#line{
	width:0.1px;
	height:95px;
	border: 1px solid lightgray;
	position:absolute;
	left:142px;
	top:60px;
}
#unread{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:160px;
	top:52px;
	cursor:pointer;
}
#unread-title{
	position:absolute;
	left:0px;
	top:115px;
	font-size:16px;
}
#unread>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}


#calendar{
width:260px;
font-size:10px;
}
/* ?????? ?????? */
.room {
	grid-area: room;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
	position:relative;
}
.room>h4{
	position:absolute;
	top:15px;
	left:17px;
}
#reading{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:23px;
	top:52px;
	cursor:pointer;
}
#reading-title{
	position:absolute;
	left:10px;
	top:115px;
	font-size:16px;
}
#reading>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
#study{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:160px;
	top:52px;
	cursor:pointer;
}
#study-title{
	position:absolute;
	left:0px;
	top:115px;
	font-size:16px;
}
#study>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
/* ?????? */
#weather{
	padding:0px;
	width:100%;
	height:100%;
	display:block;
	border:2px solid #BDE0FE;
}

#one{
	width:100%;
	height:70%;
}
#two{
	width:100%;
	height:30%;
	background:#BDE0FE; 
	padding:10px;
	font-size:17px;
	padding:12px;
	align:center;
	padding-left:35px;
}
#two>p{
	display:inline;
	padding:5px;
}
#weatherIcon{
	margin-left:40px;
	font-size:70px;
}
#city{
	padding:20px;
}
</style>
 <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
  	
<body>
	<jsp:include page="../common/links.jsp" />
	<div>
		<jsp:include page="../common/header.jsp" />

	</div>

	<div class="gridWrap">
	<div class="container1">
	
		<div class="class" >
		<h4>????????????</h4>
		 <ul style="margin-left:-22px; line-height: 24px;">
		  <li style="padding:none;"><b>2022.03.02</b> &nbsp;&nbsp;&nbsp; ???1?????? ?????? ??? ????????? </li>
		  <li style="padding:none;"><b>2022.03.12</b> &nbsp;&nbsp;&nbsp;??????????????? </li>
		  <li style="padding:none;"><b>2022.04.05</b> &nbsp;&nbsp;&nbsp;???????????? 1/3??? </li>
		  <li style="padding:none;"><b>2022.04.23</b> &nbsp;&nbsp;&nbsp;???????????? 1/2??? </li>
		  <li style="padding:none;"><b>2022.07.08</b> &nbsp;&nbsp;&nbsp;?????? ?????? </li>
		  <li style="padding:none;"><b>2022.07.25</b> &nbsp;&nbsp;&nbsp;???/??????/???????????? ?????? </li>
		 </ul>
		</div>
		
		<!-- ?????? -->
		<div class="mail">
		<h4>?????????</h4>
			<div id="inbox" onclick="location.href='webMail.inbox'">
				<img src="resources/images/inbox.png" alt="">
				<div id="inbox-title">????????????<span style="color:blue; font-weight:900;">&nbsp;0</span>???</div>
			</div>
			
			<div id="line"></div>
			
			<div id="unread" onclick="location.href='webMail.unread'">
				<img src="resources/images/unread.png" alt="">
				<div id="unread-title">???????????????<span style="color:blue; font-weight:900;">&nbsp;0</span>???</div>
			</div>
			
		</div>
		
		<!-- ???????????? -->
		<div class="room">
		<h4>????????????</h4>
			<div id="reading" onclick="location.href='rsvdReading'">
				<img src="resources/images/reading_icon.png" alt="">
				<div id="reading-title">????????? ??????</div>
			</div>
			
			<div id="line"></div>
			
			<div id="study" onclick="location.href='rsvdStudy'">
				<img src="resources/images/study_icon.png" alt="">
				<div id="study-title">???????????? ??????</div>
			</div>
		</div>
	</div>

	<div class="container2">

		<!-- ???????????? -->
		<div class="inform">
		 <h2><b>${loginUser.korName}</b></h2>
		 <c:choose>
		<c:when test="${loginUser.userDiv eq 1}">
		 ${loginUser.studUniv} <br>
		 ${loginUser.studDepartment} 
		 	
		 	<c:if test="${loginUser.studStatus eq 1}">
		 		(??????)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 2}">
		 		(??????)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 3}">
		 		(??????)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 3}">
		 		(??????)
		 	</c:if>
		 	
		 </c:when>
		<c:when test="${loginUser.userDiv eq 2}">
		 ${loginUser.profUniv} <br>
		 ${loginUser.profDepartment} (??????)
		</c:when>
		
		<c:when test="${loginUser.userDiv eq 3}">
		 ??????????????? <br>
		 ????????????????????????.
		</c:when>
		 <c:otherwise>
		 ??????????????????<br>
		????????? ??? ??????????????????
		 </c:otherwise>
		 
		 </c:choose>
		 
		  <span id="group" style="line-height: 38px;" class="badge badge-pill badge-primary">UNI SYSTEM ????????????</span>
		 
		  
		   <!--<button id="group" style="">UNI SYSTEM ???????????? </button>  -->
		 
		 <div style="text-align:center;">
		 <a href="">???????????? ??????</a>&nbsp;|&nbsp;<a href="logout.me">????????????</a>
		 
		
		 </div>
		</div>
		
		<!-- ???????????? -->
		<div class="baro">
			<div id="baro-title">???????????? ?????????</div>
			<div id="num1" onclick="location.href='list.msg'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">01</span>
				?????? ?????????
			</div>
			<div id="num2" onclick="location.href='todoList'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">02</span>
				TO-DO LIST
			</div>
			<div id="num3" onclick="location.href='list.bo'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">03</span>
				????????????
			</div>
			<div id="num4" onclick="location.href='myStu.appList'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">04</span>
				????????????
			</div>
			<div id="num5" onclick="location.href='myStu.cert.apply'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">05</span>
				????????? ??????
			</div>
			<div id="num6" onclick="location.href='list.vbo'">
				<span class="badge badge-pill" style="font-size:15px; font-weight:900; line-height:10px;">06</span>
				???????????? ??? ?????????
			</div>
		</div>
		
		<!-- ???????????? -->
		<div class="calendar">
		<h4><a href="calendar">?????? ??????</a></h4>
		<div id='calendar'></div>  
		</div>
		
		<!-- ?????? -->
		<div id="weather">
		<!-- <h4>WEATHER</h4> -->
				<div id="one">
					<div id="weatherIcon" style="float:left; width:40%;">
					</div>
					<div id="city" style="text-align:right">
						 <h2 style="font-weight:800"></h2>
						<p>???????????????, ??????<p>
					</div>
				</div>
				<div id="two">
					?????? : <p id="humidity"></p><i class="wi wi-humidity"></i> &nbsp;&nbsp;&nbsp;&nbsp; ?????? : <p id="wind"></p><i class="wi wi-windy"></i>
				</div>
		</div>
		
		
		<!-- ???????????? -->
		<div class="notice">
		<h4>????????????</h4>
		<ul>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=932">Microsoft 365 Education ?????? ??????</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=929">?????????????????? ????????? ?????? ?????? ??????</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=931">?????? ????????? ????????????(Wi-Fi)???????????? ??????</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=930">????????? ??????????????? ?????? ?????? ??????(200422 ??????)</a></li>	 
		</ul>
		
		</div>
		
	
	</div>
	

<script>

$(function(){
	
	$.ajax({
		   url:'getevent',
	       data:{euserNo : '${loginUser.userNo}'
	    	   	 ,tuserNo : '${loginUser.userNo}'},
	       type:'POST',
	       dataType:'json',
	       success:function(data){
    	       console.log(data);
    	      
    	       let eventArr = []; // [{title:xxx, start:xxxx, end:xxx}, {}]
    	       
    	       let todoArr =[];
    	       
    	       for(let i in data.eventList){
    	    	   let obj = {
    	    			  	  groupId:data.eventList[i].eventNo,
    	    			   	  title:data.eventList[i].eventTitle,
    	    			   	  start:data.eventList[i].startDate,
    	    			   	  end:data.eventList[i].endDate
    	    			   	  };
    	    	   eventArr.push(obj);
    	       }
    	       
    	       for(let i in data.todoList){
					let obj = {
							groupId:data.todoList[i].todoNo,
							title:data.todoList[i].todoContent,
							start:data.todoList[i].todoDate,
							allDay : true 
					};
					todoArr.push(obj);
				}	
    	       
    	       let arr = eventArr.concat(todoArr);
    	       console.log(arr);
    	       
	    	    // calendar element ??????
	  		     var calendarEl = $('#calendar')[0];
	  		     // full-calendar ????????????
	  		     var calendar = new FullCalendar.Calendar(calendarEl, {
	  		        height: '350px', // calendar ?????? ??????
	  		        expandRows: true, // ????????? ?????? ?????? ?????????
	  		        slotMinTime: '08:00', // Day ??????????????? ?????? ??????
	  		        slotMaxTime: '20:00', // Day ??????????????? ?????? ??????
	  		        // ????????? ????????? ??????
	  		        headerToolbar: {
	  		          left: 'prev,next today',
	  		          right: 'dayGridMonth'
	  		        },
	  		        initialView: 'dayGridMonth', // ?????? ?????? ?????? ????????? ????????? ??????(?????? ??????: ???)
	  		        navLinks: true, // ????????? ???????????? Day ???????????? Week ???????????? ??????
	  		        editable: true, // ?????? ?????? 
	  		        selectable: true, // ?????? ?????? ????????? ????????????
	  		        nowIndicator: true, // ?????? ?????? ??????
	  		        dayMaxEvents: true, // ???????????? ???????????? ?????? ?????? (+ ??? ???????????? ??????)
	  		        locale: 'ko', // ????????? ??????
	  		        eventAdd: function(obj) { // ???????????? ???????????? ???????????? ?????????
	  		          console.log(obj);
	  		        },
	  		      eventDrop: function(data, delta, revertFunc) { //????????? ??????
	  		    	  
	  				 let updateStartDate = data.event._instance.range.start;
	  				 let updateStartStr =  (new Date(updateStartDate)).toISOString().slice(0, 10)
	  			   
	  				 let updateEndDate = data.event._instance.range.end;
	  				 let updateEndStr = (new Date(updateEndDate)).toISOString().slice(0, 10)
		  			 
	  		       	 // let updateStartStr = updateStartDate.getFullYear() + "-" + (updateStartDate.getMonth() + 1) + "-" + updateStartDate.getDate();
	  		      	 // let updateEndStr = updateEndDate.getFullYear() + "-" + (updateEndDate.getMonth() + 1) + "-" + updateEndDate.getDate();
	  		    	  
	  		    	 console.log(updateStartStr);
	  		    	 
			  			$.ajax({
			  			  type: 'POST',  
			  			  dataType:'json',
			  			  url: "updateSchedule",
			  			  data: {
			  				  eventNo:data.event._def.groupId, 
			  				  eventTitle:data.event._def.title, 
			  				  startDate:updateStartStr, 
			  				  endDate:updateEndStr
			  				  },
			  				  success:function( result ) {
			  					  console.log(result)
			  					  if(result == 1){
			  					  }
			  				  }
			  				  });
	  			  } , 
	  			 
	  			  
	  		     
	  		        eventRemove: function(obj){ // ???????????? ???????????? ???????????? ?????????
	  		          console.log(obj);
	  		        },
	  		        
	  		        select: function (start, end, allDay) {             
				        var startFix= moment($.fullCalendar.formatDate(start, 'YYYY-MM-DD'));               
				        newCalendar(startFix);           
	  		        }, 

	  		       
	  		       events:arr,
	  		       
	  		       eventClick: function(data, jsEvent, view) { //????????? ??????
	  		    	   console.log(data);
	 				if(!confirm("?????? '"+ data.event._def.title+"'??? ?????????????????????????"))
	 				{
	 					return false;
	 				}else{
	 					
	 				$.ajax({
	 				  type: 'POST',  
	 				  dataType:'json',
	 				  url: "deleteSchedule",
	 				  data: {eventNo: data.event._def.groupId},
	 				  success:
	 					function(result){
	 					   if(result == 1){
	 						alert('?????????????????????.');
	 						location.reload();
	 						}
	 				  }
	 				});
	 				}
	 			  }
	  		        
	  		        
	  		      });
	  		      // ????????? ?????????
	  		      calendar.render();
    	         
	      } // success:function ???
	})  // ajax ???  
	
	$(function(){
		
		weather();
	
	})
	
	function weather(){
	
		var apiURL = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=00a7ff3d1d0d1e0074be2b3daed50c29";
		
		$.ajax({
			url:apiURL,
			dataType:"json",
			type:"get",
			async:"false",
			success:data => {
				var main = "";		
				var icon = data.weather[0].icon;
				var disc = data.weather[0].description;
				
				//day
				if(icon == '01d'){ //??????
				 	main = "<i class='wi wi-day-sunny'></i>";
				}else if(icon == '02d'){ //??????
					main = "<i class='wi wi-day-cloudy'></i>";
				}else if(icon == '03d'){ //?????? ??????
					main = "<i class='wi wi-cloud'></i>";
				}else if(icon == '04d'){ //??????
					main = "<i class='wi wi-cloudy'></i>";
				}else if(icon == '09d'){ //?????????
					main = "<i class='wi wi-hail'></i>";
				}else if(icon == '10d'){ //?????????
					main = "<i class='wi wi-day-rain'></i>";
				}else if(icon == '11d'){ //????????????
					main = "<i class='wi wi-day-thunderstorm'></i>";
				}else if(icon == '13d'){ //???
					main = "<i class='wi wi-day-snow-wind'></i>";
				}else if(icon == '50d'){ //??????
					main = "<i class='wi wi-fog'></i>";
				}
				//night
				else if(icon == '01n'){ //??????
					main = "<i class='wi wi-night-clear'></i>";
				}else if(icon == '02n'){ //??????
					main = "<i class='wi wi-night-alt-cloudy'></i>";
				}else if(icon == '03n'){ //?????? ??????
					main = "<i class='wi wi-cloud'></i>";
				}else if(icon == '04n'){ //??????
					main = "<i class='wi wi-cloudy'></i>";
				}else if(icon == '09n'){ //?????????
					main = "<i class='wi wi-hail'></i>";
				}else if(icon == '10n'){ //?????????
					main = "<i class='wi wi-night-alt-hail'></i>";
				}else if(icon == '11n'){ //????????????
					main = "<i class='wi wi-day-thunderstorm'></i>";
				}else if(icon == '13n'){ //???
					main = "<i class='wi wi-night-snow'></i>";
				}else if(icon == '50n'){ //??????
					main = "<i class='wi wi-fog'></i>";
				}
				
				$("#weatherIcon").html(main);
				$("#city>h2").text(Math.floor(data.main.temp- 273.15) + "??C");
				$("#humidity").text(data.main.humidity);
				$("#wind").text(data.wind.speed);
				
				
			},error:() => {
				console.log("?????? ?????? ??????");
			}
		})
	}	
}); //$function ???

</script>
 
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
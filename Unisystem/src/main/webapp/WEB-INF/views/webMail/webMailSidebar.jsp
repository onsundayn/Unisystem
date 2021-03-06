<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	/*사이드바 전체영역 스타일*/
    #webMail-sidebar{
        background-color: white;
        width: 190px;
        min-height:700px;
        float: left;
    }
    .sidebar-lines{
        margin-left: 5px;
        margin-right: 5px;
        border: darkgray solid 1px;
    }

    /*메일쓰기, 내게쓰기 스타일*/
    #btn-wrapper{
        width: 100%;
        height: 60px;
        padding: 20px 15px;
    }
    #btn-wrapper>button{
        width: 75px;
        height: 35px;
        background-color: RGB(26,86,162);
        color: white;
        border:none;
        border-radius: 3px;
        font-weight: 550;
        font-size: 14px;
    }
    #writeMail{
        margin-right: 3px;
    }
    /*안읽음, 중요, 첨부*/
    #top{
        margin-left: 12px;
        margin-top: 13px;
    }
    #top::after{display:block;content:"";clear:both;}
    #top>div{
        float: left;
        width: 55px;
        height: 40px;
    }
    #top>div>div{
        font-size: 13px;;
    }
    #unread-count{
        color: RGB(26,86,162);
        font-weight: 700;
        font-size: 17px;
    }
    #unread{
    	cursor:pointer;
    }
    #important{
        margin-top: -3px;
        cursor:pointer;
    }
    .fa-star{color:RGB(252,175,23);}
    #att{
        margin-top: -2px;
        cursor:pointer;
    }
    .fa-paperclip{color: gray;}
    
    /*메일함*/
    #mail-boxes{
        margin-top: 13px;
        margin-bottom: 13px;
    }
    #mail-boxes>div{
        width: 100%;
        height: 30px;
        line-height: 29px;
        padding-left: 13px;
        font-size: 13px;
        cursor: pointer;
    }
    #mail-boxes>div:hover{
        background-color: rgba(211, 209, 209, 0.34);
    }
    #mail-boxes span{
        color: RGB(26,86,162);
        font-weight: 700;
        font-size: 13px;
        margin-left: 10px;
        height: 100%;
        line-height: 29px;
    }
    #mail-boxes button{
        background-color: white;
        border: gray solid 1px;
        border-radius: 3px;
        font-size: 13px;
        width: 67px;
        height: 23px;
        line-height: 20px;
        margin-left: 35px;
    }
    .fa-trash{
        color: gray;
        cursor: pointer;
    }
    #emptySpam{
    	width:20px;
    	margin-left:55px;
    }
    #spam-icon{
    	margin-left:0px!important;
    	margin-right:0px;
    }
    #emptyTrash{
    	width:20px;
    	margin-left:55px;
    }
    #trash-icon{
    	margin-left:26px!important;
    	margin-right:0px;
    }
   
    
    /*주소록*/
    #contact{
        width: 100%;
        height: 40px;
        line-height: 29px;
        padding-left: 13px;
        font-size: 13px;
        cursor: pointer;
    }
    #contact:hover{
        background-color: rgba(211, 209, 209, 0.34);
    }
    #contact span{
        font-size: 16px;
        font-weight: 600;
        margin-left: 10px;
    }
    .fa-address-book{
        color:  RGB(26,86,162);
        height: 40px;
        margin-top: 7px;
    }
</style>
</head>
<body>
	<jsp:include page="modals.jsp" />
	<nav id="webMail-sidebar">
            <div id="btn-wrapper">
                <button id="writeMail" onclick="location.href='webMail.writeForm'">메일쓰기</button>
                <button id="writeMailToMS" onclick="location.href='webMail.writeToMeForm'">내게쓰기</button>
            </div>
            <div id="top" align="center">
                <div id="unread" onclick="location.href='webMail.unread'">
                    <div id="unread-count"></div><div>안읽음</div>
                </div>
                <div id="important" onclick="location.href='webMail.important'">
                    <i class="fa fa-star fa-xs" aria-hidden="true"></i><div>중요</div>
                </div>
                <div id="att" onclick="location.href='webMail.attach'">
                    <i class="fa fa-paperclip fa-sm" aria-hidden="true"></i><div>첨부</div>
                </div>
            </div>
            <hr class="sidebar-lines">
            <div id="mail-boxes">
                <div onclick="location.href='webMail.inbox'">받은메일함 <span id="inbox-count"></span></div>
                <div onclick="location.href='webMail.toMe'">내게쓴메일함</div>
                <div><a href="webMail.sent" style="text-decoration:none; color:black;">보낸메일함</a><button onclick='location.href="webMail.sent.readReceipt"'>수신확인</button></div>
                <div onclick="location.href='webMail.drafts'">임시보관함</div>
                <div>
                   	 스팸메일함
                    <span>10</span>
                    <a type="button" id="emptySpam" data-dismiss="modal" data-toggle="modal" href="#emptySpamAskModal">
                    	<i class="fa fa-trash fa-sm" id="spam-icon" aria-hidden="true" style="margin-left: 55px;"></i>
                    </a>
                </div>
                <div>
                   	 <a href="webMail.trash" style="text-decoration:none; color:black;">휴지통</a>
                    <span>32</span>
                    <a type="button" id="emptyTrash" data-dismiss="modal" data-toggle="modal" href="#emptyTrashAskModal">
                    	<i class="fa fa-trash fa-sm" id="trash-icon" aria-hidden="true" style="margin-left: 55px;"></i>
                    </a>
                </div>
            </div>
            <hr class="sidebar-lines">
            <div id="contact" onclick="location.href='webMail.contact'">
                <i class="fa fa-address-book fa-2x" aria-hidden="true"></i>
                <span>주소록</span>
            </div>
        </nav>
        
        <script>
        	$(function(){
        			$.ajax({
        				url:"webMail.selectInboxList",
        				data:{currentPage:0, userNo:'${loginUser.userNo}'},
        				success:function(result){
    						$("#unread-count").text(result.unreadCount);
    						$("#inbox-count").text(result.unreadCount);
        				},error:function(){
        					console.log("사이드바 안읽은 메일 목록 조회용 ajax 통신 실패");
        				}
        			});
        	})
        </script>

</body>
</html>
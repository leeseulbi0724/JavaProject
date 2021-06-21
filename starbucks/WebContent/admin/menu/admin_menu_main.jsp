<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	menuDAO dao = new menuDAO();
	ArrayList<menuVO> list = dao.getMenuList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리 | 관리자 페이지</title>
<style>
	.table { text-align:center; margin:15px; width:1150px; font-size:13px; }
	.table, .table th, .table td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 .table thead tr:first-child { background-color:rgb(237,237,237); }
 	 .table tr th { padding:5px 0 5px 0; }
 	 
 	 .table td { vertical-align:middle; }
 	  	 
 	 button.btn_style { font-size:10px; }
 	 
 	 .content_menu div.search { text-align:left; padding: 10px; border:1px solid lightgray; }
	.content_menu div.search input { width:150px; height:12px; }
	.content_menu div.search button { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; }
	
	#update { float:right; }
	
	tr td:first-child{
		width: 126px;
	}
	tr td:nth-child(2){
		width: 67px;
	}
	tr td:last-child {
		width: 633px;
	}
	
	/* 미리보기 스타일 셋팅 */
	#preview{
		position:absolute;
		border:0px solid #ccc;
		background:#333;
		padding:1px;
		display:none;
		color:#fff;
	}
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.elevatezoom.js"></script>
<script>
$(document).ready(function() {	
	$("#update").click(function() {
		location.replace("http://localhost:9000/starbucks/admin/menu/admin_menu_write.jsp");
	});
	
	$("#search").click (function() {	
        var value = $("#search_input").val().toLowerCase();
        $(".tbody tr").hide();
        var select = $(".select").val();
		if( select == "id") {
			var value = $(".tbody td:nth-child(8n+4):contains('" + value + "') ");
		 	$(value).parent().show();
		}
        
    });
	
	var xOffset = 10;
    var yOffset = 30;

    $(document).on("mouseover",".img",function(e){ //마우스 오버시
		
		$("body").append("<p id='preview'><img src='"+ $(this).children("img").attr("src") +"' width='300px' height='300px' /></p>");						 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast"); //미리보기 화면 설정 셋팅
	});
	
	
	$(document).on("mouseout",".img",function(){ //마우스 아웃시
		$("#preview").remove();
	});
	
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../admin_header.jsp"></jsp:include>

	<!-- 문의 관리 -->
	<div class="content_menu" id="content">
		<jsp:include page = "admin_menu_menu.jsp"></jsp:include>
	<section>
		<div class="text">Home > <span>메뉴 관리</span></div>
		<div class="search">
			<select class="select">
				<option value="id">이름</option>
			</select>
			<input type="text" id="search_input">
			<button id="search">검색</button>
			<button id="update">메뉴등록</button>
		</div>
		<div class="center" style="overflow:scroll">
		<form name="comment" action="admin_question_comment.jsp" method="post">
			<table border=1 class="table" >
			<thead>
				<tr>
					<th>이미지</th>
					<th>종류</th>
					<th>분류</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody class="tbody">
			<% for(menuVO vo : list){ %>
			<tr>
				<td class="img"><img src="http://localhost:9000/starbucks/images/<%=vo.getImg() %>.jpg" width=50 height=50></td>
				<td><%=vo.getM_type() %></td>
				<td><%=vo.getP_type() %></td>
				<td><%=vo.getK_name() %></td>
			</tr>
			<% } %>
			</tbody>
		</table>
		</form>
		</div>
	</section>	
	</div>
</body>
</html>
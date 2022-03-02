<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
   th, td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		$("#loginBtn").hide();
		var loginMsg="${loginMsg}";
		if(loginMsg!=""){
			alert(loginMsg)
			if(loginMsg=="로그인 실패"){
				$("#loginBtn").click();
			}
		
		}
		// login 후 session이 있을 때..
		var hasSession="${member.name}";
		//console.log("${member.id}");
		console.log("세션이름:"+hasSession);
		console.log(hasSession);
		if(hasSession==""){ // session값이 없을 때..
			alert("로그인이 필요합니다!");
			$("#loginBtn").click();
		}else{
			$("#loginBtn").show();
			$("#loginBtn").text("로그아웃");
		}
		// session이 없는데, 다이얼로그를 닫는 경우, 처리..
		$("#exampleModalCenter").on('hide.bs.modal', function(){
			if(hasSession==""){ // session값이 없을 때..
				alert("로그인이 필요합니다!");
				$("#loginBtn").click();
			}
		});	
		
		
		
		--%>
    	$("#login").click(function(){ 
    		$("#frm02").submit();
    	});		
		$("#regBtn").click(function(){
			//if(confirm("등록하시겠습니까?")){
			location.href="${path}/board.do?method=insertFrm";
			//}
		});
		var pageSize="${boardSch.pageSize}"
			$("[name=pageSize]").val(pageSize);
			$("[name=pageSize]").change(function(){
				$("[name=curPage]").val(1);
				$("#frm01").submit();
			});		
		
	});
	function detail(no){
		// 더블 클릭시, no를 매개변수를 넘기고 controller에 요청값을 전달 처리.
		location.href="${path}/board.do?method=detail&no="+no;
	}
	function goPage(no){
		$("[name=curPage]").val(no);
		$("#frm01").submit();
	}	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >게시판리스트</h2>

</div>
<div class="container">
  <p align="right">
  	<c:if test="${not empty member.id}">
  		${member.id} 로그인중<br>
  	</c:if>
  	<button class="btn btn-info" type="button"
  		data-toggle="modal" id="loginBtn" data-target="#exampleModalCenter"
  	>로그인</button></p>
	<form id="frm01" class="form" action="${path}/board.do?method=list"  method="post">
		<input type="hidden" name="curPage" value="1"/>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="title" value="${boardSch.title}" placeholder="제목" />
	    <input class="form-control mr-sm-2" name="writer" value="${boardSch.writer}"
	    	  placeholder="작성자" />
	    <button class="btn btn-info" type="submit">조회</button>
	    <button class="btn btn-success" id="regBtn" type="button">등록</button>
 	</nav><br>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">총 ${boardSch.count}건</span>
		</div>
		<input class="form-control"/>
		<div class="input-group-append">
			<span class="input-group-text">페이지 크기</span>
			<select name="pageSize" class="form-control">
				<option>3</option>
				<option>5</option>
				<option>10</option>
				<option>20</option>
				<option>50</option>
			</select>
		</div>
	</div>
	</form>
	<script type="text/javascript">

	</script>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="board" items="${boardList}">
    		<tr ondblclick="detail(${board.no})">
    			<td>${board.cnt}</td>
    			<td style="text-align:left">
    			<%--
    			레벨에 따른 공백 처리 후, 답글 이미지 넣기.
    			level : 계층 레벨에 따라, 공백 및 마지막에 답글 이미지 표현
    			 --%>	
    			<c:forEach varStatus="sts" begin="1" end="${board.level}">
    				&nbsp;&nbsp;
    				<c:if test="${board.level>1 and sts.last }">
    					<img width="25" height="15" 
    						src="${path}/a02_img/reply1.PNG"
    					/>
    				</c:if>
    				<%-- level 만큼 공백을 넣고, 마지막(sts.last)에 답글이미지 삽입  --%>
    			</c:forEach>
    			 
    			${board.title}</td>
    			<td>${board.writer}</td>
    			<td><fmt:formatDate value="${board.regdte}"/></td>
    			<td>${board.readcnt}</td></tr>
    	</c:forEach>
    </tbody>
	</table>
	<!-- class="page-item active" -->
	<ul class="pagination  justify-content-end">
	  <li class="page-item"><a class="page-link" 
	  	href="javascript:goPage(${boardSch.startBlock!=1?boardSch.startBlock-1:1})"">Previous</a></li>
	  <c:forEach var="cnt" begin="${boardSch.startBlock}" end="${boardSch.endBlock}">
	  	<li class="page-item ${cnt==boardSch.curPage?'active':''}"> <!-- 클릭한 현재 페이지 번호 -->
	  		<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" 
	  	href="javascript:goPage(${boardSch.endBlock!=boardSch.pageCount?boardSch.endBlock+1:boardSch.endBlock})">Next</a></li>
	  <!-- 다음 block의 리스트는 현재 블럭의 마지막 번호 +1 
	  	   마지막 블럭이 총페이지수일 때는 다음 블럭이 없기 때문에 그대로 두고
	  	   다음 블럭이 있을 때만 카운트 되게 
	  -->
	</ul>

</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form" action="${path}/board.do?method=login" method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="아이디 입력" name="id">
	      </div>
	      <div class="col">
	        <input type="password" class="form-control" placeholder="패스워드 입력" name="pass">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="login"  class="btn btn-primary">로그인</button>

      </div>
    </div>
  </div>
</div>
</body>
</html>
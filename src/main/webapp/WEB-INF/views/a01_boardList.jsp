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
		var loginMsg="${loginMsg}";
		if(loginMsg!=""){
			alert(loginMsg)
		}
		// login 후 session이 있을 때..
		var hasSession="${member.name}";
		console.log("${member.id}");
		console.log("세션이름:"+hasSession);
		console.log(hasSession);
		if(hasSession==""){ // session값이 없을 때..
			alert("로그인이 필요합니다!");
			$("#loginBtn").click();
		}
		
		
		<%-- 
		
		--%>
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				location.href="${path}/board.do?method=insertFrm";
			}
		});
	});
	function detail(no){
		// 더블 클릭시, no를 매개변수를 넘기고 controller에 요청값을 전달 처리.
		location.href="${path}/board.do?method=detail&no="+no;
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
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="title" value="${board.title}" placeholder="제목" />
	    <input class="form-control mr-sm-2" name="writer" value="${board.writer}"
	    	  placeholder="작성자" />
	    <button class="btn btn-info" type="submit">조회</button>
	    <button class="btn btn-success" id="regBtn" type="button">등록</button>
 	</nav>
	</form>
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
    		<tr ondblclick="detail(${board.no})"><td>${board.no}</td><td>${board.title}</td>
    			<td>${board.writer}</td>
    			<td><fmt:formatDate value="${board.regdte}"/></td>
    			<td>${board.readcnt}</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
    
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
        <script>
        	$("#login").click(function(){ 
        		$("#frm02").submit();
        	});
        </script>
      </div>
    </div>
  </div>
</div>
</body>
</html>
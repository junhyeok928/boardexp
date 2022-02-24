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
   td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var sessId = "${member.id}"
		var msg = "${msg}";
		if(msg!=""){
			if(msg=="수정되었습니다"){
				if(confirm(msg+"\n조회화면이동하시겠습니까?")){
					location.href="${path}/board.do?method=list";
				}	
			}
			if(msg=="삭제되었습니다."){
			
				alert(msg+"\n조회화면이동!")
				location.href="${path}/board.do?method=list";
			}
		}
		<%-- 
		
		--%>
		$("#goMain").click(function(){
			location.href="${path}/board.do?method=list";
		});
		// 삭제버튼 클릭시, session으로 수정권한 확인 해서(작성자와 동일)
		// 권한이 있는 경우에만 삭제 처리..
		$("#delBtn").click(function(){
			if(sessId!=$("[name=writer]").val()){
				alert("삭제는 작성자만이 가능합니다.")
			}else{
				if(confirm("삭제하시겠습니까?")){
					location.href="${path}/board.do?method=del&no="+$("[name=no]").val();	
				}
			}
		});
		$("#uptBtn").click(function(){
			if(sessId!=$("[name=writer]").val()){
				alert("수정은 작성자만이 가능합니다!");
			}else{
				if(confirm("수정하시겠습니까?")){
					$("form").attr("action","${path}/board.do?method=upt");
					$("form").submit();
				}
			}
		});
		$("#reBtn").click(function(){
			if(confirm("답글을 작성하시겠습니까?")){
				$("[name=refno]").val($("[name=no]").val());
				$("[name=title]").val("RE:"+$("[name=title]").val());
				$("[name=content]").val("\n\n\n\n\n\n\======이전글======\n"+$("[name=content]").val());
				$("form").attr("action","${path}/board.do?method=insertFrm");
				// method=insertFrm
				$("form").submit();
			}
		});
		
	});
	function downFile(fname){
		if(confirm("다운로드할 파일:"+fname)){
			location.href="${path}/download.do?fname="+fname;
		}
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">
  	게시판 상세</h2>
</div>
<style>
	.input-group-prepend{width:20%;}
	.input-group-text{width:100%;font-weight:bolder;}
</style><!--  -->
<div class="container">
	<form method="post" enctype="multipart/form-data"
		action="${path}/board.do?method=update">
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">글번호</span>
		</div>
		<input name="no" class="form-control" value="${board.no}"/>	
		<div class="input-group-prepend">
			<span class="input-group-text">상위글번호</span>
		</div>
		<input name="refno" class="form-control" value="${board.refno}"/>	
	</div>			
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" value="${board.title}" />			 
	</div>  
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 자</span>
		</div>
		<input name="writer" class="form-control" 
			placeholder="작성자입력하세요"   value="${board.writer}" readonly/>
		<!-- 작성자는 입력해서 변경불가능 처리 -->	
		<div class="input-group-prepend">
			<span class="input-group-text">조회수</span>
		</div>
		<input name="readcnt" class="form-control" value="${board.readcnt}"/>	
	</div>	
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">등 록 일</span>
		</div>
		
		<input class="form-control" 
			placeholder="작성자입력하세요"  
			value='<fmt:formatDate type="both" value="${board.regdte}" />'/>	
		<div class="input-group-prepend">
			<span class="input-group-text">수 정일</span>
		</div>
		<input  class="form-control" 
			value='<fmt:formatDate type="both" value="${board.uptdte}" />'/>	
	</div>			
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="content" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${board.content}</textarea>		 
	</div> 
	<c:forEach var="fname" items="${board.fnames }">
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text" 
				onclick="downFile('${fname}')">첨부 파일(다운로드)</span>
		</div>
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">${fname}</label>
		</div>		
	</div> 	 
	</c:forEach>
 	</form>
 	<div style="text-align:right;">
 		<input type="button" class="btn btn-primary"
			value="답글" id="reBtn"/>	
		<input type="button" class="btn btn-warning"
			value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger"
			value="삭제" id="delBtn"/>			
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>	
</div>
</div>
</body>
</html>
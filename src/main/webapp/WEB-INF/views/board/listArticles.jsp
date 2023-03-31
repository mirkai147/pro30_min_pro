<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<style>
.board_table {
  border-collapse: collapse;
  width: 80%;
  margin: 20px auto;
}

.board_table td {
  padding: 5px;
  border: 1px solid #ddd;
}

.board_table tr:nth-child(even) {
  background-color: #f2f2f2;
}

.board_table a {
  color: #008CBA;
  text-decoration: none; /* 밑줄 제거 */
  font-weight: bold; /* 글자 두께 */
}

/* hover 스타일 */
.board_table a:hover {
  color: red;
}

/* 클릭한 링크 스타일 */
.board_table a:active {
  color: green;
}
.cls1 {text-decoration:none;}
.cls2 {
  text-align:center; font-size:30px;
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #ffffff;
  color: #428bca;
  border: 1px solid #428bca;
  border-radius: 0.25rem;
  text-decoration: none;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.cls2:hover {
  background-color: #428bca;
  color: #ffffff;
}

.cls2:visited {
  color: #428bca;
}

.cls2:visited:hover {
  background-color: #428bca;
  color: #ffffff;
}

/* .cls2 {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100px;
} */
</style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script>
<body>
<table align="center" border="1"  width="80%" class="board_table" >
  <tr height="10" align="center"  bgcolor="lightgreen">
     <td >글번호</td>
     <td >작성자</td>              
     <td >제목</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${articlesList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${articlesList !=null }" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center">
	<td width="5%">${articleNum.count}</td>
	<td width="10%">${article.id }</td>
	<td align='left'  width="35%">
	  <span style="padding-right:30px"></span>
	   <c:choose>
	      <c:when test='${article.level > 1 }'>  
	         <c:forEach begin="1" end="${article.level }" step="1">
	              <span style="padding-left:20px"></span>    
	         </c:forEach>
	         <span style="font-size:12px;">[답변]</span>
                   <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	          </c:when>
	          <c:otherwise>
	            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
	          </c:otherwise>
	        </c:choose>
	  </td>
	  <td  width="10%">${article.writeDate}</td> 
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<a  class="cls2"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><h1>글쓰기</h1></a>
</body>
</html>
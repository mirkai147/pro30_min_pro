<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


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
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
<table border="1"  align="center"  width="80%" class="board_table">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>이름</b></td>
      <td><b>이메일</b></td>
      <td><b>가입일</b></td>
      <td><b>수정</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
      <td>${member.id}</td>
      <td>${member.pwd}</td>
      <td>${member.name}</td>
      <td>${member.email}</td>
      <td>${member.joinDate}</td>
      <td><a href="${contextPath}/member/modForm.do?id=${member.id }" >수정하기</a></td>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/member/memberForm.do" class="cls2"><h1>회원가입</h1></a>
</body>
</html>

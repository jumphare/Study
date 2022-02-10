<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
id (hidden)은 잘 도착했나요? <%=request.getParameter("id") %><br>
id01 (readonly)은 action 전송위치로 보내졌는가: <%=request.getParameter("id01") %><br>
id02 (disabled)은 action 전송위치로 보내졌는가: <%=request.getParameter("id02") %>
</body>
</html>
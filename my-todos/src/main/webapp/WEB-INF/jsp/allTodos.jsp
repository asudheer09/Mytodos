<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty todos}">
		<table>
		<tr>
			<th>Task Name</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Status</th>
		</tr>
			<c:forEach var="listValue" items="${todos}">
				<tr>
					<td>${listValue.taskName}</td>
					<td>${listValue.startDate}</td>
					<td>${listValue.endDate}</td>
					<td>${listValue.status}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
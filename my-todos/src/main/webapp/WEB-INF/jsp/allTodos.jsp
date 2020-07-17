<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"	rel="stylesheet">
</head>
<body>
	<c:if test="${not empty todos}">
		<table class="table table-striped">
		<tr>
			<th scope="col">Task Name</th>
			<th scope="col">Start Date</th>
			<th scope="col">End Date</th>
			<th scope="col">Status</th>
			<th scope="col">Edit</th>
			<th scope="col">Delete</th>
			
		</tr>
			<c:forEach var="listValue" items="${todos}">
				<tr>
					<td class="table-primary">${listValue.taskName}</td>
					<td class="table-secondary">${listValue.startDate}</td>
					<td class="table-success">${listValue.endDate}</td>
					<td class="table-danger">${listValue.status}</td>
					<td class="table-danger"><a href="editTodos/${listValue.id}">Edit</a></td>
					<td class="table-danger"><a href="deleteTodos/${listValue.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/1.9.1/jquery.min.js"></script>
</html>
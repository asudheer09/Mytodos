<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TO DO's APP</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
	<style>
		#mybutton{
			float:right;
		}
	</style>
</head>
<body>
	<h1 align="center" style="color:#337ab7">WELCOME TO MY TODO'S &nbsp; APPLICTION</h1>
	<hr>
	<button class="btn btn-primary mb-2" id="mybutton">
		<a href="/Mytodos/mytodos" style="color:white">ADD TODO'S</a>
	</button>
	
	<form class="form-inline" action="/Mytodos/search" method="get">
  <div class="form-group mx-sm-3 mb-2">
    <input type="text" class="form-control" name="id" placeholder="search by id">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Search By ID</button>
</form>
	
	<!-- <form action="/Mytodos/search" method="get">
		Enter id to search :<input type="text" name="id">
		<input type="submit">
	</form> -->

	<hr>
	<c:if test="${not empty todos}">
		<table class="table table-striped">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Task Name</th>
				<th scope="col">Start Date</th>
				<th scope="col">End Date</th>
				<th scope="col">Status</th>
				<th scope="col">Edit</th>
				<th scope="col">Delete</th>
			</tr>
			<c:forEach var="listValue" items="${todos}">
				<tr>
					<td class="table-primary">${listValue.id}</td>
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
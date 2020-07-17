<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>
<title>Spring MVC Form Handling</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css"	rel="stylesheet">

</head>
<body>
	<h2>create Todo:</h2>
	<form:form method="POST" action="/Mytodos/add" modelAttribute="mytodos">
		<table>
			<tr>
				<td><form:label path="taskName">Task Name</form:label></td>
				<td><form:input path="taskName" /></td>
			</tr>
			<tr>
				<td><form:label path="startDate">Start Date</form:label></td>
				<td><form:input path="startDate" /></td>
			</tr>
			<tr>
				<td><form:label path="endDate">End Date</form:label></td>
				<td><form:input path="endDate" /></td>
			</tr>

			<tr>
				<td><form:label path="status">Select Status</form:label></td>
				<td><form:select path="status">
						<form:option value="NONE" label="Select" />
						<form:options items="${statusList}" />
					</form:select></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Submit" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form:form>
</body>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/1.9.1/jquery.min.js"></script>
</html>

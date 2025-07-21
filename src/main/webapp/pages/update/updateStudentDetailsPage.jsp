<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<main>
		<c:choose>
			<c:when test="${student ne null || !empty student }">
				<h1>Enter student details</h1>
				<form action="../controller/updateStudentDetails" method="post">
					<table>
						<tr>
							<th>Student ID</th>
							<td><input type="text" readonly="readonly" name="studentId"
								value="${student.id}" /></td>
						</tr>
						<tr>
							<th>Enter Student First Name</th>
							<td><input type="text" name="firstname"
								value="${student.firstName}" required /></td>
						</tr>
						<tr>
							<th>Enter Student Last Name</th>
							<td><input type="text" name="lastname"
								value="${student.lastName}" required /></td>
						</tr>
						<tr>
							<th>Enter Student Age</th>
							<td><input type="number" name="age" value="${student.age}"
								required /></td>
						</tr>
						<tr>
							<th>Enter Student Email</th>
							<td><input type="text" name="email" value="${student.email}"
								required /></td>
						</tr>
						<tr>
							<th>Enter Student Marks</th>
							<td><input type="number" name="marks"
								value="${student.marks}" required /></td>
						</tr>
						<tr>
							<th>Enter Student Address</th>
							<td><input type="text" name="address"
								value="${student.address}" required /></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><input
								type="submit" value="Submit" /></td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<h1 style="color: red;">Oops! students records not found..!</h1>
			</c:otherwise>
		</c:choose>
	</main>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>

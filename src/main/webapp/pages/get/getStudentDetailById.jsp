<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Details By Id Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<c:choose>
		<c:when test="${student ne null || !empty student}">
			<main>
				<h1>Student Details By Id</h1>
				<table>
					<tr>
						<th>Student_ID</th>
						<td>${student.id}</td>
					</tr>
					<tr>
						<th>Student_FirstName</th>
						<td>${student.firstName}</td>
					</tr>
					<tr>
						<th>Student_LastName</th>
						<td>${student.lastName}</td>
					</tr>
					<tr>
						<th>Student_Age</th>
						<td>${student.age}</td>
					</tr>
					<tr>
						<th>Student_Email</th>
						<td>${student.email}</td>
					</tr>
					<tr>
						<th>Student_Marks</th>
						<td>${student.marks}</td>
					</tr>
					<tr>
						<th>Student_Address</th>
						<td>${student.address}</td>
					</tr>
				</table>
			</main>
		</c:when>
		<c:otherwise>
			<jsp:forward page="../common/student_not_found.jsp" />
		</c:otherwise>
	</c:choose>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>

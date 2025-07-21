<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get All Student Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main>

		<c:choose>

			<c:when test="${students ne null || !empty students}">
				<h1>All Student Details</h1>
				<table>
					<tr>
						<th>Student_Id</th>
						<th>Student_FirstName</th>
						<th>Student_LastName</th>
						<th>Student_Age</th>
						<th>Student_email</th>
						<th>Student_Marks</th>
						<th>Student_Address</th>
					</tr>
					<c:forEach var="student" items="${students}">
						<tr>
							<th>${student.id}</th>
							<th>${student.firstName}</th>
							<th>${student.lastName}</th>
							<th>${student.age}</th>
							<th>${student.email}</th>
							<th>${student.marks}</th>
							<th>${student.address}</th>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h1>NO STUDENTS RECORD FOUND</h1>
			</c:otherwise>
		</c:choose>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>

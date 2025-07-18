<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>Delete Result Page</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	</head>
	<body>
		<jsp:include page="../common/header.jsp" />
		<main>
			<c:choose>
				<c:when test="${status eq 'success' }">
					<h1>STUDENT RECORD DELETED SUCCESSFULLY..!</h1>
				</c:when>
				<c:when test="${status eq 'not_found' }">
					<h1 style="color: red;">OOPS! STUDENTS RECORDS NOT FOUND..!</h1>
				</c:when>
				<c:otherwise>
					<h1 style="color: red;">OOPS! STUDENT RECORD DELETE OPERATION FAILED..</h1>
				</c:otherwise>
			</c:choose>
		</main>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>

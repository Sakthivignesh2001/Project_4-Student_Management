<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Result Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<c:choose>
			<c:when test="${status eq 'success' }">
				<h1>STUDENT RECORD UPDATED SUCCESSFULLY..!</h1>
			</c:when>
			<c:otherwise>
				<h1 style="color: red;">OOPS! STUDENT RECORD UPDATE OPERATION FAILED..</h1>
			</c:otherwise>
		</c:choose>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>

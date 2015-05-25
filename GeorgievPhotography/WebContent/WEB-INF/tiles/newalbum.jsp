<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
	<div class="container">
		<h2>Upload Album</h2>
		<sf:form role="form" id="album" method="post"
			action="${pageContext.request.contextPath}/uploadalbum"
			commandName="album">
			<div class="form-group">
				<label for="name">Album name:</label>
				<sf:input class="control" path="name" name="name" type="text" />
				<div class="error">
					<sf:errors path="name"></sf:errors>
				</div>
			</div>
			<div class="form-group">
				<label for="link">Link to album:</label>
				<sf:input class="control" path="link" name="link" type="text" />
				<div class="error">
					<sf:errors path="link"></sf:errors>
				</div>
			</div>
			<div class="form-group">
				<label for="username">Allow access to:</label>
				<sf:select class="form-control"  path="username">
					<c:forEach var="user" items="${users}">
						<option value="${user.username}">${user.username}</option>
					</c:forEach>
				</sf:select>
				<div class="error">
					<sf:errors path="username"></sf:errors>
				</div>
			</div>
			<button type="submit" class="btn btn-default">Upload album</button>
		</sf:form>
	</div>
</body>

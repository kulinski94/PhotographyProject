<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h2>Select user to see photos</h2>
<div class="container">
	<sf:form method="post" class="form-inline"
		action="${pageContext.request.contextPath}/userphotos"
		commandName="user">

		<div class="form-group ">
			<label for="dealer">Users:</label>
			<sf:select class="form-control" path="username">
				<c:forEach items="${users}" var="user">
					<option value="${user.username}">${user.username}</option>
				</c:forEach>
			</sf:select>
		</div>
		<button type="submit" class="btn btn-default">See photos</button>
	</sf:form>
</div>

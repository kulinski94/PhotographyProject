<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<c:if test="${photos.size() == 0}">
	Has no photos
</c:if>
	<c:if test="${photos.size() > 0}">
Not selected photos 
	<sf:form class="form-horizontal" commandName="order"
			action="${pageContext.request.contextPath}/submitphotos">
			<table class="photos">
				<thead>
					<tr>
						<td>PHOTO</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="photo" items="${photos}">
						<c:if test="${!photo.selected}">
							<tr>
								<td><input id="${photo.id}" type="checkbox" class="checkbox"
									value="${photo.id}"  /><label
									for="${photo.id}" style="background: url(${photo.url})" onclick="select(${photo.id})">
								</label></td>
								<td><sf:checkbox path="selectedIds" value="${photo.id}"
										id="sf${photo.id}"/></td>
							</tr>
							<sf:errors path="selectedIds">
							</sf:errors>
						</c:if>
					</c:forEach>
				<thead>
			</table>
			<button type="submit" class="btn btn-default">Select photos</button>
		</sf:form>

	</c:if>

	<script type="text/javascript">
		function select(id) {
			var remember = document.getElementById(id);
			if (remember.checked) {
				document.getElementById("sf"+id).checked = false;
			} else {
				document.getElementById("sf"+id).checked = true;
			}
		}
	</script>
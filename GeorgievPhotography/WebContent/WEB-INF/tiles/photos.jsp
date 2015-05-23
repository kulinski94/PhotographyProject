<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<c:if test="${photos.size() == 0}">
	Has no photos
	</c:if>
	<c:if test="${photos.size() > 0}">
		<div class="container">
			SELECTED PHOTOS
			<table class="table">
				<thead>
					<tr>
						<th>Title</th>
						<th>PHOTO</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="photo" items="${photos}">
						<c:if test="${photo.selected}">
							<tr>
								<td><c:out value="${photo.title}"></c:out></td>
								<td><img class="thumbnail" src="${photo.url}"></td>
							</tr>
						</c:if>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>

</div>
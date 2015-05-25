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
		<sf:form class="form" commandName="order"
			action="${pageContext.request.contextPath}/submitphotos">
			<h3>Select your photos then submit</h3>
			<p>
				<button type="button" class="btn btn-primary btn-lg" onclick="checkForSelectedIds()">Submit
					photos</button>
			</p>
			<c:forEach var="photo" items="${photos}">
				<c:if test="${!photo.selected}">
					<div class="col-md-4">
						<input id="${photo.id}" type="checkbox" class="checkbox"
							value="${photo.id}" /><label for="${photo.id}"
							style="background: url(${photo.url}) no-repeat"
							onclick="select(${photo.id})"> </label>
						<sf:checkbox path="selectedIds" value="${photo.id}"
							id="sf${photo.id}" />
						<sf:errors path="selectedIds">

						</sf:errors>
					</div>
				</c:if>
			</c:forEach>
		</sf:form>
	</c:if>
</div>
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
<script type="text/javascript">
		function checkForSelectedIds() {
			var order = document.getElementById("order");
			var checkboxes = order.getElementsByClassName("checkbox");
			var noOneIsChecked = true;
			for (i = 0; i < checkboxes.length; i++) { 
			    if(checkboxes[i].checked){
			    	noOneIsChecked = false;
			    	break;
			    }
			}
			if(noOneIsChecked){
				alert("You must select at least one photo");
			}else{
				order.submit();
			}	
		}
	</script>
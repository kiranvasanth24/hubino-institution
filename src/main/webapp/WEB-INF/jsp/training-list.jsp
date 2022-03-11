<%--
  Created by IntelliJ IDEA.
  com.example.demo.User: GH
  Date: 09-Feb-22
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>View Users</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.card-deck {
	margin-bottom: 15px;
}
</style>
</head>
<body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div class="container">
		<h1>Users List</h1>
		<a href="adduserform.jsp">Add New User</a>
		<div class="row">
			<c:forEach items="${list}" var="u">
				<div class="col-3 card-deck">
					<div class="card">
						<img class="card-img-top" src="${u.course_img}"
							alt="Card image cap" height="100" width="100">
						<div class="card-body">
							<p class="card-title">
								<span class="font-weight-bold">Name : </span><label>${u.trainer_name}</label>
							</p>
							<p class="card-text">
								<span class="font-weight-bold">Id : </span><label>${u.trainingId}</label>
							</p>
							<p class="card-text">
								<span class="font-weight-bold">Course : </span><label>${u.course}</label>
							</p>
							<p class="card-text">
								<span class="font-weight-bold">Duration : </span><label>${u.duration}</label>
							</p>

							<a href="edit?id=<c:out value='${u.trainingId}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${u.trainingId}' />">Delete</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>

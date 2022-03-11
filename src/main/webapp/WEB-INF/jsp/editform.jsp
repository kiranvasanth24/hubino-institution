<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="update" method="post">

					<input type="hidden" name="trainingId" value="${trainingInfo.trainingId}" />

					<fieldset class="form-group">
						<label>Training Name</label> <input type="text"
							value="${trainingInfo.trainer_name}" class="form-control"
							name="trainer_name" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Training Id</label> <input type="text"
							value="${trainingInfo.description}" class="form-control"
							name="description">
					</fieldset>

					<fieldset class="form-group">
						<label>Course</label> <input type="text"
							value="${trainingInfo.course}" class="form-control" name="course">
					</fieldset>

					<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
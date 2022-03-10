<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hubino Institution</title>

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet"></link>

<script>
	var initial_timer = (1000 * 60 * 2);
	var timer = initial_timer;
	var stop = false;
	
	var eventList = ["mousemove", "click", "mousedown", "mouseenter", "mouseleave", "mousemove", "mouseout", "mouseover", "mouseup"];
	
	for(event of eventList) {
		document.addEventListener(event, function() {
		timer = initial_timer; 
	});
	}

	if (!stop) {
		setInterval(function() {
			timer -= 1000;
			console.log("Timer:" + timer);
			if (timer == 0 || timer < 0) {
				window.location = "/login_page";
				stop = true;
			}
		}, 1000);
	}

	$(document).ready(function() {
		var minDate = new Date();
		$("#s_date").datepicker({
			showAnim : 'drop',
			numberOfMonth : 1,
			minDate : minDate,
			onClose : function(selectedDate) {
				$('#e_date').datepicker("option", "minDate", selectedDate);
				display();
			}
		});

		$("#e_date").datepicker({
			showAnim : 'drop',
			numberOfMonth : 1,
			minDate : minDate,
			onClose : function() {
				display()
			}
		});
	});
	function display() {
		var sd = new Date(document.getElementById('s_date').value);
		var ed = new Date(document.getElementById('e_date').value);

		var oneDay = 24 * 60 * 60 * 1000;
		var diffDays = Math.abs((ed.getTime() - sd.getTime()) / (oneDay));

		var res = "<input type=\"text\" name=\"duration\" class=\"form-control\" placeholder=\"duration\" value=\""+diffDays+"\" required/>";
		document.getElementById('out').innerHTML = res;
	}
</script>

<style>
body {
	background-image:
		url("https://images.pexels.com/photos/1468419/pexels-photo-1468419.jpeg?cs=srgb&dl=pexels-pied-piper-1468419.jpg&fm=jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<br>
	<h1 class="text-center text-success">Course Registration</h1>
	<br>
	<div class="container">
		<a href="/login_page" class="btn btn-info btn-lg"> <span
			class="glyphicon glyphicon-log-out"></span> ${username}
		</a>
	</div>
	<div class="container">
		<div class="col-lg-8
		m-auto d-block">

			<form action="training" method="get">

				<div class="form-group">
					<label style="color: white">Course: </label><select name="course"
						class="form-control">
						<option value="java">java</option>
						<option value="python">python</option>
						<option value="cpp">cpp</option>
						<option value="scala">scala</option>
					</select> <br />
				</div>
				<div class="form-group">
					<label style="color: white">Trainer: </label><select name="trainer"
						class="form-control">
						<option value="trainer1">trainer1</option>
						<option value="trainer2">trainer2</option>
						<option value="trainer3">trainer3</option>
						<option value="trainer4">trainer4</option>
					</select> <br />
				</div>
				<div class="form-group">
					<label style="color: white">Start_date: </label><input type="text"
						class="form-control" name="start_date" id="s_date"
						placeholder="dd/mm/yyyy" required /> <br />
				</div>
				<div class="form-group">
					<label style="color: white">End_date: </label><input type="text"
						class="form-control" name="end_date" id="e_date"
						placeholder="dd/mm/yyyy" required /> <br />
				</div>
				<div class="form-group">
					<label style="color: white">Description: </label><input type="text"
						class="form-control" name="desc" placeholder="description"
						required /> <br />
				</div>
				<div class="form-group">
					<label style="color: white">Duration: </label>
					<p id="out"></p>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="submit" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
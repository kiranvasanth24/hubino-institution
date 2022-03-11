<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet"></link>
<script>
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
		document.getElementById('dur').innerHTML = res;
	}
</script>
</head>
<body>
<br>
	<h1 class="text-center text-success">
		Edit Training Details
	</h1>
<br>
<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="training" method="get">

					<input type="hidden" name="id" id="id"
						value="${trainingInfo.trainingId}" /> <br />
					<div class="form-group">
						<p id="cou"></p>
					</div>
					<div class="form-group">
						<p id="tra"></p>
					</div>
					<div class="form-group">
						<label>Start_date: </label><input type="text"
							class="form-control" value="${trainingInfo.start_date}"
							name="start_date" id="s_date" placeholder="dd/mm/yyyy" required />
						<br />
					</div>
					<div class="form-group">
						<label>End_date: </label><input type="text" class="form-control"
							value="${trainingInfo.end_date}" name="end_date" id="e_date"
							placeholder="dd/mm/yyyy" required /> <br />
					</div>
					<div class="form-group">
						<label>Description: </label><input type="text"
							class="form-control" value="${trainingInfo.description}"
							name="desc" placeholder="description" required /> <br />
					</div>
					<div class="form-group">
						<label>Duration: </label>
						<p id="dur"></p>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="submit" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	var prev_course = "${trainingInfo.course}";

	var res_course_start = "<div class=\"form-group\"><label>Course: </label><select name=\"course\"class=\"form-control\">";
	if (prev_course == "java") {
		res_course_start += "<option value=\"java\" selected>java</option><option value=\"python\">python</option><option value=\"cpp\">cpp</option><option value=\"scala\">scala</option>";
	} else if (prev_course == "python") {
		res_course_start += "<option value=\"java\">java</option><option value=\"python\" selected>python</option><option value=\"cpp\">cpp</option><option value=\"scala\">scala</option>";
	} else if (prev_course == "cpp") {
		res_course_start += "<option value=\"java\">java</option><option value=\"python\">python</option><option value=\"cpp\" selected>cpp</option><option value=\"scala\">scala</option>";
	} else if (prev_course == "scala") {
		res_course_start += "<option value=\"java\">java</option><option value=\"python\">python</option><option value=\"cpp\">cpp</option><option value=\"scala\" selected>scala</option>";
	}

	document.getElementById('cou').innerHTML = res_course_start
			+ "</select> <br /></div>";
	
	var prev_trainer = "${trainingInfo.trainer_name}";
	var res_trainer_start = "<div class=\"form-group\"><label>Trainer: </label><select name=\"trainer\" class=\"form-control\">";
	if (prev_trainer == "trainer1") {
		res_trainer_start += "<option value=\"trainer1\" selected>trainer1</option><option value=\"trainer2\">trainer2</option><option value=\"trainer3\">trainer3</option><option value=\"trainer4\">trainer4</option>";
	} else if (prev_trainer == "trainer2") {
		res_trainer_start += "<option value=\"trainer1\" >trainer1</option><option value=\"trainer2\" selected>trainer2</option><option value=\"trainer3\">trainer3</option><option value=\"trainer4\">trainer4</option>";
	} else if (prev_trainer == "trainer3") {
		res_trainer_start += "<option value=\"trainer1\" >trainer1</option><option value=\"trainer2\" >trainer2</option><option value=\"trainer3\" selected>trainer3</option><option value=\"trainer4\">trainer4</option>";
	} else if (prev_trainer == "trainer4") {
		res_trainer_start += "<option value=\"trainer1\" >trainer1</option><option value=\"trainer2\" >trainer2</option><option value=\"trainer3\" >trainer3</option><option value=\"trainer4\" selected>trainer4</option>";
	}
	document.getElementById('tra').innerHTML = res_trainer_start
			+ "</select> <br /></div>";

	var res = "<input type=\"text\" name=\"duration\" class=\"form-control\" placeholder=\"duration\" value=\""+${trainingInfo.duration}+"\" required/>";
	document.getElementById('dur').innerHTML = res;
</script>
</html>
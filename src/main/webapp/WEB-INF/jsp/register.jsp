<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <style>
    body {
  background-image:url("https://images.pexels.com/photos/159711/books-bookstore-book-reading-159711.jpeg?cs=srgb&dl=pexels-pixabay-159711.jpg&fm=jpg");
  background-size: 100% 190%;
    background-repeat: no-repeat;
}
</style>
</head>

<body><br>
	<h1 class="text-center text-success">
		<span style="color:white">Create User Account</span>
	</h1>



	<div class="container">
	<div class="col-lg-8
		m-auto d-block">
		<form  action="register_user" method="get" >
		<div class="form-group">
			<label for ="user" style="color:white">
				Username:
			</label>
			<input type="text"
					name="username" id="username"
					class="form-control"  placeholder="Username" required>
			<h5 id="usercheck" style="color: red;" >
					**Username is missing
			</h5>
		</div>

		<div class="form-group">
			<label for="password" style="color:white">
					Password:
			</label>
			<input type="password" name="password"
				id="password" class="form-control" placeholder="Password" required>
			<h5 id="passcheck" style="color: red;">
				**Please Fill the password
			</h5>
		</div>

		<div class="form-group">
			<label for="conpassword" style="color:white">
					Confirm Password:
			</label>
			<input type="password" name="c_password"
					id="c_password" class="form-control" placeholder="Confirm Password" required>
			<h5 id="conpasscheck" style="color: red;">
				**Password didn't match
			</h5>
		</div>

		<input type="submit" id="submitbtn"
			value="Sign Up" class="btn btn-primary">
		</form>
	</div>
	</div>
</body>
<script>
$(document).ready(function () {
	$('#usercheck').hide();
	let usernameError = true;
	$('#username').keyup(function () {
		validateUsername();
	});
	
	function validateUsername() {
	let usernameValue = $('#username').val();
	if (usernameValue.length == '') {
	$('#usercheck').show();
		usernameError = false;
		return false;
	}
	else if((usernameValue.length < 3)||
			(usernameValue.length > 20)) {
		$('#usercheck').show();
		$('#usercheck').html
("**length of username must be between 3 and 20");
		usernameError = false;
		return false;
	}
	else {
		$('#usercheck').hide();
	}
	}

	$('#passcheck').hide();
	let passwordError = true;
	$('#password').keyup(function () {
		validatePassword();
	});
	function validatePassword() {
		let passwordValue =
			$('#password').val();
		if (passwordValue.length == '') {
			$('#passcheck').show();
			passwordError = false;
			return false;
		}
		if ((passwordValue.length < 7)||
			(passwordValue.length >20)) {
			$('#passcheck').show();
			$('#passcheck').html
("**length of your password must be between 7 and 20");
			$('#passcheck').css("color", "red");
			passwordError = false;
			return false;
		} else {
			$('#passcheck').hide();
		}
	}
		
	$('#conpasscheck').hide();
	let confirmPasswordError = true;
	$('#c_password').keyup(function () {
		validateConfirmPassword();
	});
	function validateConfirmPassword() {
		let confirmPasswordValue =
			$('#c_password').val();
		let passwordValue =
			$('#password').val();
		if (passwordValue != confirmPasswordValue) {
			$('#conpasscheck').show();
			$('#conpasscheck').html(
				"**Password didn't Match");
			$('#conpasscheck').css(
				"color", "red");
			confirmPasswordError = false;
			return false;
		} else {
			$('#conpasscheck').hide();
		}
	}

	$('#submitbtn').click(function () {
		validateUsername();
		validatePassword();
		validateConfirmPassword();
		validateEmail();
		if ((usernameError == true) &&
			(passwordError == true) &&
			(confirmPasswordError == true) &&
			(emailError == true)) {
			return true;
		} else {
			return false;
		}
	});
});
</script>
</html>

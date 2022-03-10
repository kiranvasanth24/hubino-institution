<!DOCTYPE html>
<!--<html xmlns:th="http://www.thymeleaf.org">-->
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Sign Up - CodeJava</title>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   
     <div class="container text-center">
    <c:if test="${not empty errorMsg}">
      <div class="alert alert-danger role="alert">${errorMsg}</div>
     </c:if>
     <c:if test="${not empty successMsg}">
      <div class="alert alert-success role="alert">${successMsg}</div>
     </c:if>
    
        <div>
            <h1>User Registration - Sign Up</h1>
        </div>
        <form action="register_user" method="get" style="max-width: 600px; margin: 0 auto;">
        <div class="m-3">
            <div class="form-group row">
                <label class="col-4 col-form-label">User Name: </label>
                <div class="col-8">
                    <input type="text" class="form-control" name="username" required />
                </div>
            </div>
             
            <div class="form-group row">
                <label class="col-4 col-form-label">Password: </label>
                <div class="col-8">
                    <input type="password"  class="form-control" name="password"
                           id="password" required minlength="6" maxlength="10"/>
                </div>
            </div>
             
            <div class="form-group row">
                <label class="col-4 col-form-label">Confirm Password: </label>
                <div class="col-8">
                    <input type="password"  class="form-control" name="c_password"
                          id="c_password"  required minlength="2" maxlength="20"/>
                </div>
            </div>
             
            <div>
                <button type="submit" onclick="function()" class="btn btn-primary">Sign Up</button>
            </div>
        </div>
        
        </form>
    </div>
</body>
<script>
jQuery(function(){
        $("#submit").click(function(){
        $(".error").hide();
        var hasError = false;
        var passwordVal = $("#password").val();
        var checkVal = $("#c_password").val();
        if (passwordVal == '') {
            $("#password").after('<span class="error">Please enter a password.</span>');
            hasError = true;
        } else if (checkVal == '') {
            $("#c_password").after('<span class="error">Please re-enter your password.</span>');
            hasError = true;
        } else if (passwordVal != checkVal ) {
            $("#c_password").after('<span class="error">Passwords do not match.</span>');
            hasError = true;
        }
        if(hasError == true) {return false;}
    });
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
<title>Mandal Theater | LogIn</title>
<style>
        .container {
                font-size: 40px;
                position: relative;
                text-align: center;
                color: white;
            }
        form{
            position: absolute;
            top: 80px;
            left: 40px;
            background:rgb(255,255,255,0.3);
            backdrop-filter:blur(10px);
            border-radius:25px;
        }
        .form-group{
            color: white;
            padding-top:10px;
            padding-right:20px;
            padding-left:20px;
        }
        input{
            background: rgba(0,0,0,0);
            opacity: 0.5;
            border: none;
            outline: none;
        }
        label{
            font-size: x-large;
        }
        button{
            opacity: 0.9;
        }
    </style>
    
</head>
<body style="background-color:black;">
<div class="container">
        <img src="${pageContext.request.contextPath}\assortment-cinema-elements-red-background-with-copy-space.jpg" class="img-fluid" alt="not available" alt="theater" style="object-fit: fill;">
        
        <div class="container" style=" text-align: right; position: absolute; top: 50px;left: 20px; width:1100px; height:430px;background:rgba(212, 210, 210, 0.279);
        backdrop-filter:blur(9px);
        border-radius:25px;">
            <h1 style="font-size:80px;text-align:right;">Welcome <br>To</h1>
            <br>
        <h2 style="font-size:50px;text-align:right;">Mandal<br> Theater</h2>
        </div>
        <form action="/user/logincredentials" method="post" id="login">
          <div class="form-group">
            <label class="rounded float-left" for="exampleInputEmail1"><img src="${pageContext.request.contextPath}\email.png" width="25" height="25"> Email address</label>
            <input type="email" class="form-control" id="customerEmail" name="customerEmail" aria-describedby="emailHelp" oninput="checkEmail()"required>
            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
            <p id = "output" style="font-size: 1rem;color: white;margin: 0.1rem 1rem; width: 380px;"></p>
          </div>
          <div class="form-group">
            <label class="rounded float-left" for="exampleInputPassword1"><img src="${pageContext.request.contextPath}\padlock.png" width="25" height="25"> Password</label>
            <input type="password" class="form-control" id="customerPassword" name="customerPassword" required>
          </div>
          <!--<div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <a href="/user/forgotPassword" style="font-size:medium;">Forgot Password</a>
          </div>-->
          <br>
          <button type="submit" class="btn btn-dark">Log In</button>
          <div style="font-size:small;" id="loginStatus">
            ${msg}
          </div>
          <h6>Don't Have an Account? <a href="registerpage">Create One</a></h6>
        </form>
        
    </div>
    <!-- Prevents back button -->
	<script type="text/javascript">
    var output = document.getElementById('loginStatus');
			function checkEmail(){
        let customerEmail = document.getElementById('customerEmail').value;
         let regex = new RegExp(/^[^\s@]+@[^\s@]+\.[^\s@]+(\.[^\s@]+)?$/);
         let regex2 = /^.*\.com$/;
         let isValid = regex.test(customerEmail);
         let isSecondValid = regex.test(customerEmail);
         console.log(isValid);
         console.log(isSecondValid);
         if (isValid && isSecondValid) {
            output.innerHTML = null;
         } else {
            output.innerHTML = customerEmail + " is not a valid email !";
         }
      }
      
	</script>
</body>
</html>
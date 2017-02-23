<!DOCTYPE html>

<html land="en">

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" >
	<link href="bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" >
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/validator.js"></script>

	<meta charset=utf-8>
	<title>More Each Day</title>
</head>

<body class="bodycontent">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="register-outsidebox" id="reg">
					<section>
						<h1 class="title">Register: </h1>
						<br>
						<form action="Register" method="POST">			
							<div class="name-input">
								<input type="text" name="username" placeholder="Username" class="username" value="" required />
							</div>
							<br>
							<br>
							<div class = "pass-input">
								<input type="text" name="email" placeholder="Email" class="password" value="" required=""/>
							</div>
							<br>
							<br>
							<div class="pass-input">
								<input id="pass1" type="password" name="password" placeholder="Password" class="password" required />
							</div>
							<br>
							<br>
							<div class="pass-input">
								<input id="pass2" onkeyup="checkPass(); return false;"
								type="password" name="pass-rep" placeholder="Repeat Password" class="password" required />
							</div>
							<br>
							<br>
							<div class="blue-button-box">
								<button type="submit" class="blue-button">Register</button>
							</div>
							<br>
							<div class="red-button-box">
								<button onclick="window.location.href='/MoreEachDay/Login'" class="red-button">Log In</button>
							</div>	
						</form>
					</section>
				</div>
			</div>
		</div>
</body>
</html>

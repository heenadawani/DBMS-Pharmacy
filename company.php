<<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<a href="pharmacy.php">HOME</a>
		<br>
		<form action="connect.php" method="post">
			<input type="text" placeholder="search the company" id="c_name" name="c_name"/>
			<button type="submit" value="submit1" name="submit1" id="submit1"/>
		</form>
		<?php "include connect.php" ;
            ?>
			
	</body>
</html>
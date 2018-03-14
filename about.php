<<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<a href="pharmacy.php">HOME</a>
		<br>
		
			<?php 
			$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "pharmacy";
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} $sql="Select * from pharmacy where ph_id=601";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) 
		{
		   if ($result->num_rows > 0) 
			{
				while($row = $result->fetch_assoc()) 
				{
					echo "<br> ID: ". $row["ph_id"]. "  <br>NAME: ". $row["ph_name"]."  <br>ADDRESS: ". $row["ph_address"]."<br>";
				}
			}
		}
		else
		{
			echo "0 results";
		}?>
		
		<?php "include connect.php" ;
            ?>
			
	</body>
</html>
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
	} 

	if(isset($_POST['submit']))
	{
		session_start();
		$trade_name=$_POST['trade_name'];
		$sql="Select * from drug where trade_name='$trade_name'";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) 
		{
		   if ($result->num_rows > 0) 
			{
				while($row = $result->fetch_assoc()) 
				{
					echo "<br> NAME: ". $row["trade_name"]. "  <br>CONTENT: ". $row["content"]."  <br>COLOR: ". $row["color"]."<br>";
				}
			}
		}
		else
		{
			echo "0 results";
		}
	}
	
	if(isset($_POST['submit1']))
	{
		session_start();
		$c_name=$_POST['c_name'];
		$sql="Select c_id,cname from company where cname='$c_name'";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) 
		{
		   if ($result->num_rows > 0) 
			{
				while($row = $result->fetch_assoc()) 
				{
					echo "<br> COMPANY ID: ". $row["c_id"]. "  <br>NAME: ". $row["cname"]."<br>";
				}
			}
		}
		else
		{
			echo "0 results";
		}
	}
	
	if(isset($_POST['submit2']))
	{
		session_start();
		$sql="Select * from pharmacy where ph_id=601";
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
		}
	}
	$conn->close();
?>
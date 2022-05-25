
<!DOCTYPE html>
 <head>  <title>Enter todoid to display data - creating a simple web application</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <style>
li {list-style: none;}
</style>
</head>
<body>
<h2>Enter todo Id and submit to edit</h2>
<p> test id: 32067211-9022-4e80-9695-87663bfef540 </P>
<ul>
<form name="display" action="index.php" method="POST" >
<li>todo ID:</li><li><input type="text" name="todo_id" /></li>
<li><input type="submit" name="submit" /></li>
</form>
</ul>

<?php
$db = pg_connect(
    "host=ec2-54-247-96-153.eu-west-1.compute.amazonaws.com 
    port=5432 
    dbname=d9tr4lb9pa72v9 
    user=sqfgksfzywzsiu 
    password=a3cdd44eb09149e491ed1c95cf71a6ecac8fdd67d2400421617a4c17c0da841f"
);
// $query = "INSERT INTO todo VALUES ('$_POST[todo_id]','$_POST[todo_name]',
//$query = "INSERT INTO users VALUES (uuid_generate_v4 (),'mos11@gmail.com', crypt('mos11', gen_salt('bf')), current_timestamp,current_timestamp)";
// $query = "SELECT * from USERS";
// $result = pg_query($query); 

$result = pg_query($db, "SELECT * FROM todos WHERE todo_id = '$_POST[todo_id]'"); 

if (isset($_POST['submit']))

{

    $result = pg_query($db, "SELECT * FROM todos WHERE todo_id = '$_POST[todo_id]'"); 
    $row = pg_fetch_assoc($result);
echo "<ul>
		<form name='update' action='index.php' method='POST' >
			<li> Todo ID: '$row[todo_id]' </li><li><input type='hidden' name='todo_id' value='$row[todo_id]'  /></li>
			<li>Date of creation: '$row[created_on]'</li>
            <li>Last update on: '$row[updated_on]'</li>
            <li>Todos Name:<input type='text' name='todo_name_updated' value='$row[name]' /></li>
			<li><input type='submit' name='new' /></li>  
		</form>
    </ul>";
}


if (isset($_POST['new']))
{  

    $result1 = pg_query($db, "UPDATE todos SET name = '$_POST[todo_name_updated]'  WHERE todo_id = '$_POST[todo_id]'");
   
    if(!$result1)
        {
        echo "Update failed!!";
        } else
        {
        echo "Update successfull;";
        }
}

?>
</body>
</html>
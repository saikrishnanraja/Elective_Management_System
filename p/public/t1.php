<?php
session_start();
error_reporting(0);
include("../../s/includes/config.php");


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $file_path = 'C:\Users\Welcome\Downloads/mn.txt';

if (file_exists($file_path)) {
    $fileContent = file_get_contents($fileName);
    $phoneNumber = substr($fileContent, strpos($fileContent, ':') + 2);
    if (unlink($file_path)) {
        echo 'File deleted successfully.';
    } else {
        echo 'Unable to delete the file.';
    }
} else {
    echo 'File does not exist.';
}
  $pnumb = $_POST['phno'];
    $sql = "SELECT * FROM students WHERE phnumber='$pnumb'";
    $result = mysqli_query($con, $sql);
    if (mysqli_num_rows($result) > 0) {
      $row = mysqli_fetch_assoc($result);
      $regno = $row['StudentRegno'];
      $password = $row['password'];
      $name=$row['studentName'];
      $query=mysqli_query($con,"SELECT * FROM students WHERE StudentRegno='$regno' and password='$password'");
      $num=mysqli_fetch_array($query);
    if($num>0)
    {
       if($phoneNumber==$pnumb)
     {
$_SESSION['login']=$regno;
$_SESSION['id']=$regno;
$_SESSION['sname']=$name;
$uip=$_SERVER['REMOTE_ADDR'];
$status=1;
$log=mysqli_query($con,"insert into userlog(studentRegno,userip,status) values('".$_SESSION['login']."','$uip','$status')");
header("location:http:../../s/change-password.php");
}
else
{

  echo 'The mobile numbers you entered don\'t match';
  }
}
    } else {
      echo "No user found with that mobile number";
    }
  }
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
    .h {
      background-color: #a95d6b;
    }
  </style>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Student Login</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />

</head>
<body>
    <?php include('../../s/includes/header.php');?>

<section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                             <li><a href="admin/">Admin Login </a></li>
                              <li><a class="h" href="index.php">Student Login</a></li>
        

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">OTP Check Successful!  Please Enter Mobile Number to login</h4>


                </div>

            </div>
             <span style="color:red;" ><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
            <form name="admin" method="post">
            <div class="row">
                <div class="col-md-6">
                     <label>Enter mobile number : </label>
                        <input type="text" name="phno" class="form-control"  />
                        <hr />
                        <button type="submit" name="submit" class="btn btn-info"><span class="glyphicon glyphicon-user"></span> &nbsp;Log Me In </button>&nbsp;
                </div>
                </form>
                <div class="col-md-6">
                    <div class="alert alert-info">
                
                         <strong> Latest News / Updates</strong>
                         <marquee direction='up'  scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                        <ul>
                            <?php
$sql=mysqli_query($con,"select * from news");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{
?>
                            <li>
                              <a href="news-details.php?nid=<?php echo htmlentities($row['id']);?>"><?php echo htmlentities($row['newstitle']);?>-<?php echo htmlentities($row['postingDate']);?></a>
                            </li>
                           <?php } ?> 
                     
                        </ul>
                    </marquee>
                       
                    </div>
                                    </div>

            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <?php include('../../s/includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>

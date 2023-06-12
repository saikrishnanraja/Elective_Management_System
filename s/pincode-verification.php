
<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
    {   
header('location:index.php');
}
else{
  date_default_timezone_set('Asia/Kolkata'); // change according to timezone
  $currentTime = date('d-m-Y h:i:s A', time());

  // Read the JSON file
  $filePath = 'admin/dates.json';
  $jsonData = file_get_contents($filePath);
  $data = json_decode($jsonData, true);

  $startDate = $data['sdate'];
  $endDate = $data['edate'];

  // Compare the current date with the start and end dates
  $currentDate = strtotime(date('Y-m-d'));
  $startDate = strtotime($startDate);
  $endDate = strtotime($endDate);

  if ($currentDate < $startDate) {
      // Registration hasn't begun
      $message = "Registration hasn't begun.";
      $displayForm = false;
  } elseif ($currentDate > $endDate) {
      // Registration date is over
      $message = "Registration date is over.";
      $displayForm = false;
  }
  else{

    $message = "";
    $displayForm = true;
if(isset($_POST['submit']))
{
$sql=mysqli_query($con,"SELECT * FROM  students where pincode='".trim($_POST['pincode'])."' && StudentRegno='".$_SESSION['login']."'");
$num=mysqli_fetch_array($sql);
if($num>0)
{
$_SESSION['pcode']=$_POST['pincode'];
header("location:enroll.php");
}else{
echo '<script>alert("Error : The selected location is not registered with this account!!")</script>';
echo '<script>window.location.href=my-pincode-verification.php</script>';    
}
}
  }
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Pincode Verification</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['login']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Student Pincode Verification</h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Pincode Verification
                        </div>
<font color="red" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>


                        <div class="panel-body">
                        <?php if ($displayForm) { ?>
                       <form name="pincodeverify" method="post">
   <div class="form-group">
    <label for="pincode">Select Registered Location:</label>
                <select class="form-control" id="pincode" name="pincode" required>
                <option value="" disabled selected>Select Location</option>
                  <option value="641001">Coimbatore-641001</option>
                  <option value="690525">Amritapuri-690525</option>
                  <option value="560035">Bengaluru-560035</option>
                  <option value="682041">Kochi-682041</option>
                  <option value="570026">Mysore-570026</option>
                  <option value="601103">Chennai-601103</option>
                </select>
                </div>
 
  <button type="submit" name="submit" class="btn btn-default">Verify</button>
                           <hr />
   
                             </div>


</form>
<?php } else { ?>
                           <p><?php echo $message; ?></p>
                       <?php } ?>
                            </div>
                            </div>
                    </div>
                  
                </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
<?php } ?>

<?php
session_start();
include('includes/config.php');
//if(strlen($_SESSION['alogin'])==0)
  //{   
  //}
//else
//{

if(isset($_POST['submit']))
{
$studentname=$_POST['studentname'];
$studentregno=$_POST['studentregno'];
$mailid=$_POST['studentmail'];
$num=$_POST['studentnum'];
$num="91" . trim($num);
$pincode = $_POST['pincode'];
$password=md5($_POST['password']);

$ret=mysqli_query($con,"insert into students(studentName,StudentRegno,password,pincode,mail,phnumber) values('$studentname','$studentregno','$password','$pincode','$mailid','$num')");
if($ret)
{
echo '<script>alert("Student Registered Successfully. Pincode is "+"'.$pincode.'")</script>';
echo '<script>window.location.href=manage-students.php</script>';
}else{
echo '<script>alert("Something went wrong. Please try again.")</script>';
echo '<script>window.location.href=manage-students.php</script>';
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
    <title>Student Registration</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>

<body>


<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Student Registration  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Student Registration
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>


                        <div class="panel-body">
                       <form name="dept" method="post">
   <div class="form-group">
    <label for="studentname">Student Name  </label>
    <input type="text" class="form-control" id="studentname" name="studentname" placeholder="Student Name" required />
  </div>

 <div class="form-group">
    <label for="studentregno">Student Reg No   </label>
    <input type="text" class="form-control" id="studentregno" name="studentregno" onBlur="userAvailability()" placeholder="Student Reg no" required />
     <span id="user-availability-status1" style="font-size:12px;">
  </div>

  <div class="form-group">
    <label for="studentmail">Student Mail Id   </label>
    <input type="text" class="form-control" id="studentmail" name="studentmail" onBlur="userAvailability()" placeholder="Student Mail" required />
     <span id="user-availability-status1" style="font-size:12px;">
  </div>
  
  <div class="form-group">
    <label for="studentmail">Student Contact Number   </label>
    <input type="text" class="form-control" id="studentnum" name="studentnum" onBlur="userAvailability()" placeholder="Student Contact Number" required />
     <span id="user-availability-status1" style="font-size:12px;">
  </div>
  <div class="form-group">
                <label for="pincode">Location   </label>
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

<div class="form-group">
    <label for="password">Password  </label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required />
    <span id="password-validation-msg" style="color: red;"></span>
  </div>   

 <button type="submit" name="submit" id="submit" class="btn btn-default">Submit</button>
 <?php
if(strlen($_SESSION['alogin'])==0)
{
?>
    <div id="my-element"><a href="../index.php">Go back to Log In</a></div>
    <?php
}
?>
</form>
                            </div>
                            </div>
                    </div>
                  
                </div>

            </div>





        </div>
    </div>
  <?php include('includes/footer.php');?>
    <script src="../assets/js/jquery-1.11.1.js"></script>
    <script src="../assets/js/bootstrap.js"></script>
<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'regno='+$("#studentregno").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
<script>
function checkPasswordValidity() {
    var password = document.getElementById("password").value;
    var msgElement = document.getElementById("password-validation-msg");

    if (password.length < 8 || !/[a-zA-Z]/.test(password) || !/[0-9]/.test(password)) {
        msgElement.textContent = "Password must be at least 8 characters long and contain a mix of alphabets and numbers.";
    } else {
        msgElement.textContent = "";
    }
}

// Call the function on password field change
document.getElementById("password").addEventListener("input", checkPasswordValidity);
</script>

</body>
</html>
<?php ?>

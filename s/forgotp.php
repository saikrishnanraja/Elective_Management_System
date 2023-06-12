<?php
$filename = 'C:\Users\Welcome\Downloads/mn.txt';
$redirectFile = 'slogin2.php';

if (file_exists($filename)) {
    // Redirect to the specified file
    header("Location: $redirectFile");
    exit;
} else {

session_start();
error_reporting(0);
if (isset($_POST['submit1'])) {
    $_SESSION['ml'] = $_POST['email'];
$randomNumber = mt_rand(100000, 999999);
    $_SESSION['otp'] = $randomNumber;
    $file = 'ver.json';
    $data = [
      'myVariable1' => $_SESSION['ml'],
      'myVariable2' => $_SESSION['otp']
  ];
  file_put_contents($file, json_encode($data));
  echo '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>

$(document).ready(function() {
    $.ajax({
      type: "POST",
      url: "run_app.php",
      success: function(response) {
        console.log(response);
      },
      error: function(error) {
        console.error(error);
      }
     





    });
  });

</script>';
    //header('Location: otp.php');
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
    <?php include('includes/header.php');?>
    
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
                    <h4 class="page-head-line">Please Login To Enter </h4>

                </div>

            </div>
             
            
            <span style="color:red;" ><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
            <form id="emailForm" method="post" name="admin">
            <div class="row">
                <div class="col-md-6">
                     <label>Enter mail id : </label>
                        <input type="email" id="email" name="email" class="form-control"  />
                        <hr />
                        <button type="submit" name="submit1" id="sendButton" class="btn btn-info"><span class="glyphicon glyphicon-user"></span>Send Email</button>&nbsp;
                        <button type="button" name="redir" onclick="location.href='otp.php';" class="btn btn-default">Enter otp</button>
                        <a href="http://localhost:3000/">Verify my mobile number</a>
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
    <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>

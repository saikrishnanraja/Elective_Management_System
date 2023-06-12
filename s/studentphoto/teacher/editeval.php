<?php
session_start();
include('includes/config.php');
if(strlen($_SESSION['tlogin'])==0)
    {   
header('location:index.php');
}
else{
     $nm=$_SESSION['con'];
    if(isset($_POST['submit']))
    {
        $snm=$_POST['seval'];
        $mrks=$_POST['testmarks'];
        $enm=$_POST['eval'];
        $ret=mysqli_query($con,"INSERT INTO marks (sname, ename, mark) VALUES ('$snm', '$enm', $mrks);");
        if($ret)
{
echo '<script>alert("Mark Entered Successfully !!")</script>';
echo '<script>window.location.href=editeval.php</script>';
}else {
echo '<script>alert("Error : Marks Not Entered!!")</script>';
echo '<script>window.location.href=editeval.php</script>';
}
    }
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Teacher | Course</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['tlogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Evaluation  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           Evaluation
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>


                        <div class="panel-body">
                       <form name="dept" method="post">
                       <div class="form-group">
   <label for="course">Select a Evaluation:</label>
        <select id="course" name="eval">
            <?php
            // Connect to the database
           
            $sql = "SELECT * 
            FROM eval 
            WHERE course='$nm';";
            $result = mysqli_query($con, $sql);
            echo '<option value="" disabled selected>Select</option>';
            // Generate the dropdown options
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<option value="' . $row['name'] . '">' . $row['name'] . '</option>';
            }

                        ?>
        </select>
        </div>
   <div class="form-group">
   <label for="course">Select a Student:</label>
        <select id="course" name="seval">
            <?php
            // Connect to the database
           
            $sql = "SELECT * 
            FROM students 
            WHERE studentRegno IN (
                SELECT studentRegno 
                FROM courseenrolls 
                WHERE course = '$nm'
            );";
            $result = mysqli_query($con, $sql);
            echo '<option value="" disabled selected>Select</option>';
            // Generate the dropdown options
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<option value="' . $row['studentName'] . '">' . $row['studentName'] . '</option>';
            }

                        ?>
        </select>
        </div>
        <div class="form-group">
    <label for="studentname">Enter Marks:  </label>
    <input type="number" class="form-control" id="testmarks" name="testmarks"  />
  </div>
        
        <input type="submit" value="Submit" name="submit">
        <div id="my-element"><a href="marks.php">Go Back</a></div></div>
</form>
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
    <script src="../assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="../assets/js/bootstrap.js"></script>
</body>
</html>
<?php } ?>

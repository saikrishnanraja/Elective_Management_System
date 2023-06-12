<?php
session_start();
include('includes/config.php');
if(strlen($_SESSION['tlogin'])==0)
    {   
header('location:index.php');
}
else{

    if(isset($_POST['submit']))
    {
        $cid=$_POST['course'];
        $tnm=$_POST['testname'];
        $mm=$_POST['maxmarks'];
        $sql="INSERT INTO eval (name, course, mmarks)
        VALUES ('$tnm', '$cid', $mm);";
        $result = mysqli_query($con, $sql);
    }
    if(isset($_GET['del']))
{
mysqli_query($con,"delete from eval where name = '".$_GET['id']."'");
mysqli_query($con,"delete from marks where ename = '".$_GET['id']."'");
echo '<script>alert("Evaluation deleted!!")</script>';
echo '<script>window.location.href="tests.php"</script>';
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
                        <h1 class="page-head-line">Create Evaluation  </h1>
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
   <label for="course">Select a course:</label>
        <select id="course" name="course" required>
            <?php
            // Connect to the database
           
            $sql = "SELECT * FROM course";
            $result = mysqli_query($con, $sql);
            echo '<option value="" disabled selected>Select Course</option>';
            // Generate the dropdown options
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<option value="' . $row['id'] . '">' . $row['courseName'] . '</option>';
            }

                        ?>
        </select>
        <br><br>
        <div class="form-group">
    <label for="studentname">Test Name  </label>
    <input type="text" class="form-control" id="testname" name="testname"  required/>
  </div>
  <div class="form-group">
    <label for="studentname">Max Marks  </label>
    <input type="number" class="form-control" id="maxmarks" name="maxmarks"  required/>
  </div>
        <input type="submit" value="Submit" name="submit">
        </div>
</form>
                            </div>
                            </div>
                    </div>
                  
                </div>
                <font color="red" align="center"><?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?></font>
                <div class="col-md-12">
                    <!--    Bordered Table  -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Manage Eval
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Eval Name</th>
                                            <th>Course Code</th>
                                            <th>Max Marks</th>
                                             <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<?php
$sql=mysqli_query($con,"SELECT eval.*, course.courseCode FROM eval JOIN course ON course.id = eval.course;");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{
?>


                                        <tr>
                                            <td><?php echo $cnt;?></td>
                                            <td><?php echo htmlentities($row['name']);?></td>
                                            <td><?php echo htmlentities($row['courseCode']);?></td>
                                            <td><?php echo htmlentities($row['mmarks']);?></td>
                                           <td> <a href="tests.php?id=<?php echo $row['name']?>&del=delete" onClick="return confirm('Are you sure you want to delete?')">
                                            <button class="btn btn-danger">Delete</button></td>
                                        </tr>
<?php 
$cnt++;
} ?>

                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                     <!--  End  Bordered Table  -->
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

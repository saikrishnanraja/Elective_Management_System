<?php
//the subject
$sub = "Your subject";
//the message
$msg = "Your message";
//recipient email here
$rec = "krishnanagalingam@gmail.com";
//send email
mail($rec,$sub,$msg);
if (mail($rec, $sub, $msg)) {
    echo "Email sent successfully.";
} else {
    echo "Failed to send email.";
}

?>
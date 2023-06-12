<?php
exec('node app.js', $output, $exitCode);
if ($exitCode === 0) {
  echo 'Main sent successfully.';
} else {
  echo 'Error sending mail.';
}
?>
<?
include 'config.php';

echo "<textarea data-type=\"text/xml\"><files>";
for ($i = 0; $i < sizeof ($_FILES["file"]["name"]); $i++) {
  $name = $_FILES["file"]["name"][$i];
  if (!$name)
    continue;
  $path = $FILES_ROOT . $name;
  move_uploaded_file ($_FILES["file"]["tmp_name"][$i], $path);
  echo "<file src=\"http://copei.de/pi/files/$name\"/>";
}
echo "</files></textarea>";
?>

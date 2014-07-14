<?
$FILES_ROOT = "/wwwroot/copei.de/www/pi/files/";
$name = $_FILES["file"]["name"];
$path = $FILES_ROOT . $name;
move_uploaded_file ($_FILES["file"]["tmp_name"], $path);
#header ("Content-Type: text/xml; charset=utf-8");
echo "<textarea data-type=\"text/xml\">";
echo "<file src=\"http://copei.de/pi/files/$name\"/>";
echo "</textarea>";
?>

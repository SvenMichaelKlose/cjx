<?php
// Author: Sven Michael Klose <pixel@copei.de>

include 'config.php':

$parsed  = parse_url (remove_multiple_slashes ($_SERVER['REQUEST_URI']));
if (isset ($parsed["query"])) {
    $values  = explode ('&', html_entity_decode ($parsed["query"]));
    foreach ($values as $i) {
        $x = explode('=', $i);
        $_GET[$x[0]] = $x[1];
    }
}

$location = explode_path ($parsed["path"]);
$ID_CLIENT = $location[$PATH_IMPLODE_START + 1];
$SCHEMA = $location[$PATH_IMPLODE_START + 2];
#$path = implode_path ($location, $PATH_IMPLODE_START + 2, sizeof ($location));

function remove_multiple_slashes ($x)
{
    return preg_replace ('/\\/+/', '/', $x);
}

function explode_path ($path)
{
    return explode ("/", $path);
}

function implode_path ($location, $start, $end)
{
    $path = '';
    for ($i = $start; $i < $end; $i++)
	    $path .= "/" . $location[$i];
    return $path;
}

function make_xml_path ()
{
    global $ID_CLIENT, $XML_ROOT_DIR, $SCHEMA;

    $directory = "$XML_ROOT_DIR/$ID_CLIENT";
    if (!file_exists ($directory)) {
        echo "Your attempt has been reported.";
        exit;
    }

    return "$directory/$SCHEMA.xml";
}

function make_file_path ()
{
    global $ID_CLIENT, $XML_ROOT_DIR, $SCHEMA;

    return "$FILE_ROOT_DIR/$ID_CLIENT/$SCHEMA";
}

function save_xml_file ()
{
    file_put_contents (make_xml_path (), $_POST['x']);
    exit;
}

function load_xml_file ()
{
    $path = make_xml_path ();

    if (!file_exists ($path)) {
        header ("HTTP/1.0 404 Not Found");
        echo "File not found.";
        exit;
    }

    header ("Content-Type: text/xml; charset=utf-8");
    echo file_get_contents (make_xml_path ());
    exit;
}

function upload_file ($where)
{
    file_put_contents (make_file_path ($id_client, $schema_name), $data);
    exit;
}

if (!$ID_CLIENT)
    echo "Who's there?";

if (!$SCHEMA)
    echo "Whatchew want?";

if ($_POST)
    save_xml_file ();
else
    load_xml_file ();
?>

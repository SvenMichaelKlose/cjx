<?php
// Author: Sven Michael Klose <pixel@copei.de>

$PATH_IMPLODE_START = 1;
$XML_ROOT_DIR = "/wwwroot/copei.de/www/pi/xml";
$ROLE = "superadmin";

#header ("Content-Type: text/xml; charset=utf-8");

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

function fetch_permissions ()
{
    $permissions = xml_fetch ($XML_ROOT_DIR . "/permissions.xml");
}

function check_permission ($id_client)
{
/*
    if ($ROLE == "superadmin" || $ID_CLIENT == $id_client)
        return;
    exit;
*/
}

function make_xml_path ($id_client, $schema_name)
{
    return $XML_ROOT_DIR . "/" . $id_client . "/" . $schema_name . ".xml";
}

function make_file_path ($id_client, $name)
{
    return $FILE_ROOT_DIR . "/" . $id_client . "/" . $name;
}

function save_xml_file ()
{
    check_permission ($id_client);
    file_put_contents (make_xml_path ($id_client, $schema_name), $data);
    exit;
}

function load_xml_file ()
{
    check_permission ($id_client);
    echo file_get_contents (make_xml_path ($id_client, $schema_name), $data);
    exit;
}

function upload_file ($where)
{
    check_permission ($id_client);
    file_put_contents (make_file_path ($id_client, $schema_name), $data);
    exit;
}

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
$path = implode_path ($location, $PATH_IMPLODE_START + 2, sizeof ($location));
echo "Client: " . $ID_CLIENT . "<br>Path: " . $path;

?>

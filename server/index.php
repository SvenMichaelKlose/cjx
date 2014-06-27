<?php
// Author: Sven Michael Klose <pixel@copei.de>

$ROLE = "superadmin";
$XML_ROOT_DIR = "/wwwroot/copei.de/www/pi/xml"

header ("Content-Type: text/xml; charset=utf-8");
$xml = new SimpleXMLElement ($xmlstr);
echo $xml->asXML ();

login_or_die ();

function fetch_permissions ()
{
    $permissions = xml_fetch ($XML_ROOT_DIR . "/permissions.xml");
}

function check_permission ($id_client)
{
    if ($ROLE == "superadmin" || $ID_CLIENT == $id_client)
        return;
    exit;
}

function make_path ($id_client, $schema_name)
{
    return $XML_ROOT_DIR . "/" . $id_client . "/" . $schema_name . ".xml";
}

function save_xml_file ()
{
    check_permission ($id_client);
    $path = make_path ($schema_name);
    file_put_contents ($path, update_xml (file_get_contents ($path), $data));
    exit;
}

function load_xml_file ()
{
    check_permission ($id_client);
    echo file_get_contents (make_path ($schema_name), $data);
    exit;
}
?>

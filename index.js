// Author: Sven Michael Klose <pixel@copei.de>

//
// FORM GENERATOR
//

function field_textual_input_element (field)
{
    return $("<input>", {type: field.type,
                         name: field.name});
}

function field_image_input_element (field)
{
    return $("<img>", {src: field.src});
}

var ELMGEN = {
    text:   field_textual_input_element,
    tel:    field_textual_input_element,
    image:  field_image_input_element
};

function field_label (field)
{
    return $("<label>").text (field.desc + ":");
}

function field_element (field)
{
    return ELMGEN[field.type] (field);
}

function insert_field (parent, field)
{
    parent.append (field_label (field),
                   field_element (field),
                   $("<br>"));
}

function insert_fields (parent, fields)
{
    var i = 0, item;
    while (item = fields[i++])
        insert_field (parent, item);
}

function generate_form (fields)
{
    var $f = $("form");
    $f.empty ();
    insert_fields ($f, fields);
}

//// END OF FORM GENERATOR

var address_info = [
    {name: "name",
     type: "text",
     desc: "Name"},
    {name: "vorname",
     type: "text",
     desc: "Vorname"},
    {name: "tel",
     type: "tel",
     desc: "Telefonnummer"}
];

generate_form (address_info)

# Quick overview

This CMS transforms XML document fragments to HTML. The functions that
generate HTML are called 'views'. They take their context information
from global variables that are set up temporarily with function
with_mixin(). The views that should be used to render a document are
also specified that way.

with_mixin() takes an array of objects whose keys are the global
variable names. An example:

  with_mixin
    foo: 1
    render_bar

set the global variable foo to 1, calls function render_bar() and
restores foo afterwards. Given that all views are already in the
global namespace you could render an XML document this way:

  with_mixin
    xml: ($ ".myxmldoc")
    render_record

If you wish to make the XML editable you can add the set of
editor views already prepared for you:

  with_mixin [
    V_EDIT
    xml: ($ ".myxmldoc") # Yeah. Get used to jQuery, dude! B)
  ], render_record

However, with this CMS' set of views it's not that super-simple.
It also takes a "schema" which describes the XML document, so you
get headings, labels and just the right views appropriate for
certain data types. It's just the first view (render_record()
in this case) which you have to specify. Adding a schema is
pretty straightforward as well:

  with_mixin [
    V_EDIT
    schema: SCHEMAS["myxmldoc"]
    xml:    ($ ".myxmldoc")
  ], render_record


# Global variables

## SCHEMAS

An object of all schemas used, keyed by name.


# Global mixins

This is a description of the global mixins used by the views.

## schema

The schema of the record(s) rendered. It's an array of objects
that the describe the record's field.

    schema:  SCHEMAS["address"]

## parent

The parent XML element the record(s) rendered. New records become
children of this node.  For example:

    parent: xml_root "addresses"

## records

An array of XML records that render_records() is supposed to
display.  Requires 'schema' and 'parent'.  The most common configuration
for this is:

    records: parent.children()

## schema_name

Used as a class name for the HTML elements containing a single record.

    schema_name: "address"

## desc

Actually provides the page or view title.

    desc: "Addresses"
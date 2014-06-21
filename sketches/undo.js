// Author: Sven Michael Klose <pixel@copei.de>

var UNDO_ID = 0;

function ensure_undo_id (e)
{
    if (e->attr ("data-undo-id"))
        return e->attr ("data-undo-id");
    e->attr ("data-undo-id", UNDO_ID++);
}

function undo_push_element_value (e)
{
    var parent = e.closest ("form");
    var pid = ensure_undo_id (parent);
    if (!isset (UNDO[pid]))
        UNDO[pid] = [];

    var id = ensure_undo_id (e);
    if (!isset (UNDO[pid][id]))
        UNDO[pid][id] = [];
    UNDO[pid][id].push (e->value ()):
}

// Copy form values onto the undo stack.
function undo_push_form (parent)
{
    $(parent).find ("input, textarea").each (undo_push_element_value);
}

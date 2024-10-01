function createNotes(data, slot)
    local metadata = data.metadata or {}
    local text = metadata.text

    if not text then
        local input = lib.inputDialog('Krs Notepad', {
            {type = 'input', label = 'Text Input', description = 'Create your notes', icon = 'fa-solid fa-note-sticky', required = true, min = 1, max = 25} 
        })

        if not input or not input[1] then
            return
        end

        text = tostring(input[1])

        TriggerServerEvent('krs_notepad:createNoteItem', data, text)  
    end
end

function viewNote(data, slot)
    local metadata = data.metadata or {}

    if next(metadata) == nil then
        lib.notify({title = 'Krs Notepad', description = 'No note found.', type = 'error'})
        return
    end

    local text = metadata.text

    if text and text ~= "" then
        lib.alertDialog({
            header = 'Notepad',
            content = metadata.description,
            centered = true,
            cancel = false,
            labels = {cancel = 'Close'}
        })
    end
end

exports('notepad_saved', function(data, slot)
    exports.ox_inventory:useItem(data, function(data)
        if data then
            viewNote(data)
        end
    end)
end)

exports('notepad', function(data, slot)
    exports.ox_inventory:useItem(data, function(success)
        if success then
            createNotes(data, slot)
        end
    end)
end)


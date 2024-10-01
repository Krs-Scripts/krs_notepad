
RegisterNetEvent('krs_notepad:createNoteItem', function(data, text)
    local playerId = source

    local metadata = { text = text, description = "Note: " .. text }

    exports.ox_inventory:AddItem(playerId, 'notepad_saved', 1, metadata)

    TriggerClientEvent('ox_lib:notify', playerId, {title = 'Krs Notepad', icon = 'fa-solid fa-note-sticky', description = "Note saved successfully!", type = 'success'}) 
end)
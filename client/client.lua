local function openNui(data)
    print(json.encode(data))
    SendNUIMessage({
        action = data.mode,
        metadata = data
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("giveItem", function(data)
    lib.callback('krs_notepad:getName', false, function(name)
        local metadata = {}
        metadata.mode = "view"
        metadata.title = data.title
        metadata.name = data.name
        metadata.object = data.object
        metadata.save = name
      
        print('m '..json.encode(metadata, { indent = true }))

        TriggerServerEvent("krs_notepad:createItems", metadata)
        SetNuiFocus(false, false)
    end)
end)

exports('openNotepad', function(data)
    local note = {}
    if next(data) == nil then 
        note.mode = 'create'
        note.title = 'server name'
    else
        print(json.encode(data))
        note.mode = data.mode
        note.title = data.save
        note.save = data.save
        note.object = data.object
    end
    openNui(note)
end)
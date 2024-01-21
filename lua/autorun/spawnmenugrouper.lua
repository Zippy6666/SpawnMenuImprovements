    // Adds a "All" category to some spawn menu tabs


spawnmenugroupdone = spawnmenugroupdone or false



if !spawnmenugroupdone then


    -- NPCs
    for cls, tbl in pairs(list.Get("NPC")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "All"
        NewTbl.IconOverride = "entities/"..cls..".png"
        list.Set( "NPC", cls.."_all", NewTbl )

    end


    spawnmenugroupdone = true


end



hook.Add("Initialize", "spawnmenugrouper", function()

    -- Entities
    for cls, tbl in pairs(list.Get("SpawnableEntities")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "All"
        list.Set( "SpawnableEntities", cls.."_all", NewTbl )

    end


    -- Weapons
    for cls, tbl in pairs(list.Get("Weapon")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "All"
        list.Set( "Weapon", cls.."_all", NewTbl )

    end

end)
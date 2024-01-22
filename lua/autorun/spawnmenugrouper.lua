    // Adds a "All" category to some spawn menu tabs

local GenericIcon = "icon16/bricks_all.png"
list.Set( "ContentCategoryIcons", "ALL", GenericIcon )


hook.Add("Initialize", "spawnmenugrouper", function()

    -- NPCs
    for cls, tbl in pairs(list.Get("NPC")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        NewTbl.IconOverride = file.Exists( "materials/entities/" .. cls .. ".png", "GAME" )&&"entities/" .. cls .. ".png"
        or GenericIcon
        list.Set( "NPC", cls.."_all", NewTbl )

    end


    -- ZBase Test
    -- if ZBaseSpawnMenuNPCList then

    --     for cls, tbl in pairs(ZBaseSpawnMenuNPCList) do

    --         local NewTbl = table.Copy(tbl)
    --         NewTbl.Category = "ALL"
    --         NewTbl.IconOverride = file.Exists( "materials/entities/" .. cls .. ".png", "GAME" )&&"entities/" .. cls .. ".png"
    --         or GenericIcon
    --         list.Set( "NPC", cls.."_all", NewTbl )
    
    --     end

    -- end


    -- Entities
    for cls, tbl in pairs(list.Get("SpawnableEntities")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        NewTbl.IconOverride = file.Exists( "materials/entities/" .. cls .. ".png", "GAME" )&&"entities/" .. cls .. ".png"
        or GenericIcon
        list.Set( "SpawnableEntities", cls.."_all", NewTbl )

    end


    -- Weapons
    for cls, tbl in pairs(list.Get("Weapon")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        list.Set( "Weapon", cls.."_all", NewTbl )

    end



    -- Vehicles
    for cls, tbl in pairs(list.Get("Vehicles")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        NewTbl.IconOverride = file.Exists( "materials/entities/" .. cls .. ".png", "GAME" )&&"entities/" .. cls .. ".png"
        or GenericIcon
        list.Set( "Vehicles", cls.."_all", NewTbl )

    end

end)
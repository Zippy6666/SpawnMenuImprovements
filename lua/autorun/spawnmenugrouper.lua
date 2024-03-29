    // Adds a "All" category to some spawn menu tabs

local GenericIcon = "icon16/bricks_all.png"
list.Set( "ContentCategoryIcons", "ALL", GenericIcon )


local function FindIcon( cls )
    return (file.Exists( "materials/entities/" .. cls .. ".png", "GAME" ) && "entities/" .. cls .. ".png")
    or (file.Exists( "materials/vgui/entities/" .. cls .. ".png", "GAME" ) && "entities/" .. cls .. ".png")
    or GenericIcon
end


hook.Add("Initialize", "spawnmenugrouper", function()

    -- NPCs
    for cls, tbl in pairs(list.Get("NPC")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        NewTbl.IconOverride = NewTbl.IconOverride or FindIcon(cls)
        list.Set( "NPC", cls.."_all", NewTbl )

    end


    -- Entities
    for cls, tbl in pairs(list.Get("SpawnableEntities")) do

        local NewTbl = table.Copy(tbl)
        NewTbl.Category = "ALL"
        NewTbl.IconOverride = NewTbl.IconOverride or FindIcon(cls)

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
        NewTbl.IconOverride = NewTbl.IconOverride or FindIcon(cls)
        or GenericIcon
        list.Set( "Vehicles", cls.."_all", NewTbl )

    end

end)
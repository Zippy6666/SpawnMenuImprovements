    // Stop spawn menu from stuttering when opening categories by opening all of them once (opens any node created though DTree:AddNode)


hook.Add("Initialize", "SpawnMenuAntiStutter", function()

    -- Store addnode func
    _OldAddNodeFunc_ = _OldAddNodeFunc_ or DTree.AddNode


    local Nodes = {}



    -- Override addnode func
    function DTree:AddNode( ... )

        local node =  _OldAddNodeFunc_(self, ...)
        table.insert(Nodes, node)

        return node

    end


    concommand.Add("ClickAllNodes", function()

        local StartT = SysTime()
        local Nodes_All = {} -- The 'all' category nodes, will be clicked in the end so that it the first tab that appears


        for _, node in ipairs(Nodes) do

            -- Click the node
            node:DoClick()


            if node:GetText()=="ALL" then
                table.insert(Nodes_All, node)
            end

        end


        -- Select "all" category for all tabs
        for _, node in ipairs(Nodes_All) do
            node:DoClick()
        end


        MsgN("Clicked All Nodes (", math.Round(SysTime()-StartT, 2), " seconds)")

    end)

end)


    -- Opens the spawnmenu for one second, clearing that first stutter
local function PreOpenMenu()
    RunConsoleCommand("+menu")
    timer.Simple(0.5, function()
        RunConsoleCommand("-menu")
    end)
end


hook.Add("InitPostEntity", "SpawnMenuAntiStutter", function()
    
    PreOpenMenu()
    RunConsoleCommand("ClickAllNodes")
    
end)

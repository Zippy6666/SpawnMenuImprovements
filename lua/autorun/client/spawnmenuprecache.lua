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


        for _, node in ipairs(Nodes) do

            -- Click the node
            node:DoClick()

        end


        MsgN("Clicked All Nodes (", math.Round(SysTime()-StartT, 2), " seconds)")

    end)

end)


hook.Add("InitPostEntity", "SpawnMenuAntiStutter", function()
    RunConsoleCommand("ClickAllNodes")
end)

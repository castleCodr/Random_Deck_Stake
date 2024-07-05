Controller_key_update_ref = Controller.key_hold_update
function Controller:key_hold_update(key, dt)
    if ((self.locked) and not G.SETTINGS.paused) or (self.locks.frame) or (self.frame_buttonpress) then return end
    Controller_key_update_ref(self,key,dt)
    if(key == "d" and G.GAME.viewed_back ~= nil) then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        G.FUNCS.change_viewed_back({to_key=math.random(1,#G.P_CENTER_POOLS['Back'])})
    end
    if(key == "s" and G.GAME.stake ~= nil) then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        G.FUNCS.change_stake({to_key=math.random(1,#G.P_CENTER_POOLS['Stake'])})
    end
    if(key == "r" and G.GAME.stake ~= nil and G.GAME.viewed_back ~= nil) then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        G.FUNCS.change_viewed_back({to_key=math.random(1,#G.P_CENTER_POOLS['Back'])})
        G.FUNCS.change_stake({to_key=math.random(1,#G.P_CENTER_POOLS['Stake'])})
    end
    
end

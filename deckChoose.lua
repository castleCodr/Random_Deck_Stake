Controller_key_update_ref = Controller.key_hold_update
function Controller:key_hold_update(key, dt)    
    if ((self.locked) and not G.SETTINGS.paused) or (self.locks.frame) or (self.frame_buttonpress) then return end
    Controller_key_update_ref(self,key,dt)
    if(G.GAME.viewed_back == nil or G.GAME.viewed_back.effect == nil or G.GAME.viewed_back.effect.center == nil  and get_deck_win_stake(G.GAME.viewed_back.effect.center.key) ~= nil and get_deck_win_stake(G.GAME.viewed_back.effect.center.key) ~= 0) then
        return
    end
    G.FUNCS.random_back = function() 
        
        args = {to_key = math.random(1,#G.P_CENTER_POOLS['Stake'])}
        G.viewed_stake = G.viewed_stake or 1
        G.GAME.viewed_back:change_to(G.P_CENTER_POOLS.Back[args.to_key])
        if G.sticker_card then G.sticker_card.sticker = get_deck_win_sticker(G.GAME.viewed_back.effect.center) end
        local max_stake = get_deck_win_stake(G.GAME.viewed_back.effect.center.key) or 0
        if(max_stake == 0 and G.PROFILES ~= nil and G.PROFILES[G.SETTINGS.profile].MEMORY  ~= nil) then
            G.viewed_stake = math.min(G.viewed_stake, max_stake + 1)
            G.PROFILES[G.SETTINGS.profile].MEMORY.deck = args.to_val    
        end
    end
    if(key == "d" and G.GAME.viewed_back ~= nil )then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        local back = {to_key=math.random(1,#G.P_CENTER_POOLS['Back']) }
        if(back ~= nil) then
            if(back.to_key ~= nil) then
                G.FUNCS.random_back()       
            end
        end
        
    end
    if(key == "s" and G.GAME.stake ~= nil)  and get_deck_win_stake(G.GAME.viewed_back.effect.center.key) ~= nil then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        local stake = {to_key=math.random(1,#G.P_CENTER_POOLS['Stake'])}
        if(stake ~= nil) then
            if(stake.to_key ~= nil) then
                G.FUNCS.change_stake(stake)         
            end
        end
    end
    if(key == "r" and G.GAME.stake ~= nil and G.GAME.viewed_back ~= nil) and get_deck_win_stake(G.GAME.viewed_back.effect.center.key) ~= nil then
        math.randomseed(os.clock())
        math.random()
        math.random()
        math.random()
        if(back ~= nil) then
            if(back.to_key ~= nil) then
                G.FUNCS.random_back()       
            end
        end
        local stake = {to_key=math.random(1,#G.P_CENTER_POOLS['Stake'])}
        if(stake ~= nil) then
            if(stake.to_key ~= nil) then
                G.FUNCS.change_stake(stake)         
            end
        end
    
    end
end

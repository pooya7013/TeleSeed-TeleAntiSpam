
do

local function pre_process(msg)
    
    �Checking mute
    local hash = 'matef:'..msg.to.id
    if redis:get(hash) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then
            delete_msg(msg.id, ok_cb, true)
            return ""
        end
    
        return msg
    end

  


local function run(msg, matches)
    chat_id =  msg.to.id
    
    if is_momod(msg) and matches[1]:lower() == 'lock' then
      
            
                    local hash = 'matef:'..msg.to.id
                    redis:set(hash, true)
                    return 
  elseif is_momod(msg) and matches[1]:lower() == 'unlock' then
                    local hash = 'matef:'..msg.to.id
                    redis:del(hash)
                    return 
end

end

return {
    patterns = {
        '^[/!#](lock) fwd$',
        '^[/!#](unlock) fwd$',
    '^(lock) fwd$',
        '^(unlock) fwd$',
    },
    run = run,
    pre_process = pre_process
}
end
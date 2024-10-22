-- Author : Lord Odin, based on skan-radio mod, simplified and added channels with text names
-- Further Simplyfied by Evilpla, basically removed the remote open

script.on_event("toggle-constant-combinator-hotkey", function(event)
  local player = game.players[event.player_index]
  if player then
    local entity = player.selected
    local text
    if entity ~= nil and entity.valid and (entity.name == "constant-combinator") then
      local cb = entity.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior ]]
      if cb and cb.enabled then
        cb.enabled = false
        text = { "rcct.off" }
      else
        cb.enabled = true
        text = { "rcct.on" }
      end
      player.create_local_flying_text({ text = text, position = entity.position })
    elseif entity ~= nil and entity.valid and (entity.name == "power-switch") then
      if entity.power_switch_state then
        entity.power_switch_state = false
        text = { "rcct.off" }
      else
        entity.power_switch_state = true
        text = { "rcct.on" }
      end
      player.create_local_flying_text({ text = text, position = entity.position })
    end
  end
end)

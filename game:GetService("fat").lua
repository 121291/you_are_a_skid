      
if not isfile("game_latest.log") then
    writefile("game_latest.lua", tostring(game.PlaceId))
else
    appendfile("game_latest.lua", tostring(game.PlaceId))
end

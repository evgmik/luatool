print('init.lua ver 1.2')
wifi.setmode(wifi.STATION)
print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())
-- wifi config start
wifi.sta.config("beamhome","C930F921D7F672A23C55638F3B")
-- wifi config end

dofile("main.lua")

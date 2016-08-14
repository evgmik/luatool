-- Connecting to the network
tmr.alarm(0, 1000, 1, function()
   if wifi.sta.getip() == nil then
      print("Connecting to AP...")
   else
      print('IP: ',wifi.sta.getip())
      tmr.stop(0)
   end
end)

-- syncronize clock
sntp.sync('192.168.2.17',
  function(sec,usec,server)
    print('sync', sec, usec, server)
  end,
  function()
   print('failed!')
  end
)

-- read and report sensonr once, since alarm will wait before executing
dofile("read_dht.lua")

-- now we print DHT sensor data every 60 seconds
tmr.alarm(0, 60000, tmr.ALARM_AUTO, function() dofile("read_dht.lua") end )

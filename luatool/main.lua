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

-- now we print DHT sensor data every 10 seconds
tmr.alarm(0, 10000, tmr.ALARM_AUTO, function() dofile("read_dht.lua") end )

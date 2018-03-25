local component = require("component")
local sides = require("sides")
local textutils = require("serialization")
local inv = component.inventory_controller
local os = require("os")
local rs = component.redstone
local term = require("term")
local gpu = component.gpu
local rest = require "restutils"

local killResponse = rest.getJson("http://localhost:8080/api/withers/killed")
local kills = killResponse.intValue

term.clear()

function ser(v)
  return textutils.serialize(v)
end

local side = sides.up
local invSize = inv.getInventorySize(side)

function spawn()
  rs.setOutput(sides.left, 15)
  os.sleep(.1)
  rs.setOutput(sides.left, 0)
end

function loop()
    if (inventoryValid()) then
      spawn()
      kills = kills + 3
      url = "http://localhost:8080/api/withers/killed"
      rest.post(url, { amount = 3 })
    end
end

function inventoryValid() 
  requiredSize = 32
  slot1 = inv.getStackInSlot(side, 1)
  slot2 = inv.getStackInSlot(side, 2)

  if (slot1 and slot2) then
      return (slot1.size > requiredSize) and (slot2.size > requiredSize)
  end

  return false
end

w, h = gpu.getResolution()
gpu.fill(0, 0, w, h, " ")

while true do
  gpu.set(20, 20, "Killed " .. kills .. " Withers")
  loop()
  os.sleep(.5)    
end
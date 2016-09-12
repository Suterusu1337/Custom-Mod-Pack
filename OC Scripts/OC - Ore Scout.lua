local robot = require("robot")
local computer = require("computer")
local component = require("component")
local sides = require("sides")
 
local gen = component.generator
 
local args = {...}
local distanceMax = tonumber(args[1])
local distanceLateral = tonumber(args[2])
 
local robotFirstInventorySlot = 6
local distanceTraveled = 0
local torchInterval = 7
 
local function placeTorch()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if robot.compareTo(2) then
            robot.back()
            robot.placeUp()
            robot.forward()
            return
        end
    end
end
 
local function feedGenerator()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if gen.insert(1) then
            return
        end
    end
end
 
local function purge()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if robot.compareTo(3) or robot.compareTo(4) or robot.compareTo(5) then
            robot.drop()
        end
    end
end
 
local function mine()
    robot.swing()
    robot.swingUp()
    robot.swingDown()
end
 
local function mining(dist)
    local i = 1
        while i < dist do
            if robot.forward() then
                mine()
                i = i + 1
                if i % torchInterval == 0 then
                    placeTorch()
                end
                if i % 32 == 0 then
                    feedGenerator()
                end
                if i % 50 == 0 then
                    purge()
                end
            else
                robot.swing()
            end
        end
end
 
local function moveLateral()
    placeTorch()
    robot.turnRight()
    robot.swing()
    mining(distanceLateral)
    placeTorch()
    robot.turnRight()
end
 
local function tunnel()
    mining(distanceMax)
    moveLateral()
    mining(distanceMax)
    placeTorch()
    purge()
    gen.remove()
end
 
robot.swing()
tunnel()
computer.shutdown(false)
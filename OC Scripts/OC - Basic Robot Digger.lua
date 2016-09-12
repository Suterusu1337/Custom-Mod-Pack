local robot = require("robot")
local computer = require("computer")
local component = require("component")
local sides = require("sides")
 
local gen = component.generator
 
local args = {...}
local distanceFront = tonumber(args[1])
local distanceSide = tonumber(args[2])
local distanceDown = tonumber(args[3])
 
local direction = "front"
local robotFirstInventorySlot = 6
 
local function feedGenerator()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if gen.insert(16) then
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
 
local function changeDirection()
    if direction == "front" then
        direction = "back"
    elseif direction == "back" then
        direction = "front"
    end
end
 
local function turnLeft()
    robot.turnLeft()
    robot.swing()
    robot.forward()
    robot.turnLeft()
end
 
local function turnRight()
    robot.turnRight()
    robot.swing()
    robot.forward()
    robot.turnRight()
end
 
local function mining()
    local k = 0
    while k < distanceDown do
        print(k)
        local j = 0
        while j < distanceSide -1 do
            print(j)
            local i = 0
            while i < distanceFront - 1 do
                print(i)
                robot.swing()
                if robot.forward() then
                    i = i + 1
                end
            end
            if computer.energy() < 5000 then
                feedGenerator()
            end
            if direction == "front" then
                if j % 2 == 0 then
                    turnRight()
                else
                    turnLeft()
                end
            elseif direction == "back" then
                if j % 2 == 0 then
                    turnLeft()
                else
                    turnRight()
                end
            end
            j = j + 1
        end
        local l = 1
        while l < distanceFront do
            print(l)
            robot.swing()
            if robot.forward() then
                l = l + 1
            end
        end
        purge()
        robot.swingDown()
        robot.down()
        robot.turnAround()
        changeDirection()
        k = k + 1
    end
    purge()
    gen.remove()
    computer.shutdown(false)
end
 
mining()
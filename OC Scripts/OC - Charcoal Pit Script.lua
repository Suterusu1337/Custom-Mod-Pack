local robot = require("robot")
local computer = require("computer")
local component = require("component")
local sides = require("sides")

local direction = "East"
local Task = 1

local BotX = 773
local BotY = 100
local BotZ = -2053

local WC01 = 785
local WT01 = "X"
local WC02 = -2077
local WT02 = "Z"
local WC03 = 97
local WT03 = "Y"

local CurrentWaypoint = 1
local Cord = WC01
local PointType = WT01

local function feedGenerator()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if component.generator.insert(16) then
            return
        end
    end
end

local function TurnNorth()
	if direction ~= "North"	then
		if direction == "East" then
			robot.turnLeft()
		end
		if direction == "South"	then
			robot.turnAround()
		end
		if direction == "West" then
			robot.turnRight()
		end
		direction = "North"
	end
end

local function TurnEast()
	if direction ~= "East" then
		if direction == "North"	then
			robot.turnRight()
		end
		if direction == "South"	then
			robot.turnLeft()
		end
		if direction == "West" then
			robot.turnAround()
		end
		direction = "East"
	end
end
	
local function TurnSouth()
	if direction ~= "South"	then
		if direction == "North"	then
			robot.turnAround()
		end
		if direction == "East" then
			robot.turnRight()
		end
		if direction == "West" then
			robot.turnLeft()
		end
		direction = "South"
	end
end

local function TurnWest()
	if direction ~= "West" then
		if direction == "North"	then
			robot.turnLeft()
		end
		if direction == "East" then
			robot.turnAround()
		end
		if direction == "South"	then
			robot.turnRight()
		end
		direction = "West"
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

local function NextWaypoint()
	if CurrentWaypoint == 1 then
		if computer.energy() < 5000 then
         feedGenerator()
      end
		if Task == 1 then 
			Cord = WC02
			PointType = WT02
		end
		if Task == 4 then 
			Task = Task + 1
			print("Task 5 Complete")
			return
		end
	end
	
	if CurrentWaypoint == 2 then
		if computer.energy() < 5000 then
         feedGenerator()
      end
		if Task == 1 then 
			Cord = WC03
			PointType = WT03
		end
		if Task == 4 then 
			Cord = WC01
			PointType = WT01
		end
	end
	
	if CurrentWaypoint == 3 then
		if computer.energy() < 5000 then
         feedGenerator()
      end
		if Task == 1 then 
			Task = Task + 1
			print("Task 1 Complete")
		end
		if Task == 4 then 
			Cord = WC02
			PointType = WT02
		end
	end
	
	if Task == 1 then
		CurrentWaypoint = CurrentWaypoint + 1
	end
	
	if Task == 4 then
		CurrentWaypoint = CurrentWaypoint - 1
	end
end

local function MoveToPoint()
	if PointType == "X" then
		if BotX > Cord	then
			TurnWest()
			if robot.detect() == false then
				robot.forward()
				BotX = BotX - 1
			end
		else
			TurnEast()
			if robot.detect() == false	then
				robot.forward()
				BotX = BotX + 1
			end
		end
		
		if BotX == Cord then
			NextWaypoint()
		end
	end
	
	if PointType == "Z" then
		if BotZ < Cord	then
			TurnSouth()
			if robot.detect() == false	then
				robot.forward()
				BotZ = BotZ + 1
			end
		else
			TurnNorth()
			if robot.detect() == false	then
				robot.forward()
				BotZ = BotZ - 1
			end
		end
		
		if BotZ == Cord then
			NextWaypoint()
		end
	end
	
	if PointType == "Y" then
		if BotY > Cord	then
			robot.down()
			BotY = BotY - 1
		else
			robot.up()
			BotY = BotY + 1
		end
		
		if BotY == Cord then
			NextWaypoint()
		end		
	end
end

local function Moving(distanceFront, distanceSide, distanceDown)
    local k = 0
    while k < distanceDown do
        print(k)
        local j = 0
        while j < distanceSide -1 do
            print(j)
            local i = 0
            while i < distanceFront - 1 do
                print(i)
                robot.swing() -- action here
                if robot.forward() then
                    i = i + 1
                end
            end
            if computer.energy() < 5000 then
                feedGenerator()
            end
            if distanceSide % 2 == 0 then
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
            else
                if direction == "front" then
                    if j % 2 == 0 then
                        turnRight()
                    else
                        turnLeft()
                    end
                elseif direction == "back" then
                    if j % 2 == 0 then
                        turnRight()
                    else
                        turnLeft()
                    end
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
        if k == (distanceDown - 1) then
            print("Task 3 Complete")
				Task = Task + 1
            purge()
            gen.remove()
            computer.shutdown(false)
        end
	     purge()
        obot.swingDown()
        robot.down()
        robot.turnAround()
        changeDirection()
        k = k + 1
    end
end

while true do
	if Task == 1 then
		MoveToPoint()
	end
	if Task == 2 then
		robot.select(1)
		component.inventory_controller.equip()
		robot.swingDown()
		robot.down()
		robot.swingDown()
		robot.down()
		Task = Task + 1
		print("Task 2 Complete")
		robot.select(1)
		component.inventory_controller.equip()
	end
	if Task == 3 then
		Moving(11,11,5)
	end
end
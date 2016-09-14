local robot = require("robot")
local computer = require("computer")
local component = require("component")
local sides = require("sides")
local gen = component.generator
local InvCon = component.inventory_controller
local Task = 1
local Complete = 0
local Facedirection = "front"
local Direction = "North"
local BotX = 777
local BotY = 100
local BotZ = -2043
local WC01 = -2053
local WT01 = "Z"
local WC02 = 785
local WT02 = "X"
local WC03 = -2077
local WT03 = "Z"
local WC04 = 97
local WT04 = "Y"
local CurrentWaypoint = 1
local EndWaypoint = 5
local Cord = WC01
local PointType = WT01
local function feedGenerator()
    for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
        robot.select(i)
        if component.generator.insert(32) then
            return
        end
    end
end
local function TurnNorth()
	if Direction ~= "North"	then
		if Direction == "East" then
			robot.turnLeft()
		end
		if Direction == "South"	then
			robot.turnAround()
		end
		if Direction == "West" then
			robot.turnRight()
		end
		Direction = "North"
	end
end
local function TurnEast()
	if Direction ~= "East" then
		if Direction == "North"	then
			robot.turnRight()
		end
		if Direction == "South"	then
			robot.turnLeft()
		end
		if Direction == "West" then
			robot.turnAround()
		end
		Direction = "East"
	end
end
local function TurnSouth()
	if Direction ~= "South"	then
		if Direction == "North"	then
			robot.turnAround()
		end
		if Direction == "East" then
			robot.turnRight()
		end
		if Direction == "West" then
			robot.turnLeft()
		end
		Direction = "South"
	end
end
local function TurnWest()
	if Direction ~= "West" then
		if Direction == "North"	then
			robot.turnLeft()
		end
		if Direction == "East" then
			robot.turnAround()
		end
		if Direction == "South"	then
			robot.turnRight()
		end
		Direction = "West"
	end
end
local function NextWaypoint()
	CurrentWaypoint = CurrentWaypoint + 1
	if computer.energy() < 5000 then
		feedGenerator()
	end
	if CurrentWaypoint == EndWaypoint then
		Task = Task + 1
		print("Navigation Complete")
		return
	end
	if CurrentWaypoint == 2 then
		Cord = WC02
		PointType = WT02
	end
	if CurrentWaypoint == 3 then
		Cord = WC03
		PointType = WT03
	end
	if CurrentWaypoint == 4 then
			Cord = WC04
			PointType = WT04
	end
end
local function placeWood(side)
    if robot.compareTo(2) then
            if side == "down" then
                robot.placeDown()
            elseif side == "up" then
                robot.placeUp()
            elseif side == "front" then
                robot.place()
            end
        return
    else
        for i = robotFirstInventorySlot, robot.inventorySize(), 1 do
            robot.select(i)
            if robot.compareTo(2) then
                if side == "down" then
                    robot.placeDown()
                elseif side == "up" then
                    robot.placeUp()
                elseif side == "front" then
                    robot.place()
                end
            return
            end
        end
    end
end
local function changeDirection()
    if Direction == "front" then
        Direction = "back"
    elseif Direction == "back" then
        Direction = "front"
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
local function turnLeftReverse()
    robot.turnLeft()
    robot.back()
    placeWood("front")
    robot.turnLeft()
end
 
local function turnRightReverse()
    robot.turnRight()
    robot.back()
    placeWood("front")
    robot.turnRight()
end
local function GetTools()
	robot.select(1)
	robot.forward()
	robot.turnLeft()
	robot.forward()
	robot.forward()
	robot.forward()
	local InvSize = InvCon.getInventorySize(sides.front)
	for a=1,InvSize,1 do
		if InvCon.suckFromSlot(sides.front,a,1) then
			break
		else
			print("No Shovel")
			Complete = 1
		end
	end
	InvCon.equip()
	robot.turnRight()
	robot.forward()
	robot.turnLeft()
	local InvSize = InvCon.getInventorySize(sides.front)
	for a=1,InvSize,1 do
		if InvCon.suckFromSlot(sides.front,a,1) then
			break
		else
			print("No Axe")
			Complete = 1
		end
	end
	robot.turnRight()
	robot.forward()
	robot.turnLeft()
	robot.select(2)
	robot.suck()
	robot.select(6)
	for a=1,9,1 do
		robot.suck()
	end
	robot.turnAround()
	print("Task 1 Complete")
	Task = Task + 1
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
local function moving(distanceFront, distanceSide, distanceDown)
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
                if Facedirection == "front" then
                    if j % 2 == 0 then
                        turnRight()
                    else
                        turnLeft()
                    end
                elseif Facedirection == "back" then
                    if j % 2 == 0 then
                        turnLeft()
                    else
                        turnRight()
                    end
                end
            else
                if Facedirection == "front" then
                    if j % 2 == 0 then
                        turnRight()
                    else
                        turnLeft()
                    end
                elseif Facedirection == "back" then
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
            print("Charcoal Harvested")
				Task = Task + 1
        end
        robot.swingDown()
        robot.down()
        robot.turnAround()
        changeDirection()
        k = k + 1
    end
end
local function placing(distanceFront, distanceSide, distanceDown)
    local k = 0
    while k < distanceDown do
        print(k)
        local j = 0
        while j < distanceSide -1 do
            print(j)
            local i = 0
            while i < distanceFront - 1 do
                print(i)
                if robot.back() then
                    i = i + 1
                end
                placeWood("front")
            end
            if computer.energy() < 15000 then
                feedGenerator()
            end
            if distanceSide % 2 == 0 then
                if direction == "front" then
                    if j % 2 == 0 then
                        turnRightReverse()
                    else
                        turnLeftReverse()
                    end
                elseif direction == "back" then
                    if j % 2 == 0 then
                        turnLeftReverse()
                    else
                        turnRightReverse()
                    end
                end
            else
                if direction == "front" then
                    if j % 2 == 0 then
                        turnRightReverse()
                    else
                        turnLeftReverse()
                    end
                elseif direction == "back" then
                    if j % 2 == 0 then
                        turnRightReverse()
                    else
                        turnLeftReverse()
                    end
                end
            end
            j = j + 1
        end
        local l = 1
        while l < distanceFront do
            print(l)
            if robot.back() then
                l = l + 1
            end
            placeWood("front")
        end
        if k == (distanceDown - 1) then
            robot.up()
            placeWood("down")
            robot.up()
            robot.select(3)
            robot.placeDown()
            print("Wood Placed")
				Task = Task + 1
        end
        robot.up()
        robot.placeDown()
        robot.turnAround()
        changeDirection()
        k = k + 1
    end
end
while Complete == 0 do
	if Task == 1 then
		GetTools()
	end
	if Task == 2 then
		MoveToPoint()
	end
	if Task == 3 then
		robot.select(3)
		robot.swingDown()
		robot.down()
		robot.select(17)
		robot.swingDown()
		robot.down()
		robot.select(1)
		component.inventory_controller.equip()
		robot.select(17)
		Task = Task + 1
		print("Task 3 Complete")
	end
	if Task == 4 then
		moving(11,11,5)
	end
	if Task == 5 then
		placing(11,11,5)
	end
	if Task == 6 then
		robot.select(3)
		robot.up()
		
end
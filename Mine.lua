local function moveForward()
    while not turtle.forword() do

        if turtle.detect() then
            turtle.dig()
            if turtle.detect() then
                sleep(0.8)
            end

        elseif turtle.getFuelLevel() == 0 then
            for i = 1, 16 do
                turtle.select(i)
                if turtle.refuel(0) then
                      turtle.refuel()
                end
                if turtle.getFuelLevel() >= 1000 then
                      break
                end
            end

        elseif turtle.attack() then
            print()
        end

    end
end

function unload()
    for i = 2, 15 do 
        turtle.select(i)
        turtle.drop()
    end
end

function main()
    local distance = 100
    local depth = 0 
    for i = 1, distance do
        depth = depth + 1
        moveForward()
        turtle.digUp()
        turtle.digDown()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    for i = 1, depth do
        moveForward()
    end
    unload()
end

main()
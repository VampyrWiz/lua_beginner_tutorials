local fruits = { 'Apple', 'Banana', 'Orange' }

table.insert(fruits, 'Cherry')

for i = 1, #fruits do
    print(fruits[i])
end
print()

table.insert(fruits, 2, 'Avacado')

for i = 1, #fruits do
    print(fruits[i])
end
print()

table.remove(fruits, 4)

for i = 1, #fruits do
    print(fruits[i])
end
print()

table.insert(fruits, 'Orange')

local player = {
    name = 'Alice',
    level = '10',
    score = '100'
}
player.lives = 3

print('-----------------------------------------------------------------')

-- Looping through tables

for index, value in ipairs(fruits) do
    print("Fruit " .. index .. ": " .. value)
end
print()

for key, value in pairs(player) do
    print(string.upper(key) .. ": " .. value)
end
print()

-- Metatables
local car = {
    speed = 100
}

print(car.speed)
print(car.maxSpeed)
print()

local metatable = {
    __index = function (table, key)
        if key == 'maxSpeed' then
            return 300
        end
    end
}

setmetatable(car, metatable)
print(car.speed)
print(car.maxSpeed)
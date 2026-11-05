-- If, elseif, else
local age = nil
age = 18
if age < 18 then
    print("Sorry, you cannot vote and no subsidies is given.")
elseif age >= 18 and age < 60 then
    print("You can vote but no subsidies is given.")
else
    print("You can vote and are given subsidies.")
end
print()

-- Loops (for and while)
for i=1,10 do
    print("13 x "..i.." = "..(13 * i))
end
print()

for i=100,0,-10 do
    print("Ahead you are these amount of people: "..i)
    if i == 0 then
        print("It's your turn. Pay your amount.")
    end
end
print()

local motorcycles = {"Honda", "Bajaj", "Yamaha", "Indian", "Harley Davidson", "BMW", "Suzuki"}
for i=1,#motorcycles do
    print(motorcycles[i])
end
print()

local number = 1
local sum = 0
while number <= 10 do
    sum = sum + number
    number = number + 1
end
print(sum.."\n")

-- break and continue
for i=1,10 do
    print(i)
    if i == 5 then
        break
    end
end
print()

-- no continue in lua
for i=1,10 do
    if i % 2 ~= 0 then
        print(i)
    end
end
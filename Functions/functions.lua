local function hello_world()
    print("Hello World!")
end

hello_world()

local function greetings(name)
    print("Hello " .. name .. ".")
end

greetings("Alice")
greetings("Bob")

local function get_max(num1, num2, num3)
    if num1 > num2 then
        if num1 > num3 then
            return num1
        else
            return num3
        end
    else
        if num2 > num3 then
            return num2
        else
            return num3
        end
    end
end
print(get_max(10, 20, 30))

local intro = function(name)
    print("Hello, my name is "..name..".")
end
intro("John Smirk")

-- Recursive Function
local function factorial(num)
    if num == 0 then
        return 1
    else
        return num * factorial(num - 1)
    end
end
print(factorial(6))

io.write("Enter the number: ")
local num = io.read("*n")
print(factorial(num))

local function hcf(num1, num2)
    if num1 == 0 then
        return num2
    else
        return hcf(num2 % num1, num1)
    end
end
print(hcf(80, 12))
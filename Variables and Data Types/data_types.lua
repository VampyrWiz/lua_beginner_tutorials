-- Numbers -> Treats all numbers as floating point.
local num1 = 10
local num2 = 3
print(num1.." + "..num2.." = "..(num1 + num2))
print(num1.." - "..num2.." = "..(num1 - num2))
print(num1.." * "..num2.." = "..(num1 * num2))
print(num1.." / "..num2.." = "..(num1 / num2))
print(num1.." % "..num2.." = "..(num1 % num2))
print(num1.." // "..num2.." = "..(num1 // num2))

-- Strings
local greetings = "Hello"
local name = "Man"
print(greetings.." "..name..".")

-- Boolean
local flag = true
print(flag)

-- Tables -> Array + Dictionary
local motorcycles = {"Honda", "Bajaj", "Yamaha", "Indian", "Harley Davidson", "BMW", "Suzuki"}
print(motorcycles[1]) -- Array starts with 1 in lua. 0 is nil.
local market = {name = "Apple", price = 10}
print("I bought 1 "..market.name.." in Rs. "..market.price..".")

-- nil
local age = nil
print(age)
print(motorcycles[0])
age = 10
print(age)
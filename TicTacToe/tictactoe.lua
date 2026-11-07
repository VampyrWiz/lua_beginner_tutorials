-- Choose Single Player or Double Player
local singlePlayer = nil
::wrongChoice::
print("Enter the choice for mode:")
print("1 for Single Player")
print("2 for Double Player")
local choice = io.read("*n")
if choice == 1 then
    singlePlayer = true
elseif choice == 2 then
    singlePlayer = false
else
    goto wrongChoice
end

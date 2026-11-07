local file = io.open("hello_world.txt", "w")

file:write("Hello World!")
file:write(" I'm learning Lua.")
file:close()

file = io.open("hello_world.txt", "a")
file:write("\nThis is appended.")
file:close()

file = io.open("hello_world.txt", "r")
if file then
    local content = file:read("*all") -- line for a line
    print(content)
else
    print("File not found.")
end
file:close()

os.remove('hello_world.txt')
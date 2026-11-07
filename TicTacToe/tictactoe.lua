local ai = require("TicTacToe/ai")
-- Draw Board
local function drawBoard(gameTable)
    os.execute("clear") -- os.execute("cls") if windows
    for index, value in ipairs(gameTable) do
        if index % 3 ~= 0 then
            io.write(" "..value .. " |")
        else
            io.write(" "..value .. "\n")
            if index ~= 9 then
               io.write("---+---+---\n") 
            end
        end
    end
end

-- Player Turn
local function playerTurn(gameTable, playerSymbol)
    drawBoard(gameTable)
    print("Player " .. playerSymbol .. " Turn.")
    local playerChoice = nil
    while true do
        io.write("Enter your choice (1 - 9): ")
        playerChoice = io.read("*n")
        if playerChoice >= 1 and playerChoice <= 9 then
            if gameTable[playerChoice] == " " then
                gameTable[playerChoice] = playerSymbol
                break
            else
                print(playerChoice .. " already occupied. Please enter your choice again.")
            end
        else
            print("Invalid Choice. Please enter your choice again.")
        end
    end
end

-- AI Turn
local function aiTurn(gameTable, aiSymbol)
    gameTable[ai.bestMove(gameTable, aiSymbol)] = aiSymbol
end

-- Check Game Condition
local function checkGameCondition(gameTable)
    -- Check Row
    for row = 1, 7, 3 do
        if gameTable[row] ~= " " then
            if gameTable[row] == gameTable[row + 1] then
                if gameTable[row] == gameTable[row + 2] then
                    return 1, gameTable[row] -- 1 = Victory
                end
            end
        end
    end

    -- Check Column
    for column = 1, 3 do
        if gameTable[column] ~= " " then
            if gameTable[column] == gameTable[3 + column] then
                if gameTable[column] == gameTable[column + 6] then
                    return 1, gameTable[column] -- 1 = Victory
                end
            end
        end
    end

    -- Check Diagnols
    if gameTable[5] ~= " " then
        if gameTable[1] == gameTable[5] and gameTable[5] == gameTable[9] then
            return 1, gameTable[5] -- 1 = Victory
        elseif gameTable[3] == gameTable[5] and gameTable[5] == gameTable[7] then
            return 1, gameTable[5] -- 1 = Victory
        end
    end

    -- 2 = Draw and 3 = GameIncomplete
    local result = 2
    for i = 1, #gameTable do
        if gameTable[i] == " " then
            result = 3
            break
        end
    end
    return result, " "
end

-- Choose Single Player or Double Player
local singlePlayer = nil
::newGame::
print("Enter the choice for mode:")
print("1 for Single Player")
print("2 for Double Player")
print("Any for Exit")
local choice = io.read("*n")
if choice == 1 then
    singlePlayer = true
elseif choice == 2 then
    singlePlayer = false
else
    os.exit(0)
end

-- Single Player
local gameTable = { " ", " ", " ", " ", " ", " ", " ", " ", " " }
local endGame = false
if singlePlayer then
    drawBoard(gameTable)
    local turn = math.random(2)
    local playerSymbol, aiSymbol = 'O', 'X'
    if turn % 2 ~= 0 then
        playerSymbol = 'X'
        aiSymbol = 'O'
    end
    while not endGame do
        if turn % 2 == 0 then
            playerTurn(gameTable, playerSymbol)
        else
            aiTurn(gameTable, aiSymbol)
        end
        turn = turn + 1
        local condition, victor = checkGameCondition(gameTable)
        if condition == 1 then
            if victor == playerSymbol then
                drawBoard(gameTable)
                print("Player Won.\n")
            else
                drawBoard(gameTable)
                print("AI Won.\n")
            end
            endGame = true
        elseif condition == 2 then
            drawBoard(gameTable)
            print("Draw.\n")
            endGame = true
        end
    end
else
    drawBoard(gameTable)
    local turn = math.random(2)
    local playerSymbol1, playerSymbol2 = 'O', 'X'
    if turn % 2 ~= 0 then
        playerSymbol1 = 'X'
        playerSymbol2 = 'O'
    end
    while not endGame do
        if turn % 2 == 0 then
            playerTurn(gameTable, playerSymbol1)
        else
            playerTurn(gameTable, playerSymbol2)
        end
        turn = turn + 1
        local condition, victor = checkGameCondition(gameTable)
        if condition == 1 then
            drawBoard(gameTable)
            print("Player "..victor.." Won.\n")
            endGame = true
        elseif condition == 2 then
            drawBoard(gameTable)
            print("Draw.\n")
            endGame = true
        end
    end
end

goto newGame
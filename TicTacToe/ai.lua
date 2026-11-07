local ai = {}

local function checkVictory(board, symbol)
    -- Check Row
    for row = 1, 7, 3 do
        if board[row] == symbol then
            if board[row] == board[row + 1] then
                if board[row] == board[row + 2] then
                    return true
                end
            end
        end
    end

    -- Check Column
    for column = 1, 3 do
        if board[column] == symbol then
            if board[column] == board[3 + column] then
                if board[column] == board[column + 6] then
                    return true
                end
            end
        end
    end

    -- Check Diagnols
    if board[5] == symbol then
        if board[1] == board[5] and board[5] == board[9] then
            return true
        elseif board[3] == board[5] and board[5] == board[7] then
            return true
        end
    end

    return false
end

local function checkDraw(board)
    for i = 1, #board do
        if board[i] == " " then
            return false
        end
    end
    return true
end

-- Alpha Beta Pruning
local function minimax(board, turn, aiSymbol, depth, alpha, beta)
    local opponent = aiSymbol == 'X' and 'O' or 'X'
    if checkVictory(board, aiSymbol) then
        return 10 - depth
    elseif checkVictory(board, opponent) then
        return depth - 10
    elseif checkDraw(board) then
        return 0
    end

    local maximizing = (aiSymbol == turn)
    local best = maximizing and -math.huge or math.huge
    local nextTurn = maximizing and (aiSymbol == 'X' and 'O' or 'X') or aiSymbol

    for i = 1, #board do
        if board[i] == " " then
            board[i] = turn
            local score = minimax(board, nextTurn, aiSymbol, depth + 1, alpha, beta)
            board[i] = " "
            if maximizing then
                if score > best then best = score end
                if best > alpha then alpha = best end
            else
                if score < best then best = score end
                if best < beta then beta = best end
            end
            if beta <= alpha then break end
        end
    end
    return best
end

function ai.bestMove(board, aiSymbol)
    local bestScore, move = -math.huge, nil
    local opponent = aiSymbol == "X" and "O" or "X"
    for i = 1, #board do
        if board[i] == " " then
            board[i] = aiSymbol
            local score = minimax(board, opponent, aiSymbol, 1, -math.huge, math.huge)
            board[i] = " "
            if score > bestScore then bestScore, move = score, i end
        end
    end
    return move
end

return ai
--Vova here, copied this this file to add more quotes, I wanted some Sun Tzu
--up in here
math.randomseed(os.time())

local list_extend = vim.list_extend

--- @param line string
--- @param max_width number
--- @return table
local format_line = function(line, max_width)
    if line == "" then
        return { " " }
    end

    local formatted_line = {}

    -- split line by spaces into list of words
    local words = {}
    local target = "%S+"
    for word in line:gmatch(target) do
        table.insert(words, word)
    end

    local bufstart = " "
    local buffer = bufstart
    for i, word in ipairs(words) do
        if (#buffer + #word) <= max_width then
            buffer = buffer .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        else
            table.insert(formatted_line, buffer:sub(1, -2))
            buffer = bufstart .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        end
    end
    -- right-justify text if the line begins with -
    if line:sub(1, 1) == "-" then
        for i, val in ipairs(formatted_line) do
            local space = string.rep(" ", max_width - #val - 2)
            formatted_line[i] = space .. val:sub(2, -1)
        end
    end
    return formatted_line
end

--- @param fortune table
--- @param max_width number
--- @return table
local format_fortune = function(fortune, max_width)
    -- Converts list of strings to one formatted string (with linebreaks)
    local formatted_fortune = { " " } -- adds spacing between alpha-menu and footer
    for _, line in ipairs(fortune) do
        local formatted_line = format_line(line, max_width)
        formatted_fortune = list_extend(formatted_fortune, formatted_line)
    end
    return formatted_fortune
end

local get_fortune = function(fortune_list)
    -- selects an entry from fortune_list randomly
    local ind = math.random(1, #fortune_list)
    return fortune_list[ind]
end

-- Credit to @mhinz for compiling this list in vim-startify
local fortune_list = {
    {
        "\"You must understand that there is more than one path to the top of the mountain\"",
        "",
        "- Miyamoto Musashi, A Book of Five Rings"
    },
    {
        "\"from one thing, know ten thousand things\"",
        "",
        "- Miyamoto Musashi, A Book of Five Rings"
    },
    {
        "\"You should not have any special fondness for a particular weapon, or anything else, for that matter. Too much is the same as not enough. Without imitating anyone else, you should have as much weaponry as suits you.\"",
        "",
        "- Miyamoto Musashi, A Book of Five Rings"
    },
    {
        "\"In the midst of chaos, there is also opportunity\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"All warfare is based on deception. Hence, when we are able to attack, we must seem unable; when using our forces, we must appear inactive; when we are near, we must make the enemy believe we are far away; when far away, we must make him believe we are near.\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"Victorious warriors win first and then go to war, while defeated warriors go to war first and then seek to win\"",
        "",
        "- Sun Tzu, The Art of War"
    },
    {
        "\"Let your plans be dark and impenetrable as night, and when you move, fall like a thunderbolt\"",
        "",
        "- Sun Tzu, The Art of War"
    },
}

--- @return table
--- @param opts number|table? optional
--- returns an array of strings
local main = function(opts)
    local options = {
        max_width = 54,
        fortune_list = fortune_list,
    }

    if type(opts) == "number" then
        options.max_width = opts
    elseif type(opts) == "table" then
        options = vim.tbl_extend("force", options, opts)
    end

    local fortune = get_fortune(options.fortune_list)
    local formatted_fortune = format_fortune(fortune, options.max_width)

    return formatted_fortune
end

return main

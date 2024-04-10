local norrsken = require("norrsken")
local configs = norrsken.configs()
local colors = norrsken.colors()

local bg = configs.lualine_bg_color or colors.black

local normal = {
    a = { fg = colors.black, bg = colors.twilight, gui = 'bold' },
    b = { fg = colors.twilight, bg = bg },
    c = { fg = colors.white, bg = bg },
}

local command = {
    a = { fg = colors.black, bg = colors.nebula, gui = 'bold' },
    b = { fg = colors.nebula, bg = bg },
}

local visual = {
    a = { fg = colors.black, bg = colors.sky, gui = 'bold' },
    b = { fg = colors.sky, bg = bg },
}

local inactive = {
    a = { fg = colors.white, bg = colors.visual, gui = 'bold' },
    b = { fg = colors.black, bg = colors.white },
}

local replace = {
    a = { fg = colors.black, bg = colors.glow, gui = 'bold' },
    b = { fg = colors.glow, bg = bg },
    c = { fg = colors.white, bg = bg },
}

local insert = {
    a = { fg = colors.black, bg = colors.aurora, gui = 'bold' },
    b = { fg = colors.aurora, bg = bg },
    c = { fg = colors.white, bg = bg },
}

return {
    normal = normal,
    command = command,
    visual = visual,
    inactive = inactive,
    replace = replace,
    insert = insert,
}

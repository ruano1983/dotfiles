require('smoothcursor').setup({
    type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

    cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursorGreen",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    autostart = true,           -- Automatically start SmoothCursor
    always_redraw = false,       -- Redraw the screen on each update
    speed = 100,                 -- Max speed is 100 to stick with your current position
})

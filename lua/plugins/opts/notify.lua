local config = {
    background_colour = "#131313",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
    },
    level = 4,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
    },
    timeout = 1200,
    top_down = true,
}

return config

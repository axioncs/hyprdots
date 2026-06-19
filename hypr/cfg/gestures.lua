hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move" })
hl.gesture({
    fingers = 4,
    direction = "down",
    action = function()
        hl.exec_cmd("systemctl suspend")
    end
})

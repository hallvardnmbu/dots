hl.config({
    general = {
        layout = "dwindle",
    },
    dwindle = {
        preserve_split = true,
    },

    animations = {
        enabled = true,
    },
})

-- https://easings.net/
-- https://www.cssportal.com/css-cubic-bezier-generator/
hl.curve("quick", { type = "bezier", points = { { 0, 0 }, { 0.1, 1 } } })

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 3,
    bezier = "quick",
})

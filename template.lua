-- scriptname
-- short script description
-- v1.0.0 @author
-- llllllll.co/t/12345
--
--
--    ▼ instructions below ▼
--
-- E1 - something
-- E2 - something else
-- E3 - yet another thing
-- K1 - does something
-- K2 - does something else
-- K3 - does yet another thing

---specify a minimum required version of norns for this script.
norns.version.required = 240424 -- can be a number or string, formatted YYMMDD

---specify an engine for this script
engine.name = "None"

-- local lattice = require('lattice')
-- local somelib = include('lib/somelib')

---flag to indicate if the screen needs to be redrawn.
---@type boolean
local screen_dirty

---screen redraw timer
---
---@see screen_dirty
---@type { id: integer, count: number, event: function, time: number } | nil
local screen_redraw_metro

---softcut level before script initialization.
---used to reset the softcut level to its previous value when the script exits.
---@type number
local pre_script_softcut_level

---norns - script init handler
---
---function which executes at script load
function init()
    -- place all script initialization logic and calls below
    --
    --

    -- set the pre_script_softcut_level to the current softcut level
    pre_script_softcut_level = params:get('softcut_level')

    -- set the screen dirty flag to trigger the initial screen redraw
    screen_dirty = false

    -- initialize the screen redraw timer
    screen_redraw_metro = metro.init()
    screen_redraw_metro.time = 1 / 15
    screen_redraw_metro.event = function()
        if screen_dirty then
            screen_dirty = false
            redraw()
        end
    end
    screen_redraw_metro.count = -1 -- `-1` means repeat indefinitely

    -- start the screen redraw timer
    if screen_redraw_metro == nil then
        print("screen_redraw metro is nil - exiting script")
        return
    end
    screen_redraw_metro:start()
end

---norns - script cleanup handler
---
---called by norns when the script is stopped or reloaded.
function cleanup()
    -- place all script cleanup logic and calls below
    --
    --

    -- stop the screen redraw timer
    if screen_redraw_metro ~= nil then
        metro.free(screen_redraw_metro.id) -- stop the screen redraw timer
    end

    -- reset the softcut level to its previous value
    params:set('softcut_level', pre_script_softcut_level)
end

---norns - key input handler
---
---function to parse norns keypresses.
---called by norns when a key is pressed or released.
---this function provides an opportunity to trigger an action based on the key
---pressed or released.
---@param n integer key number
---| 1 K1 (key 1)
---| 2 K2 (key 2)
---| 3 K3 (key 3)
---@param z number key value
---| 0 key released
---| 1 key pressed
function key(n, z)
    -- place all actions for key presses and release below
    --
    --

    if n == 1 then
        -- K1 - key 1
        print("K1: " .. z) -- debug: print key presses and releases
    elseif n == 2 then
        -- K2 - key 2
        print("K2: " .. z) -- debug: print key presses and releases
    elseif n == 3 then
        -- K3 - key 3
        print("K3: " .. z) -- debug: print key presses and releases
    end

    screen_dirty = true -- set screen dirty flag to trigger screen redraw
end

---norns - encoder input handler
---
---called by norns when an encoder is turned.
---@param n integer encoder number
---| 1 E1 encoder 1
---| 2 E2 encoder 2
---| 3 E3 encoder 3
---@param d number delta value indicating the direction of the turn, where a positive number is a clockwise turn, and a negative number is a counter-clockwise turn.
function enc(n, d)
    -- place all actions for encoder turns below
    --
    --

    if n == 1 then
        -- E1 - encoder 1
        print("E1: " .. d) -- debug: print encoder turns
    elseif n == 2 then
        -- E2 - encoder 2
        print("E2: " .. d) -- debug: print encoder turns
    elseif n == 3 then
        -- E3 - encoder 3
        print("E3: " .. d) -- debug: print encoder turns
    end

    screen_dirty = true -- set screen dirty flag to trigger screen redraw
end

---norns - screen redraw handler
---
---within this script, this function is called by the locally defined
---`screen_redraw_metro`.
---place all screen drawing logic and calls in this function
function redraw()
    screen.clear() -- by default, clear the screen

    -- replace with your screen drawing logic below
    --
    --

    screen.aa(0)
    screen.level(15)
    screen.move(64, 28)
    screen.text_center("title")
    screen.move(64, 36)
    screen.text_center("sub-title")
    screen.update()
end

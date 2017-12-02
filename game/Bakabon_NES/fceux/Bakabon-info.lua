-- NES "Heisei Tensai Bakabon" HUD script for FCEUX
--
-- displays position, speed, etc.

local COLOR_RED = "red"

local info_prev = nil

function get_info()
    local info = {}

    info.screen_x = memory.readbyte(0x53)
    info.camera_x = 0x100*memory.readbyte(0x5E) + memory.readbyte(0x5D)
    info.x = 0x100*(info.screen_x+info.camera_x) + memory.readbyte(0x0178)
    info.speed_x = 0x100*memory.readbyte(0x7F) + memory.readbyte(0x7E)

    info.y = 0x100*memory.readbyte(0x59) + memory.readbyte(0x0181)
    info.speed_y = 0x100*memory.readbyte(0x017E) + memory.readbyte(0x017D)

    info.umbrella_count = memory.readbyte(0x03A4)
    info.mem_0x56 = memory.readbyte(0x56)
    info.mem_0x0180 = memory.readbyte(0x0180)

    info.enemy_hit = memory.readbyte(0x0396)

    info.rand = 0x10000*memory.readbyte(0x15) + 0x100*memory.readbyte(0x14) + memory.readbyte(0x13)

    info.mem_0x04A0 = memory.readbyte(0x04A0)

    info.mem_0x039A = memory.readbyte(0x039A)

    info.mem_0x039C = memory.readbyte(0x039C)

    info.seg_frame = -1
    if taseditor.engaged() then
        local f_current = emu.framecount()
        for f = f_current, 0, -1 do
            if taseditor.markedframe(f) then
                info.seg_frame = f_current - f
                break
            end
        end
    end

    return info
end

function show_info()
    local info = get_info()

    gui.text(0, 8, string.format("X:%.3f  SCR:%d CAM:%d", info.x / 256.0, info.screen_x, info.camera_x))
    gui.text(0, 16, string.format("X speed:%.3f", info.speed_x / 256.0))

    gui.text(0, 32, string.format("Y:%.3f", info.y / 256.0))
    gui.text(0, 40, string.format("Y speed:%.3f", info.speed_y / 256.0))

    if info_prev ~= nil then
        gui.text(104, 16, string.format("PreX:%.3f", info_prev.x / 256.0))
        if info_prev.x + info.speed_x ~= info.x and info_prev.x - info.speed_x ~= info.x then gui.text(72, 16, "X_BUG", COLOR_RED); end
        gui.text(104, 40, string.format("PreY:%.3f", info_prev.y / 256.0))
        if info_prev.y + info_prev.speed_y ~= info.y and info_prev.y - info.speed_y ~= info.y then gui.text(72, 40, "Y_BUG", COLOR_RED); end
    end

    gui.text(216, 8, string.format("$56:%d", info.mem_0x56))
    gui.text(216, 16, string.format("UMB:%d", info.umbrella_count))
    gui.text(200, 32, string.format("$0180:%d", info.mem_0x0180))

    gui.text(208, 224, string.format("SEG:%d", info.seg_frame))

    -- 中ボス用
    if false then
        gui.text(0, 56, string.format("HIT: %d", info.enemy_hit))
    end

    -- 1-BOSS用
    if false then
        gui.text(0, 56, string.format("RAND:0x%06X", info.rand))

        gui.text(104, 56, string.format("$04A0:%d", info.mem_0x04A0))

        gui.text(192, 56, string.format("$039A:%d", info.mem_0x039A))
    end

    -- 4-BOSS用
    if true then
        gui.text(0, 56, string.format("RAND:0x%06X", info.rand))

        gui.text(104, 56, string.format("$039C:%d", info.mem_0x039C))
    end

    info_prev = info
end

function main()
    emu.registerafter(show_info)
    --gui.register(show_info)
end

main()

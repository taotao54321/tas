

local N_OBJ = 32

local BARRIER_01 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
}
local BARRIER_0203 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0x4A, 0x58, 0x66, 0xC8 },
    { 0x9A, 0x58, 0xB6, 0xC8 },
}
local BARRIER_0405 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0x00, 0x38, 0x07, 0xFF },
    { 0xDA, 0x3A, 0xFF, 0x50 },
    { 0xDA, 0x58, 0xFF, 0xFF },
    { 0xF0, 0x50, 0xFF, 0x58 },
}
local BARRIER_06 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0xDA, 0x20, 0xFF, 0x50 },
    { 0xDA, 0x58, 0xFF, 0xFF },
    { 0xF0, 0x40, 0xFF, 0x60 },
    { 0x00, 0x20, 0x07, 0xFF },
}
local BARRIER_07 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0x00, 0x38, 0x36, 0x58 },
    { 0x4A, 0x38, 0xB6, 0x58 },
    { 0xCA, 0x38, 0xFF, 0x58 },
    { 0x1A, 0x68, 0x76, 0x88 },
    { 0x8A, 0x68, 0xE6, 0x88 },
    { 0x00, 0x98, 0x36, 0xB8 },
    { 0x4A, 0x98, 0xB6, 0xB8 },
    { 0xCA, 0x98, 0xFF, 0xB8 },
}
local BARRIER_08 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0x00, 0x38, 0x36, 0x58 },
    { 0x4A, 0x38, 0xB6, 0x58 },
    { 0xCA, 0x38, 0xFF, 0x58 },
    { 0x1A, 0x68, 0xE6, 0x88 },
    { 0x00, 0x98, 0x36, 0xB8 },
    { 0x4A, 0x98, 0xB6, 0xB8 },
    { 0xCA, 0x98, 0xFF, 0xB8 },
}
local BARRIER_09 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xC8, 0xFF, 0xF0 },
    { 0x00, 0x38, 0x76, 0x58 },
    { 0x8A, 0x38, 0xFF, 0x58 },
    { 0x1A, 0x68, 0xE6, 0x88 },
    { 0x00, 0x98, 0x76, 0xB8 },
    { 0x8A, 0x98, 0xFF, 0xB8 },
}
local BARRIER_10 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xD0, 0xFF, 0xF0 },
    { 0x00, 0xC0, 0x2E, 0xD0 },
    { 0x3A, 0xC0, 0xDE, 0xD0 },
    { 0xEA, 0xC0, 0xFF, 0xD0 },
    { 0x5A, 0xB0, 0xC6, 0xC0 },
    { 0x68, 0xA0, 0xAE, 0xB0 },
    { 0x7A, 0x98, 0xAE, 0xA0 },
    { 0x82, 0x90, 0xAE, 0x98 },
    { 0x8A, 0x88, 0xAE, 0x90 },
}
local BARRIER_11 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xD0, 0xFF, 0xF0 },
    { 0x00, 0xC0, 0x1E, 0xD0 },
    { 0x2A, 0xC0, 0x7E, 0xD0 },
    { 0x8A, 0xC0, 0xDE, 0xD0 },
    { 0xEA, 0xC0, 0xFF, 0xD0 },
    { 0x3A, 0xB8, 0x6C, 0xC0 },
    { 0x3E, 0xA8, 0x64, 0xB8 },
    { 0x46, 0xA0, 0x5A, 0xA8 },
    { 0x94, 0xB8, 0xC6, 0xC0 },
    { 0x9A, 0xB0, 0xC4, 0xB8 },
    { 0x9E, 0xA0, 0xBC, 0xB0 },
}
local BARRIER_12 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xD0, 0xFF, 0xF0 },
    { 0x00, 0xC0, 0x4E, 0xD0 },
    { 0x00, 0xC0, 0x44, 0xC8 },
    { 0x00, 0xB8, 0x3C, 0xC0 },
    { 0x00, 0xB0, 0x34, 0xB8 },
    { 0x00, 0x98, 0x2A, 0xB0 },
    { 0x04, 0x88, 0x24, 0x98 },
    { 0xC4, 0xC0, 0xFF, 0xC8 },
    { 0xD4, 0xB8, 0xFF, 0xC0 },
    { 0xDC, 0xB0, 0xFF, 0xB8 },
    { 0xE4, 0xA0, 0xFF, 0xB0 },
    { 0xF4, 0x98, 0xFF, 0xA0 },
    { 0x5A, 0xC0, 0x7C, 0xD0 },
    { 0x88, 0xC0, 0xAC, 0xD0 },
    { 0xB8, 0xC0, 0xFF, 0xD0 },
}
local BARRIER_131415 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xD0, 0xFF, 0xF0 },
    { 0x00, 0x00, 0x3C, 0x2C },
    { 0x00, 0x00, 0x24, 0x3C },
    { 0x00, 0x00, 0x14, 0x54 },
    { 0xEC, 0xA4, 0xFF, 0xFF },
    { 0xDC, 0xBC, 0xFF, 0xFF },
    { 0xC4, 0xCC, 0xFF, 0xFF },
    { 0xF8, 0x00, 0xFF, 0x50 },
    { 0x00, 0xA8, 0x08, 0xFF },
}
local BARRIER_16 = {
    { 0x00, 0x00, 0xFF, 0x20 },
    { 0x00, 0xD0, 0xFF, 0xF0 },
    { 0x00, 0x20, 0x38, 0x30 },
    { 0x00, 0x30, 0x18, 0x58 },
    { 0xC8, 0x20, 0xFF, 0x30 },
    { 0xE8, 0x30, 0xFF, 0x58 },
    { 0x00, 0xA0, 0x18, 0xC8 },
    { 0x00, 0xC8, 0x38, 0xD0 },
    { 0xC8, 0xC8, 0xFF, 0xD0 },
    { 0xE8, 0xA0, 0xFF, 0xC8 },
}

local BARRIER = {
    BARRIER_01,
    BARRIER_0203,
    BARRIER_0203,
    BARRIER_0405,
    BARRIER_0405,
    BARRIER_06,
    BARRIER_07,
    BARRIER_08,
    BARRIER_09,
    BARRIER_10,
    BARRIER_11,
    BARRIER_12,
    BARRIER_131415,
    BARRIER_131415,
    BARRIER_131415,
    BARRIER_16,
}

local HITSIZE = {
    {  6,  6 }, -- PLAYER1
    {  6,  6 }, -- PLAYER2
    {  4,  4 }, -- PLAYERBULLET
    {  7,  3 }, -- ENERGY
    {  8,  8 }, -- BALLOON
    {  2,  4 }, -- BALLOONSTRING
    {  8,  8 }, -- SCISSORS
    {  8,  8 }, -- COW
    {  8,  8 }, -- DRUM
    {  8,  8 }, -- HELI
    {  4,  4 }, -- HELIBULLET
    {  5, 12 }, -- WALLV
    {  8,  8 }, -- ROBO
    {  8,  8 }, -- BLICK
    {  8,  8 }, -- ROBODEAD
    {  8,  8 }, -- SEAHORSE
    {  4,  8 }, -- BUBBLE
    {  4,  4 }, -- STARFISH
    {  4,  4 }, -- STARFISHCHILD
    { 10, 10 }, -- SEAWEED
    {  4,  4 }, -- SEAHORSEBULLET
    { 12,  5 }, -- WALLH
    {  0,  0 }, -- 0x17
    {  8,  8 }, -- ASTEROID
    {  8,  8 }, -- RAY
    {  4,  4 }, -- ASTEROIDCHILD
    { 10, 10 }, -- CAPSULE
    {  8,  8 }, -- BLACKHOLE
}

local COLOR_BARRIER = "orange"
local COLOR_OBJ = "cyan"

local function clip(value)
    if value < 0 then return 0; end
    if value > 0xFF then return 0xFF; end
    return value
end

local function box(x1, y1, x2, y2, color)
    x1 = clip(x1)
    y1 = clip(y1)
    x2 = clip(x2)
    y2 = clip(y2)

    gui.drawbox(x1, y1, x2, y2, "clear", color)
end

local function sasa_signed(value)
    if value >= 0x80 then value = -(value-0x80); end
    return value
end

local function read_obj()
    local obj_list = {}
    local player = { nil, nil }
    for i = 1, N_OBJ do
        local obj = {}
        local addr = 0x0200 + 8*(i-1)
        obj.t = memory.readbyte(addr+0)
        if obj.t > 0 then
            obj.x = memory.readbyte(addr+1)
            obj.y = memory.readbyte(addr+2)
            if obj.t == 1 or obj.t == 2 then
                obj.vx = memory.readbyte(addr+3)
                obj.vy = memory.readbyte(addr+4)
                obj.dir = memory.readbyte(addr+5)
                obj.cool = memory.readbyte(addr+6)
                player[obj.t] = obj
            elseif obj.t == 12 or obj.t == 22 or obj.t == 27 then
                obj.hp = 4*(memory.readbyte(addr+3)-1) + memory.readbyte(addr+4)+1
            end
        end
        obj_list[i] = obj
    end

    return obj_list, player[1], player[2]
end

local function draw_barrier()
    local stage = memory.readbyte(0x23)
    if stage < 1 or stage > 16 then return; end

    local barrier = BARRIER[stage]
    for i = 1, #barrier do
        local b = barrier[i]
        box(b[1], b[2], b[3], b[4], COLOR_BARRIER)
    end
end

local function draw_obj(obj_list)
    for i = 1, N_OBJ do
        local obj = obj_list[i]
        if obj.t > 0 then
            local w = HITSIZE[obj.t][1]
            local h = HITSIZE[obj.t][2]
            box(obj.x-w, obj.y-h, obj.x+w, obj.y+h, COLOR_OBJ)
        end
    end

    wallhp = {}
    wallnum = 0
    for i = 1, N_OBJ do
        local obj = obj_list[i]
        if obj.t == 12 or obj.t == 22 or obj.t == 27 then
            wallnum = wallnum + 1
            wallhp[wallnum] = obj.hp
        end
    end

    for i = 1, wallnum do
        gui.text(48*(i-1), 16, string.format("W%d:%d", i, wallhp[i]))
    end
end

local function draw_info(p1, p2)
    local f = memory.readbyte(0x04)
    local info_f = string.format("F:0x%02X", f)

    local seg_frame = -1
    if taseditor.engaged() then
        local f_current = emu.framecount()
        for f = f_current, 0, -1 do
            if taseditor.markedframe(f) then
                seg_frame = f_current - f
                break
            end
        end
    end
    local info_seg = string.format("%d", seg_frame)

    local info_p = ""
    local info_p1cool = ""
    local info_p2cool = ""
    if p1 then
        local info_p1 = string.format("1P:(%3d,%3d),(%3d,%3d)",
                                      p1.x, p1.y, sasa_signed(p1.vx), sasa_signed(p1.vy))
        info_p = info_p .. info_p1
        info_p1cool = string.format("%d", p1.cool)
    end
    if p2 then
        local info_p2 = string.format(" 2P:(%3d,%3d),(%3d,%3d)",
                                      p2.x, p2.y, sasa_signed(p2.vx), sasa_signed(p2.vy))
        info_p = info_p .. info_p2
        info_p2cool = string.format("%d", p2.cool)
    end

    gui.text(0, 8, info_p)
    gui.text(0, 32, info_p1cool)
    gui.text(248, 32, info_p2cool)
    gui.text(222, 222, info_f)

    gui.text(160, 222, info_seg)

    gui.text(236, 8, string.format("E:%d", memory.readbyte(0x1F)))
end

local function draw()
    local obj_list, p1, p2 = read_obj()

    draw_barrier()
    draw_obj(obj_list)
    draw_info(p1, p2)
end

local function main()
    emu.registerafter(draw)
end

main()

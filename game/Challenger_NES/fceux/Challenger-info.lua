--[[
チャレンジャー (FC) HUD script

TODO: TAS Editor上だと入力読み取り/乱数消費回数がうまく認識できない
      memory.register() を正しく動作させるには実際にエミュレーションを
      行う必要があるが、TAS Editor上では単に各フレームに対応するステー
      トをロードするだけなのが原因。
--]]

----------------------------------------------------------------------
-- util
----------------------------------------------------------------------

local function mem_read_u8(addr)
    return memory.readbyte(addr)
end

local function mem_write_u8(addr, value)
    memory.writebyte(addr, value)
end

local function mem_read_u16_le(addr)
    local lo = mem_read_u8(addr)
    local hi = mem_read_u8(addr+1)
    return bit.bor(lo, bit.lshift(hi, 8))
end

local function mem_write_u16_le(addr, value)
    local lo = bit.band(value, 0xFF)
    local hi = bit.band(bit.rshift(value, 8), 0xFF)
    mem_write_u8(addr, lo)
    mem_write_u8(addr+1, hi)
end


----------------------------------------------------------------------
-- main
----------------------------------------------------------------------

local input_read = false
local rand_cnt = 0

local function get_info()
    info = {}

    info.x = mem_read_u16_le(0x8F)
    info.y = mem_read_u16_le(0x91)
    info.knife_x = mem_read_u16_le(0x47)
    info.knife_y = mem_read_u16_le(0x49)
    info.boss_hit = mem_read_u8(0x71)

    return info
end

local function on_before()
    input_read = false
    rand_cnt = 0
end

local function on_input_read()
    input_read = true
end

local function on_rand()
    rand_cnt = rand_cnt + 1
end

local function on_draw()
    info = get_info()

    gui.text(0, 8, string.format("YOU:(%d,%d) KNI:(%d,%d) HIT:%d",
        info.x, info.y, info.knife_x, info.knife_y, info.boss_hit
    ))
    gui.text(0, 16, string.format("INP:%d RND:%d", (input_read and 1 or 0), rand_cnt))
end

local function main()
    emu.registerbefore(on_before)
    memory.registerexec(0x9EAA, on_input_read)
    memory.registerexec(0x87D9, on_rand)
    emu.registerafter(on_draw)
end

main()

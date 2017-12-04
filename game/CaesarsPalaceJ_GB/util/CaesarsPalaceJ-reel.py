#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""GB Caesars Palace (J) jackpot slot reel simulator

乱数値に対応する各リール値を表示。
"""

ARRAY_42E0 = (
    0x00,
    0x01, 0x01, 0x01, 0x01,
    0x02, 0x02,
    0x03, 0x03, 0x03, 0x03,
    0x04, 0x04,
    0x05, 0x05, 0x05, 0x05,
    0x06, 0x06,
    0x07, 0x07, 0x07, 0x07,
    0x08, 0x08,
    0x09, 0x09, 0x09, 0x09,
    0x0A, 0x0A,
    0x0B, 0x0B, 0x0B, 0x0B,
    0x0C, 0x0C,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0E, 0x0E,
    0x0F, 0x0F, 0x0F, 0x0F,
    0x10, 0x10,
    0x11, 0x11, 0x11, 0x11,
    0x12, 0x12,
    0x13, 0x13, 0x13, 0x13,
    0x14, 0x14,
    0x15, 0x15, 0x15
)

ARRAY_4320 = (
    0x00,
    0x01, 0x01, 0x01, 0x01,
    0x02, 0x02, 0x02,
    0x03, 0x03, 0x03,
    0x04, 0x04,
    0x05, 0x05, 0x05, 0x05,
    0x06, 0x06,
    0x07, 0x07, 0x07, 0x07,
    0x08, 0x08,
    0x09, 0x09, 0x09, 0x09,
    0x0A, 0x0A,
    0x0B, 0x0B, 0x0B, 0x0B,
    0x0C, 0x0C,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0E, 0x0E,
    0x0F, 0x0F, 0x0F, 0x0F,
    0x10, 0x10,
    0x11, 0x11, 0x11, 0x11,
    0x12, 0x12,
    0x13, 0x13, 0x13, 0x13,
    0x14, 0x14,
    0x15, 0x15, 0x15
)

REEL_LEN = 22

REEL_PARAMS = (
    ( ARRAY_42E0, 0x12 ),
    ( ARRAY_4320, 0x0A ),
    ( ARRAY_4320, 0x02 ),
    ( ARRAY_42E0, 0x10 )
)

def reel(i, r):
    ary, addend = REEL_PARAMS[i]
    off = (0x40*r) >> 8
    return (ary[off] + addend) % REEL_LEN

def main():
    for r in range(0x100):
        print("\t".join(map("0x{:02X}".format, (
            r, reel(0,r), reel(1,r), reel(2,r), reel(3,r)
        ))))

if __name__ == "__main__": main()
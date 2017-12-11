#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""GB Caesars Palace (J) RNG simulator

フレームカウンタ $C0C0 の値に対応する乱数値を表示。
"""

def gb_adc8(lhs, rhs, carry_in):
    tmp       = lhs + rhs + carry_in
    res       = tmp & 0xFF
    carry_out = tmp > 0xFF
    return res, carry_out

def gb_sla(n):
    res   = (n<<1) & 0xFF
    carry = (n & 0x80) != 0
    return res, carry

def suzy_rand(frame):
    r = frame
    c = False

    r ^= 0x55
    r, c = gb_sla(r)
    r, c = gb_adc8(r, 0x0D, c)

    r ^= 0xE9
    r, c = gb_sla(r)
    r, c = gb_adc8(r, 0x13, c)

    r ^= 0x22
    r, c = gb_sla(r)
    r, c = gb_adc8(r, 0x17, c)

    return r

def main():
    for f in range(0x100):
        print("0x{:02X}\t0x{:02X}".format(f, suzy_rand(f)))

if __name__ == "__main__": main()

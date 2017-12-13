#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os.path
import sys

from ks.ines import Ines
import util

OUT_DIR = "out"

SPLITS = (
    ("item.bin",    0x10100,  64 * 101),
    ("monster.bin", 0x14000, 128 * 101),
)

def warn(s):
    print(s, file=sys.stderr)

def error(s):
    warn(s)
    sys.exit(1)

def usage():
    error(f"Usage: {sys.argv[0]} <ROM.nes>")

def extract(name, prg, off, size):
    path = os.path.join(OUT_DIR, name)
    with open(path, "wb") as out:
        out.write(prg[off:off+size])
    print(path, size)

def main():
    if len(sys.argv) != 2: usage()
    rom_path = sys.argv[1]

    rom = Ines.from_file(rom_path)
    if not util.rom_is_ok(rom): error("ROM check failed")

    for name, off, size in SPLITS:
        extract(name, rom.prg_rom, off, size)

if __name__ == "__main__": main()

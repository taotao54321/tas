# -*- coding: utf-8 -*-

import base64
import functools
import hashlib
import io
import os.path

from ks.item_data    import ItemData
from ks.monster_data import MonsterData

_OUT_DIR = "out"

_PATH_ITEM    = os.path.join(_OUT_DIR, "item.bin")
_PATH_MONSTER = os.path.join(_OUT_DIR, "monster.bin")

def base64_str(buf):
    return base64.b64encode(buf).decode("ascii")

def rom_is_ok(rom):
    SHA1_PRG = "111311cf697f2091313db436c1597ecc65b5a5c8"
    SHA1_CHR = "fdd81630ef2660c9a6db05a7ac2f9fbf3bd6f8a1"

    sha1_prg = hashlib.sha1(rom.prg_rom).hexdigest().lower()
    sha1_chr = hashlib.sha1(rom.chr_rom).hexdigest().lower()
    return sha1_prg == SHA1_PRG and sha1_chr == SHA1_CHR

def dice_pretty(dice):
    add_str = f"+{dice.add}" if dice.add != 0 else ""
    return f"{dice.num}d{dice.side}{add_str}"

@functools.lru_cache()
def item_data():
    return ItemData.from_file(_PATH_ITEM)

def item_name_pretty(buf):
    with io.StringIO() as out:
        for b in buf:
            if 0x20 <= b <= 0x7A:
                out.write(chr(b))
            elif b == 0x1E:
                out.write("{of}")
            elif b == 0x1D:
                out.write("{scroll}")
            elif b == 0x1C:
                out.write("{potion}")
            else:
                out.write(f"{{0x{b:02X}}}")
        return out.getvalue()

@functools.lru_cache()
def monster_data():
    return MonsterData.from_file(_PATH_MONSTER)

def monster_name_pretty(buf):
    with io.StringIO() as out:
        for b in buf:
            if 0x20 <= b <= 0x7A:
                out.write(chr(b))
            elif b == 0x1F:
                out.write(" ")
            else:
                out.write(f"{{0x{b:02X}}}")
        return out.getvalue()



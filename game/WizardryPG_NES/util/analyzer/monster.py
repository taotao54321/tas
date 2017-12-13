#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import os.path
import sys

from tabulate import tabulate

import util

OUT_DIR   = "out"
OUT_JSON  = os.path.join(OUT_DIR, "monster.json")
OUT_TABLE = os.path.join(OUT_DIR, "monster.txt")

def warn(s):
    print(s, file=sys.stderr)

def error(s):
    warn(s)
    sys.exit(1)

def bool_pretty(x):
    return "o" if x else ""

def genre_pretty(genre):
    return genre.name

def dmg_pretty(mon):
    return ",".join(map(util.dice_pretty, mon.dmg_dices[:mon.at]))

def next_pretty(mon):
    if mon.next_prob == 0: return ""

    percent = 100 if mon.next_prob == 0xFF else int(100*mon.next_prob/256)

    data = util.monster_data()
    name_str = util.monster_name_pretty(data.monsters[mon.next_monster].isname)
    prob_str = f"{mon.next_prob}/256 = {percent}%"
    return f"({mon.next_monster}) {name_str} ({prob_str})"

def element_pretty(elem):
    # TODO: stub
    return elem

def to_json(data):
    monsters = []
    for i, mon in enumerate(data.monsters):
        monsters.append(dict(
            id            = i,
            usname_pretty = util.monster_name_pretty(mon.usname),
            usname_base64 = util.base64_str(mon.usname),
            upname_pretty = util.monster_name_pretty(mon.upname),
            upname_base64 = util.base64_str(mon.upname),
            isname_pretty = util.monster_name_pretty(mon.isname),
            isname_base64 = util.base64_str(mon.isname),
            ipname_pretty = util.monster_name_pretty(mon.ipname),
            ipname_base64 = util.base64_str(mon.ipname),
            genre         = mon.genre.value,
            num_dice      = [mon.num_dice.num, mon.num_dice.side, mon.num_dice.add],
            hit_dice      = [mon.hit_dice.num, mon.hit_dice.side, mon.hit_dice.add],
            ac            = mon.ac,
            at            = mon.at,
            dmg_dices     = [[d.num, d.side, d.add] for d in mon.dmg_dices[:mon.at]],
            drain         = mon.drain,
            healing       = mon.healing,
            drop_wander   = mon.drop_wander,
            drop_room     = mon.drop_room,
            next_monster  = mon.next_monster,
            next_prob     = mon.next_prob,
            mage_lv       = mon.mage_lv,
            cleric_lv     = mon.cleric_lv,
            breath        = mon.breath_raw,
            mr            = mon.mr,
            resist        = mon.resist_raw,
            call          = mon.call,
            run           = mon.run,
            sleepy        = mon.sleepy,
            critical      = mon.critical,
            paralyze      = mon.paralyze,
            poison        = mon.poison,
            petrify       = mon.petrify,
            exp           = mon.exp,
        ))
    return json.dumps(monsters, indent=2)

def to_table(data, fmt):
    COLS = (
        ( "ID"              , lambda i,mon: i ),
        ( "Identified sg."  , lambda i,mon: util.monster_name_pretty(mon.isname) ),
        ( "Identified pl."  , lambda i,mon: util.monster_name_pretty(mon.ipname) ),
        ( "Unidentified sg.", lambda i,mon: util.monster_name_pretty(mon.usname) ),
        ( "Unidentified pl.", lambda i,mon: util.monster_name_pretty(mon.upname) ),
        ( "Genre"           , lambda i,mon: genre_pretty(mon.genre) ),
        ( "Num"             , lambda i,mon: util.dice_pretty(mon.num_dice) ),
        ( "HD"              , lambda i,mon: util.dice_pretty(mon.hit_dice) ),
        ( "AC"              , lambda i,mon: mon.ac ),
        ( "AT"              , lambda i,mon: mon.at ),
        ( "Damage"          , lambda i,mon: dmg_pretty(mon) ),
        ( "Drain"           , lambda i,mon: mon.drain ),
        ( "Healing"         , lambda i,mon: mon.healing ),
        ( "Drop (wander)"   , lambda i,mon: mon.drop_wander ),
        ( "Drop (room)"     , lambda i,mon: mon.drop_room ),
        ( "Next monster"    , lambda i,mon: next_pretty(mon) ),
        ( "M-LV"            , lambda i,mon: mon.mage_lv ),
        ( "C-LV"            , lambda i,mon: mon.cleric_lv ),
        ( "Breath"          , lambda i,mon: element_pretty(mon.breath) ),
        ( "MR"              , lambda i,mon: mon.mr ),
        ( "Resist"          , lambda i,mon: element_pretty(mon.resist) ),
        ( "Call"            , lambda i,mon: bool_pretty(mon.call) ),
        ( "Run"             , lambda i,mon: bool_pretty(mon.run) ),
        ( "Sleepy"          , lambda i,mon: bool_pretty(mon.sleepy) ),
        ( "Critical"        , lambda i,mon: bool_pretty(mon.critical) ),
        ( "Paralyze"        , lambda i,mon: bool_pretty(mon.paralyze) ),
        ( "Petrify"         , lambda i,mon: bool_pretty(mon.petrify) ),
        ( "EXP"             , lambda i,mon: mon.exp ),
    )
    HEADERS = [col[0] for col in COLS]

    matrix = []
    for i, mon in enumerate(data.monsters):
        matrix.append([col[1](i,mon) for col in COLS])
    return tabulate(matrix, headers=HEADERS, tablefmt=fmt)

def main():
    data = util.monster_data()

    js = to_json(data)
    with open(OUT_JSON, "w") as out:
        print(js, file=out)
    print(OUT_JSON)

    table = to_table(data, "rst")
    with open(OUT_TABLE, "w") as out:
        print(table, file=out)
    print(OUT_TABLE)

if __name__ == "__main__": main()

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import os.path
import sys

from tabulate import tabulate

import util

OUT_DIR   = "out"
OUT_JSON  = os.path.join(OUT_DIR, "item.json")
OUT_TABLE = os.path.join(OUT_DIR, "item.txt")

def warn(s):
    print(s, file=sys.stderr)

def error(s):
    warn(s)
    sys.exit(1)

def bool_pretty(x):
    return "o" if x else ""

def genre_pretty(genre):
    return genre.name

def magic_pretty(magic):
    # TODO: stub
    return magic

def sp_pretty(sp):
    # TODO: stub
    return sp

def break_pretty(item):
    if item.break_prob == 0: return ""

    percent = 100 if item.break_prob == 0xFF else int(100*item.break_prob/256)

    data = util.item_data()
    name_str = util.item_name_pretty(data.items[item.break_item].iname)
    prob_str = f"{item.break_prob}/256 = {percent}%"
    return f"{name_str} ({prob_str})"

def stock_pretty(stock):
    return "inf" if stock == 0xFF else str(stock)

def equip_pretty(equip):
    STR = "FMCTWSLN"
    return "".join(c if e else "_" for c,e in zip(STR,equip))

def element_pretty(elem):
    # TODO: stub
    return elem

def montype_pretty(montype):
    # TODO: stub
    return montype

def to_json(data):
    items = []
    for i, item in enumerate(data.items):
        items.append(dict(
            id           = i,
            uname_pretty = util.item_name_pretty(item.uname),
            uname_base64 = util.base64_str(item.uname),
            iname_pretty = util.item_name_pretty(item.iname),
            iname_base64 = util.base64_str(item.iname),
            genre        = item.genre.value,
            curse        = item.curse,
            sp           = item.sp,
            break_prob   = item.break_prob,
            break_item   = item.break_item,
            price        = item.price,
            stock        = item.stock,
            magic        = item.magic,
            equip        = item.equip_raw,
            healing      = item.healing,
            ac           = item.ac,
            st           = item.st,
            at           = item.at,
            dice         = [item.dice.num, item.dice.side, item.dice.add],
            critical     = item.critical,
            defence      = item.defence_raw,
            resist       = item.resist_raw,
            slay         = item.slay_raw,
        ))
    return json.dumps(items, indent=2)

def to_table(data, fmt):
    COLS = (
        ( "ID"          , lambda i,item: i ),
        ( "Identified"  , lambda i,item: util.item_name_pretty(item.iname) ),
        ( "Unidentified", lambda i,item: util.item_name_pretty(item.uname) ),
        ( "Genre"       , lambda i,item: genre_pretty(item.genre) ),
        ( "Curse"       , lambda i,item: bool_pretty(item.curse) ),
        ( "Magic"       , lambda i,item: magic_pretty(item.magic) ),
        ( "SP"          , lambda i,item: sp_pretty(item.sp) ),
        ( "Break"       , lambda i,item: break_pretty(item) ),
        ( "Price"       , lambda i,item: item.price ),
        ( "Stock"       , lambda i,item: stock_pretty(item.stock) ),
        ( "Equip"       , lambda i,item: equip_pretty(item.equip) ),
        ( "Healing"     , lambda i,item: item.healing ),
        ( "AC"          , lambda i,item: item.ac ),
        ( "ST"          , lambda i,item: item.st ),
        ( "AT"          , lambda i,item: item.at ),
        ( "Dice"        , lambda i,item: util.dice_pretty(item.dice) ),
        ( "Critical"    , lambda i,item: bool_pretty(item.critical) ),
        ( "Resist"      , lambda i,item: element_pretty(item.resist) ),
        ( "Defence"     , lambda i,item: montype_pretty(item.defence) ),
        ( "Slay"        , lambda i,item: montype_pretty(item.slay) ),
    )
    HEADERS = [col[0] for col in COLS]

    matrix = []
    for i, item in enumerate(data.items):
        matrix.append([col[1](i,item) for col in COLS])
    return tabulate(matrix, headers=HEADERS, tablefmt=fmt)

def main():
    data = util.item_data()

    js = to_json(data)
    with open(OUT_JSON, "w") as out:
        print(js, file=out)
    print(OUT_JSON)

    table = to_table(data, "rst")
    with open(OUT_TABLE, "w") as out:
        print(table, file=out)
    print(OUT_TABLE)

if __name__ == "__main__": main()

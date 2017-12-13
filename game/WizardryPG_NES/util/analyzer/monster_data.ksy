meta:
  title: 'NES Wizardry PG - monster data'
  id: monster_data

seq:
  - id: monsters
    type: monster
    repeat: eos

types:
  monster:
    seq:
      - id: usname_raw
        type: vname
        size: 1 + 15
      - id: upname_raw
        type: vname
        size: 1 + 15
      - id: isname_raw
        type: vname
        size: 1 + 15
      - id: ipname_raw
        type: vname
        size: 1 + 15
      - id: genre
        type: u1
        enum: genre
      - id: reserved_0
        size: 1
      - id: num_dice
        type: dice
      - id: hit_dice
        type: dice
      - id: ac
        type: s1
      - id: at
        type: u1
      - id: dmg_dices
        type: dice
        repeat: expr
        repeat-expr: 6
      - id: drain
        type: u1
      - id: healing
        type: u1
      - id: drop_wander
        type: u1
      - id: drop_room
        type: u1
      - id: next_monster
        type: u1
      - id: next_prob
        type: u1
      - id: mage_lv
        type: u1
      - id: cleric_lv
        type: u1
      - id: unknown
        type: u1
      - id: breath_raw
        type: u1
      - id: mr
        type: u1
        doc: magic resistance
      - id: resist_raw
        type: u1
      - id: reserved_1
        type: b1
      - id: call
        type: b1
      - id: run
        type: b1
      - id: sleepy
        type: b1
      - id: critical
        type: b1
      - id: paralyze
        type: b1
      - id: poison
        type: b1
      - id: petrify
        type: b1
      - id: reserved_2
        size: 3
      - id: exp_raw
        type: u1
        repeat: expr
        repeat-expr: 3
      - id: reserved_3
        size: 1
      - id: reserved_4
        size: 16
    instances:
      usname:
        io: usname_raw._io
        pos: 1
        size: usname_raw.len
      upname:
        io: upname_raw._io
        pos: 1
        size: upname_raw.len
      isname:
        io: isname_raw._io
        pos: 1
        size: isname_raw.len
      ipname:
        io: ipname_raw._io
        pos: 1
        size: ipname_raw.len
      breath:
        value: >
          [
            (breath_raw & (1<<0)) != 0,
            (breath_raw & (1<<1)) != 0,
            (breath_raw & (1<<2)) != 0,
            (breath_raw & (1<<3)) != 0,
            (breath_raw & (1<<4)) != 0,
            (breath_raw & (1<<5)) != 0,
            (breath_raw & (1<<6)) != 0,
            (breath_raw & (1<<7)) != 0,
          ]
      resist:
        value: >
          [
            (resist_raw & (1<<0)) != 0,
            (resist_raw & (1<<1)) != 0,
            (resist_raw & (1<<2)) != 0,
            (resist_raw & (1<<3)) != 0,
            (resist_raw & (1<<4)) != 0,
            (resist_raw & (1<<5)) != 0,
            (resist_raw & (1<<6)) != 0,
            (resist_raw & (1<<7)) != 0,
          ]
      exp:
        value: >
          (exp_raw[0] >> 4  ) * 100000 +
          (exp_raw[0] & 0x0F) *  10000 +
          (exp_raw[1] >> 4  ) *   1000 +
          (exp_raw[1] & 0x0F) *    100 +
          (exp_raw[2] >> 4  ) *     10 +
          (exp_raw[2] & 0x0F) *      1
  vname:
    seq:
      - id: len
        type: u1
      - id: name
        size: 15
  dice:
    seq:
      - id: num
        type: u1
      - id: side
        type: u1
      - id: add
        type: u1

enums:
  genre:
    0: fighter
    1: mage
    2: cleric
    3: thief
    4: midget
    5: giant
    6: mythical
    7: dragon
    8: animal
    9: lycanthrope
    10: undead
    11: demon
    12: insect
    13: enchanted

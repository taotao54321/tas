meta:
  title: 'NES Wizardry PG - item data'
  id: item_data

seq:
  - id: items
    type: item
    repeat: eos

types:
  item:
    seq:
      - id: uname_raw
        type: vname
        size: 1 + 16
      - id: iname_raw
        type: vname
        size: 1 + 16
      - id: genre
        type: u1
        enum: genre
      - id: align_raw
        type: u1
      - id: curse_raw
        type: u1
      - id: sp
        type: u1
      - id: break_prob
        type: u1
      - id: break_item
        type: u1
      - id: price_raw
        type: u1
        repeat: expr
        repeat-expr: 6
      - id: stock
        type: u1
      - id: magic
        type: u1
      - id: equip_raw
        type: u1
      - id: healing
        type: s1
      - id: ac
        type: s1
      - id: st
        type: s1
      - id: at
        type: u1
      - id: dice
        type: dice
      - id: critical_raw
        type: u1
      - id: defence_raw
        type: u2be
      - id: resist_raw
        type: u1
      - id: slay_raw
        type: u2be
      - id: reserved
        size: 2
    instances:
      uname:
        io: uname_raw._io
        pos: 1
        size: uname_raw.len
      iname:
        io: iname_raw._io
        pos: 1
        size: iname_raw.len
      curse:
        value: curse_raw != 0
      price:
        value: >
          (price_raw[0] >> 4  ) * 100000000000 +
          (price_raw[0] & 0x0F) *  10000000000 +
          (price_raw[1] >> 4  ) *   1000000000 +
          (price_raw[1] & 0x0F) *    100000000 +
          (price_raw[2] >> 4  ) *     10000000 +
          (price_raw[2] & 0x0F) *      1000000 +
          (price_raw[3] >> 4  ) *       100000 +
          (price_raw[3] & 0x0F) *        10000 +
          (price_raw[4] >> 4  ) *         1000 +
          (price_raw[4] & 0x0F) *          100 +
          (price_raw[5] >> 4  ) *           10 +
          (price_raw[5] & 0x0F) *            1
      align:
        value: >
          [
            (align_raw & (1<<0)) != 0,
            (align_raw & (1<<1)) != 0,
            (align_raw & (1<<2)) != 0,
          ]
      equip:
        value: >
          [
            (equip_raw & (1<<0)) != 0,
            (equip_raw & (1<<1)) != 0,
            (equip_raw & (1<<2)) != 0,
            (equip_raw & (1<<3)) != 0,
            (equip_raw & (1<<4)) != 0,
            (equip_raw & (1<<5)) != 0,
            (equip_raw & (1<<6)) != 0,
            (equip_raw & (1<<7)) != 0,
          ]
      critical:
        value: critical_raw != 0
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
      defence:
        value: >
          [
            (defence_raw & (1<< 0)) != 0,
            (defence_raw & (1<< 1)) != 0,
            (defence_raw & (1<< 2)) != 0,
            (defence_raw & (1<< 3)) != 0,
            (defence_raw & (1<< 4)) != 0,
            (defence_raw & (1<< 5)) != 0,
            (defence_raw & (1<< 6)) != 0,
            (defence_raw & (1<< 7)) != 0,
            (defence_raw & (1<< 8)) != 0,
            (defence_raw & (1<< 9)) != 0,
            (defence_raw & (1<<10)) != 0,
            (defence_raw & (1<<11)) != 0,
            (defence_raw & (1<<12)) != 0,
            (defence_raw & (1<<13)) != 0,
            (defence_raw & (1<<14)) != 0,
            (defence_raw & (1<<15)) != 0,
          ]
      slay:
        value: >
          [
            (slay_raw & (1<< 0)) != 0,
            (slay_raw & (1<< 1)) != 0,
            (slay_raw & (1<< 2)) != 0,
            (slay_raw & (1<< 3)) != 0,
            (slay_raw & (1<< 4)) != 0,
            (slay_raw & (1<< 5)) != 0,
            (slay_raw & (1<< 6)) != 0,
            (slay_raw & (1<< 7)) != 0,
            (slay_raw & (1<< 8)) != 0,
            (slay_raw & (1<< 9)) != 0,
            (slay_raw & (1<<10)) != 0,
            (slay_raw & (1<<11)) != 0,
            (slay_raw & (1<<12)) != 0,
            (slay_raw & (1<<13)) != 0,
            (slay_raw & (1<<14)) != 0,
            (slay_raw & (1<<15)) != 0,
          ]
  vname:
    seq:
      - id: len
        type: u1
      - id: name
        size: 16
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
    0: weapon
    1: armor
    2: shield
    3: helm
    4: gloves
    5: item
    6: accessory
  # unused
  alignment:
    0: good
    1: neutral
    2: evil
  class:
    0: fighter
    1: mage
    2: cleric
    3: thief
    4: wizard
    5: samurai
    6: lord
    7: ninja

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""全パスワードの正当性および対応する面を表示
"""

import itertools


PASSWD_CHAR = "あいことばをまちがえたらだめなの"

STAGE_MAP = (
     0,  0,  0,  3,  3,  3,  6,  6,  6,  9,  9,  9,  9, 13,
    14, 14, 14, 17, 17, 17, 17, 21, 21, 21, 21, 25, 25, 25, 25, 25, 30,
    31, 31, 31, 34, 34, 34, 37, 37, 37, 37, 41, 41, 41, 44,
    45, 45, 45, 48, 48, 48, 51, 51, 51, 54, 54, 54, 57
)


def judge(passwd):
    if not passwd[3]: return None
    if ((passwd[2]-passwd[3])&0xF) != ((passwd[0]+passwd[1])&0xF): return None

    idx = (((passwd[0]-passwd[3])&0xF)<<4) | ((passwd[1]-passwd[3])&0xF)
    if idx >= 58: return None
    return idx


def show(passwd, idx):
    str_passwd = "".join(PASSWD_CHAR[i] for i in passwd)
    if idx is None:
        print("{}\t0\t-1\t-1".format(str_passwd))
    else:
        print("{}\t1\t{}\t{}".format(str_passwd, idx, STAGE_MAP[idx]))


def main():
    print("#passwd\tvalid\tidx\tstage")
    for passwd in itertools.product(range(16), repeat=4):
        idx = judge(passwd)
        show(passwd, idx)

if __name__ == "__main__": main()

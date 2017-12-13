.PHONY: all clean

ks/%.py: %.ksy
	ksc --target python --outdir ks $<

ROM:=wizpg.nes

OUT_DIR:=out

TARGET_ITEM:=$(OUT_DIR)/item.json $(OUT_DIR)/item.txt
TARGET_MONSTER:=$(OUT_DIR)/monster.json $(OUT_DIR)/monster.txt
TARGET:=$(TARGET_ITEM) $(TARGET_MONSTER)

SPLITS:=\
    $(OUT_DIR)/item.bin \
    $(OUT_DIR)/monster.bin

KAITAI_SRCS:=$(wildcard *.ksy)
KAITAI_PYS:=$(KAITAI_SRCS:%.ksy=ks/%.py)

all: $(TARGET)

$(TARGET_ITEM): $(SPLITS)
	./item.py

$(TARGET_MONSTER): $(SPLITS)
	./monster.py

$(SPLITS): $(ROM) $(KAITAI_PYS)
	./split.py $(ROM)

clean:
	-$(RM) $(TARGET) $(SPLITS) $(KAITAI_PYS)

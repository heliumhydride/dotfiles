include config.mk

ifeq ($(WIN32),1)
	O += .exe
endif

SRC_DIR := ./src

SRCS := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c' -or -name '*.s')
OBJS := $(SRCS:%.c=%.o)

all: $(O)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(O): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean:
	rm -f $(O) $(OBJS)

.PHONY: clean

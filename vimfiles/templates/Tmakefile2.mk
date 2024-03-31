include config.mk

ifeq ($(WIN32),1)
	O += .exe
endif

OBJS = file1.o file2.o

all: $(O)

file1.o: file1.c
	$(CC) $(CFLAGS) -c -o $@ $<

file2.o: file2.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(O): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean:
	rm -f $(O) $(OBJS)

.PHONY: clean

include config.mk

ifeq ($(WIN32),1)
	O += .exe
endif

all: $(O)

$(O):main.c
	@echo "  (CC)    $< --> $@"
	@$(CC) $(CFLAGS) -o $@ $<

clean:
	@echo "  (CLEAN)  $(O)"
	@rm -f $(O)

.PHONY: clean

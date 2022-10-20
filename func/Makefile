ALL_SRC = $(shell find . -name '*.S')
PREFIX = riscv64-unknown-linux-gnu-

test.s: test.elf
	$(PREFIX)objdump -d $< > $@

test.elf: $(ALL_SRC)
	$(PREFIX)gcc -nostdlib all.S -I. -T runtime.ld -o $@
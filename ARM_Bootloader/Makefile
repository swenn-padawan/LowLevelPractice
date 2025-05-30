#@Makefile######################################################################

#@Variables#####################################################################

QEMU	:=	qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -kernel boot.elf

AS		:=	aarch64-unknown-linux-gnu-as

LD		:=	aarch64-unknown-linux-gnu-ld

#@Rules#########################################################################

qemu:
	$(QEMU)
run:
	$(AS) boot.S -o boot.o
	$(LD) -T linker.ld boot.o -o boot.elf

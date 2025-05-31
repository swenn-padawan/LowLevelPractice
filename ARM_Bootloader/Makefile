CROSS	=	aarch64-unknown-linux-gnu
AS		=	$(CROSS)-as
LD		=	$(CROSS)-ld
OBJCOPY	=	$(CROSS)-objcopy
OBJDUMP	=	$(CROSS)-objdump

NAME	=	boot
BIN		=	$(NAME).bin
SRC		=	$(NAME).s
OBJ		=	$(NAME).o
ELF		=	$(NAME).elf
LINKER	=	linker.ld

QEMU_FLAGS = -M virt -machine secure=off -m 2G -cpu cortex-a53 -nographic -serial stdio -monitor none -bios

all: $(BIN)

$(OBJ): $(SRC)
	$(AS) -g $(SRC) -o $(OBJ)

$(ELF): $(OBJ) $(LINKER)
	$(LD) -T $(LINKER) $(OBJ) -o $(ELF)

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $(ELF) $(BIN)

clean:
	rm -f $(OBJ) $(ELF) $(BIN)

run: $(BIN)
	qemu-system-aarch64 $(QEMU_FLAGS) $(BIN)

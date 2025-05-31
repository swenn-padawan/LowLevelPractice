.section .text
.global _start

//.equ to create a const value

.equ UART_BASE,	0x09000000		// Base address of UART
.equ UART_FR,	0x18			// Stand for Flag Register
.equ UART_DR,	0x00			// Stand for Data Register(were we write char)
.equ FR_TXFF,	0x20			// Say if the send Buffer is Full

_start:							// Entry Point
	ldr		x0, =msg			// Load the msg address in the x0 register
.loop:
	ldrb	w1, [x0], #1		// Read an octet from msg, store in w1 and x0 += 1
	cbz		w1, .end			// Compare and branch if zero (if the char is NULL it end)

.wait:
	ldr		x2, =UART_BASE		// Put the UART_BASE address in x2
	ldr		w3, [x2, #UART_FR]	// Read the FR Register in w3 ?
	tst		w3, #FR_TXFF		// Test if FIFO bit is full
	b.ne	.wait				// If full, we wait
	str		w1, [x2, #UART_DR]	// Write the char in UART
	b		.loop
.end:
	wfe							// Wait for Event (Freeze the cpu in QEMU, to optimize)
msg:
	.ascii "Hello UART!\n\0"	// .ascii is non NULL terminate


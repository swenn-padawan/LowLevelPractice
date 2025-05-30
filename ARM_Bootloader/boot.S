.section .text
.global _start
_start:
	mov r0, #1 // STDOUT
	adr r1, mystring // R1 = address of string
	mov r2, #6 // R2 = size of string
	mov r7, #4 // R7 = syscall number for 'write()'
	svc #0 // invoke syscall
_exit:
	mov r7, #0
	svc #0
mystring:
	.string "Hello\n"

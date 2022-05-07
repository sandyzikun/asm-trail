section .data
	txt0	db	0xa, 0
	txt1	db	"Sharing", 0x20, 0
	txt	db	"Holax, Sekai!", 0xa, 0
	txt2	db	"We're Sharing an Endless Love", 0xa, 0
	dig	db	0

section .bss
	inst	resb	16

section .text
	global	_start

%macro	exit	1		; Declaring the Name and the Num of Parameters of the Macro
	mov	rax,	60	; Declaring the Function we're to call is `sys_exit`
	mov	rdi,	%1	; `%[k]` means the k-th Parameter
	syscall			; Calling the Function `sys_exit`
%endmacro

_start:
	call	_printext
	mov	rax,	3
	call	_printdgrax
	mov	rax,	9
	call	_printdgrax
	mov	rax,	txt0
	call	_printstrax
	mov	rax,	txt1
	call	_printstrax
	call	_readstr
	mov	rax,	txt2
	call	_printstrax
	exit	0		; Process of exiting the Program

_printext:			; A Sub-routine calling the Function `sys_write` to print the Bytes to which `rax` pointed
	mov	rax,	1	; Declaring the Function we're to call is `sys_read`
	mov	rdi,	1
	mov	rsi,	txt
	mov	rdx,	14
	syscall
	ret

_readstr:			; A Sub-routine calling the Function `sys_read`(?) to read the String which the User inputs then stored it in `inst`
	mov	rax,	0	; Declaring the Function we're to call is `sys_read`
	mov	rdi,	0
	mov	rsi,	inst
	mov	rdx,	16
	syscall
	ret

_printdgrax:
	add	rax, 	48	; Add 48 to the Value of `rax`, which refers to the ascii of any digit
	mov	[dig],	al	; Temporarily storing the Byte of the Digit in `[dig]` from `al`
	mov	rax,	1
	mov	rdi,	1
	mov	rsi,	dig
	mov	rdx,	1
	syscall
	ret

;input: rax as a pointer to the specified string
;output: print string as rax
_printstrax:
	push	rax		; Pushing the Value of `rax` into the Stack
	mov	rbx,	0	; Setting the Value of `rbx` to zero, for counting Length of the Bytes later
_prloop:
	inc	rax		; ++`rax`, which makes it point to the Byte next to the one pointed to previously
	inc	rbx		; ++`rbx`, which means the Length it recorded is added by one
	mov	ch,	[rax]	; Temporarily storing the Byte in `cl` (or using `ch` is also proper), which `rax` pointed to, for being compared to zero later
	cmp	ch,	0	; Compare the Byte to zero,
	jne	_prloop		; * if the result is not equal, go back to `_prloop` (`jne` == "Jump when Not Equal")
				; * otherwise, execute the program below:
	mov	rax,	1	; Declaring the Function we're to call is `sys_write`, like every time we called it previously
	mov	rdi,	1	;
	pop	rsi		; The top of the Stack should be pushed from `rax` previously, which means it refers to the Starter of the String
				; Now we pop it to `rsi`
	mov	rdx,	rbx	; (Actually we can also operate on `rdx` directly only in this case, nevertheless operating on `rbx` before copying to `rdx` is more of safety
	syscall
	ret

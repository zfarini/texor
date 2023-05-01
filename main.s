	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_stbi_failure_reason    ## -- Begin function stbi_failure_reason
	.p2align	4, 0x90
_stbi_failure_reason:                   ## @stbi_failure_reason
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_image_free        ## -- Begin function stbi_image_free
	.p2align	4, 0x90
_stbi_image_free:                       ## @stbi_image_free
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_set_flip_vertically_on_load ## -- Begin function stbi_set_flip_vertically_on_load
	.p2align	4, 0x90
_stbi_set_flip_vertically_on_load:      ## @stbi_set_flip_vertically_on_load
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, _stbi__vertically_flip_on_load_global(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_set_flip_vertically_on_load_thread ## -- Begin function stbi_set_flip_vertically_on_load_thread
	.p2align	4, 0x90
_stbi_set_flip_vertically_on_load_thread: ## @stbi_set_flip_vertically_on_load_thread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %ecx
	movq	_stbi__vertically_flip_on_load_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	movl	%ecx, (%rax)
	movq	_stbi__vertically_flip_on_load_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	movb	$1, (%rax)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load              ## -- Begin function stbi_load
	.p2align	4, 0x90
_stbi_load:                             ## @stbi_load
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB4_1
## %bb.3:
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi_load_from_file
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_fclose
	movq	%r14, %rax
	jmp	LBB4_2
LBB4_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%eax, %eax
LBB4_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_from_file    ## -- Begin function stbi_load_from_file
	.p2align	4, 0x90
_stbi_load_from_file:                   ## @stbi_load_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, -276(%rbp)        ## 4-byte Spill
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	_stbi__stdio_callbacks+16(%rip), %rax
	movq	%rax, -240(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rax
	movq	%rax, -248(%rbp)
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -256(%rbp)
	movq	%rdi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB5_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB5_3
LBB5_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB5_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	-276(%rbp), %r8d        ## 4-byte Reload
	callq	_stbi__load_and_postprocess_8bit
	movq	%rax, %rbx
	testq	%rax, %rax
	je	LBB5_5
## %bb.4:
	movl	-72(%rbp), %esi
	subl	-80(%rbp), %esi
	shlq	$32, %rsi
	negq	%rsi
	sarq	$32, %rsi
	movq	%r14, %rdi
	movl	$1, %edx
	callq	_fseek
LBB5_5:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB5_7
## %bb.6:
	movq	%rbx, %rax
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_7:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__load_and_postprocess_8bit
_stbi__load_and_postprocess_8bit:       ## @stbi__load_and_postprocess_8bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2120, %rsp             ## imm = 0x848
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	-2152(%rbp), %r9
	callq	_stbi__load_main
	testq	%rax, %rax
	je	LBB6_1
## %bb.2:
	movq	%rax, %r13
	movl	-2152(%rbp), %eax
	cmpl	$8, %eax
	je	LBB6_3
## %bb.4:
	movq	%rbx, -2104(%rbp)       ## 8-byte Spill
	cmpl	$16, %eax
	jne	LBB6_43
## %bb.5:
	movl	(%r15), %eax
	movl	(%r12), %ebx
	movl	%r14d, %ecx
	testl	%r14d, %r14d
	jne	LBB6_7
## %bb.6:
	movq	-2104(%rbp), %rcx       ## 8-byte Reload
	movl	(%rcx), %ecx
LBB6_7:
	imull	%eax, %ebx
	imull	%ecx, %ebx
	movslq	%ebx, %rdi
	callq	_malloc
	movq	%rax, %r8
	testq	%rax, %rax
	je	LBB6_27
## %bb.8:
	testl	%ebx, %ebx
	jle	LBB6_26
## %bb.9:
	movl	%ebx, %eax
	cmpl	$15, %ebx
	jbe	LBB6_10
## %bb.17:
	leaq	(%r13,%rax,2), %rcx
	cmpq	%rcx, %r8
	jae	LBB6_19
## %bb.18:
	leaq	(%r8,%rax), %rcx
	cmpq	%rcx, %r13
	jae	LBB6_19
LBB6_10:
	xorl	%ecx, %ecx
LBB6_11:
	movq	%rcx, %rdx
	notq	%rdx
	addq	%rax, %rdx
	movq	%rax, %rsi
	andq	$3, %rsi
	je	LBB6_14
## %bb.12:
	negq	%rsi
	.p2align	4, 0x90
LBB6_13:                                ## =>This Inner Loop Header: Depth=1
	movzbl	1(%r13,%rcx,2), %ebx
	movb	%bl, (%r8,%rcx)
	incq	%rcx
	incq	%rsi
	jne	LBB6_13
LBB6_14:
	cmpq	$3, %rdx
	jb	LBB6_26
## %bb.15:
	subq	%rcx, %rax
	leaq	3(%r8,%rcx), %rdx
	leaq	6(%r13,%rcx,2), %rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB6_16:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-5(%rcx,%rsi,2), %ebx
	movb	%bl, -3(%rdx,%rsi)
	movzbl	-3(%rcx,%rsi,2), %ebx
	movb	%bl, -2(%rdx,%rsi)
	movzbl	-1(%rcx,%rsi,2), %ebx
	movb	%bl, -1(%rdx,%rsi)
	movzbl	1(%rcx,%rsi,2), %ebx
	movb	%bl, (%rdx,%rsi)
	addq	$4, %rsi
	cmpq	%rsi, %rax
	jne	LBB6_16
	jmp	LBB6_26
LBB6_1:
	xorl	%r8d, %r8d
	jmp	LBB6_41
LBB6_3:
	movq	%r13, %r8
	jmp	LBB6_29
LBB6_27:
	leaq	L_.str.67(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	jmp	LBB6_28
LBB6_19:
	movl	%eax, %ecx
	andl	$-16, %ecx
	leaq	-16(%rcx), %rdi
	movq	%rdi, %rdx
	shrq	$4, %rdx
	incq	%rdx
	movl	%edx, %esi
	andl	$1, %esi
	testq	%rdi, %rdi
	je	LBB6_20
## %bb.21:
	movl	$1, %edi
	subq	%rdx, %rdi
	leaq	-1(%rsi,%rdi), %rdi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB6_22:                                ## =>This Inner Loop Header: Depth=1
	movdqu	(%r13,%rdx,2), %xmm0
	movdqu	16(%r13,%rdx,2), %xmm1
	psrlw	$8, %xmm0
	packuswb	%xmm0, %xmm0
	psrlw	$8, %xmm1
	packuswb	%xmm0, %xmm1
	movq	%xmm0, (%r8,%rdx)
	movq	%xmm1, 8(%r8,%rdx)
	movdqu	32(%r13,%rdx,2), %xmm0
	movdqu	48(%r13,%rdx,2), %xmm1
	psrlw	$8, %xmm0
	packuswb	%xmm0, %xmm0
	psrlw	$8, %xmm1
	packuswb	%xmm0, %xmm1
	movq	%xmm0, 16(%r8,%rdx)
	movq	%xmm1, 24(%r8,%rdx)
	addq	$32, %rdx
	addq	$2, %rdi
	jne	LBB6_22
	jmp	LBB6_23
LBB6_20:
	xorl	%edx, %edx
LBB6_23:
	testq	%rsi, %rsi
	je	LBB6_25
## %bb.24:
	movdqu	(%r13,%rdx,2), %xmm0
	movdqu	16(%r13,%rdx,2), %xmm1
	psrlw	$8, %xmm0
	psrlw	$8, %xmm1
	packuswb	%xmm0, %xmm0
	movq	%xmm0, (%r8,%rdx)
	packuswb	%xmm0, %xmm1
	movq	%xmm1, 8(%r8,%rdx)
LBB6_25:
	cmpq	%rax, %rcx
	jne	LBB6_11
LBB6_26:
	movq	%r13, %rdi
	movq	%r8, %rbx
	callq	_free
	movq	%rbx, %r8
LBB6_28:
	movl	$8, -2152(%rbp)
	movq	-2104(%rbp), %rbx       ## 8-byte Reload
LBB6_29:
	movq	_stbi__vertically_flip_on_load_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpb	$1, (%rax)
	jne	LBB6_31
## %bb.30:
	movq	_stbi__vertically_flip_on_load_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpl	$0, (%rax)
	jne	LBB6_32
	jmp	LBB6_41
LBB6_31:
	cmpl	$0, _stbi__vertically_flip_on_load_global(%rip)
	je	LBB6_41
LBB6_32:
	movq	%r8, -2120(%rbp)        ## 8-byte Spill
	testl	%r14d, %r14d
	jne	LBB6_34
## %bb.33:
	movl	(%rbx), %r14d
LBB6_34:
	movl	(%r12), %eax
	movq	%rax, -2112(%rbp)       ## 8-byte Spill
	cmpl	$2, %eax
	jl	LBB6_40
## %bb.35:
	movslq	(%r15), %rax
	movslq	%r14d, %rcx
	imulq	%rax, %rcx
	movq	%rcx, -2128(%rbp)       ## 8-byte Spill
	movq	-2112(%rbp), %rax       ## 8-byte Reload
	shrq	%rax
	movq	%rax, -2136(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -2104(%rbp)       ## 8-byte Spill
	leaq	-2096(%rbp), %r14
	.p2align	4, 0x90
LBB6_36:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_38 Depth 2
	cmpq	$0, -2128(%rbp)         ## 8-byte Folded Reload
	je	LBB6_39
## %bb.37:                              ##   in Loop: Header=BB6_36 Depth=1
	movq	-2104(%rbp), %r12       ## 8-byte Reload
	movl	%r12d, %eax
	notl	%eax
	addl	-2112(%rbp), %eax       ## 4-byte Folded Reload
	movslq	%eax, %r15
	movq	-2128(%rbp), %r13       ## 8-byte Reload
	imulq	%r13, %r15
	movq	-2120(%rbp), %rax       ## 8-byte Reload
	addq	%rax, %r15
	imulq	%r13, %r12
	addq	%rax, %r12
	.p2align	4, 0x90
LBB6_38:                                ##   Parent Loop BB6_36 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	$2048, %r13             ## imm = 0x800
	movl	$2048, %ebx             ## imm = 0x800
	cmovbq	%r13, %rbx
	movl	$2048, %ecx             ## imm = 0x800
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	___memcpy_chk
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	addq	%rbx, %r12
	addq	%rbx, %r15
	subq	%rbx, %r13
	jne	LBB6_38
LBB6_39:                                ##   in Loop: Header=BB6_36 Depth=1
	movq	-2104(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, %rax
	movq	%rcx, -2104(%rbp)       ## 8-byte Spill
	cmpq	-2136(%rbp), %rcx       ## 8-byte Folded Reload
	jb	LBB6_36
LBB6_40:
	movq	-2120(%rbp), %r8        ## 8-byte Reload
LBB6_41:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB6_44
## %bb.42:
	movq	%r8, %rax
	addq	$2120, %rsp             ## imm = 0x848
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_44:
	callq	___stack_chk_fail
LBB6_43:
	leaq	L___func__.stbi__load_and_postprocess_8bit(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.46(%rip), %rcx
	movl	$1249, %edx             ## imm = 0x4E1
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_from_file_16 ## -- Begin function stbi_load_from_file_16
	.p2align	4, 0x90
_stbi_load_from_file_16:                ## @stbi_load_from_file_16
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, -276(%rbp)        ## 4-byte Spill
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	_stbi__stdio_callbacks+16(%rip), %rax
	movq	%rax, -240(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rax
	movq	%rax, -248(%rbp)
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -256(%rbp)
	movq	%rdi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB7_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB7_3
LBB7_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB7_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	-276(%rbp), %r8d        ## 4-byte Reload
	callq	_stbi__load_and_postprocess_16bit
	movq	%rax, %rbx
	testq	%rax, %rax
	je	LBB7_5
## %bb.4:
	movl	-72(%rbp), %esi
	subl	-80(%rbp), %esi
	shlq	$32, %rsi
	negq	%rsi
	sarq	$32, %rsi
	movq	%r14, %rdi
	movl	$1, %edx
	callq	_fseek
LBB7_5:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB7_7
## %bb.6:
	movq	%rbx, %rax
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB7_7:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbi__load_and_postprocess_16bit
LCPI8_0:
	.space	16,1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbi__load_and_postprocess_16bit:      ## @stbi__load_and_postprocess_16bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2120, %rsp             ## imm = 0x848
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	-2152(%rbp), %r9
	callq	_stbi__load_main
	testq	%rax, %rax
	je	LBB8_1
## %bb.2:
	movq	%rax, %r13
	movl	-2152(%rbp), %eax
	cmpl	$8, %eax
	je	LBB8_5
## %bb.3:
	cmpl	$16, %eax
	je	LBB8_29
## %bb.4:
	leaq	L___func__.stbi__load_and_postprocess_16bit(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.46(%rip), %rcx
	movl	$1275, %edx             ## imm = 0x4FB
	callq	___assert_rtn
LBB8_1:
	xorl	%r13d, %r13d
	jmp	LBB8_41
LBB8_5:
	movq	%r12, %rcx
	movq	%r13, -2112(%rbp)       ## 8-byte Spill
	movq	%rbx, -2104(%rbp)       ## 8-byte Spill
	movl	(%rbx), %eax
	movl	(%r12), %ebx
	movl	%r14d, %ecx
	testl	%r14d, %r14d
	jne	LBB8_7
## %bb.6:
	movl	(%r15), %ecx
LBB8_7:
	imull	%eax, %ebx
	imull	%ecx, %ebx
	leal	(%rbx,%rbx), %eax
	movslq	%eax, %rdi
	callq	_malloc
	movq	%rax, %r13
	testq	%rax, %rax
	je	LBB8_27
## %bb.8:
	testl	%ebx, %ebx
	movq	-2112(%rbp), %rdi       ## 8-byte Reload
	jle	LBB8_26
## %bb.9:
	movl	%ebx, %r9d
	cmpl	$15, %ebx
	jbe	LBB8_10
## %bb.17:
	leaq	(%rdi,%r9), %rcx
	cmpq	%rcx, %r13
	jae	LBB8_19
## %bb.18:
	leaq	(%r13,%r9,2), %rcx
	cmpq	%rcx, %rdi
	jae	LBB8_19
LBB8_10:
	xorl	%ecx, %ecx
LBB8_11:
	movq	%rcx, %r8
	notq	%r8
	addq	%r9, %r8
	movq	%r9, %rsi
	andq	$3, %rsi
	je	LBB8_14
## %bb.12:
	negq	%rsi
	.p2align	4, 0x90
LBB8_13:                                ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rcx), %edx
	movl	%edx, %ebx
	shll	$8, %ebx
	orl	%edx, %ebx
	movw	%bx, (%r13,%rcx,2)
	incq	%rcx
	incq	%rsi
	jne	LBB8_13
LBB8_14:
	cmpq	$3, %r8
	jb	LBB8_26
## %bb.15:
	subq	%rcx, %r9
	leaq	6(%r13,%rcx,2), %rdx
	leaq	3(%rdi,%rcx), %rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB8_16:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-3(%rcx,%rsi), %eax
	movl	%eax, %ebx
	shll	$8, %ebx
	orl	%eax, %ebx
	movw	%bx, -6(%rdx,%rsi,2)
	movzbl	-2(%rcx,%rsi), %ebx
	movl	%ebx, %eax
	shll	$8, %eax
	orl	%ebx, %eax
	movw	%ax, -4(%rdx,%rsi,2)
	movzbl	-1(%rcx,%rsi), %ebx
	movl	%ebx, %eax
	shll	$8, %eax
	orl	%ebx, %eax
	movw	%ax, -2(%rdx,%rsi,2)
	movzbl	(%rcx,%rsi), %ebx
	movl	%ebx, %eax
	shll	$8, %eax
	orl	%ebx, %eax
	movw	%ax, (%rdx,%rsi,2)
	addq	$4, %rsi
	cmpq	%rsi, %r9
	jne	LBB8_16
	jmp	LBB8_26
LBB8_27:
	leaq	L_.str.67(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	jmp	LBB8_28
LBB8_19:
	movl	%r9d, %ecx
	andl	$-16, %ecx
	leaq	-16(%rcx), %rbx
	movq	%rbx, %rdx
	shrq	$4, %rdx
	incq	%rdx
	movl	%edx, %esi
	andl	$1, %esi
	testq	%rbx, %rbx
	je	LBB8_20
## %bb.21:
	movl	$1, %eax
	subq	%rdx, %rax
	leaq	-1(%rsi,%rax), %rax
	xorl	%edx, %edx
	movdqa	LCPI8_0(%rip), %xmm0    ## xmm0 = [257,257,257,257,257,257,257,257]
	.p2align	4, 0x90
LBB8_22:                                ## =>This Inner Loop Header: Depth=1
	pmovzxbw	(%rdi,%rdx), %xmm1 ## xmm1 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	8(%rdi,%rdx), %xmm2 ## xmm2 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmullw	%xmm0, %xmm1
	pmullw	%xmm0, %xmm2
	movdqu	%xmm1, (%r13,%rdx,2)
	movdqu	%xmm2, 16(%r13,%rdx,2)
	pmovzxbw	16(%rdi,%rdx), %xmm1 ## xmm1 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	24(%rdi,%rdx), %xmm2 ## xmm2 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmullw	%xmm0, %xmm1
	pmullw	%xmm0, %xmm2
	movdqu	%xmm1, 32(%r13,%rdx,2)
	movdqu	%xmm2, 48(%r13,%rdx,2)
	addq	$32, %rdx
	addq	$2, %rax
	jne	LBB8_22
	jmp	LBB8_23
LBB8_20:
	xorl	%edx, %edx
LBB8_23:
	testq	%rsi, %rsi
	je	LBB8_25
## %bb.24:
	pmovzxbw	(%rdi,%rdx), %xmm0 ## xmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	8(%rdi,%rdx), %xmm1 ## xmm1 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	movdqa	LCPI8_0(%rip), %xmm2    ## xmm2 = [257,257,257,257,257,257,257,257]
	pmullw	%xmm2, %xmm0
	pmullw	%xmm2, %xmm1
	movdqu	%xmm0, (%r13,%rdx,2)
	movdqu	%xmm1, 16(%r13,%rdx,2)
LBB8_25:
	cmpq	%r9, %rcx
	jne	LBB8_11
LBB8_26:
	callq	_free
LBB8_28:
	movl	$16, -2152(%rbp)
	movq	-2104(%rbp), %rbx       ## 8-byte Reload
LBB8_29:
	movq	_stbi__vertically_flip_on_load_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpb	$1, (%rax)
	jne	LBB8_31
## %bb.30:
	movq	_stbi__vertically_flip_on_load_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpl	$0, (%rax)
	jne	LBB8_32
	jmp	LBB8_41
LBB8_31:
	cmpl	$0, _stbi__vertically_flip_on_load_global(%rip)
	je	LBB8_41
LBB8_32:
	movq	%r13, -2112(%rbp)       ## 8-byte Spill
	testl	%r14d, %r14d
	jne	LBB8_34
## %bb.33:
	movl	(%r15), %r14d
LBB8_34:
	movl	(%r12), %eax
	movq	%rax, -2120(%rbp)       ## 8-byte Spill
	cmpl	$2, %eax
	jl	LBB8_40
## %bb.35:
	movslq	(%rbx), %rax
	addl	%r14d, %r14d
	movslq	%r14d, %rcx
	imulq	%rax, %rcx
	movq	%rcx, -2128(%rbp)       ## 8-byte Spill
	movq	-2120(%rbp), %rax       ## 8-byte Reload
	shrq	%rax
	movq	%rax, -2136(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -2104(%rbp)       ## 8-byte Spill
	leaq	-2096(%rbp), %r14
	.p2align	4, 0x90
LBB8_36:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_38 Depth 2
	cmpq	$0, -2128(%rbp)         ## 8-byte Folded Reload
	je	LBB8_39
## %bb.37:                              ##   in Loop: Header=BB8_36 Depth=1
	movq	-2104(%rbp), %r12       ## 8-byte Reload
	movl	%r12d, %eax
	notl	%eax
	addl	-2120(%rbp), %eax       ## 4-byte Folded Reload
	movslq	%eax, %r15
	movq	-2128(%rbp), %r13       ## 8-byte Reload
	imulq	%r13, %r15
	movq	-2112(%rbp), %rax       ## 8-byte Reload
	addq	%rax, %r15
	imulq	%r13, %r12
	addq	%rax, %r12
	.p2align	4, 0x90
LBB8_38:                                ##   Parent Loop BB8_36 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	$2048, %r13             ## imm = 0x800
	movl	$2048, %ebx             ## imm = 0x800
	cmovbq	%r13, %rbx
	movl	$2048, %ecx             ## imm = 0x800
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	___memcpy_chk
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	addq	%rbx, %r12
	addq	%rbx, %r15
	subq	%rbx, %r13
	jne	LBB8_38
LBB8_39:                                ##   in Loop: Header=BB8_36 Depth=1
	movq	-2104(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, %rax
	movq	%rcx, -2104(%rbp)       ## 8-byte Spill
	cmpq	-2136(%rbp), %rcx       ## 8-byte Folded Reload
	jb	LBB8_36
LBB8_40:
	movq	-2112(%rbp), %r13       ## 8-byte Reload
LBB8_41:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB8_43
## %bb.42:
	movq	%r13, %rax
	addq	$2120, %rsp             ## imm = 0x848
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB8_43:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_16           ## -- Begin function stbi_load_16
	.p2align	4, 0x90
_stbi_load_16:                          ## @stbi_load_16
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB9_1
## %bb.3:
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi_load_from_file_16
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_fclose
	movq	%r14, %rax
	jmp	LBB9_2
LBB9_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%eax, %eax
LBB9_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_16_from_memory ## -- Begin function stbi_load_16_from_memory
	.p2align	4, 0x90
_stbi_load_16_from_memory:              ## @stbi_load_16_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$240, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -216(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -48(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdi, -40(%rbp)
	movslq	%esi, %rax
	addq	%rdi, %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -32(%rbp)
	leaq	-232(%rbp), %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	callq	_stbi__load_and_postprocess_16bit
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	jne	LBB10_2
## %bb.1:
	addq	$240, %rsp
	popq	%rbp
	retq
LBB10_2:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_16_from_callbacks ## -- Begin function stbi_load_16_from_callbacks
	.p2align	4, 0x90
_stbi_load_16_from_callbacks:           ## @stbi_load_16_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r14d
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	16(%rdi), %rax
	movq	%rax, -240(%rbp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	%rcx, -248(%rbp)
	movq	%rax, -256(%rbp)
	movq	%rsi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB11_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB11_3
LBB11_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB11_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi__load_and_postprocess_16bit
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-48(%rbp), %rcx
	jne	LBB11_5
## %bb.4:
	addq	$232, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB11_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_from_memory  ## -- Begin function stbi_load_from_memory
	.p2align	4, 0x90
_stbi_load_from_memory:                 ## @stbi_load_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$240, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -216(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -48(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdi, -40(%rbp)
	movslq	%esi, %rax
	addq	%rdi, %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -32(%rbp)
	leaq	-232(%rbp), %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	callq	_stbi__load_and_postprocess_8bit
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	jne	LBB12_2
## %bb.1:
	addq	$240, %rsp
	popq	%rbp
	retq
LBB12_2:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_load_from_callbacks ## -- Begin function stbi_load_from_callbacks
	.p2align	4, 0x90
_stbi_load_from_callbacks:              ## @stbi_load_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r14d
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	16(%rdi), %rax
	movq	%rax, -240(%rbp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	%rcx, -248(%rbp)
	movq	%rax, -256(%rbp)
	movq	%rsi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB13_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB13_3
LBB13_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB13_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi__load_and_postprocess_8bit
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-48(%rbp), %rcx
	jne	LBB13_5
## %bb.4:
	addq	$232, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB13_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_loadf_from_memory ## -- Begin function stbi_loadf_from_memory
	.p2align	4, 0x90
_stbi_loadf_from_memory:                ## @stbi_loadf_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$240, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -216(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -48(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdi, -40(%rbp)
	movslq	%esi, %rax
	addq	%rdi, %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -32(%rbp)
	leaq	-232(%rbp), %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r8, %rcx
	movl	%r9d, %r8d
	callq	_stbi__loadf_main
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	jne	LBB14_2
## %bb.1:
	addq	$240, %rsp
	popq	%rbp
	retq
LBB14_2:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbi__loadf_main
LCPI15_0:
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI15_1:
	.long	1132396544              ## float 255
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbi__loadf_main:                      ## @stbi__loadf_main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	movq	%rdx, %r13
	movq	%rsi, %rbx
	callq	_stbi__load_and_postprocess_8bit
	testq	%rax, %rax
	je	LBB15_42
## %bb.1:
	movq	%rax, %r12
	movl	(%rbx), %ecx
	movl	(%r13), %ebx
	testl	%r15d, %r15d
	jne	LBB15_3
## %bb.2:
	movl	(%r14), %r15d
LBB15_3:
	movl	%ebx, %eax
	orl	%ecx, %eax
	js	LBB15_11
## %bb.4:
	testl	%ebx, %ebx
	je	LBB15_6
## %bb.5:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%ebx
	cmpl	%ecx, %eax
	jl	LBB15_11
LBB15_6:
	imull	%ecx, %ebx
	movl	%r15d, %eax
	orl	%ebx, %eax
	js	LBB15_11
## %bb.7:
	testl	%r15d, %r15d
	je	LBB15_9
## %bb.8:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r15d
	cmpl	%ebx, %eax
	jl	LBB15_11
LBB15_9:
	movl	%r15d, %eax
	imull	%ebx, %eax
	cmpl	$536870911, %eax        ## imm = 0x1FFFFFFF
	ja	LBB15_11
## %bb.10:
	shll	$2, %eax
	movslq	%eax, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB15_11
## %bb.12:
	movq	%rax, %r13
	movl	%r15d, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	movl	%r15d, %edx
	sbbl	$0, %edx
	testl	%ebx, %ebx
	jle	LBB15_41
## %bb.13:
	movss	_stbi__l2h_gamma(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm2
	movss	_stbi__l2h_scale(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm0, -320(%rbp)       ## 16-byte Spill
	movl	%r15d, -120(%rbp)       ## 4-byte Spill
	movslq	%r15d, %rcx
	movl	%edx, %eax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	movl	%ebx, -116(%rbp)        ## 4-byte Spill
	movl	%ebx, %esi
	movq	%rsi, -184(%rbp)        ## 8-byte Spill
                                        ## kill: def $eax killed $eax killed $rax def $rax
	andl	$-4, %eax
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	leaq	-4(%rax), %rax
	movq	%rax, -256(%rbp)        ## 8-byte Spill
	shrq	$2, %rax
	leal	1(%rax), %esi
	movddup	%xmm2, %xmm3            ## xmm3 = xmm2[0,0]
	movddup	%xmm0, %xmm0            ## xmm0 = xmm0[0,0]
	movapd	%xmm0, -224(%rbp)       ## 16-byte Spill
	andl	$1, %esi
	leaq	16(%r13), %rdi
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	leaq	(,%rcx,4), %r15
	leaq	4(%r12), %rcx
	movq	%rsi, -248(%rbp)        ## 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -232(%rbp)        ## 8-byte Spill
	movss	LCPI15_1(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	movapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	movapd	%xmm3, -144(%rbp)       ## 16-byte Spill
	movq	%r12, -176(%rbp)        ## 8-byte Spill
	movq	%r12, %r14
	xorl	%r12d, %r12d
	movq	%r13, -168(%rbp)        ## 8-byte Spill
	movapd	%xmm2, -304(%rbp)       ## 16-byte Spill
	movl	%edx, -84(%rbp)         ## 4-byte Spill
	movq	%r15, -240(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB15_14:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB15_20 Depth 2
                                        ##     Child Loop BB15_24 Depth 2
	movq	%rcx, -192(%rbp)        ## 8-byte Spill
	movq	%rdi, -200(%rbp)        ## 8-byte Spill
	testl	%edx, %edx
	jle	LBB15_25
## %bb.15:                              ##   in Loop: Header=BB15_14 Depth=1
	cmpl	$4, -84(%rbp)           ## 4-byte Folded Reload
	jae	LBB15_17
## %bb.16:                              ##   in Loop: Header=BB15_14 Depth=1
	xorl	%ebx, %ebx
	jmp	LBB15_24
	.p2align	4, 0x90
LBB15_17:                               ##   in Loop: Header=BB15_14 Depth=1
	movq	%r14, -272(%rbp)        ## 8-byte Spill
	movq	%r12, -280(%rbp)        ## 8-byte Spill
	cmpq	$0, -256(%rbp)          ## 8-byte Folded Reload
	je	LBB15_18
## %bb.19:                              ##   in Loop: Header=BB15_14 Depth=1
	movq	-232(%rbp), %r14        ## 8-byte Reload
	xorl	%ebx, %ebx
	movq	-200(%rbp), %r15        ## 8-byte Reload
	movq	-192(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB15_20:                               ##   Parent Loop BB15_14 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	pmovzxbd	-4(%r12,%rbx), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	movaps	LCPI15_0(%rip), %xmm1   ## xmm1 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	divps	%xmm1, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movaps	%xmm1, -64(%rbp)        ## 16-byte Spill
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	cvtps2pd	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	movaps	%xmm1, %xmm0
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	movaps	-64(%rbp), %xmm0        ## 16-byte Reload
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	-80(%rbp), %xmm1        ## 16-byte Reload
	movlhps	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0]
	movaps	%xmm1, -80(%rbp)        ## 16-byte Spill
	movaps	-112(%rbp), %xmm0       ## 16-byte Reload
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -64(%rbp)        ## 16-byte Spill
	movapd	-112(%rbp), %xmm0       ## 16-byte Reload
	unpckhpd	%xmm0, %xmm0    ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movapd	-64(%rbp), %xmm1        ## 16-byte Reload
	unpcklpd	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0]
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm2
	movapd	-80(%rbp), %xmm1        ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	cvtpd2ps	%xmm1, %xmm0
	cvtpd2ps	%xmm2, %xmm1
	unpcklpd	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0]
	movupd	%xmm0, -16(%r15,%rbx,4)
	pmovzxbd	(%r12,%rbx), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	divps	LCPI15_0(%rip), %xmm0
	cvtps2pd	%xmm0, %xmm1
	movaps	%xmm1, -64(%rbp)        ## 16-byte Spill
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	cvtps2pd	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	movaps	%xmm1, %xmm0
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	movaps	-64(%rbp), %xmm0        ## 16-byte Reload
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	-80(%rbp), %xmm1        ## 16-byte Reload
	movlhps	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0]
	movaps	%xmm1, -80(%rbp)        ## 16-byte Spill
	movaps	-112(%rbp), %xmm0       ## 16-byte Reload
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -64(%rbp)        ## 16-byte Spill
	movapd	-112(%rbp), %xmm0       ## 16-byte Reload
	unpckhpd	%xmm0, %xmm0    ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movapd	-64(%rbp), %xmm1        ## 16-byte Reload
	unpcklpd	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0]
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm2
	movapd	-80(%rbp), %xmm1        ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	cvtpd2ps	%xmm1, %xmm0
	cvtpd2ps	%xmm2, %xmm1
	unpcklpd	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0]
	movupd	%xmm0, (%r15,%rbx,4)
	addq	$8, %rbx
	addq	$2, %r14
	jne	LBB15_20
	jmp	LBB15_21
LBB15_18:                               ##   in Loop: Header=BB15_14 Depth=1
	xorl	%ebx, %ebx
LBB15_21:                               ##   in Loop: Header=BB15_14 Depth=1
	cmpq	$0, -248(%rbp)          ## 8-byte Folded Reload
	movq	-280(%rbp), %r12        ## 8-byte Reload
	je	LBB15_23
## %bb.22:                              ##   in Loop: Header=BB15_14 Depth=1
	movq	%r12, %rax
	imulq	-48(%rbp), %rax         ## 8-byte Folded Reload
	addq	%rax, %rbx
	movq	-176(%rbp), %rax        ## 8-byte Reload
	pmovzxbd	(%rax,%rbx), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	divps	LCPI15_0(%rip), %xmm0
	cvtps2pd	%xmm0, %xmm1
	movaps	%xmm1, -64(%rbp)        ## 16-byte Spill
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	cvtps2pd	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	movaps	%xmm1, %xmm0
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	movaps	-64(%rbp), %xmm0        ## 16-byte Reload
	movhlps	%xmm0, %xmm0            ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	-80(%rbp), %xmm1        ## 16-byte Reload
	movlhps	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0]
	movaps	%xmm1, -80(%rbp)        ## 16-byte Spill
	movaps	-112(%rbp), %xmm0       ## 16-byte Reload
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movaps	%xmm0, -64(%rbp)        ## 16-byte Spill
	movapd	-112(%rbp), %xmm0       ## 16-byte Reload
	unpckhpd	%xmm0, %xmm0    ## xmm0 = xmm0[1,1]
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	callq	_pow
	movapd	-64(%rbp), %xmm1        ## 16-byte Reload
	unpcklpd	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0]
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm2
	movapd	-80(%rbp), %xmm1        ## 16-byte Reload
	mulpd	%xmm0, %xmm1
	cvtpd2ps	%xmm1, %xmm0
	cvtpd2ps	%xmm2, %xmm1
	unpcklpd	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0]
	movq	-168(%rbp), %rax        ## 8-byte Reload
	movupd	%xmm0, (%rax,%rbx,4)
LBB15_23:                               ##   in Loop: Header=BB15_14 Depth=1
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rbx
	cmpq	-208(%rbp), %rax        ## 8-byte Folded Reload
	movss	LCPI15_1(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	movapd	-304(%rbp), %xmm2       ## 16-byte Reload
	movq	-240(%rbp), %r15        ## 8-byte Reload
	movq	-272(%rbp), %r14        ## 8-byte Reload
	je	LBB15_25
	.p2align	4, 0x90
LBB15_24:                               ##   Parent Loop BB15_14 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r14,%rbx), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm2, %xmm1
	callq	_pow
	movapd	-304(%rbp), %xmm2       ## 16-byte Reload
	movss	LCPI15_1(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	mulsd	-320(%rbp), %xmm0       ## 16-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%r13,%rbx,4)
	incq	%rbx
	cmpq	%rbx, -208(%rbp)        ## 8-byte Folded Reload
	jne	LBB15_24
LBB15_25:                               ##   in Loop: Header=BB15_14 Depth=1
	incq	%r12
	movq	-200(%rbp), %rdi        ## 8-byte Reload
	addq	%r15, %rdi
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	-192(%rbp), %rcx        ## 8-byte Reload
	addq	%rax, %rcx
	addq	%r15, %r13
	addq	%rax, %r14
	cmpq	-184(%rbp), %r12        ## 8-byte Folded Reload
	movl	-84(%rbp), %edx         ## 4-byte Reload
	jne	LBB15_14
## %bb.26:
	movl	-120(%rbp), %eax        ## 4-byte Reload
	testb	$1, %al
	movq	-176(%rbp), %r12        ## 8-byte Reload
	movq	-168(%rbp), %r13        ## 8-byte Reload
	movq	-184(%rbp), %r14        ## 8-byte Reload
	movl	-116(%rbp), %ecx        ## 4-byte Reload
	movaps	LCPI15_0(%rip), %xmm0   ## xmm0 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	jne	LBB15_41
## %bb.27:
	movslq	%edx, %r8
	xorl	%r10d, %r10d
	cmpl	$4, %ecx
	jb	LBB15_36
## %bb.28:
	cmpl	$1, %eax
	jne	LBB15_36
## %bb.29:
	movl	%r14d, %r10d
	andl	$-4, %r10d
	leaq	-4(%r10), %rcx
	movq	%rcx, %rax
	shrq	$2, %rax
	incq	%rax
	movl	%eax, %r9d
	andl	$1, %r9d
	testq	%rcx, %rcx
	je	LBB15_30
## %bb.31:
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rcx
	shlq	$4, %rcx
	movq	%r13, %rdi
	addq	%rcx, %rdi
	leaq	(,%rdx,8), %r11
	leaq	(%r12,%rdx,4), %rcx
	movl	$1, %edx
	subq	%rax, %rdx
	leaq	-1(%r9,%rdx), %rdx
	xorl	%esi, %esi
	movq	%r8, %rax
	movaps	%xmm0, %xmm2
LBB15_32:                               ## =>This Inner Loop Header: Depth=1
	pmovzxbd	(%r12,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	divps	%xmm2, %xmm0
	movups	%xmm0, (%r13,%rax,4)
	pmovzxbd	(%rcx,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	divps	%xmm2, %xmm0
	movups	%xmm0, (%rdi,%rax,4)
	addq	$8, %rsi
	addq	%r11, %rax
	addq	$2, %rdx
	jne	LBB15_32
	jmp	LBB15_33
LBB15_11:
	movq	%r12, %rdi
	callq	_free
	leaq	L_.str.67(%rip), %rcx
	jmp	LBB15_43
LBB15_42:
	leaq	L_.str.47(%rip), %rcx
LBB15_43:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%r13d, %r13d
LBB15_44:
	movq	%r13, %rax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB15_30:
	xorl	%esi, %esi
LBB15_33:
	testq	%r9, %r9
	je	LBB15_35
## %bb.34:
	imulq	-48(%rbp), %rsi         ## 8-byte Folded Reload
	addq	%r8, %rsi
	pmovzxbd	(%r12,%rsi), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	cvtdq2ps	%xmm0, %xmm0
	divps	LCPI15_0(%rip), %xmm0
	movups	%xmm0, (%r13,%rsi,4)
LBB15_35:
	cmpq	%r14, %r10
	je	LBB15_41
LBB15_36:
	movq	%r10, %rax
	notq	%rax
	testb	$1, %r14b
	je	LBB15_38
## %bb.37:
	movq	%r10, %rcx
	imulq	-48(%rbp), %rcx         ## 8-byte Folded Reload
	addq	%r8, %rcx
	movzbl	(%r12,%rcx), %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	divss	LCPI15_1(%rip), %xmm0
	movss	%xmm0, (%r13,%rcx,4)
	orq	$1, %r10
LBB15_38:
	addq	%r14, %rax
	je	LBB15_41
## %bb.39:
	movq	%r14, %rcx
	subq	%r10, %rcx
	movq	%r10, %r14
	movq	-48(%rbp), %rax         ## 8-byte Reload
	imulq	%rax, %r14
	addq	%r8, %r14
	incq	%r10
	imulq	%rax, %r10
	leaq	(,%rax,8), %r9
	leaq	(%rax,%rax), %r11
	leaq	(,%r8,4), %rax
	leaq	(%rax,%r10,4), %r15
	addq	%r8, %r10
	addq	%r12, %r10
	leaq	(%r12,%r14), %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
LBB15_40:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx,%rax), %edi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rsi,%r14,4)
	movzbl	(%r10,%rax), %edi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rsi,%r15)
	addq	%r9, %rsi
	addq	%r11, %rax
	addq	$-2, %rcx
	jne	LBB15_40
LBB15_41:
	movq	%r12, %rdi
	callq	_free
	jmp	LBB15_44
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_loadf_from_callbacks ## -- Begin function stbi_loadf_from_callbacks
	.p2align	4, 0x90
_stbi_loadf_from_callbacks:             ## @stbi_loadf_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r14d
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	16(%rdi), %rax
	movq	%rax, -240(%rbp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	%rcx, -248(%rbp)
	movq	%rax, -256(%rbp)
	movq	%rsi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB16_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB16_3
LBB16_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB16_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi__loadf_main
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-48(%rbp), %rcx
	jne	LBB16_5
## %bb.4:
	addq	$232, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB16_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_loadf             ## -- Begin function stbi_loadf
	.p2align	4, 0x90
_stbi_loadf:                            ## @stbi_loadf
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB17_1
## %bb.2:
	movq	%rax, %r15
	movq	%rbx, -288(%rbp)        ## 8-byte Spill
	movl	%r14d, -276(%rbp)       ## 4-byte Spill
	movq	_stbi__stdio_callbacks+16(%rip), %rax
	movq	%rax, -240(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rax
	movq	%rax, -248(%rbp)
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -256(%rbp)
	movq	%r15, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %r14
	movq	%r14, -64(%rbp)
	movq	%r14, -80(%rbp)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB17_3
## %bb.4:
	movq	%r14, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB17_5
LBB17_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%ebx, %ebx
	jmp	LBB17_6
LBB17_3:
	movl	$0, -224(%rbp)
	movq	%r14, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB17_5:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	-288(%rbp), %rcx        ## 8-byte Reload
	movl	-276(%rbp), %r8d        ## 4-byte Reload
	callq	_stbi__loadf_main
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	_fclose
LBB17_6:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB17_8
## %bb.7:
	movq	%rbx, %rax
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB17_8:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_loadf_from_file   ## -- Begin function stbi_loadf_from_file
	.p2align	4, 0x90
_stbi_loadf_from_file:                  ## @stbi_loadf_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r14d
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	_stbi__stdio_callbacks+16(%rip), %rax
	movq	%rax, -240(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rax
	movq	%rax, -248(%rbp)
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -256(%rbp)
	movq	%rdi, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB18_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB18_3
LBB18_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB18_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_stbi__loadf_main
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-48(%rbp), %rcx
	jne	LBB18_5
## %bb.4:
	addq	$232, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB18_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_hdr_from_memory ## -- Begin function stbi_is_hdr_from_memory
	.p2align	4, 0x90
_stbi_is_hdr_from_memory:               ## @stbi_is_hdr_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_hdr            ## -- Begin function stbi_is_hdr
	.p2align	4, 0x90
_stbi_is_hdr:                           ## @stbi_is_hdr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB20_2
## %bb.1:
	movq	%rax, %rdi
	callq	_fclose
LBB20_2:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_hdr_from_file  ## -- Begin function stbi_is_hdr_from_file
	.p2align	4, 0x90
_stbi_is_hdr_from_file:                 ## @stbi_is_hdr_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_hdr_from_callbacks ## -- Begin function stbi_is_hdr_from_callbacks
	.p2align	4, 0x90
_stbi_is_hdr_from_callbacks:            ## @stbi_is_hdr_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_ldr_to_hdr_gamma  ## -- Begin function stbi_ldr_to_hdr_gamma
	.p2align	4, 0x90
_stbi_ldr_to_hdr_gamma:                 ## @stbi_ldr_to_hdr_gamma
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movss	%xmm0, _stbi__l2h_gamma(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_ldr_to_hdr_scale  ## -- Begin function stbi_ldr_to_hdr_scale
	.p2align	4, 0x90
_stbi_ldr_to_hdr_scale:                 ## @stbi_ldr_to_hdr_scale
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movss	%xmm0, _stbi__l2h_scale(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_hdr_to_ldr_gamma  ## -- Begin function stbi_hdr_to_ldr_gamma
	.p2align	4, 0x90
_stbi_hdr_to_ldr_gamma:                 ## @stbi_hdr_to_ldr_gamma
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_hdr_to_ldr_scale  ## -- Begin function stbi_hdr_to_ldr_scale
	.p2align	4, 0x90
_stbi_hdr_to_ldr_scale:                 ## @stbi_hdr_to_ldr_scale
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_malloc_guesssize ## -- Begin function stbi_zlib_decode_malloc_guesssize
	.p2align	4, 0x90
_stbi_zlib_decode_malloc_guesssize:     ## @stbi_zlib_decode_malloc_guesssize
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$4112, %rsp             ## imm = 0x1010
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movl	%edx, %r15d
	movl	%esi, %r12d
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movslq	%edx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB27_6
## %bb.1:
	movq	%rbx, -4136(%rbp)
	movslq	%r12d, %rcx
	addq	%rbx, %rcx
	movq	%rcx, -4128(%rbp)
	leaq	-4136(%rbp), %rdi
	movq	%rax, %rsi
	movl	%r15d, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB27_5
## %bb.2:
	testq	%r14, %r14
	je	LBB27_3
## %bb.4:
	movl	-4112(%rbp), %ecx
	movq	-4104(%rbp), %rax
	subl	%eax, %ecx
	movl	%ecx, (%r14)
	jmp	LBB27_7
LBB27_5:
	movq	-4104(%rbp), %rdi
	callq	_free
LBB27_6:
	xorl	%eax, %eax
LBB27_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-40(%rbp), %rcx
	jne	LBB27_9
## %bb.8:
	addq	$4112, %rsp             ## imm = 0x1010
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB27_3:
	movq	-4104(%rbp), %rax
	jmp	LBB27_7
LBB27_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbi__do_zlib
LCPI28_0:
	.space	16
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbi__do_zlib:                         ## @stbi__do_zlib
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2568, %rsp             ## imm = 0xA08
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	%rsi, 32(%rdi)
	movq	%rsi, 24(%rdi)
	movslq	%edx, %rax
	addq	%rsi, %rax
	movq	%rax, 40(%rdi)
	movl	%ecx, 48(%rdi)
	testl	%r8d, %r8d
	je	LBB28_10
## %bb.1:
	movq	(%r14), %rsi
	movq	8(%r14), %rdx
	xorl	%ecx, %ecx
	cmpq	%rdx, %rsi
	jae	LBB28_3
## %bb.2:
	leaq	1(%rsi), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rsi), %eax
	movq	%rdi, %rsi
	cmpq	%rdx, %rsi
	jb	LBB28_4
	jmp	LBB28_5
LBB28_3:
	xorl	%eax, %eax
	cmpq	%rdx, %rsi
	jae	LBB28_5
LBB28_4:
	leaq	1(%rsi), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rsi), %ecx
	movq	%rdi, %rsi
LBB28_5:
	cmpq	%rdx, %rsi
	jae	LBB28_7
## %bb.6:
	movl	%eax, %edx
	shll	$8, %edx
	orl	%ecx, %edx
	imulq	$138547333, %rdx, %rsi  ## imm = 0x8421085
	shrq	$32, %rsi
	movl	%edx, %edi
	subl	%esi, %edi
	shrl	%edi
	addl	%esi, %edi
	shrl	$4, %edi
	movl	%edi, %esi
	shll	$5, %esi
	subl	%esi, %edi
	addl	%edx, %edi
	je	LBB28_8
LBB28_7:
	leaq	L_.str.79(%rip), %rcx
	jmp	LBB28_216
LBB28_8:
	testb	$32, %cl
	jne	LBB28_219
## %bb.9:
	andl	$15, %eax
	cmpl	$8, %eax
	jne	LBB28_221
LBB28_10:
	leaq	16(%r14), %r10
	movq	$0, 16(%r14)
	leaq	20(%r14), %r12
	leaq	52(%r14), %rax
	movq	%rax, -2600(%rbp)       ## 8-byte Spill
	leaq	2072(%r14), %rax
	movq	%rax, -2592(%rbp)       ## 8-byte Spill
	xorl	%edx, %edx
	leaq	_stbi__compute_huffman_codes.length_dezigzag(%rip), %r8
	xorl	%ecx, %ecx
	movq	%r10, -2568(%rbp)       ## 8-byte Spill
	testl	%ecx, %ecx
	jg	LBB28_20
LBB28_12:
	decl	%ecx
	movl	%ecx, %eax
	.p2align	4, 0x90
LBB28_13:                               ## =>This Inner Loop Header: Depth=1
	leal	1(%rax), %ecx
	movl	%edx, %esi
	shrl	%cl, %esi
	testl	%esi, %esi
	jne	LBB28_19
## %bb.14:                              ##   in Loop: Header=BB28_13 Depth=1
	movq	(%r14), %rsi
	cmpq	8(%r14), %rsi
	jae	LBB28_16
## %bb.15:                              ##   in Loop: Header=BB28_13 Depth=1
	leaq	1(%rsi), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rsi), %esi
	jmp	LBB28_17
	.p2align	4, 0x90
LBB28_16:                               ##   in Loop: Header=BB28_13 Depth=1
	xorl	%esi, %esi
LBB28_17:                               ##   in Loop: Header=BB28_13 Depth=1
	movzbl	%sil, %esi
                                        ## kill: def $cl killed $cl killed $rcx
	shll	%cl, %esi
	orl	%esi, %edx
	movl	%edx, (%r12)
	leal	9(%rax), %ecx
	movl	%ecx, (%r10)
	addl	$8, %eax
	cmpl	$25, %ecx
	jl	LBB28_13
## %bb.18:
	movl	%edx, %ecx
	andl	$1, %ecx
	movl	%ecx, -2572(%rbp)       ## 4-byte Spill
	shrl	%edx
	movl	%edx, (%r12)
	movl	%eax, (%r10)
	jmp	LBB28_27
LBB28_19:
	movq	8(%r14), %rax
	movq	%rax, (%r14)
	jmp	LBB28_20
LBB28_11:
	movl	(%r10), %ecx
	movl	(%r12), %edx
	testl	%ecx, %ecx
	jle	LBB28_12
LBB28_20:
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, -2572(%rbp)       ## 4-byte Spill
	shrl	%edx
	movl	%edx, (%r12)
	leal	-1(%rcx), %eax
	movl	%eax, (%r10)
	cmpl	$2, %ecx
	jg	LBB28_27
	.p2align	4, 0x90
LBB28_21:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %esi
	movl	%eax, %ecx
	shrl	%cl, %esi
	testl	%esi, %esi
	jne	LBB28_26
## %bb.22:                              ##   in Loop: Header=BB28_21 Depth=1
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_24
## %bb.23:                              ##   in Loop: Header=BB28_21 Depth=1
	leaq	1(%rcx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_25
	.p2align	4, 0x90
LBB28_24:                               ##   in Loop: Header=BB28_21 Depth=1
	xorl	%ecx, %ecx
LBB28_25:                               ##   in Loop: Header=BB28_21 Depth=1
	movzbl	%cl, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
	orl	%esi, %edx
	movl	%edx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_21
	jmp	LBB28_27
LBB28_26:
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_27:
	movl	%edx, %ecx
	shrl	$2, %ecx
	movl	%ecx, (%r12)
	addl	$-2, %eax
	movl	%eax, (%r10)
	andl	$3, %edx
	je	LBB28_36
## %bb.28:
	xorl	%ebx, %ebx
	cmpl	$1, %edx
	je	LBB28_43
## %bb.29:
	cmpl	$3, %edx
	je	LBB28_217
## %bb.30:
	cmpl	$4, %eax
	jg	LBB28_46
	.p2align	4, 0x90
LBB28_31:                               ## =>This Inner Loop Header: Depth=1
	movq	%rcx, %rsi
	movl	%ecx, %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	testl	%edx, %edx
	jne	LBB28_45
## %bb.32:                              ##   in Loop: Header=BB28_31 Depth=1
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_34
## %bb.33:                              ##   in Loop: Header=BB28_31 Depth=1
	leaq	1(%rcx), %rdx
	movq	%rdx, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_35
	.p2align	4, 0x90
LBB28_34:                               ##   in Loop: Header=BB28_31 Depth=1
	xorl	%ecx, %ecx
LBB28_35:                               ##   in Loop: Header=BB28_31 Depth=1
	movzbl	%cl, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
	movq	%rsi, %rcx
	orl	%edx, %ecx
	movl	%ecx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_31
	jmp	LBB28_46
LBB28_36:
	movl	%eax, %edx
	andl	$7, %edx
	je	LBB28_176
## %bb.37:
	cmpl	%edx, %eax
	jge	LBB28_175
	.p2align	4, 0x90
LBB28_38:                               ## =>This Inner Loop Header: Depth=1
	movq	%rcx, %rdi
	movl	%ecx, %esi
	movl	%eax, %ecx
	shrl	%cl, %esi
	testl	%esi, %esi
	jne	LBB28_174
## %bb.39:                              ##   in Loop: Header=BB28_38 Depth=1
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_41
## %bb.40:                              ##   in Loop: Header=BB28_38 Depth=1
	leaq	1(%rcx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_42
	.p2align	4, 0x90
LBB28_41:                               ##   in Loop: Header=BB28_38 Depth=1
	xorl	%ecx, %ecx
LBB28_42:                               ##   in Loop: Header=BB28_38 Depth=1
	movzbl	%cl, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
	movq	%rdi, %rcx
	orl	%esi, %ecx
	movl	%ecx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_38
	jmp	LBB28_175
LBB28_43:
	movq	-2600(%rbp), %rdi       ## 8-byte Reload
	leaq	_stbi__zdefault_length(%rip), %rsi
	movl	$288, %edx              ## imm = 0x120
	callq	_stbi__zbuild_huffman
	testl	%eax, %eax
	je	LBB28_217
## %bb.44:
	movq	-2592(%rbp), %rdi       ## 8-byte Reload
	leaq	_stbi__zdefault_distance(%rip), %rsi
	movl	$32, %edx
	callq	_stbi__zbuild_huffman
	testl	%eax, %eax
	jne	LBB28_112
	jmp	LBB28_217
LBB28_45:
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
	movq	%rsi, %rcx
LBB28_46:
	movq	%rcx, %rdx
	movl	%ecx, %ebx
	shrl	$5, %ebx
	movl	%ebx, (%r12)
	addl	$-5, %eax
	movl	%eax, (%r10)
	cmpl	$4, %eax
	jg	LBB28_53
	.p2align	4, 0x90
LBB28_47:                               ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	movl	%eax, %ecx
	shrl	%cl, %esi
	testl	%esi, %esi
	jne	LBB28_52
## %bb.48:                              ##   in Loop: Header=BB28_47 Depth=1
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_50
## %bb.49:                              ##   in Loop: Header=BB28_47 Depth=1
	leaq	1(%rcx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_51
	.p2align	4, 0x90
LBB28_50:                               ##   in Loop: Header=BB28_47 Depth=1
	xorl	%ecx, %ecx
LBB28_51:                               ##   in Loop: Header=BB28_47 Depth=1
	movzbl	%cl, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
	orl	%esi, %ebx
	movl	%ebx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_47
	jmp	LBB28_53
LBB28_52:
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_53:
	andl	$31, %edx
	movl	%ebx, %r15d
	andl	$31, %r15d
	shrl	$5, %ebx
	movl	%ebx, (%r12)
	addl	$-5, %eax
	movl	%eax, (%r10)
	cmpl	$3, %eax
	jg	LBB28_60
	.p2align	4, 0x90
LBB28_54:                               ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	movl	%eax, %ecx
	shrl	%cl, %esi
	testl	%esi, %esi
	jne	LBB28_59
## %bb.55:                              ##   in Loop: Header=BB28_54 Depth=1
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_57
## %bb.56:                              ##   in Loop: Header=BB28_54 Depth=1
	leaq	1(%rcx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_58
	.p2align	4, 0x90
LBB28_57:                               ##   in Loop: Header=BB28_54 Depth=1
	xorl	%ecx, %ecx
LBB28_58:                               ##   in Loop: Header=BB28_54 Depth=1
	movzbl	%cl, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
	orl	%esi, %ebx
	movl	%ebx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_54
	jmp	LBB28_60
LBB28_59:
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_60:
	addl	$257, %edx              ## imm = 0x101
	movq	%rdx, -2608(%rbp)       ## 8-byte Spill
	incl	%r15d
	movl	%ebx, %esi
	andl	$15, %esi
	shrl	$4, %ebx
	movl	%ebx, (%r12)
	addl	$-4, %eax
	movl	%eax, (%r10)
	addl	$4, %esi
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -2560(%rbp)
	movl	$0, -2545(%rbp)
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB28_61:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB28_62 Depth 2
	cmpl	$2, %eax
	jg	LBB28_68
	.p2align	4, 0x90
LBB28_62:                               ##   Parent Loop BB28_61 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%ebx, %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	testl	%edx, %edx
	jne	LBB28_67
## %bb.63:                              ##   in Loop: Header=BB28_62 Depth=2
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_65
## %bb.64:                              ##   in Loop: Header=BB28_62 Depth=2
	leaq	1(%rcx), %rdx
	movq	%rdx, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_66
	.p2align	4, 0x90
LBB28_65:                               ##   in Loop: Header=BB28_62 Depth=2
	xorl	%ecx, %ecx
LBB28_66:                               ##   in Loop: Header=BB28_62 Depth=2
	movzbl	%cl, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
	orl	%edx, %ebx
	movl	%ebx, (%r12)
	addl	$8, %eax
	movl	%eax, (%r10)
	cmpl	$25, %eax
	jl	LBB28_62
	jmp	LBB28_68
	.p2align	4, 0x90
LBB28_67:                               ##   in Loop: Header=BB28_61 Depth=1
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_68:                               ##   in Loop: Header=BB28_61 Depth=1
	movl	%ebx, %ecx
	shrl	$3, %ecx
	movl	%ecx, (%r12)
	addl	$-3, %eax
	movl	%eax, (%r10)
	andb	$7, %bl
	movzbl	(%rdi,%r8), %edx
	movb	%bl, -2560(%rbp,%rdx)
	incq	%rdi
	movl	%ecx, %ebx
	cmpq	%rsi, %rdi
	jne	LBB28_61
## %bb.69:
	leaq	-2072(%rbp), %rdi
	leaq	-2560(%rbp), %rsi
	movl	$19, %edx
	callq	_stbi__zbuild_huffman
	xorl	%ebx, %ebx
	movl	$0, %ecx
	testl	%eax, %eax
	je	LBB28_111
## %bb.70:
	movq	-2608(%rbp), %rax       ## 8-byte Reload
	movq	%r15, %rbx
	leal	(%r15,%rax), %eax
	movl	%eax, -2584(%rbp)       ## 4-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB28_71:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB28_78 Depth 2
                                        ##     Child Loop BB28_90 Depth 2
                                        ##     Child Loop BB28_84 Depth 2
	movq	%r14, %rdi
	leaq	-2072(%rbp), %rsi
	callq	_stbi__zhuffman_decode
	cmpl	$19, %eax
	jae	LBB28_108
## %bb.72:                              ##   in Loop: Header=BB28_71 Depth=1
	cmpl	$15, %eax
	jg	LBB28_74
## %bb.73:                              ##   in Loop: Header=BB28_71 Depth=1
	movslq	%r13d, %rcx
	incl	%r13d
	movb	%al, -2528(%rbp,%rcx)
	cmpl	%r13d, -2584(%rbp)      ## 4-byte Folded Reload
	jg	LBB28_71
	jmp	LBB28_105
	.p2align	4, 0x90
LBB28_74:                               ##   in Loop: Header=BB28_71 Depth=1
	cmpl	$18, %eax
	je	LBB28_83
## %bb.75:                              ##   in Loop: Header=BB28_71 Depth=1
	cmpl	$17, %eax
	movq	-2568(%rbp), %rdi       ## 8-byte Reload
	je	LBB28_89
## %bb.76:                              ##   in Loop: Header=BB28_71 Depth=1
	cmpl	$16, %eax
	jne	LBB28_108
## %bb.77:                              ##   in Loop: Header=BB28_71 Depth=1
	movl	(%rdi), %ecx
	movl	(%r12), %r15d
	cmpl	$1, %ecx
	jg	LBB28_96
	.p2align	4, 0x90
LBB28_78:                               ##   Parent Loop BB28_71 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%r15d, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	jne	LBB28_95
## %bb.79:                              ##   in Loop: Header=BB28_78 Depth=2
	movq	(%r14), %rax
	cmpq	8(%r14), %rax
	jae	LBB28_81
## %bb.80:                              ##   in Loop: Header=BB28_78 Depth=2
	leaq	1(%rax), %rdx
	movq	%rdx, (%r14)
	movzbl	(%rax), %eax
	jmp	LBB28_82
	.p2align	4, 0x90
LBB28_81:                               ##   in Loop: Header=BB28_78 Depth=2
	xorl	%eax, %eax
LBB28_82:                               ##   in Loop: Header=BB28_78 Depth=2
	movzbl	%al, %eax
	shll	%cl, %eax
	orl	%eax, %r15d
	movl	%r15d, (%r12)
	addl	$8, %ecx
	movl	%ecx, (%rdi)
	cmpl	$25, %ecx
	jl	LBB28_78
	jmp	LBB28_96
LBB28_83:                               ##   in Loop: Header=BB28_71 Depth=1
	movq	-2568(%rbp), %rdi       ## 8-byte Reload
	movl	(%rdi), %ecx
	movl	(%r12), %eax
	cmpl	$6, %ecx
	jg	LBB28_99
	.p2align	4, 0x90
LBB28_84:                               ##   Parent Loop BB28_71 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%eax, %edx
	shrl	%cl, %edx
	testl	%edx, %edx
	jne	LBB28_98
## %bb.85:                              ##   in Loop: Header=BB28_84 Depth=2
	movq	(%r14), %rdx
	cmpq	8(%r14), %rdx
	jae	LBB28_87
## %bb.86:                              ##   in Loop: Header=BB28_84 Depth=2
	leaq	1(%rdx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rdx), %edx
	jmp	LBB28_88
	.p2align	4, 0x90
LBB28_87:                               ##   in Loop: Header=BB28_84 Depth=2
	xorl	%edx, %edx
LBB28_88:                               ##   in Loop: Header=BB28_84 Depth=2
	movzbl	%dl, %edx
	shll	%cl, %edx
	orl	%edx, %eax
	movl	%eax, (%r12)
	addl	$8, %ecx
	movl	%ecx, (%rdi)
	cmpl	$25, %ecx
	jl	LBB28_84
	jmp	LBB28_99
LBB28_89:                               ##   in Loop: Header=BB28_71 Depth=1
	movl	(%rdi), %ecx
	movl	(%r12), %eax
	cmpl	$2, %ecx
	jg	LBB28_101
	.p2align	4, 0x90
LBB28_90:                               ##   Parent Loop BB28_71 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%eax, %edx
	shrl	%cl, %edx
	testl	%edx, %edx
	jne	LBB28_100
## %bb.91:                              ##   in Loop: Header=BB28_90 Depth=2
	movq	(%r14), %rdx
	cmpq	8(%r14), %rdx
	jae	LBB28_93
## %bb.92:                              ##   in Loop: Header=BB28_90 Depth=2
	leaq	1(%rdx), %rsi
	movq	%rsi, (%r14)
	movzbl	(%rdx), %edx
	jmp	LBB28_94
	.p2align	4, 0x90
LBB28_93:                               ##   in Loop: Header=BB28_90 Depth=2
	xorl	%edx, %edx
LBB28_94:                               ##   in Loop: Header=BB28_90 Depth=2
	movzbl	%dl, %edx
	shll	%cl, %edx
	orl	%edx, %eax
	movl	%eax, (%r12)
	addl	$8, %ecx
	movl	%ecx, (%rdi)
	cmpl	$25, %ecx
	jl	LBB28_90
	jmp	LBB28_101
LBB28_95:                               ##   in Loop: Header=BB28_71 Depth=1
	movq	8(%r14), %rax
	movq	%rax, (%r14)
LBB28_96:                               ##   in Loop: Header=BB28_71 Depth=1
	movl	%r15d, %eax
	shrl	$2, %eax
	movl	%eax, (%r12)
	addl	$-2, %ecx
	movl	%ecx, (%rdi)
	testl	%r13d, %r13d
	je	LBB28_108
## %bb.97:                              ##   in Loop: Header=BB28_71 Depth=1
	andl	$3, %r15d
	addl	$3, %r15d
	movslq	%r13d, %rax
	movb	-2529(%rbp,%rax), %al
	jmp	LBB28_103
LBB28_98:                               ##   in Loop: Header=BB28_71 Depth=1
	movq	8(%r14), %rdx
	movq	%rdx, (%r14)
LBB28_99:                               ##   in Loop: Header=BB28_71 Depth=1
	movl	%eax, %r15d
	andl	$127, %r15d
	shrl	$7, %eax
	movl	%eax, (%r12)
	addl	$-7, %ecx
	movl	%ecx, (%rdi)
	addl	$11, %r15d
	jmp	LBB28_102
LBB28_100:                              ##   in Loop: Header=BB28_71 Depth=1
	movq	8(%r14), %rdx
	movq	%rdx, (%r14)
LBB28_101:                              ##   in Loop: Header=BB28_71 Depth=1
	movl	%eax, %r15d
	andl	$7, %r15d
	shrl	$3, %eax
	movl	%eax, (%r12)
	addl	$-3, %ecx
	movl	%ecx, (%rdi)
	addl	$3, %r15d
LBB28_102:                              ##   in Loop: Header=BB28_71 Depth=1
	xorl	%eax, %eax
LBB28_103:                              ##   in Loop: Header=BB28_71 Depth=1
	movl	-2584(%rbp), %ecx       ## 4-byte Reload
	subl	%r13d, %ecx
	cmpl	%r15d, %ecx
	jl	LBB28_108
## %bb.104:                             ##   in Loop: Header=BB28_71 Depth=1
	movslq	%r13d, %rcx
	leaq	-2528(%rbp,%rcx), %rdi
	movl	%r15d, %edx
	movzbl	%al, %esi
	callq	_memset
	addl	%r15d, %r13d
	cmpl	%r13d, -2584(%rbp)      ## 4-byte Folded Reload
	jg	LBB28_71
LBB28_105:
	jne	LBB28_108
## %bb.106:
	movq	-2600(%rbp), %rdi       ## 8-byte Reload
	leaq	-2528(%rbp), %rsi
	movq	-2608(%rbp), %r15       ## 8-byte Reload
	movl	%r15d, %edx
	callq	_stbi__zbuild_huffman
	testl	%eax, %eax
	je	LBB28_109
## %bb.107:
	movl	%r15d, %eax
	leaq	-2528(%rbp,%rax), %rsi
	movq	-2592(%rbp), %rdi       ## 8-byte Reload
	movl	%ebx, %edx
	callq	_stbi__zbuild_huffman
	xorl	%ecx, %ecx
	testl	%eax, %eax
	setne	%cl
	jmp	LBB28_110
LBB28_108:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	leaq	L_.str.86(%rip), %rcx
	movq	%rcx, (%rax)
LBB28_109:
	xorl	%ecx, %ecx
LBB28_110:
	xorl	%ebx, %ebx
LBB28_111:
	testl	%ecx, %ecx
	je	LBB28_217
LBB28_112:
	movq	24(%r14), %r15
	jmp	LBB28_114
	.p2align	4, 0x90
LBB28_113:                              ##   in Loop: Header=BB28_114 Depth=1
	movb	%r13b, (%r15)
	incq	%r15
LBB28_114:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB28_125 Depth 2
                                        ##     Child Loop BB28_137 Depth 2
                                        ##     Child Loop BB28_150 Depth 2
                                        ##     Child Loop BB28_164 Depth 2
                                        ##     Child Loop BB28_168 Depth 2
                                        ##     Child Loop BB28_172 Depth 2
                                        ##     Child Loop BB28_121 Depth 2
	movq	%r14, %rdi
	movq	-2600(%rbp), %rsi       ## 8-byte Reload
	callq	_stbi__zhuffman_decode
	movl	%eax, %r13d
	cmpl	$255, %eax
	jg	LBB28_122
## %bb.115:                             ##   in Loop: Header=BB28_114 Depth=1
	testl	%r13d, %r13d
	js	LBB28_220
## %bb.116:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	40(%r14), %rax
	cmpq	%rax, %r15
	jb	LBB28_113
## %bb.117:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%r15, 24(%r14)
	cmpl	$0, 48(%r14)
	je	LBB28_228
## %bb.118:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	32(%r14), %rdi
	subq	%rdi, %r15
	cmpl	$-1, %r15d
	je	LBB28_215
## %bb.119:                             ##   in Loop: Header=BB28_114 Depth=1
	subl	%edi, %eax
	leal	1(%r15), %ecx
	cmpl	%eax, %ecx
	jbe	LBB28_130
	.p2align	4, 0x90
LBB28_121:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	testl	%eax, %eax
	js	LBB28_215
## %bb.120:                             ##   in Loop: Header=BB28_121 Depth=2
	addl	%eax, %eax
	cmpl	%eax, %ecx
	ja	LBB28_121
LBB28_130:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%r15, %rbx
	movl	%eax, %r15d
	movq	%r15, %rsi
	callq	_realloc
	testq	%rax, %rax
	je	LBB28_215
## %bb.131:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%rax, 32(%r14)
	movl	%ebx, %ebx
	addq	%rax, %rbx
	movq	%rbx, 24(%r14)
	addq	%rax, %r15
	movq	%r15, 40(%r14)
	movq	%rbx, %r15
	jmp	LBB28_113
	.p2align	4, 0x90
LBB28_122:                              ##   in Loop: Header=BB28_114 Depth=1
	cmpl	$256, %r13d             ## imm = 0x100
	movq	-2568(%rbp), %r10       ## 8-byte Reload
	je	LBB28_191
## %bb.123:                             ##   in Loop: Header=BB28_114 Depth=1
	movslq	%r13d, %rax
	leaq	_stbi__zlength_base(%rip), %rcx
	movl	-1028(%rcx,%rax,4), %r13d
	leaq	-265(%rax), %rcx
	cmpq	$19, %rcx
	ja	LBB28_134
## %bb.124:                             ##   in Loop: Header=BB28_114 Depth=1
	addq	$-257, %rax             ## imm = 0xFEFF
	leaq	_stbi__zlength_extra(%rip), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	(%r10), %edx
	movl	(%r12), %esi
	cmpl	%eax, %edx
	jge	LBB28_133
	.p2align	4, 0x90
LBB28_125:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%esi, %edi
	movl	%edx, %ecx
	shrl	%cl, %edi
	testl	%edi, %edi
	jne	LBB28_132
## %bb.126:                             ##   in Loop: Header=BB28_125 Depth=2
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_128
## %bb.127:                             ##   in Loop: Header=BB28_125 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_129
	.p2align	4, 0x90
LBB28_128:                              ##   in Loop: Header=BB28_125 Depth=2
	xorl	%ecx, %ecx
LBB28_129:                              ##   in Loop: Header=BB28_125 Depth=2
	movzbl	%cl, %edi
	movl	%edx, %ecx
	shll	%cl, %edi
	orl	%edi, %esi
	movl	%esi, (%r12)
	addl	$8, %edx
	movl	%edx, (%r10)
	cmpl	$25, %edx
	jl	LBB28_125
	jmp	LBB28_133
LBB28_132:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_133:                              ##   in Loop: Header=BB28_114 Depth=1
	movl	$-1, %edi
	movl	%eax, %ecx
	shll	%cl, %edi
	notl	%edi
	andl	%esi, %edi
	shrl	%cl, %esi
	movl	%esi, (%r12)
	subl	%eax, %edx
	movl	%edx, (%r10)
	addl	%r13d, %edi
	movl	%edi, %r13d
LBB28_134:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%r14, %rdi
	movq	-2592(%rbp), %rsi       ## 8-byte Reload
	callq	_stbi__zhuffman_decode
	testl	%eax, %eax
	js	LBB28_220
## %bb.135:                             ##   in Loop: Header=BB28_114 Depth=1
	cltq
	leaq	_stbi__zdist_base(%rip), %rcx
	movl	(%rcx,%rax,4), %esi
	leaq	-4(%rax), %rcx
	cmpq	$25, %rcx
	ja	LBB28_144
## %bb.136:                             ##   in Loop: Header=BB28_114 Depth=1
	leaq	_stbi__zdist_extra(%rip), %rcx
	movl	(%rcx,%rax,4), %r8d
	movq	-2568(%rbp), %rax       ## 8-byte Reload
	movl	(%rax), %edx
	movl	(%r12), %ebx
	cmpl	%r8d, %edx
	jge	LBB28_143
	.p2align	4, 0x90
LBB28_137:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%ebx, %edi
	movl	%edx, %ecx
	shrl	%cl, %edi
	testl	%edi, %edi
	jne	LBB28_142
## %bb.138:                             ##   in Loop: Header=BB28_137 Depth=2
	movq	(%r14), %rcx
	cmpq	8(%r14), %rcx
	jae	LBB28_140
## %bb.139:                             ##   in Loop: Header=BB28_137 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rcx), %ecx
	jmp	LBB28_141
	.p2align	4, 0x90
LBB28_140:                              ##   in Loop: Header=BB28_137 Depth=2
	xorl	%ecx, %ecx
LBB28_141:                              ##   in Loop: Header=BB28_137 Depth=2
	movzbl	%cl, %edi
	movl	%edx, %ecx
	shll	%cl, %edi
	orl	%edi, %ebx
	movl	%ebx, (%r12)
	addl	$8, %edx
	movl	%edx, (%rax)
	cmpl	$25, %edx
	jl	LBB28_137
	jmp	LBB28_143
LBB28_142:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
LBB28_143:                              ##   in Loop: Header=BB28_114 Depth=1
	movl	$-1, %edi
	movl	%r8d, %ecx
	shll	%cl, %edi
	notl	%edi
	andl	%ebx, %edi
	shrl	%cl, %ebx
	movl	%ebx, (%r12)
	subl	%r8d, %edx
	movl	%edx, (%rax)
	addl	%edi, %esi
LBB28_144:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	32(%r14), %rdi
	movq	%r15, %rdx
	subq	%rdi, %r15
	movslq	%esi, %rbx
	cmpq	%rbx, %r15
	jl	LBB28_223
## %bb.145:                             ##   in Loop: Header=BB28_114 Depth=1
	movslq	%r13d, %rcx
	addq	%rdx, %rcx
	movq	40(%r14), %rax
	cmpq	%rax, %rcx
	jbe	LBB28_151
## %bb.146:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%rdx, 24(%r14)
	cmpl	$0, 48(%r14)
	je	LBB28_228
## %bb.147:                             ##   in Loop: Header=BB28_114 Depth=1
	movl	%r15d, %ecx
	notl	%ecx
	cmpl	%ecx, %r13d
	ja	LBB28_215
## %bb.148:                             ##   in Loop: Header=BB28_114 Depth=1
	subl	%edi, %eax
	leal	(%r13,%r15), %ecx
	cmpl	%eax, %ecx
	jbe	LBB28_152
	.p2align	4, 0x90
LBB28_150:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	testl	%eax, %eax
	js	LBB28_215
## %bb.149:                             ##   in Loop: Header=BB28_150 Depth=2
	addl	%eax, %eax
	cmpl	%eax, %ecx
	ja	LBB28_150
LBB28_152:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%rbx, -2584(%rbp)       ## 8-byte Spill
	movq	%r13, %rbx
	movl	%eax, %r13d
	movq	%r13, %rsi
	callq	_realloc
	testq	%rax, %rax
	je	LBB28_215
## %bb.153:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%rax, 32(%r14)
	movl	%r15d, %r15d
	addq	%rax, %r15
	movq	%r15, 24(%r14)
	addq	%rax, %r13
	movq	%r13, 40(%r14)
	movq	%rbx, %r13
	movq	-2584(%rbp), %rbx       ## 8-byte Reload
	jmp	LBB28_154
	.p2align	4, 0x90
LBB28_151:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%rdx, %r15
LBB28_154:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%r15, %rax
	subq	%rbx, %rax
	cmpl	$1, %ebx
	jne	LBB28_157
## %bb.155:                             ##   in Loop: Header=BB28_114 Depth=1
	testl	%r13d, %r13d
	je	LBB28_114
## %bb.156:                             ##   in Loop: Header=BB28_114 Depth=1
	movl	%r13d, %edx
	movzbl	(%rax), %esi
	movq	%r15, %rdi
	callq	_memset
	decl	%r13d
	leaq	1(%r15,%r13), %r15
	jmp	LBB28_114
LBB28_157:                              ##   in Loop: Header=BB28_114 Depth=1
	testl	%r13d, %r13d
	je	LBB28_114
## %bb.158:                             ##   in Loop: Header=BB28_114 Depth=1
	leal	-1(%r13), %ecx
	leaq	1(%rcx), %rdx
	cmpq	$32, %rdx
	jb	LBB28_159
## %bb.160:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%rcx, %rsi
	subq	%rbx, %rsi
	leaq	1(%r15,%rsi), %rsi
	cmpq	%rsi, %r15
	jae	LBB28_163
## %bb.161:                             ##   in Loop: Header=BB28_114 Depth=1
	leaq	1(%r15,%rcx), %rcx
	cmpq	%rcx, %rax
	jae	LBB28_163
LBB28_159:                              ##   in Loop: Header=BB28_114 Depth=1
	movq	%r15, %rcx
LBB28_166:                              ##   in Loop: Header=BB28_114 Depth=1
	leal	-1(%r13), %edx
	testb	$7, %r13b
	je	LBB28_170
## %bb.167:                             ##   in Loop: Header=BB28_114 Depth=1
	movl	%r13d, %edi
	andl	$7, %edi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB28_168:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ebx
	movb	%bl, (%rcx,%rsi)
	incq	%rsi
	cmpl	%esi, %edi
	jne	LBB28_168
## %bb.169:                             ##   in Loop: Header=BB28_114 Depth=1
	addq	%rsi, %rcx
	addq	%rsi, %rax
	subl	%esi, %r13d
	movq	%rcx, %r15
	cmpl	$7, %edx
	jb	LBB28_114
	jmp	LBB28_171
LBB28_170:                              ##   in Loop: Header=BB28_114 Depth=1
                                        ## implicit-def: $r15
	cmpl	$7, %edx
	jb	LBB28_114
LBB28_171:                              ##   in Loop: Header=BB28_114 Depth=1
	movl	%r13d, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB28_172:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ebx
	movb	%bl, (%rcx,%rsi)
	movzbl	1(%rax,%rsi), %ebx
	movb	%bl, 1(%rcx,%rsi)
	movzbl	2(%rax,%rsi), %ebx
	movb	%bl, 2(%rcx,%rsi)
	movzbl	3(%rax,%rsi), %ebx
	movb	%bl, 3(%rcx,%rsi)
	movzbl	4(%rax,%rsi), %ebx
	movb	%bl, 4(%rcx,%rsi)
	movzbl	5(%rax,%rsi), %ebx
	movb	%bl, 5(%rcx,%rsi)
	movzbl	6(%rax,%rsi), %ebx
	movb	%bl, 6(%rcx,%rsi)
	movzbl	7(%rax,%rsi), %ebx
	movb	%bl, 7(%rcx,%rsi)
	addq	$8, %rsi
	cmpl	%esi, %edx
	jne	LBB28_172
## %bb.173:                             ##   in Loop: Header=BB28_114 Depth=1
	addq	%rsi, %rcx
	movq	%rcx, %r15
	jmp	LBB28_114
LBB28_163:                              ##   in Loop: Header=BB28_114 Depth=1
	negq	%rbx
	movl	%r13d, %r8d
	andl	$31, %r8d
	subq	%r8, %rdx
	leaq	(%r15,%rdx), %rcx
	addq	%rdx, %rax
	subl	%edx, %r13d
	leaq	16(%r15,%rbx), %rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB28_164:                              ##   Parent Loop BB28_114 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movups	-16(%rdi,%rsi), %xmm0
	movups	(%rdi,%rsi), %xmm1
	movups	%xmm0, (%r15,%rsi)
	movups	%xmm1, 16(%r15,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rdx
	jne	LBB28_164
## %bb.165:                             ##   in Loop: Header=BB28_114 Depth=1
	movq	%rcx, %r15
	testl	%r8d, %r8d
	je	LBB28_114
	jmp	LBB28_166
LBB28_174:
	movq	8(%r14), %rcx
	movq	%rcx, (%r14)
	movq	%rdi, %rcx
LBB28_175:
	movq	%rcx, %rsi
	movl	%edx, %ecx
	shrl	%cl, %esi
	movq	%rsi, %rcx
	movl	%ecx, (%r12)
	subl	%edx, %eax
	movl	%eax, (%r10)
LBB28_176:
	testl	%eax, %eax
	jle	LBB28_179
## %bb.177:
	leal	-1(%rax), %r8d
	movl	%r8d, %r9d
	shrl	$3, %r9d
	leaq	1(%r9), %rdi
	movl	%edi, %esi
	andl	$3, %esi
	cmpl	$3, %r9d
	jae	LBB28_180
## %bb.178:
	xorl	%edx, %edx
	testq	%rsi, %rsi
	jne	LBB28_183
LBB28_185:
	xorl	%ecx, %ecx
	jmp	LBB28_186
LBB28_179:
	xorl	%r9d, %r9d
	testl	%eax, %eax
	js	LBB28_225
LBB28_187:
	cmpl	$3, %r9d
	ja	LBB28_202
## %bb.188:
	movl	%r9d, %eax
	movq	(%r14), %rsi
	movq	8(%r14), %rdx
	testb	$1, %al
	je	LBB28_194
## %bb.189:
	cmpq	%rdx, %rsi
	jae	LBB28_192
## %bb.190:
	leaq	1(%rsi), %rcx
	movq	%rcx, (%r14)
	movb	(%rsi), %dil
	movq	%rcx, %rsi
	jmp	LBB28_193
LBB28_180:
	subq	%rsi, %rdi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB28_181:                              ## =>This Inner Loop Header: Depth=1
	movb	%cl, -2072(%rbp,%rdx)
	movb	%ch, -2071(%rbp,%rdx)
	movq	%rcx, %rbx
	shrl	$16, %ecx
	movb	%cl, -2070(%rbp,%rdx)
	shrl	$24, %ebx
	movb	%bl, -2069(%rbp,%rdx)
	addq	$4, %rdx
	xorl	%ecx, %ecx
	cmpq	%rdx, %rdi
	jne	LBB28_181
## %bb.182:
	testq	%rsi, %rsi
	je	LBB28_185
LBB28_183:
	leaq	-2072(%rbp,%rdx), %rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB28_184:                              ## =>This Inner Loop Header: Depth=1
	movb	%cl, (%rdx,%rdi)
	shrl	$8, %ecx
	incq	%rdi
	cmpq	%rdi, %rsi
	jne	LBB28_184
LBB28_186:
	incl	%r9d
	andl	$-8, %r8d
	addl	$-8, %eax
	subl	%r8d, %eax
	movl	%ecx, (%r12)
	movl	%eax, (%r10)
	testl	%eax, %eax
	jns	LBB28_187
	jmp	LBB28_225
LBB28_191:
	movq	%r15, 24(%r14)
	jmp	LBB28_213
LBB28_192:
	xorl	%edi, %edi
LBB28_193:
	movb	%dil, -2072(%rbp,%rax)
	incq	%rax
LBB28_194:
	cmpl	$3, %r9d
	je	LBB28_202
	.p2align	4, 0x90
LBB28_195:                              ## =>This Inner Loop Header: Depth=1
	cmpq	%rdx, %rsi
	jae	LBB28_197
## %bb.196:                             ##   in Loop: Header=BB28_195 Depth=1
	leaq	1(%rsi), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rsi), %ecx
	movq	%rdi, %rsi
	jmp	LBB28_198
	.p2align	4, 0x90
LBB28_197:                              ##   in Loop: Header=BB28_195 Depth=1
	xorl	%ecx, %ecx
LBB28_198:                              ##   in Loop: Header=BB28_195 Depth=1
	movb	%cl, -2072(%rbp,%rax)
	cmpq	%rdx, %rsi
	jae	LBB28_200
## %bb.199:                             ##   in Loop: Header=BB28_195 Depth=1
	leaq	1(%rsi), %rdi
	movq	%rdi, (%r14)
	movzbl	(%rsi), %ecx
	movq	%rdi, %rsi
	jmp	LBB28_201
	.p2align	4, 0x90
LBB28_200:                              ##   in Loop: Header=BB28_195 Depth=1
	xorl	%ecx, %ecx
LBB28_201:                              ##   in Loop: Header=BB28_195 Depth=1
	movb	%cl, -2071(%rbp,%rax)
	addq	$2, %rax
	cmpq	$4, %rax
	jne	LBB28_195
LBB28_202:
	movzbl	-2071(%rbp), %eax
	shlq	$8, %rax
	movzbl	-2072(%rbp), %r13d
	orq	%rax, %r13
	movzbl	-2069(%rbp), %eax
	shll	$8, %eax
	movzbl	-2070(%rbp), %ecx
	orl	%eax, %ecx
	movl	%r13d, %eax
	xorl	$65535, %eax            ## imm = 0xFFFF
	cmpl	%eax, %ecx
	jne	LBB28_225
## %bb.203:
	movq	(%r14), %rsi
	leaq	(%rsi,%r13), %rax
	cmpq	8(%r14), %rax
	ja	LBB28_226
## %bb.204:
	leaq	(%r15,%r13), %rcx
	movq	40(%r14), %rax
	cmpq	%rax, %rcx
	jbe	LBB28_212
## %bb.205:
	cmpl	$0, 48(%r14)
	je	LBB28_228
## %bb.206:
	movq	32(%r14), %rdi
	subq	%rdi, %r15
	movl	%r15d, %ecx
	notl	%ecx
	cmpl	%ecx, %r13d
	ja	LBB28_215
## %bb.207:
	subl	%edi, %eax
	leal	(%r13,%r15), %ecx
	cmpl	%eax, %ecx
	jbe	LBB28_210
	.p2align	4, 0x90
LBB28_209:                              ## =>This Inner Loop Header: Depth=1
	testl	%eax, %eax
	js	LBB28_215
## %bb.208:                             ##   in Loop: Header=BB28_209 Depth=1
	addl	%eax, %eax
	cmpl	%eax, %ecx
	ja	LBB28_209
LBB28_210:
	movq	%r15, %rbx
	movl	%eax, %r15d
	movq	%r15, %rsi
	callq	_realloc
	testq	%rax, %rax
	je	LBB28_215
## %bb.211:
	movq	%rax, 32(%r14)
	movl	%ebx, %ebx
	addq	%rax, %rbx
	movq	%rbx, 24(%r14)
	addq	%rax, %r15
	movq	%r15, 40(%r14)
	movq	%rbx, %r15
	movq	(%r14), %rsi
LBB28_212:
	movq	%r15, %rdi
	movq	%r13, %rdx
	callq	_memcpy
	addq	%r13, (%r14)
	addq	24(%r14), %r13
	movq	%r13, 24(%r14)
	movq	%r13, %r15
	movq	-2568(%rbp), %r10       ## 8-byte Reload
LBB28_213:
	cmpl	$0, -2572(%rbp)         ## 4-byte Folded Reload
	leaq	_stbi__compute_huffman_codes.length_dezigzag(%rip), %r8
	je	LBB28_11
## %bb.227:
	movl	$1, %ebx
	jmp	LBB28_217
LBB28_215:
	leaq	L_.str.67(%rip), %rcx
LBB28_216:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%ebx, %ebx
LBB28_217:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB28_229
## %bb.218:
	movl	%ebx, %eax
	addq	$2568, %rsp             ## imm = 0xA08
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB28_219:
	leaq	L_.str.80(%rip), %rcx
	jmp	LBB28_216
LBB28_220:
	leaq	L_.str.88(%rip), %rcx
	jmp	LBB28_216
LBB28_221:
	leaq	L_.str.81(%rip), %rcx
	jmp	LBB28_216
LBB28_228:
	leaq	L_.str.84(%rip), %rcx
	jmp	LBB28_216
LBB28_223:
	leaq	L_.str.89(%rip), %rcx
	jmp	LBB28_216
LBB28_225:
	leaq	L_.str.82(%rip), %rcx
	jmp	LBB28_216
LBB28_226:
	leaq	L_.str.83(%rip), %rcx
	jmp	LBB28_216
LBB28_229:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_malloc ## -- Begin function stbi_zlib_decode_malloc
	.p2align	4, 0x90
_stbi_zlib_decode_malloc:               ## @stbi_zlib_decode_malloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$4104, %rsp             ## imm = 0x1008
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movl	%esi, %r15d
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movl	$16384, %edi            ## imm = 0x4000
	callq	_malloc
	testq	%rax, %rax
	je	LBB29_6
## %bb.1:
	movq	%rbx, -4128(%rbp)
	movslq	%r15d, %rcx
	addq	%rbx, %rcx
	movq	%rcx, -4120(%rbp)
	leaq	-4128(%rbp), %rdi
	movq	%rax, %rsi
	movl	$16384, %edx            ## imm = 0x4000
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB29_5
## %bb.2:
	testq	%r14, %r14
	je	LBB29_3
## %bb.4:
	movl	-4104(%rbp), %ecx
	movq	-4096(%rbp), %rax
	subl	%eax, %ecx
	movl	%ecx, (%r14)
	jmp	LBB29_7
LBB29_5:
	movq	-4096(%rbp), %rdi
	callq	_free
LBB29_6:
	xorl	%eax, %eax
LBB29_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-32(%rbp), %rcx
	jne	LBB29_9
## %bb.8:
	addq	$4104, %rsp             ## imm = 0x1008
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB29_3:
	movq	-4096(%rbp), %rax
	jmp	LBB29_7
LBB29_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_malloc_guesssize_headerflag ## -- Begin function stbi_zlib_decode_malloc_guesssize_headerflag
	.p2align	4, 0x90
_stbi_zlib_decode_malloc_guesssize_headerflag: ## @stbi_zlib_decode_malloc_guesssize_headerflag
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4104, %rsp             ## imm = 0x1008
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	movl	%edx, %r12d
	movl	%esi, %r13d
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movslq	%edx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB30_6
## %bb.1:
	movq	%rbx, -4144(%rbp)
	movslq	%r13d, %rcx
	addq	%rbx, %rcx
	movq	%rcx, -4136(%rbp)
	leaq	-4144(%rbp), %rdi
	movq	%rax, %rsi
	movl	%r12d, %edx
	movl	$1, %ecx
	movl	%r15d, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB30_5
## %bb.2:
	testq	%r14, %r14
	je	LBB30_3
## %bb.4:
	movl	-4120(%rbp), %ecx
	movq	-4112(%rbp), %rax
	subl	%eax, %ecx
	movl	%ecx, (%r14)
	jmp	LBB30_7
LBB30_5:
	movq	-4112(%rbp), %rdi
	callq	_free
LBB30_6:
	xorl	%eax, %eax
LBB30_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-48(%rbp), %rcx
	jne	LBB30_9
## %bb.8:
	addq	$4104, %rsp             ## imm = 0x1008
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB30_3:
	movq	-4112(%rbp), %rax
	jmp	LBB30_7
LBB30_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_buffer ## -- Begin function stbi_zlib_decode_buffer
	.p2align	4, 0x90
_stbi_zlib_decode_buffer:               ## @stbi_zlib_decode_buffer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$4112, %rsp             ## imm = 0x1010
	movl	%esi, %eax
	movq	%rdi, %rsi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, -8(%rbp)
	movq	%rdx, -4104(%rbp)
	movslq	%ecx, %rcx
	addq	%rdx, %rcx
	movq	%rcx, -4096(%rbp)
	leaq	-4104(%rbp), %rdi
	movl	%eax, %edx
	xorl	%ecx, %ecx
	movl	$1, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB31_1
## %bb.2:
	movl	-4080(%rbp), %eax
	subl	-4072(%rbp), %eax
	jmp	LBB31_3
LBB31_1:
	movl	$-1, %eax
LBB31_3:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	jne	LBB31_5
## %bb.4:
	addq	$4112, %rsp             ## imm = 0x1010
	popq	%rbp
	retq
LBB31_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_noheader_malloc ## -- Begin function stbi_zlib_decode_noheader_malloc
	.p2align	4, 0x90
_stbi_zlib_decode_noheader_malloc:      ## @stbi_zlib_decode_noheader_malloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$4104, %rsp             ## imm = 0x1008
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movl	%esi, %r15d
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movl	$16384, %edi            ## imm = 0x4000
	callq	_malloc
	testq	%rax, %rax
	je	LBB32_6
## %bb.1:
	movq	%rbx, -4128(%rbp)
	movslq	%r15d, %rcx
	addq	%rbx, %rcx
	movq	%rcx, -4120(%rbp)
	leaq	-4128(%rbp), %rdi
	movq	%rax, %rsi
	movl	$16384, %edx            ## imm = 0x4000
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB32_5
## %bb.2:
	testq	%r14, %r14
	je	LBB32_3
## %bb.4:
	movl	-4104(%rbp), %ecx
	movq	-4096(%rbp), %rax
	subl	%eax, %ecx
	movl	%ecx, (%r14)
	jmp	LBB32_7
LBB32_5:
	movq	-4096(%rbp), %rdi
	callq	_free
LBB32_6:
	xorl	%eax, %eax
LBB32_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-32(%rbp), %rcx
	jne	LBB32_9
## %bb.8:
	addq	$4104, %rsp             ## imm = 0x1008
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB32_3:
	movq	-4096(%rbp), %rax
	jmp	LBB32_7
LBB32_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_zlib_decode_noheader_buffer ## -- Begin function stbi_zlib_decode_noheader_buffer
	.p2align	4, 0x90
_stbi_zlib_decode_noheader_buffer:      ## @stbi_zlib_decode_noheader_buffer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$4112, %rsp             ## imm = 0x1010
	movl	%esi, %eax
	movq	%rdi, %rsi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, -8(%rbp)
	movq	%rdx, -4104(%rbp)
	movslq	%ecx, %rcx
	addq	%rdx, %rcx
	movq	%rcx, -4096(%rbp)
	leaq	-4104(%rbp), %rdi
	movl	%eax, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB33_1
## %bb.2:
	movl	-4080(%rbp), %eax
	subl	-4072(%rbp), %eax
	jmp	LBB33_3
LBB33_1:
	movl	$-1, %eax
LBB33_3:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	jne	LBB33_5
## %bb.4:
	addq	$4112, %rsp             ## imm = 0x1010
	popq	%rbp
	retq
LBB33_5:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_set_unpremultiply_on_load ## -- Begin function stbi_set_unpremultiply_on_load
	.p2align	4, 0x90
_stbi_set_unpremultiply_on_load:        ## @stbi_set_unpremultiply_on_load
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, _stbi__unpremultiply_on_load_global(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_convert_iphone_png_to_rgb ## -- Begin function stbi_convert_iphone_png_to_rgb
	.p2align	4, 0x90
_stbi_convert_iphone_png_to_rgb:        ## @stbi_convert_iphone_png_to_rgb
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, _stbi__de_iphone_flag_global(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi__unpremultiply_on_load_thread ## -- Begin function stbi__unpremultiply_on_load_thread
	.p2align	4, 0x90
_stbi__unpremultiply_on_load_thread:    ## @stbi__unpremultiply_on_load_thread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %ecx
	movq	_stbi__unpremultiply_on_load_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	movl	%ecx, (%rax)
	movq	_stbi__unpremultiply_on_load_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	movb	$1, (%rax)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_convert_iphone_png_to_rgb_thread ## -- Begin function stbi_convert_iphone_png_to_rgb_thread
	.p2align	4, 0x90
_stbi_convert_iphone_png_to_rgb_thread: ## @stbi_convert_iphone_png_to_rgb_thread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %ecx
	movq	_stbi__de_iphone_flag_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	movl	%ecx, (%rax)
	movq	_stbi__de_iphone_flag_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	movb	$1, (%rax)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_info              ## -- Begin function stbi_info
	.p2align	4, 0x90
_stbi_info:                             ## @stbi_info
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB38_1
## %bb.3:
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	callq	_stbi_info_from_file
	movl	%eax, %r14d
	movq	%rbx, %rdi
	callq	_fclose
	movl	%r14d, %eax
	jmp	LBB38_2
LBB38_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%eax, %eax
LBB38_2:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_info_from_file    ## -- Begin function stbi_info_from_file
	.p2align	4, 0x90
_stbi_info_from_file:                   ## @stbi_info_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$296, %rsp              ## imm = 0x128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, -280(%rbp)        ## 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r15
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	callq	_ftell
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -256(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rcx
	movq	%rcx, -248(%rbp)
	movq	_stbi__stdio_callbacks+16(%rip), %rcx
	movq	%rcx, -240(%rbp)
	movq	%r15, -232(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -224(%rbp)
	movl	$0, -88(%rbp)
	leaq	-216(%rbp), %rbx
	movq	%rbx, -64(%rbp)
	movq	%rbx, -80(%rbp)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-80(%rbp), %ecx
	subl	-64(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	testl	%eax, %eax
	je	LBB39_1
## %bb.2:
	movq	%rbx, -80(%rbp)
	cltq
	leaq	-216(%rbp,%rax), %rax
	jmp	LBB39_3
LBB39_1:
	movl	$0, -224(%rbp)
	movq	%rbx, -80(%rbp)
	leaq	-215(%rbp), %rax
	movb	$0, -216(%rbp)
LBB39_3:
	movq	%rax, -72(%rbp)
	movq	%rax, -56(%rbp)
	leaq	-272(%rbp), %rax
	movq	%rax, -328(%rbp)
	leaq	-328(%rbp), %rdi
	xorl	%r14d, %r14d
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB39_11
## %bb.4:
	testq	%r13, %r13
	je	LBB39_6
## %bb.5:
	movq	-328(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, (%r13)
LBB39_6:
	testq	%r12, %r12
	movq	-280(%rbp), %rcx        ## 8-byte Reload
	je	LBB39_8
## %bb.7:
	movq	-328(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r12)
LBB39_8:
	testq	%rcx, %rcx
	je	LBB39_10
## %bb.9:
	movq	-328(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, (%rcx)
LBB39_10:
	movl	$1, %r14d
	jmp	LBB39_12
LBB39_11:
	movq	-328(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
	leaq	L_.str.47(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB39_12:
	movq	%r15, %rdi
	movq	-288(%rbp), %rsi        ## 8-byte Reload
	xorl	%edx, %edx
	callq	_fseek
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB39_14
## %bb.13:
	movl	%r14d, %eax
	addq	$296, %rsp              ## imm = 0x128
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB39_14:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_16_bit         ## -- Begin function stbi_is_16_bit
	.p2align	4, 0x90
_stbi_is_16_bit:                        ## @stbi_is_16_bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB40_1
## %bb.3:
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_stbi_is_16_bit_from_file
	movl	%eax, %r14d
	movq	%rbx, %rdi
	callq	_fclose
	movl	%r14d, %eax
	jmp	LBB40_2
LBB40_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%eax, %eax
LBB40_2:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_16_bit_from_file ## -- Begin function stbi_is_16_bit_from_file
	.p2align	4, 0x90
_stbi_is_16_bit_from_file:              ## @stbi_is_16_bit_from_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$272, %rsp              ## imm = 0x110
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	callq	_ftell
	movq	%rax, %r14
	movq	_stbi__stdio_callbacks(%rip), %rax
	movq	%rax, -248(%rbp)
	movq	_stbi__stdio_callbacks+8(%rip), %rcx
	movq	%rcx, -240(%rbp)
	movq	_stbi__stdio_callbacks+16(%rip), %rcx
	movq	%rcx, -232(%rbp)
	movq	%r12, -224(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -216(%rbp)
	movl	$0, -80(%rbp)
	leaq	-208(%rbp), %rbx
	movq	%rbx, -56(%rbp)
	movq	%rbx, -72(%rbp)
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-72(%rbp), %ecx
	subl	-56(%rbp), %ecx
	addl	%ecx, -80(%rbp)
	testl	%eax, %eax
	je	LBB41_1
## %bb.2:
	movq	%rbx, -72(%rbp)
	cltq
	leaq	-208(%rbp,%rax), %rax
	jmp	LBB41_3
LBB41_1:
	movl	$0, -216(%rbp)
	movq	%rbx, -72(%rbp)
	leaq	-207(%rbp), %rax
	movb	$0, -208(%rbp)
LBB41_3:
	movq	%rax, -64(%rbp)
	movq	%rax, -48(%rbp)
	leaq	-264(%rbp), %rax
	movq	%rax, -304(%rbp)
	leaq	-304(%rbp), %rdi
	xorl	%r15d, %r15d
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB41_6
## %bb.4:
	cmpl	$16, -272(%rbp)
	jne	LBB41_6
## %bb.5:
	movl	$1, %r15d
	jmp	LBB41_7
LBB41_6:
	movq	-304(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
LBB41_7:
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	_fseek
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB41_9
## %bb.8:
	movl	%r15d, %eax
	addq	$272, %rsp              ## imm = 0x110
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB41_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_info_from_memory  ## -- Begin function stbi_info_from_memory
	.p2align	4, 0x90
_stbi_info_from_memory:                 ## @stbi_info_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$272, %rsp              ## imm = 0x110
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	$0, -248(%rbp)
	movl	$0, -216(%rbp)
	movl	$0, -80(%rbp)
	movq	%rdi, -56(%rbp)
	movq	%rdi, -72(%rbp)
	movslq	%esi, %rax
	addq	%rdi, %rax
	movq	%rax, -48(%rbp)
	movq	%rax, -64(%rbp)
	leaq	-264(%rbp), %rax
	movq	%rax, -304(%rbp)
	leaq	-304(%rbp), %rdi
	xorl	%ebx, %ebx
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB42_8
## %bb.1:
	testq	%r12, %r12
	je	LBB42_3
## %bb.2:
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, (%r12)
LBB42_3:
	testq	%r15, %r15
	je	LBB42_5
## %bb.4:
	movq	-304(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r15)
LBB42_5:
	testq	%r14, %r14
	je	LBB42_7
## %bb.6:
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, (%r14)
LBB42_7:
	movl	$1, %ebx
	jmp	LBB42_9
LBB42_8:
	movq	-304(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
	leaq	L_.str.47(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB42_9:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB42_11
## %bb.10:
	movl	%ebx, %eax
	addq	$272, %rsp              ## imm = 0x110
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB42_11:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_info_from_callbacks ## -- Begin function stbi_info_from_callbacks
	.p2align	4, 0x90
_stbi_info_from_callbacks:              ## @stbi_info_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$272, %rsp              ## imm = 0x110
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	16(%rdi), %rax
	movq	%rax, -232(%rbp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	%rcx, -240(%rbp)
	movq	%rax, -248(%rbp)
	movq	%rsi, -224(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -216(%rbp)
	movl	$0, -80(%rbp)
	leaq	-208(%rbp), %rbx
	movq	%rbx, -56(%rbp)
	movq	%rbx, -72(%rbp)
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-72(%rbp), %ecx
	subl	-56(%rbp), %ecx
	addl	%ecx, -80(%rbp)
	testl	%eax, %eax
	je	LBB43_1
## %bb.2:
	movq	%rbx, -72(%rbp)
	cltq
	leaq	-208(%rbp,%rax), %rax
	jmp	LBB43_3
LBB43_1:
	movl	$0, -216(%rbp)
	movq	%rbx, -72(%rbp)
	leaq	-207(%rbp), %rax
	movb	$0, -208(%rbp)
LBB43_3:
	movq	%rax, -64(%rbp)
	movq	%rax, -48(%rbp)
	leaq	-264(%rbp), %rax
	movq	%rax, -304(%rbp)
	leaq	-304(%rbp), %rdi
	xorl	%ebx, %ebx
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB43_11
## %bb.4:
	testq	%r12, %r12
	je	LBB43_6
## %bb.5:
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, (%r12)
LBB43_6:
	testq	%r15, %r15
	je	LBB43_8
## %bb.7:
	movq	-304(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r15)
LBB43_8:
	testq	%r14, %r14
	je	LBB43_10
## %bb.9:
	movq	-304(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, (%r14)
LBB43_10:
	movl	$1, %ebx
	jmp	LBB43_12
LBB43_11:
	movq	-304(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
	leaq	L_.str.47(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB43_12:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB43_14
## %bb.13:
	movl	%ebx, %eax
	addq	$272, %rsp              ## imm = 0x110
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB43_14:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_16_bit_from_memory ## -- Begin function stbi_is_16_bit_from_memory
	.p2align	4, 0x90
_stbi_is_16_bit_from_memory:            ## @stbi_is_16_bit_from_memory
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -224(%rbp)
	movl	$0, -192(%rbp)
	movl	$0, -56(%rbp)
	movq	%rdi, -32(%rbp)
	movq	%rdi, -48(%rbp)
	movslq	%esi, %rax
	addq	%rdi, %rax
	movq	%rax, -24(%rbp)
	movq	%rax, -40(%rbp)
	leaq	-240(%rbp), %rax
	movq	%rax, -280(%rbp)
	leaq	-280(%rbp), %rdi
	xorl	%ebx, %ebx
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB44_3
## %bb.1:
	cmpl	$16, -248(%rbp)
	jne	LBB44_3
## %bb.2:
	movl	$1, %ebx
	jmp	LBB44_4
LBB44_3:
	movq	-280(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
LBB44_4:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-16(%rbp), %rax
	jne	LBB44_6
## %bb.5:
	movl	%ebx, %eax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%rbp
	retq
LBB44_6:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbi_is_16_bit_from_callbacks ## -- Begin function stbi_is_16_bit_from_callbacks
	.p2align	4, 0x90
_stbi_is_16_bit_from_callbacks:         ## @stbi_is_16_bit_from_callbacks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rdi), %rax
	movq	%rax, -208(%rbp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	%rcx, -216(%rbp)
	movq	%rax, -224(%rbp)
	movq	%rsi, -200(%rbp)
	movabsq	$549755813889, %rcx     ## imm = 0x8000000001
	movq	%rcx, -192(%rbp)
	movl	$0, -56(%rbp)
	leaq	-184(%rbp), %rbx
	movq	%rbx, -32(%rbp)
	movq	%rbx, -48(%rbp)
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	movl	$128, %edx
	callq	*%rax
	movl	-48(%rbp), %ecx
	subl	-32(%rbp), %ecx
	addl	%ecx, -56(%rbp)
	testl	%eax, %eax
	je	LBB45_1
## %bb.2:
	movq	%rbx, -48(%rbp)
	cltq
	leaq	-184(%rbp,%rax), %rax
	jmp	LBB45_3
LBB45_1:
	movl	$0, -192(%rbp)
	movq	%rbx, -48(%rbp)
	leaq	-183(%rbp), %rax
	movb	$0, -184(%rbp)
LBB45_3:
	movq	%rax, -40(%rbp)
	movq	%rax, -24(%rbp)
	leaq	-240(%rbp), %rax
	movq	%rax, -280(%rbp)
	leaq	-280(%rbp), %rdi
	xorl	%ebx, %ebx
	movl	$2, %esi
	xorl	%edx, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB45_6
## %bb.4:
	cmpl	$16, -248(%rbp)
	jne	LBB45_6
## %bb.5:
	movl	$1, %ebx
	jmp	LBB45_7
LBB45_6:
	movq	-280(%rbp), %rax
	movups	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
LBB45_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-16(%rbp), %rax
	jne	LBB45_9
## %bb.8:
	movl	%ebx, %eax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%rbp
	retq
LBB45_9:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_FindGlyphIndex   ## -- Begin function stbtt_FindGlyphIndex
	.p2align	4, 0x90
_stbtt_FindGlyphIndex:                  ## @stbtt_FindGlyphIndex
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $esi killed $esi def $rsi
	movq	8(%rdi), %r12
	movl	56(%rdi), %r11d
	leaq	(%r12,%r11), %r13
	movzwl	(%r12,%r11), %r8d
	rolw	$8, %r8w
	cmpw	$6, %r8w
	ja	LBB46_11
## %bb.1:
	movzwl	%r8w, %eax
	leaq	LJTI46_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB46_2:
	movzbl	2(%r13), %eax
	shll	$8, %eax
	movzbl	3(%r13), %ecx
	leal	-6(%rax,%rcx), %ecx
	xorl	%eax, %eax
	cmpl	%esi, %ecx
	jle	LBB46_37
## %bb.3:
	movslq	%esi, %rax
	movzbl	6(%r13,%rax), %eax
	jmp	LBB46_37
LBB46_4:
	movzbl	6(%r13), %eax
	shll	$8, %eax
	movzbl	7(%r13), %edx
	orl	%eax, %edx
	xorl	%eax, %eax
	cmpl	%esi, %edx
	ja	LBB46_37
## %bb.5:
	movzbl	8(%r13), %ecx
	shll	$8, %ecx
	movzbl	9(%r13), %edi
	orl	%ecx, %edi
	addl	%edx, %edi
	cmpl	%esi, %edi
	jbe	LBB46_37
## %bb.6:
	subl	%edx, %esi
	addl	%esi, %esi
	movzbl	10(%r13,%rsi), %ecx
	shll	$8, %ecx
	movzbl	11(%r13,%rsi), %eax
	orl	%ecx, %eax
	jmp	LBB46_37
LBB46_7:
	xorl	%eax, %eax
	cmpl	$65535, %esi            ## imm = 0xFFFF
	jg	LBB46_37
## %bb.8:
	movzbl	6(%r13), %eax
	shlq	$8, %rax
	movzbl	7(%r13), %r8d
	orq	%rax, %r8
	leal	14(%r11), %r10d
	movzbl	12(%r12,%r11), %ecx
	shlq	$8, %rcx
	movzbl	10(%r12,%r11), %r14d
	shll	$8, %r14d
	movzbl	11(%r12,%r11), %eax
	movzbl	13(%r12,%r11), %edx
	andl	$-2, %edx
	orq	%rcx, %rdx
	addq	%r12, %r10
	movzbl	(%r10,%rdx), %ecx
	shll	$8, %ecx
	movzbl	1(%r10,%rdx), %edi
	orl	%ecx, %edi
	xorl	%ecx, %ecx
	cmpl	%esi, %edi
	cmovgl	%ecx, %edx
	orw	%ax, %r14w
	leal	12(%r11,%rdx), %r15d
	je	LBB46_21
## %bb.9:
	movzbl	8(%r13), %ecx
	shlq	$8, %rcx
	movzbl	9(%r13), %r9d
	orq	%rcx, %r9
	movzwl	%ax, %eax
	testb	$1, %al
	jne	LBB46_22
## %bb.10:
                                        ## implicit-def: $eax
	movl	%r14d, %ebx
	cmpw	$1, %r14w
	jne	LBB46_23
	jmp	LBB46_29
LBB46_11:
	movl	%r8d, %eax
	andl	$65534, %eax            ## imm = 0xFFFE
	cmpw	$12, %ax
	jne	LBB46_39
## %bb.12:
	movl	12(%r13), %ebx
	bswapl	%ebx
	testl	%ebx, %ebx
	jle	LBB46_19
## %bb.13:
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB46_14:                               ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %eax
	subl	%edx, %eax
	sarl	%eax
	addl	%edx, %eax
	movslq	%eax, %rcx
	shlq	$2, %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movl	16(%r13,%rcx), %edi
	bswapl	%edi
	cmpl	%esi, %edi
	jbe	LBB46_16
## %bb.15:                              ##   in Loop: Header=BB46_14 Depth=1
	movl	%eax, %ebx
	cmpl	%edx, %ebx
	jg	LBB46_14
	jmp	LBB46_19
	.p2align	4, 0x90
LBB46_16:                               ##   in Loop: Header=BB46_14 Depth=1
	movl	20(%r13,%rcx), %edx
	bswapl	%edx
	cmpl	%esi, %edx
	jae	LBB46_20
## %bb.17:                              ##   in Loop: Header=BB46_14 Depth=1
	incl	%eax
	movl	%eax, %edx
	cmpl	%edx, %ebx
	jg	LBB46_14
LBB46_19:
	xorl	%eax, %eax
	jmp	LBB46_37
LBB46_20:
	subl	%edi, %esi
	xorl	%eax, %eax
	cmpw	$12, %r8w
	movl	24(%r13,%rcx), %ecx
	bswapl	%ecx
	cmovel	%esi, %eax
	addl	%ecx, %eax
	jmp	LBB46_37
LBB46_21:
	movl	%r15d, %eax
	jmp	LBB46_29
LBB46_22:
	shrq	%r9
	movl	%r15d, %ecx
	addq	%r12, %rcx
	movl	%r9d, %eax
	andl	$-2, %eax
	movzbl	(%rax,%rcx), %edi
	shll	$8, %edi
	movzbl	1(%rax,%rcx), %ecx
	orl	%edi, %ecx
	xorl	%edi, %edi
	cmpl	%esi, %ecx
	cmovgel	%edi, %eax
	addl	%r15d, %eax
	leal	-1(%r14), %ebx
	movl	%eax, %r15d
	cmpw	$1, %r14w
	je	LBB46_29
LBB46_23:
	movl	%r15d, %eax
	.p2align	4, 0x90
LBB46_24:                               ## =>This Inner Loop Header: Depth=1
	movzwl	%r9w, %r9d
	movl	%r9d, %edi
	shrl	%edi
	movl	%eax, %ecx
	addq	%r12, %rcx
	andl	$-2, %edi
	movzbl	(%rdi,%rcx), %edx
	shll	$8, %edx
	movzbl	1(%rdi,%rcx), %ecx
	orl	%edx, %ecx
	cmpl	%esi, %ecx
	jl	LBB46_26
## %bb.25:                              ##   in Loop: Header=BB46_24 Depth=1
	xorl	%edi, %edi
LBB46_26:                               ##   in Loop: Header=BB46_24 Depth=1
	addl	%eax, %edi
	shrl	$2, %r9d
	leaq	(%r12,%rdi), %rcx
	movl	%r9d, %eax
	andl	$-2, %eax
	movzbl	(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	1(%rax,%rcx), %ecx
	orl	%edx, %ecx
	cmpl	%esi, %ecx
	jl	LBB46_28
## %bb.27:                              ##   in Loop: Header=BB46_24 Depth=1
	xorl	%eax, %eax
LBB46_28:                               ##   in Loop: Header=BB46_24 Depth=1
	addl	%edi, %eax
	addw	$-2, %bx
	jne	LBB46_24
LBB46_29:
	movl	$131058, %ecx           ## imm = 0x1FFF2
	subl	%r11d, %ecx
	leal	2(%rcx,%rax), %eax
	movl	%r8d, %ecx
	andl	$-2, %ecx
	leaq	14(%r13,%rcx), %rcx
	andl	$131070, %eax           ## imm = 0x1FFFE
	movzbl	2(%rax,%rcx), %edi
	shll	$8, %edi
	movzbl	3(%rax,%rcx), %edx
	orl	%edi, %edx
	cmpl	%esi, %edx
	jg	LBB46_34
## %bb.30:
	movzbl	(%r10,%rax), %ecx
	shll	$8, %ecx
	movzbl	1(%r10,%rax), %edi
	orl	%ecx, %edi
	cmpl	%esi, %edi
	movl	$0, %ecx
	jl	LBB46_36
## %bb.31:
	shrl	%r8d
	addq	$14, %r13
	movl	%r8d, %ebx
	leaq	(%rbx,%rbx), %rcx
	leaq	(%rcx,%rcx,2), %r8
	leaq	(%r13,%r8), %rcx
	movzbl	2(%rax,%rcx), %edi
	shlq	$8, %rdi
	movzbl	3(%rax,%rcx), %ecx
	orq	%rdi, %rcx
	testw	%cx, %cx
	je	LBB46_35
## %bb.32:
	addq	%rcx, %r12
	subl	%edx, %esi
	addl	%esi, %esi
	movslq	%esi, %rcx
	addq	%r12, %rcx
	addq	%r11, %rcx
	addq	%r8, %rcx
	movzbl	16(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	17(%rax,%rcx), %ecx
	orl	%edx, %ecx
	jmp	LBB46_36
LBB46_34:
	xorl	%ecx, %ecx
	jmp	LBB46_36
LBB46_35:
	leaq	(%r13,%rbx,4), %rcx
	movzbl	2(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	3(%rax,%rcx), %ecx
	orl	%edx, %ecx
	addl	%esi, %ecx
LBB46_36:
	movzwl	%cx, %eax
LBB46_37:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB46_38:
	leaq	L___func__.stbtt_FindGlyphIndex(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1514, %edx             ## imm = 0x5EA
	callq	___assert_rtn
LBB46_39:
	leaq	L___func__.stbtt_FindGlyphIndex(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1585, %edx             ## imm = 0x631
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L46_0_set_2, LBB46_2-LJTI46_0
.set L46_0_set_11, LBB46_11-LJTI46_0
.set L46_0_set_38, LBB46_38-LJTI46_0
.set L46_0_set_7, LBB46_7-LJTI46_0
.set L46_0_set_4, LBB46_4-LJTI46_0
LJTI46_0:
	.long	L46_0_set_2
	.long	L46_0_set_11
	.long	L46_0_set_38
	.long	L46_0_set_11
	.long	L46_0_set_7
	.long	L46_0_set_11
	.long	L46_0_set_4
	.end_data_region
                                        ## -- End function
	.globl	_stbtt_GetCodepointShape ## -- Begin function stbtt_GetCodepointShape
	.p2align	4, 0x90
_stbtt_GetCodepointShape:               ## @stbtt_GetCodepointShape
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdx, %r14
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movl	%eax, %esi
	movq	%r14, %rdx
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_stbtt_GetGlyphShape    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt_GetGlyphShape
LCPI48_0:
	.long	947912704               ## float 6.10351563E-5
LCPI48_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetGlyphShape
	.p2align	4, 0x90
_stbtt_GetGlyphShape:                   ## @stbtt_GetGlyphShape
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movl	%esi, %r15d
	movq	%rdi, %rbx
	cmpl	$0, 76(%rdi)
	je	LBB48_1
## %bb.96:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -224(%rbp)
	movaps	%xmm0, -240(%rbp)
	movq	$0, -208(%rbp)
	movl	$1, -256(%rbp)
	movaps	%xmm0, -288(%rbp)
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -320(%rbp)
	movq	$0, -272(%rbp)
	leaq	-256(%rbp), %rdx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt__run_charstring
	testl	%eax, %eax
	je	LBB48_100
## %bb.97:
	movslq	-208(%rbp), %rax
	movq	%rax, %rdi
	shlq	$4, %rdi
	subq	%rax, %rdi
	subq	%rax, %rdi
	callq	_malloc
	movq	%rax, (%r12)
	movq	%rax, -280(%rbp)
	leaq	-320(%rbp), %rdx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt__run_charstring
	testl	%eax, %eax
	je	LBB48_100
## %bb.98:
	movl	-272(%rbp), %eax
	movq	%rax, %r15
	cmpl	-208(%rbp), %eax
	je	LBB48_102
## %bb.99:
	leaq	L___func__.stbtt__GetGlyphShapeT2(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.97(%rip), %rcx
	movl	$2278, %edx             ## imm = 0x8E6
	callq	___assert_rtn
LBB48_100:
	movq	$0, (%r12)
LBB48_101:
	xorl	%r15d, %r15d
	jmp	LBB48_102
LBB48_1:
	movq	8(%rbx), %r14
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt__GetGlyfOffset
	movq	$0, (%r12)
	xorl	%r15d, %r15d
	testl	%eax, %eax
	js	LBB48_102
## %bb.2:
	cltq
	leaq	(%r14,%rax), %rdi
	movzbl	(%r14,%rax), %ecx
	shll	$8, %ecx
	movzbl	1(%r14,%rax), %eax
	movswq	%cx, %r14
	orq	%rax, %r14
	testw	%r14w, %r14w
	movq	%r12, -192(%rbp)        ## 8-byte Spill
	jle	LBB48_59
## %bb.3:
	leaq	(%r14,%r14), %rdx
	movzbl	10(%rdi,%r14,2), %ebx
	movzbl	11(%rdi,%r14,2), %eax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movzbl	8(%rdi,%r14,2), %eax
	shlq	$8, %rax
	movzbl	9(%rdi,%r14,2), %ecx
	orq	%rax, %rcx
	movq	%rcx, -144(%rbp)        ## 8-byte Spill
	movq	%rdx, -184(%rbp)        ## 8-byte Spill
	leal	1(%rdx,%rcx), %eax
	movl	%eax, %ecx
	shll	$4, %ecx
	subl	%eax, %ecx
	subl	%eax, %ecx
	movq	%rdi, %r12
	movslq	%ecx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB48_102
## %bb.4:
	movq	%rax, %r13
	leaq	10(%r12,%r14,2), %rax
	addq	$10, %r12
	movq	%r12, -88(%rbp)         ## 8-byte Spill
	shlq	$8, %rbx
	addq	-80(%rbp), %rbx         ## 8-byte Folded Reload
	leaq	2(%rax,%rbx), %r9
	movq	-184(%rbp), %r12        ## 8-byte Reload
	movq	%r12, %r8
	shlq	$4, %r8
	subq	%r12, %r8
	subq	%r12, %r8
	leaq	12(%r13,%r8), %rsi
	movq	$-1, %rcx
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB48_5:                                ## =>This Inner Loop Header: Depth=1
	testb	%bl, %bl
	je	LBB48_6
## %bb.9:                               ##   in Loop: Header=BB48_5 Depth=1
	decb	%bl
	jmp	LBB48_10
	.p2align	4, 0x90
LBB48_6:                                ##   in Loop: Header=BB48_5 Depth=1
	movzbl	(%r9), %edi
	testb	$8, %dil
	jne	LBB48_8
## %bb.7:                               ##   in Loop: Header=BB48_5 Depth=1
	incq	%r9
	xorl	%ebx, %ebx
	jmp	LBB48_10
LBB48_8:                                ##   in Loop: Header=BB48_5 Depth=1
	movzbl	1(%r9), %ebx
	addq	$2, %r9
	.p2align	4, 0x90
LBB48_10:                               ##   in Loop: Header=BB48_5 Depth=1
	movb	%dil, (%rsi)
	incq	%rcx
	addq	$14, %rsi
	cmpq	%rcx, -144(%rbp)        ## 8-byte Folded Reload
	jne	LBB48_5
## %bb.11:
	leaq	(%r13,%r8), %rsi
	xorl	%r10d, %r10d
	movq	$-1, %rbx
	.p2align	4, 0x90
LBB48_12:                               ## =>This Inner Loop Header: Depth=1
	movzbl	12(%rsi), %edx
	testb	$2, %dl
	jne	LBB48_13
## %bb.14:                              ##   in Loop: Header=BB48_12 Depth=1
	testb	$16, %dl
	jne	LBB48_16
## %bb.15:                              ##   in Loop: Header=BB48_12 Depth=1
	movzbl	(%r9), %eax
	shll	$8, %eax
	movzbl	1(%r9), %edx
	cwtl
	orl	%edx, %eax
	addl	%eax, %r10d
	addq	$2, %r9
	jmp	LBB48_16
	.p2align	4, 0x90
LBB48_13:                               ##   in Loop: Header=BB48_12 Depth=1
	movzbl	(%r9), %edi
	incq	%r9
	movl	%edi, %eax
	negl	%eax
	testb	$16, %dl
	cmovnel	%edi, %eax
	addl	%eax, %r10d
LBB48_16:                               ##   in Loop: Header=BB48_12 Depth=1
	movw	%r10w, (%rsi)
	addq	$14, %rsi
	incq	%rbx
	cmpq	%rbx, %rcx
	jne	LBB48_12
## %bb.17:
	leaq	12(%r13,%r8), %rdx
	xorl	%r8d, %r8d
	movq	$-1, %rdi
	.p2align	4, 0x90
LBB48_18:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx), %ebx
	testb	$4, %bl
	jne	LBB48_19
## %bb.20:                              ##   in Loop: Header=BB48_18 Depth=1
	testb	$32, %bl
	jne	LBB48_22
## %bb.21:                              ##   in Loop: Header=BB48_18 Depth=1
	movzbl	(%r9), %eax
	shll	$8, %eax
	movzbl	1(%r9), %esi
	cwtl
	orl	%esi, %eax
	addl	%eax, %r8d
	addq	$2, %r9
	jmp	LBB48_22
	.p2align	4, 0x90
LBB48_19:                               ##   in Loop: Header=BB48_18 Depth=1
	movzbl	(%r9), %esi
	incq	%r9
	movl	%esi, %eax
	negl	%eax
	testb	$32, %bl
	cmovnel	%esi, %eax
	addl	%eax, %r8d
LBB48_22:                               ##   in Loop: Header=BB48_18 Depth=1
	movw	%r8w, -10(%rdx)
	addq	$14, %rdx
	incq	%rdi
	cmpq	%rdi, %rcx
	jne	LBB48_18
## %bb.23:
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movq	%rcx, -128(%rbp)        ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	movl	$0, -176(%rbp)          ## 4-byte Folded Spill
	movl	$0, -160(%rbp)          ## 4-byte Folded Spill
	xorl	%ecx, %ecx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB48_24:                               ## =>This Inner Loop Header: Depth=1
	movq	%r12, %r9
	leal	(%rax,%r12), %ecx
	movslq	%ecx, %r11
	movq	%r11, %rcx
	shlq	$4, %rcx
	subq	%r11, %rcx
	subq	%r11, %rcx
	movzbl	12(%r13,%rcx), %r14d
	movzwl	(%r13,%rcx), %r12d
	movzwl	2(%r13,%rcx), %edx
	movswl	%r12w, %r15d
	movswl	%dx, %r8d
	cmpl	%eax, %esi
	jne	LBB48_43
## %bb.25:                              ##   in Loop: Header=BB48_24 Depth=1
	testl	%eax, %eax
	je	LBB48_26
## %bb.27:                              ##   in Loop: Header=BB48_24 Depth=1
	testl	%ebx, %ebx
	je	LBB48_32
## %bb.28:                              ##   in Loop: Header=BB48_24 Depth=1
	testl	%edi, %edi
	je	LBB48_29
## %bb.30:                              ##   in Loop: Header=BB48_24 Depth=1
	movslq	%r10d, %rcx
	incl	%r10d
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	leal	(%rdx,%rbx), %esi
	shrl	%esi
	movq	-56(%rbp), %r9          ## 8-byte Reload
	movq	-128(%rbp), %r12        ## 8-byte Reload
	leal	(%r12,%r9), %edi
	shrl	%edi
	movq	%rcx, %rdx
	shlq	$4, %rdx
	subq	%rcx, %rdx
	subq	%rcx, %rdx
	movb	$3, 12(%r13,%rdx)
	movw	%si, (%r13,%rdx)
	movw	%di, 2(%r13,%rdx)
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movw	%bx, 4(%r13,%rdx)
	movw	%r9w, 6(%r13,%rdx)
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	jmp	LBB48_31
	.p2align	4, 0x90
LBB48_43:                               ##   in Loop: Header=BB48_24 Depth=1
	testb	$1, %r14b
	jne	LBB48_47
## %bb.44:                              ##   in Loop: Header=BB48_24 Depth=1
	testl	%edi, %edi
	je	LBB48_45
## %bb.46:                              ##   in Loop: Header=BB48_24 Depth=1
	movslq	%r10d, %rdi
	incl	%r10d
	movq	-48(%rbp), %r11         ## 8-byte Reload
	leal	(%r11,%r15), %edx
	shrl	%edx
	movl	%ebx, %r12d
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movl	%esi, %r14d
	leal	(%rbx,%r8), %esi
	shrl	%esi
	movq	%rdi, %rcx
	shlq	$4, %rcx
	subq	%rdi, %rcx
	subq	%rdi, %rcx
	movb	$3, 12(%r13,%rcx)
	movw	%dx, (%r13,%rcx)
	movw	%si, 2(%r13,%rcx)
	movl	%r14d, %esi
	movw	%r11w, 4(%r13,%rcx)
	movw	%bx, 6(%r13,%rcx)
	movl	%r12d, %ebx
LBB48_45:                               ##   in Loop: Header=BB48_24 Depth=1
	movl	$1, %edi
                                        ## kill: def $r15d killed $r15d killed $r15 def $r15
	movq	%r15, -48(%rbp)         ## 8-byte Spill
                                        ## kill: def $r8d killed $r8d killed $r8 def $r8
	movq	%r8, -56(%rbp)          ## 8-byte Spill
	movq	%r9, %r12
	jmp	LBB48_51
	.p2align	4, 0x90
LBB48_47:                               ##   in Loop: Header=BB48_24 Depth=1
	movl	%ebx, %r11d
	movl	%esi, %r8d
	movslq	%r10d, %rsi
	incl	%r10d
	movq	%rsi, %rcx
	shlq	$4, %rcx
	subq	%rsi, %rcx
	subq	%rsi, %rcx
	leaq	(%r13,%rcx), %rsi
	leaq	12(%r13,%rcx), %rbx
	testl	%edi, %edi
	jne	LBB48_48
## %bb.49:                              ##   in Loop: Header=BB48_24 Depth=1
	movb	$2, (%rbx)
	movw	%r12w, (%rsi)
	movw	%dx, 2(%r13,%rcx)
	movl	$0, 4(%r13,%rcx)
	jmp	LBB48_50
LBB48_26:                               ##   in Loop: Header=BB48_24 Depth=1
	movq	%r9, %r12
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	jmp	LBB48_37
LBB48_32:                               ##   in Loop: Header=BB48_24 Depth=1
	movq	%r9, %r12
	movslq	%r10d, %rsi
	incl	%r10d
	movq	%rsi, %rdx
	shlq	$4, %rdx
	subq	%rsi, %rdx
	subq	%rsi, %rdx
	leaq	(%r13,%rdx), %rcx
	leaq	12(%r13,%rdx), %rbx
	testl	%edi, %edi
	je	LBB48_34
## %bb.33:                              ##   in Loop: Header=BB48_24 Depth=1
	movb	$3, (%rbx)
	movl	-160(%rbp), %edi        ## 4-byte Reload
	movw	%di, (%rcx)
	movl	-176(%rbp), %ecx        ## 4-byte Reload
	movw	%cx, 2(%r13,%rdx)
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movw	%cx, 4(%r13,%rdx)
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %edx
	jmp	LBB48_35
LBB48_48:                               ##   in Loop: Header=BB48_24 Depth=1
	movb	$3, (%rbx)
	movw	%r12w, (%rsi)
	movw	%dx, 2(%r13,%rcx)
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movw	%dx, 4(%r13,%rcx)
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movw	%dx, 6(%r13,%rcx)
LBB48_50:                               ##   in Loop: Header=BB48_24 Depth=1
	xorl	%edi, %edi
	movq	%r9, %r12
	movl	%r8d, %esi
	movl	%r11d, %ebx
	jmp	LBB48_51
LBB48_29:                               ##   in Loop: Header=BB48_24 Depth=1
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	movq	-128(%rbp), %r12        ## 8-byte Reload
	movq	-80(%rbp), %rdi         ## 8-byte Reload
LBB48_31:                               ##   in Loop: Header=BB48_24 Depth=1
	movslq	%r10d, %rsi
	incl	%r10d
	movq	%rsi, %rcx
	shlq	$4, %rcx
	subq	%rsi, %rcx
	subq	%rsi, %rcx
	movb	$3, 12(%r13,%rcx)
	movl	-160(%rbp), %edx        ## 4-byte Reload
	movw	%dx, (%r13,%rcx)
	movl	-176(%rbp), %edx        ## 4-byte Reload
	movw	%dx, 2(%r13,%rcx)
	movw	%di, 4(%r13,%rcx)
	movl	%r12d, %edx
	movq	-184(%rbp), %r12        ## 8-byte Reload
	jmp	LBB48_36
LBB48_34:                               ##   in Loop: Header=BB48_24 Depth=1
	movb	$2, (%rbx)
	movl	-160(%rbp), %edi        ## 4-byte Reload
	movw	%di, (%rcx)
	movl	-176(%rbp), %ecx        ## 4-byte Reload
	movw	%cx, 2(%r13,%rdx)
	movw	$0, 4(%r13,%rdx)
	xorl	%edx, %edx
LBB48_35:                               ##   in Loop: Header=BB48_24 Depth=1
	movq	-112(%rbp), %rbx        ## 8-byte Reload
LBB48_36:                               ##   in Loop: Header=BB48_24 Depth=1
	movq	%rsi, %rcx
	shlq	$4, %rcx
	subq	%rsi, %rcx
	subq	%rsi, %rcx
	movw	%dx, 6(%r13,%rcx)
LBB48_37:                               ##   in Loop: Header=BB48_24 Depth=1
	andl	$1, %r14d
	testb	%r14b, %r14b
	je	LBB48_39
## %bb.38:                              ##   in Loop: Header=BB48_24 Depth=1
	movl	%r15d, %edi
	movl	%r8d, %esi
	movq	-80(%rbp), %r15         ## 8-byte Reload
                                        ## kill: def $r15d killed $r15d killed $r15 def $r15
	movq	-128(%rbp), %r8         ## 8-byte Reload
                                        ## kill: def $r8d killed $r8d killed $r8 def $r8
	jmp	LBB48_42
LBB48_39:                               ##   in Loop: Header=BB48_24 Depth=1
	incq	%r11
	movq	%r11, %rdx
	shlq	$4, %rdx
	subq	%r11, %rdx
	subq	%r11, %rdx
	movswl	(%r13,%rdx), %edi
	testb	$1, 12(%r13,%rdx)
	jne	LBB48_41
## %bb.40:                              ##   in Loop: Header=BB48_24 Depth=1
	addl	%r15d, %edi
	sarl	%edi
	movswl	2(%r13,%rdx), %esi
	addl	%r8d, %esi
	sarl	%esi
	jmp	LBB48_42
LBB48_41:                               ##   in Loop: Header=BB48_24 Depth=1
	movswl	2(%r13,%rdx), %esi
	incl	%eax
	.p2align	4, 0x90
LBB48_42:                               ##   in Loop: Header=BB48_24 Depth=1
	xorl	$1, %r14d
	movslq	%r10d, %rcx
	incl	%r10d
	movq	%rcx, %rdx
	shlq	$4, %rdx
	subq	%rcx, %rdx
	subq	%rcx, %rdx
	movb	$1, 12(%r13,%rdx)
	movl	%edi, -160(%rbp)        ## 4-byte Spill
	movw	%di, (%r13,%rdx)
	movl	%esi, -176(%rbp)        ## 4-byte Spill
	movw	%si, 2(%r13,%rdx)
	movl	$0, 4(%r13,%rdx)
	movslq	%ebx, %rbx
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	movzbl	(%rdx,%rbx,2), %ecx
	shll	$8, %ecx
	movzbl	1(%rdx,%rbx,2), %edx
	leal	1(%rcx,%rdx), %esi
	incl	%ebx
	movq	%rbx, -112(%rbp)        ## 8-byte Spill
	xorl	%edi, %edi
	movl	%r14d, %ebx
                                        ## kill: def $r15d killed $r15d killed $r15 def $r15
	movq	%r15, -80(%rbp)         ## 8-byte Spill
                                        ## kill: def $r8d killed $r8d killed $r8 def $r8
	movq	%r8, -128(%rbp)         ## 8-byte Spill
LBB48_51:                               ##   in Loop: Header=BB48_24 Depth=1
	leal	1(%rax), %ecx
	cmpl	-144(%rbp), %eax        ## 4-byte Folded Reload
	movl	%ecx, %eax
	jl	LBB48_24
## %bb.52:
	testl	%ebx, %ebx
	je	LBB48_57
## %bb.53:
	testl	%edi, %edi
	je	LBB48_54
## %bb.55:
	movslq	%r10d, %rax
	incl	%r10d
	movq	-48(%rbp), %r8          ## 8-byte Reload
	movq	-80(%rbp), %r9          ## 8-byte Reload
	leal	(%r9,%r8), %ecx
	shrl	%ecx
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	leal	(%rbx,%rdi), %edx
	shrl	%edx
	movq	%rax, %rsi
	shlq	$4, %rsi
	subq	%rax, %rsi
	subq	%rax, %rsi
	movb	$3, 12(%r13,%rsi)
	movw	%cx, (%r13,%rsi)
	movw	%dx, 2(%r13,%rsi)
	movw	%r8w, 4(%r13,%rsi)
	movw	%di, 6(%r13,%rsi)
	movl	-176(%rbp), %edx        ## 4-byte Reload
	movl	-160(%rbp), %esi        ## 4-byte Reload
	jmp	LBB48_56
LBB48_59:
	testw	%r14w, %r14w
	js	LBB48_61
## %bb.60:
	xorl	%r10d, %r10d
	xorl	%r13d, %r13d
	jmp	LBB48_95
LBB48_57:
	movslq	%r10d, %rcx
	incl	%r10d
	movq	%rcx, %rax
	shlq	$4, %rax
	subq	%rcx, %rax
	subq	%rcx, %rax
	leaq	12(%r13,%rax), %rdx
	leaq	(%r13,%rax), %rcx
	testl	%edi, %edi
	je	LBB48_94
## %bb.58:
	movb	$3, (%rdx)
	movl	-160(%rbp), %edx        ## 4-byte Reload
	movw	%dx, (%rcx)
	movl	-176(%rbp), %ecx        ## 4-byte Reload
	movw	%cx, 2(%r13,%rax)
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movw	%cx, 4(%r13,%rax)
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movw	%cx, 6(%r13,%rax)
	jmp	LBB48_95
LBB48_61:
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	addq	$10, %rdi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB48_62:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB48_79 Depth 2
                                        ##     Child Loop BB48_82 Depth 2
	movq	$0, -256(%rbp)
	movzbl	1(%rdi), %ebx
	testb	$2, %bl
	je	LBB48_65
## %bb.63:                              ##   in Loop: Header=BB48_62 Depth=1
	movzbl	2(%rdi), %esi
	shll	$8, %esi
	movzbl	3(%rdi), %eax
	movzbl	4(%rdi), %ecx
	testb	$1, %bl
	jne	LBB48_64
## %bb.66:                              ##   in Loop: Header=BB48_62 Depth=1
	movsbl	%cl, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movsbl	5(%rdi), %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	movl	$6, %ecx
	jmp	LBB48_67
	.p2align	4, 0x90
LBB48_64:                               ##   in Loop: Header=BB48_62 Depth=1
	movzwl	%cx, %ecx
	shll	$8, %ecx
	movzbl	5(%rdi), %edx
	orl	%ecx, %edx
	movswl	%dx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movzwl	6(%rdi), %ecx
	rolw	$8, %cx
	movswl	%cx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	movl	$8, %ecx
LBB48_67:                               ##   in Loop: Header=BB48_62 Depth=1
	orl	%eax, %esi
	addq	%rcx, %rdi
	testb	$8, %bl
	movaps	%xmm0, -176(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -160(%rbp)       ## 16-byte Spill
	jne	LBB48_68
## %bb.69:                              ##   in Loop: Header=BB48_62 Depth=1
	testb	$64, %bl
	jne	LBB48_70
## %bb.71:                              ##   in Loop: Header=BB48_62 Depth=1
	testb	%bl, %bl
	js	LBB48_73
## %bb.72:                              ##   in Loop: Header=BB48_62 Depth=1
	xorps	%xmm2, %xmm2
	movaps	%xmm2, -80(%rbp)        ## 16-byte Spill
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	movss	LCPI48_1(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, -128(%rbp)       ## 16-byte Spill
	xorps	%xmm1, %xmm1
	movaps	%xmm1, -112(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	jmp	LBB48_74
	.p2align	4, 0x90
LBB48_68:                               ##   in Loop: Header=BB48_62 Depth=1
	movzwl	(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	LCPI48_0(%rip), %xmm1
	addq	$2, %rdi
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -128(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -144(%rbp)       ## 16-byte Spill
	jmp	LBB48_74
LBB48_70:                               ##   in Loop: Header=BB48_62 Depth=1
	movzwl	(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movzwl	2(%rdi), %eax
	movss	LCPI48_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm1
	movaps	%xmm1, -144(%rbp)       ## 16-byte Spill
	rolw	$8, %ax
	cwtl
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	movaps	%xmm1, -128(%rbp)       ## 16-byte Spill
	addq	$4, %rdi
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	jmp	LBB48_74
LBB48_73:                               ##   in Loop: Header=BB48_62 Depth=1
	movzwl	(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movzwl	2(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	movzwl	4(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movss	LCPI48_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm1
	movaps	%xmm1, -144(%rbp)       ## 16-byte Spill
	movzwl	6(%rdi), %eax
	rolw	$8, %ax
	cwtl
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm3
	movaps	%xmm3, -112(%rbp)       ## 16-byte Spill
	mulss	%xmm0, %xmm2
	movaps	%xmm2, -80(%rbp)        ## 16-byte Spill
	mulss	%xmm0, %xmm1
	movaps	%xmm1, -128(%rbp)       ## 16-byte Spill
	addq	$8, %rdi
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB48_74:                               ##   in Loop: Header=BB48_62 Depth=1
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	leaq	-256(%rbp), %rdx
	callq	_stbtt_GetGlyphShape
                                        ## kill: def $eax killed $eax def $rax
	testl	%eax, %eax
	jle	LBB48_75
## %bb.76:                              ##   in Loop: Header=BB48_62 Depth=1
	movl	%ebx, -56(%rbp)         ## 4-byte Spill
	movaps	-144(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, %xmm0
	mulss	%xmm6, %xmm0
	movaps	-112(%rbp), %xmm12      ## 16-byte Reload
	movaps	%xmm12, %xmm1
	mulss	%xmm12, %xmm1
	addss	%xmm0, %xmm1
	sqrtss	%xmm1, %xmm14
	movaps	-80(%rbp), %xmm7        ## 16-byte Reload
	movaps	%xmm7, %xmm1
	mulss	%xmm7, %xmm1
	movaps	-128(%rbp), %xmm13      ## 16-byte Reload
	movaps	%xmm13, %xmm2
	mulss	%xmm13, %xmm2
	addss	%xmm1, %xmm2
	sqrtss	%xmm2, %xmm15
	movq	-256(%rbp), %r8
	movl	%eax, %ebx
	cmpl	$5, %eax
	jae	LBB48_78
## %bb.77:                              ##   in Loop: Header=BB48_62 Depth=1
	xorl	%ecx, %ecx
	movaps	-176(%rbp), %xmm0       ## 16-byte Reload
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	jmp	LBB48_81
	.p2align	4, 0x90
LBB48_75:                               ##   in Loop: Header=BB48_62 Depth=1
	movl	%r14d, %r10d
	jmp	LBB48_93
	.p2align	4, 0x90
LBB48_78:                               ##   in Loop: Header=BB48_62 Depth=1
	movl	%ebx, %edx
	andl	$3, %edx
	testq	%rdx, %rdx
	movl	$4, %ecx
	cmoveq	%rcx, %rdx
	movq	%rbx, %rcx
	subq	%rdx, %rcx
	movaps	%xmm6, %xmm8
	shufps	$0, %xmm6, %xmm8        ## xmm8 = xmm8[0,0],xmm6[0,0]
	movaps	%xmm7, %xmm9
	shufps	$0, %xmm7, %xmm9        ## xmm9 = xmm9[0,0],xmm7[0,0]
	movaps	-176(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, %xmm10
	shufps	$0, %xmm0, %xmm10       ## xmm10 = xmm10[0,0],xmm0[0,0]
	movaps	%xmm14, %xmm11
	shufps	$0, %xmm14, %xmm11      ## xmm11 = xmm11[0,0],xmm14[0,0]
	shufps	$0, %xmm12, %xmm12      ## xmm12 = xmm12[0,0,0,0]
	shufps	$0, %xmm13, %xmm13      ## xmm13 = xmm13[0,0,0,0]
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, %xmm2
	shufps	$0, %xmm1, %xmm2        ## xmm2 = xmm2[0,0],xmm1[0,0]
	movaps	%xmm15, %xmm3
	shufps	$0, %xmm15, %xmm3       ## xmm3 = xmm3[0,0],xmm15[0,0]
	leaq	48(%r8), %rdx
	movq	%rcx, %rsi
	.p2align	4, 0x90
LBB48_79:                               ##   Parent Loop BB48_62 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	-48(%rdx), %edi
	movd	%edi, %xmm4
	pinsrw	$1, -34(%rdx), %xmm4
	pinsrw	$2, -20(%rdx), %xmm4
	pinsrw	$3, -6(%rdx), %xmm4
	pmovsxwd	%xmm4, %xmm4
	cvtdq2ps	%xmm4, %xmm4
	movaps	%xmm8, %xmm5
	mulps	%xmm4, %xmm5
	movzwl	-46(%rdx), %edi
	movd	%edi, %xmm6
	pinsrw	$1, -32(%rdx), %xmm6
	pinsrw	$2, -18(%rdx), %xmm6
	pinsrw	$3, -4(%rdx), %xmm6
	pmovsxwd	%xmm6, %xmm6
	cvtdq2ps	%xmm6, %xmm6
	movaps	%xmm9, %xmm7
	mulps	%xmm6, %xmm7
	addps	%xmm5, %xmm7
	addps	%xmm10, %xmm7
	mulps	%xmm11, %xmm7
	cvttps2dq	%xmm7, %xmm5
	pextrw	$0, %xmm5, -48(%rdx)
	pextrw	$2, %xmm5, -34(%rdx)
	pextrw	$4, %xmm5, -20(%rdx)
	pextrw	$6, %xmm5, -6(%rdx)
	mulps	%xmm12, %xmm4
	mulps	%xmm13, %xmm6
	addps	%xmm4, %xmm6
	addps	%xmm2, %xmm6
	mulps	%xmm3, %xmm6
	cvttps2dq	%xmm6, %xmm4
	pextrw	$0, %xmm4, -46(%rdx)
	pextrw	$2, %xmm4, -32(%rdx)
	pextrw	$4, %xmm4, -18(%rdx)
	pextrw	$6, %xmm4, -4(%rdx)
	movzwl	-44(%rdx), %edi
	movd	%edi, %xmm4
	pinsrw	$1, -30(%rdx), %xmm4
	pinsrw	$2, -16(%rdx), %xmm4
	pinsrw	$3, -2(%rdx), %xmm4
	pmovsxwd	%xmm4, %xmm4
	cvtdq2ps	%xmm4, %xmm4
	movaps	%xmm8, %xmm5
	mulps	%xmm4, %xmm5
	movzwl	-42(%rdx), %edi
	movd	%edi, %xmm6
	pinsrw	$1, -28(%rdx), %xmm6
	pinsrw	$2, -14(%rdx), %xmm6
	pinsrw	$3, (%rdx), %xmm6
	pmovsxwd	%xmm6, %xmm6
	cvtdq2ps	%xmm6, %xmm6
	movaps	%xmm9, %xmm7
	mulps	%xmm6, %xmm7
	addps	%xmm5, %xmm7
	addps	%xmm10, %xmm7
	mulps	%xmm11, %xmm7
	cvttps2dq	%xmm7, %xmm5
	pextrw	$0, %xmm5, -44(%rdx)
	pextrw	$2, %xmm5, -30(%rdx)
	pextrw	$4, %xmm5, -16(%rdx)
	pextrw	$6, %xmm5, -2(%rdx)
	mulps	%xmm12, %xmm4
	mulps	%xmm13, %xmm6
	addps	%xmm4, %xmm6
	addps	%xmm2, %xmm6
	mulps	%xmm3, %xmm6
	cvttps2dq	%xmm6, %xmm4
	pextrw	$0, %xmm4, -42(%rdx)
	pextrw	$2, %xmm4, -28(%rdx)
	pextrw	$4, %xmm4, -14(%rdx)
	pextrw	$6, %xmm4, (%rdx)
	addq	$56, %rdx
	addq	$-4, %rsi
	jne	LBB48_79
## %bb.80:                              ##   in Loop: Header=BB48_62 Depth=1
	movaps	-144(%rbp), %xmm6       ## 16-byte Reload
	movaps	-80(%rbp), %xmm7        ## 16-byte Reload
	movaps	-128(%rbp), %xmm13      ## 16-byte Reload
	movaps	-112(%rbp), %xmm12      ## 16-byte Reload
LBB48_81:                               ##   in Loop: Header=BB48_62 Depth=1
	movq	%rcx, %rdx
	shlq	$4, %rdx
	subq	%rcx, %rdx
	subq	%rcx, %rdx
	movq	%r8, -144(%rbp)         ## 8-byte Spill
	leaq	6(%r8,%rdx), %rdx
	subq	%rcx, %rbx
	.p2align	4, 0x90
LBB48_82:                               ##   Parent Loop BB48_62 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movswl	-6(%rdx), %ecx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	movswl	-4(%rdx), %ecx
	movaps	%xmm6, %xmm3
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%ecx, %xmm4
	mulss	%xmm2, %xmm3
	movaps	%xmm7, %xmm5
	mulss	%xmm4, %xmm5
	addss	%xmm3, %xmm5
	addss	%xmm0, %xmm5
	mulss	%xmm14, %xmm5
	cvttss2si	%xmm5, %ecx
	movw	%cx, -6(%rdx)
	mulss	%xmm12, %xmm2
	mulss	%xmm13, %xmm4
	addss	%xmm2, %xmm4
	addss	%xmm1, %xmm4
	mulss	%xmm15, %xmm4
	cvttss2si	%xmm4, %ecx
	movw	%cx, -4(%rdx)
	movswl	-2(%rdx), %ecx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	movswl	(%rdx), %ecx
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%ecx, %xmm3
	movaps	%xmm6, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm7, %xmm5
	mulss	%xmm3, %xmm5
	addss	%xmm4, %xmm5
	addss	%xmm0, %xmm5
	mulss	%xmm14, %xmm5
	cvttss2si	%xmm5, %ecx
	mulss	%xmm12, %xmm2
	mulss	%xmm13, %xmm3
	addss	%xmm2, %xmm3
	addss	%xmm1, %xmm3
	mulss	%xmm15, %xmm3
	cvttss2si	%xmm3, %esi
	movw	%cx, -2(%rdx)
	movw	%si, (%rdx)
	addq	$14, %rdx
	decq	%rbx
	jne	LBB48_82
## %bb.83:                              ##   in Loop: Header=BB48_62 Depth=1
	movq	%rax, %r12
	leal	(%rax,%r14), %eax
	movq	%rax, %r15
	cltq
	movq	%rax, %rdi
	shlq	$4, %rdi
	subq	%rax, %rdi
	subq	%rax, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB48_84
## %bb.87:                              ##   in Loop: Header=BB48_62 Depth=1
	movq	%rax, %rbx
	movq	%r14, %rax
	movslq	%eax, %r14
	testl	%eax, %eax
	jle	LBB48_90
## %bb.88:                              ##   in Loop: Header=BB48_62 Depth=1
	testq	%r13, %r13
	je	LBB48_90
## %bb.89:                              ##   in Loop: Header=BB48_62 Depth=1
	movq	%r14, %rdx
	shlq	$4, %rdx
	subq	%r14, %rdx
	subq	%r14, %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	_memcpy
LBB48_90:                               ##   in Loop: Header=BB48_62 Depth=1
	movq	%r14, %rax
	shlq	$4, %rax
	subq	%r14, %rax
	subq	%r14, %rax
	movq	%rbx, %rdi
	addq	%rax, %rdi
	movslq	%r12d, %rax
	movq	%rax, %rdx
	shlq	$4, %rdx
	subq	%rax, %rdx
	subq	%rax, %rdx
	movq	-144(%rbp), %rsi        ## 8-byte Reload
	callq	_memcpy
	testq	%r13, %r13
	je	LBB48_92
## %bb.91:                              ##   in Loop: Header=BB48_62 Depth=1
	movq	%r13, %rdi
	callq	_free
LBB48_92:                               ##   in Loop: Header=BB48_62 Depth=1
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	%rbx, %r13
	movq	%r15, %r10
	movl	%r10d, %r14d
	movl	-56(%rbp), %ebx         ## 4-byte Reload
LBB48_93:                               ##   in Loop: Header=BB48_62 Depth=1
	testb	$32, %bl
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	jne	LBB48_62
	jmp	LBB48_95
LBB48_54:
	movl	-176(%rbp), %edx        ## 4-byte Reload
	movl	-160(%rbp), %esi        ## 4-byte Reload
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	movq	-80(%rbp), %r9          ## 8-byte Reload
LBB48_56:
	movslq	%r10d, %rax
	incl	%r10d
	movq	%rax, %rcx
	shlq	$4, %rcx
	subq	%rax, %rcx
	subq	%rax, %rcx
	movb	$3, 12(%r13,%rcx)
	movw	%si, (%r13,%rcx)
	movw	%dx, 2(%r13,%rcx)
	movw	%r9w, 4(%r13,%rcx)
	movw	%bx, 6(%r13,%rcx)
LBB48_95:
	movq	%r10, %r15
	movq	-192(%rbp), %rax        ## 8-byte Reload
	movq	%r13, (%rax)
LBB48_102:
	movl	%r15d, %eax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB48_94:
	movb	$2, (%rdx)
	movl	-160(%rbp), %edx        ## 4-byte Reload
	movw	%dx, (%rcx)
	movl	-176(%rbp), %ecx        ## 4-byte Reload
	movw	%cx, 2(%r13,%rax)
	movl	$0, 4(%r13,%rax)
	jmp	LBB48_95
LBB48_84:
	testq	%r13, %r13
	je	LBB48_86
## %bb.85:
	movq	%r13, %rdi
	callq	_free
LBB48_86:
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	jmp	LBB48_101
LBB48_65:
	leaq	L___func__.stbtt__GetGlyphShapeTT(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1838, %edx             ## imm = 0x72E
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphBox      ## -- Begin function stbtt_GetGlyphBox
	.p2align	4, 0x90
_stbtt_GetGlyphBox:                     ## @stbtt_GetGlyphBox
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	%rdi, %rbx
	cmpl	$0, 76(%rdi)
	je	LBB49_18
## %bb.1:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	movq	$0, -48(%rbp)
	movl	$1, -96(%rbp)
	leaq	-96(%rbp), %rdx
	movq	%rbx, %rdi
	callq	_stbtt__run_charstring
	testq	%r13, %r13
	je	LBB49_5
## %bb.2:
	movl	%eax, %ecx
	testl	%eax, %eax
	je	LBB49_4
## %bb.3:
	movl	-72(%rbp), %ecx
LBB49_4:
	movl	%ecx, (%r13)
LBB49_5:
	testq	%r12, %r12
	je	LBB49_9
## %bb.6:
	movl	%eax, %ecx
	testl	%eax, %eax
	je	LBB49_8
## %bb.7:
	movl	-64(%rbp), %ecx
LBB49_8:
	movl	%ecx, (%r12)
LBB49_9:
	testq	%r15, %r15
	je	LBB49_13
## %bb.10:
	movl	%eax, %ecx
	testl	%eax, %eax
	je	LBB49_12
## %bb.11:
	movl	-68(%rbp), %ecx
LBB49_12:
	movl	%ecx, (%r15)
LBB49_13:
	testq	%r14, %r14
	je	LBB49_17
## %bb.14:
	testl	%eax, %eax
	je	LBB49_16
## %bb.15:
	movl	-60(%rbp), %eax
LBB49_16:
	movl	%eax, (%r14)
LBB49_17:
	movl	$1, %ecx
LBB49_28:
	movl	%ecx, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB49_18:
	movq	%rbx, %rdi
	callq	_stbtt__GetGlyfOffset
	testl	%eax, %eax
	js	LBB49_19
## %bb.20:
	testq	%r13, %r13
	je	LBB49_22
## %bb.21:
	movq	8(%rbx), %rcx
	movslq	%eax, %rdx
	movzbl	2(%rcx,%rdx), %esi
	shll	$8, %esi
	movzbl	3(%rcx,%rdx), %ecx
	movswl	%si, %edx
	orl	%ecx, %edx
	movl	%edx, (%r13)
LBB49_22:
	testq	%r12, %r12
	je	LBB49_24
## %bb.23:
	movq	8(%rbx), %rcx
	movslq	%eax, %rdx
	movzbl	4(%rcx,%rdx), %esi
	shll	$8, %esi
	movzbl	5(%rcx,%rdx), %ecx
	movswl	%si, %edx
	orl	%ecx, %edx
	movl	%edx, (%r12)
LBB49_24:
	testq	%r15, %r15
	je	LBB49_26
## %bb.25:
	movq	8(%rbx), %rcx
	movslq	%eax, %rdx
	movzbl	6(%rcx,%rdx), %esi
	shll	$8, %esi
	movzbl	7(%rcx,%rdx), %ecx
	movswl	%si, %edx
	orl	%ecx, %edx
	movl	%edx, (%r15)
LBB49_26:
	movl	$1, %ecx
	testq	%r14, %r14
	je	LBB49_28
## %bb.27:
	movq	8(%rbx), %rdx
	cltq
	movzbl	8(%rdx,%rax), %esi
	shll	$8, %esi
	movzbl	9(%rdx,%rax), %eax
	movswl	%si, %edx
	orl	%eax, %edx
	movl	%edx, (%r14)
	jmp	LBB49_28
LBB49_19:
	xorl	%ecx, %ecx
	jmp	LBB49_28
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__GetGlyfOffset
_stbtt__GetGlyfOffset:                  ## @stbtt__GetGlyfOffset
	.cfi_startproc
## %bb.0:
	cmpl	$0, 76(%rdi)
	jne	LBB50_8
## %bb.1:
	movl	$-1, %eax
	cmpl	%esi, 20(%rdi)
	jle	LBB50_7
## %bb.2:
	movl	60(%rdi), %ecx
	cmpl	$1, %ecx
	jg	LBB50_7
## %bb.3:
	movslq	24(%rdi), %rdx
	addq	8(%rdi), %rdx
	movl	32(%rdi), %edi
	testl	%ecx, %ecx
	je	LBB50_4
## %bb.5:
	movslq	%esi, %rcx
	movl	(%rdx,%rcx,4), %eax
	movl	4(%rdx,%rcx,4), %edx
	bswapl	%eax
	bswapl	%edx
	jmp	LBB50_6
LBB50_4:
	movslq	%esi, %rcx
	movzbl	(%rdx,%rcx,2), %esi
	shll	$8, %esi
	movzbl	1(%rdx,%rcx,2), %eax
	orl	%esi, %eax
	addl	%eax, %eax
	movzbl	2(%rdx,%rcx,2), %esi
	shll	$8, %esi
	movzbl	3(%rdx,%rcx,2), %edx
	orl	%esi, %edx
	addl	%edx, %edx
LBB50_6:
	addl	%eax, %edi
	cmpl	%edx, %eax
	movl	$-1, %eax
	cmovnel	%edi, %eax
LBB50_7:
	retq
LBB50_8:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L___func__.stbtt__GetGlyfOffset(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.90(%rip), %rcx
	movl	$1607, %edx             ## imm = 0x647
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointBox  ## -- Begin function stbtt_GetCodepointBox
	.p2align	4, 0x90
_stbtt_GetCodepointBox:                 ## @stbtt_GetCodepointBox
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movl	%eax, %esi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphBox      ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_IsGlyphEmpty     ## -- Begin function stbtt_IsGlyphEmpty
	.p2align	4, 0x90
_stbtt_IsGlyphEmpty:                    ## @stbtt_IsGlyphEmpty
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	cmpl	$0, 76(%rdi)
	je	LBB52_2
## %bb.1:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -48(%rbp)
	movq	$0, -16(%rbp)
	movl	$1, -64(%rbp)
	leaq	-64(%rbp), %rdx
	movq	%rbx, %rdi
	callq	_stbtt__run_charstring
	testl	%eax, %eax
	sete	%cl
	cmpl	$0, -16(%rbp)
	sete	%al
	orb	%cl, %al
	jmp	LBB52_5
LBB52_2:
	movq	%rbx, %rdi
	callq	_stbtt__GetGlyfOffset
	testl	%eax, %eax
	js	LBB52_3
## %bb.4:
	movq	8(%rbx), %rcx
	cltq
	movzwl	(%rcx,%rax), %eax
	rolw	$8, %ax
	testw	%ax, %ax
	sete	%al
	jmp	LBB52_5
LBB52_3:
	movb	$1, %al
LBB52_5:
	movzbl	%al, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphHMetrics ## -- Begin function stbtt_GetGlyphHMetrics
	.p2align	4, 0x90
_stbtt_GetGlyphHMetrics:                ## @stbtt_GetGlyphHMetrics
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %r8
	movslq	36(%rdi), %r9
	movzbl	34(%r8,%r9), %eax
	shlq	$8, %rax
	movzbl	35(%r8,%r9), %r9d
	orq	%rax, %r9
	cmpl	%esi, %r9d
	jle	LBB53_5
## %bb.1:
	testq	%rdx, %rdx
	je	LBB53_3
## %bb.2:
	movslq	40(%rdi), %rax
	addq	%r8, %rax
	movslq	%esi, %r9
	movzbl	(%rax,%r9,4), %r10d
	shll	$8, %r10d
	movzbl	1(%rax,%r9,4), %r9d
	movswl	%r10w, %eax
	orl	%r9d, %eax
	movl	%eax, (%rdx)
LBB53_3:
	testq	%rcx, %rcx
	je	LBB53_10
## %bb.4:
	movslq	40(%rdi), %rax
	addq	%rax, %r8
	movslq	%esi, %rax
	movzbl	2(%r8,%rax,4), %edx
	shll	$8, %edx
	movzbl	3(%r8,%rax,4), %eax
	movswl	%dx, %edx
	jmp	LBB53_9
LBB53_5:
	testq	%rdx, %rdx
	je	LBB53_7
## %bb.6:
	movslq	40(%rdi), %rax
	addq	%r8, %rax
	movzbl	-4(%rax,%r9,4), %r10d
	shll	$8, %r10d
	movzbl	-3(%rax,%r9,4), %r11d
	movswl	%r10w, %eax
	orl	%r11d, %eax
	movl	%eax, (%rdx)
LBB53_7:
	testq	%rcx, %rcx
	je	LBB53_10
## %bb.8:
	movslq	40(%rdi), %rax
	addq	%rax, %r8
	movl	%r9d, %eax
	leaq	(%r8,%rax,4), %rax
	subl	%r9d, %esi
	movslq	%esi, %rdx
	movzbl	(%rax,%rdx,2), %esi
	shll	$8, %esi
	movzbl	1(%rax,%rdx,2), %eax
	movswl	%si, %edx
LBB53_9:
	orl	%eax, %edx
	movl	%edx, (%rcx)
LBB53_10:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetKerningTableLength ## -- Begin function stbtt_GetKerningTableLength
	.p2align	4, 0x90
_stbtt_GetKerningTableLength:           ## @stbtt_GetKerningTableLength
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	44(%rdi), %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	LBB54_4
## %bb.1:
	movq	8(%rdi), %rdx
	movzwl	2(%rdx,%rcx), %esi
	rolw	$8, %si
	testw	%si, %si
	je	LBB54_4
## %bb.2:
	movzwl	8(%rdx,%rcx), %esi
	rolw	$8, %si
	cmpw	$1, %si
	jne	LBB54_4
## %bb.3:
	movzbl	10(%rdx,%rcx), %esi
	shll	$8, %esi
	movzbl	11(%rdx,%rcx), %eax
	orl	%esi, %eax
LBB54_4:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetKerningTable  ## -- Begin function stbtt_GetKerningTable
	.p2align	4, 0x90
_stbtt_GetKerningTable:                 ## @stbtt_GetKerningTable
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	44(%rdi), %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	LBB55_6
## %bb.1:
	movq	8(%rdi), %r9
	movzwl	2(%r9,%rcx), %edi
	rolw	$8, %di
	testw	%di, %di
	je	LBB55_6
## %bb.2:
	movzwl	8(%r9,%rcx), %edi
	rolw	$8, %di
	cmpw	$1, %di
	jne	LBB55_6
## %bb.3:
	movzbl	10(%r9,%rcx), %edi
	shll	$8, %edi
	movzbl	11(%r9,%rcx), %eax
	orl	%edi, %eax
	cmpl	%edx, %eax
	cmovgl	%edx, %eax
	testl	%eax, %eax
	jle	LBB55_6
## %bb.4:
	movslq	%eax, %r8
	leaq	23(%r9,%rcx), %r9
	xorl	%edi, %edi
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB55_5:                                ## =>This Inner Loop Header: Depth=1
	movzbl	-5(%r9,%rdi), %edx
	shll	$8, %edx
	movzbl	-4(%r9,%rdi), %ecx
	orl	%edx, %ecx
	movl	%ecx, (%rsi,%rdi,2)
	movzbl	-3(%r9,%rdi), %ecx
	shll	$8, %ecx
	movzbl	-2(%r9,%rdi), %edx
	orl	%ecx, %edx
	movl	%edx, 4(%rsi,%rdi,2)
	movzbl	-1(%r9,%rdi), %ecx
	shll	$8, %ecx
	movzbl	(%r9,%rdi), %edx
	movswl	%cx, %ecx
	orl	%edx, %ecx
	movl	%ecx, 8(%rsi,%rdi,2)
	incq	%r10
	addq	$6, %rdi
	cmpq	%r8, %r10
	jl	LBB55_5
LBB55_6:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphKernAdvance ## -- Begin function stbtt_GetGlyphKernAdvance
	.p2align	4, 0x90
_stbtt_GetGlyphKernAdvance:             ## @stbtt_GetGlyphKernAdvance
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	movslq	48(%rdi), %rax
	testq	%rax, %rax
	je	LBB56_48
## %bb.1:
	movq	8(%rdi), %rdx
	movzwl	(%rdx,%rax), %ecx
	rolw	$8, %cx
	xorl	%r13d, %r13d
	cmpw	$1, %cx
	jne	LBB56_58
## %bb.2:
	addq	%rax, %rdx
	movzwl	2(%rdx), %eax
	rolw	$8, %ax
	testw	%ax, %ax
	jne	LBB56_58
## %bb.3:
	movzbl	8(%rdx), %ecx
	shlq	$8, %rcx
	movzbl	9(%rdx), %eax
	orq	%rcx, %rax
	movzbl	(%rdx,%rax), %ecx
	shlq	$8, %rcx
	movq	%rdx, -56(%rbp)         ## 8-byte Spill
	movzbl	1(%rdx,%rax), %edx
	orq	%rcx, %rdx
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	testl	%edx, %edx
	je	LBB56_58
## %bb.4:
	addq	%rax, -56(%rbp)         ## 8-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
LBB56_5:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB56_8 Depth 2
                                        ##       Child Loop BB56_12 Depth 3
                                        ##       Child Loop BB56_19 Depth 3
                                        ##       Child Loop BB56_41 Depth 3
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	movzbl	2(%rcx,%rdx,2), %eax
	shlq	$8, %rax
	movzbl	3(%rcx,%rdx,2), %r8d
	orq	%rax, %r8
	movzwl	(%rcx,%r8), %eax
	rolw	$8, %ax
	cmpw	$2, %ax
	jne	LBB56_25
## %bb.6:                               ##   in Loop: Header=BB56_5 Depth=1
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movzbl	4(%rcx,%r8), %eax
	shlq	$8, %rax
	movzbl	5(%rcx,%r8), %r11d
	orq	%rax, %r11
	testl	%r11d, %r11d
	je	LBB56_25
## %bb.7:                               ##   in Loop: Header=BB56_5 Depth=1
	addq	-56(%rbp), %r8          ## 8-byte Folded Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
LBB56_8:                                ##   Parent Loop BB56_5 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB56_12 Depth 3
                                        ##       Child Loop BB56_19 Depth 3
                                        ##       Child Loop BB56_41 Depth 3
	movzbl	6(%r8,%r9,2), %eax
	shlq	$8, %rax
	movzbl	7(%r8,%r9,2), %ecx
	orq	%rax, %rcx
	leaq	(%r8,%rcx), %r12
	movzwl	(%r8,%rcx), %r15d
	movzbl	2(%r8,%rcx), %eax
	shlq	$8, %rax
	movzbl	3(%r8,%rcx), %ecx
	orq	%rax, %rcx
	leaq	(%r12,%rcx), %r13
	movzwl	(%r12,%rcx), %eax
	rolw	$8, %ax
	cmpw	$2, %ax
	je	LBB56_17
## %bb.9:                               ##   in Loop: Header=BB56_8 Depth=2
	cmpw	$1, %ax
	jne	LBB56_24
## %bb.10:                              ##   in Loop: Header=BB56_8 Depth=2
	movzbl	2(%r13), %eax
	shll	$8, %eax
	movzbl	3(%r13), %ebx
	orl	%eax, %ebx
	je	LBB56_24
## %bb.11:                              ##   in Loop: Header=BB56_8 Depth=2
	decl	%ebx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB56_12:                               ##   Parent Loop BB56_5 Depth=1
                                        ##     Parent Loop BB56_8 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%rbx,%rdi), %eax
	movslq	%eax, %rcx
	sarl	%eax
	andq	$-2, %rcx
	movzbl	4(%r13,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%r13,%rcx), %ecx
	orl	%edx, %ecx
	cmpl	%esi, %ecx
	jle	LBB56_14
## %bb.13:                              ##   in Loop: Header=BB56_12 Depth=3
	decl	%eax
	movl	%eax, %ebx
	jmp	LBB56_16
	.p2align	4, 0x90
LBB56_14:                               ##   in Loop: Header=BB56_12 Depth=3
	cmpl	%esi, %ecx
	jge	LBB56_27
## %bb.15:                              ##   in Loop: Header=BB56_12 Depth=3
	incl	%eax
	movl	%eax, %edi
LBB56_16:                               ##   in Loop: Header=BB56_12 Depth=3
	cmpl	%ebx, %edi
	jle	LBB56_12
	jmp	LBB56_24
	.p2align	4, 0x90
LBB56_17:                               ##   in Loop: Header=BB56_8 Depth=2
	movzbl	2(%r13), %ecx
	shll	$8, %ecx
	movzbl	3(%r13), %r10d
	orl	%ecx, %r10d
	je	LBB56_24
## %bb.18:                              ##   in Loop: Header=BB56_8 Depth=2
	decl	%r10d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB56_19:                               ##   Parent Loop BB56_5 Depth=1
                                        ##     Parent Loop BB56_8 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%r10,%rbx), %edi
	sarl	%edi
	movslq	%edi, %rcx
	addq	%rcx, %rcx
	leaq	(%rcx,%rcx,2), %rdx
	movzbl	4(%r13,%rdx), %r14d
	shll	$8, %r14d
	movzbl	5(%r13,%rdx), %ecx
	orl	%r14d, %ecx
	cmpl	%esi, %ecx
	jle	LBB56_21
## %bb.20:                              ##   in Loop: Header=BB56_19 Depth=3
	decl	%edi
	movl	%edi, %r10d
	cmpl	%r10d, %ebx
	jle	LBB56_19
	jmp	LBB56_24
	.p2align	4, 0x90
LBB56_21:                               ##   in Loop: Header=BB56_19 Depth=3
	movzbl	6(%r13,%rdx), %ebx
	shll	$8, %ebx
	movzbl	7(%r13,%rdx), %eax
	orl	%ebx, %eax
	cmpl	%esi, %eax
	jge	LBB56_26
## %bb.22:                              ##   in Loop: Header=BB56_19 Depth=3
	incl	%edi
	movl	%edi, %ebx
	cmpl	%r10d, %ebx
	jle	LBB56_19
	jmp	LBB56_24
LBB56_26:                               ##   in Loop: Header=BB56_8 Depth=2
	movzbl	8(%r13,%rdx), %eax
	shll	$8, %eax
	movzbl	9(%r13,%rdx), %edx
	orl	%eax, %edx
	movl	%esi, %eax
	subl	%ecx, %eax
	addl	%edx, %eax
LBB56_27:                               ##   in Loop: Header=BB56_8 Depth=2
	cmpl	$-1, %eax
	je	LBB56_24
## %bb.28:                              ##   in Loop: Header=BB56_8 Depth=2
	rolw	$8, %r15w
	xorl	%r13d, %r13d
	cmpw	$1, %r15w
	jne	LBB56_29
## %bb.36:                              ##   in Loop: Header=BB56_8 Depth=2
	movzwl	4(%r12), %ecx
	rolw	$8, %cx
	cmpw	$4, %cx
	jne	LBB56_58
## %bb.37:                              ##   in Loop: Header=BB56_8 Depth=2
	movzwl	6(%r12), %ecx
	rolw	$8, %cx
	testw	%cx, %cx
	jne	LBB56_58
## %bb.38:                              ##   in Loop: Header=BB56_8 Depth=2
	movzbl	8(%r12), %ecx
	shll	$8, %ecx
	movzbl	9(%r12), %edx
	orl	%ecx, %edx
	cmpl	%edx, %eax
	jge	LBB56_58
## %bb.39:                              ##   in Loop: Header=BB56_8 Depth=2
	cltq
	movzbl	10(%r12,%rax,2), %ecx
	shlq	$8, %rcx
	movzbl	11(%r12,%rax,2), %r10d
	orq	%rcx, %r10
	addq	%r12, %r10
	movzbl	(%r10), %edx
	shll	$8, %edx
	movzbl	1(%r10), %r14d
	orl	%edx, %r14d
	je	LBB56_24
## %bb.40:                              ##   in Loop: Header=BB56_8 Depth=2
	decl	%r14d
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB56_41:                               ##   Parent Loop BB56_5 Depth=1
                                        ##     Parent Loop BB56_8 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%r14,%rdi), %edx
	sarl	%edx
	movslq	%edx, %rbx
	movzbl	2(%r10,%rbx,4), %eax
	shll	$8, %eax
	movzbl	3(%r10,%rbx,4), %ecx
	orl	%eax, %ecx
	cmpl	-44(%rbp), %ecx         ## 4-byte Folded Reload
	jle	LBB56_43
## %bb.42:                              ##   in Loop: Header=BB56_41 Depth=3
	decl	%edx
	movl	%edx, %r14d
	jmp	LBB56_45
	.p2align	4, 0x90
LBB56_43:                               ##   in Loop: Header=BB56_41 Depth=3
	jge	LBB56_46
## %bb.44:                              ##   in Loop: Header=BB56_41 Depth=3
	incl	%edx
	movl	%edx, %edi
LBB56_45:                               ##   in Loop: Header=BB56_41 Depth=3
	cmpl	%r14d, %edi
	jle	LBB56_41
	.p2align	4, 0x90
LBB56_24:                               ##   in Loop: Header=BB56_8 Depth=2
	incq	%r9
	cmpq	%r11, %r9
	jb	LBB56_8
LBB56_25:                               ##   in Loop: Header=BB56_5 Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	xorl	%r13d, %r13d
	movq	%rcx, %rax
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	cmpq	-72(%rbp), %rcx         ## 8-byte Folded Reload
	jb	LBB56_5
	jmp	LBB56_58
LBB56_48:
	movslq	44(%rdi), %rcx
	xorl	%r13d, %r13d
	testq	%rcx, %rcx
	je	LBB56_58
## %bb.49:
	movq	8(%rdi), %r8
	movzwl	2(%r8,%rcx), %edx
	rolw	$8, %dx
	testw	%dx, %dx
	je	LBB56_58
## %bb.50:
	addq	%rcx, %r8
	movzwl	8(%r8), %ecx
	rolw	$8, %cx
	cmpw	$1, %cx
	jne	LBB56_58
## %bb.51:
	movzbl	10(%r8), %edx
	shll	$8, %edx
	movzbl	11(%r8), %ecx
	orl	%edx, %ecx
	je	LBB56_58
## %bb.52:
	shll	$16, %esi
	orl	-44(%rbp), %esi         ## 4-byte Folded Reload
	decl	%ecx
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB56_53:                               ## =>This Inner Loop Header: Depth=1
	leal	(%rdx,%rcx), %edi
	sarl	%edi
	movslq	%edi, %rbx
	addq	%rbx, %rbx
	leaq	(%rbx,%rbx,2), %rbx
	movl	18(%r8,%rbx), %eax
	bswapl	%eax
	cmpl	%eax, %esi
	jae	LBB56_55
## %bb.54:                              ##   in Loop: Header=BB56_53 Depth=1
	decl	%edi
	movl	%edi, %ecx
	cmpl	%ecx, %edx
	jle	LBB56_53
	jmp	LBB56_58
	.p2align	4, 0x90
LBB56_55:                               ##   in Loop: Header=BB56_53 Depth=1
	jbe	LBB56_59
## %bb.56:                              ##   in Loop: Header=BB56_53 Depth=1
	incl	%edi
	movl	%edi, %edx
	cmpl	%ecx, %edx
	jle	LBB56_53
	jmp	LBB56_58
LBB56_46:
	movzbl	4(%r10,%rbx,4), %eax
	shll	$8, %eax
	movzbl	5(%r10,%rbx,4), %ecx
	jmp	LBB56_47
LBB56_59:
	movzbl	22(%r8,%rbx), %eax
	shll	$8, %eax
	movzbl	23(%r8,%rbx), %ecx
LBB56_47:
	movswl	%ax, %r13d
	orl	%ecx, %r13d
LBB56_58:
	movl	%r13d, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB56_29:
	cmpw	$2, %r15w
	jne	LBB56_58
## %bb.30:
	movzwl	4(%r12), %eax
	rolw	$8, %ax
	cmpw	$4, %ax
	jne	LBB56_58
## %bb.31:
	movzwl	6(%r12), %eax
	rolw	$8, %ax
	testw	%ax, %ax
	jne	LBB56_58
## %bb.32:
	movzbl	8(%r12), %eax
	shlq	$8, %rax
	movzbl	9(%r12), %edi
	orq	%rax, %rdi
	movzbl	10(%r12), %eax
	shlq	$8, %rax
	movzbl	11(%r12), %ebx
	orq	%rax, %rbx
	addq	%r12, %rdi
	callq	_stbtt__GetGlyphClass
	movl	%eax, %r15d
	addq	%r12, %rbx
	movq	%rbx, %rdi
	movl	-44(%rbp), %esi         ## 4-byte Reload
	callq	_stbtt__GetGlyphClass
	testl	%eax, %eax
	js	LBB56_58
## %bb.33:
	movzbl	12(%r12), %ecx
	shll	$8, %ecx
	movzbl	13(%r12), %edx
	orl	%ecx, %edx
	cmpl	%edx, %r15d
	jae	LBB56_58
## %bb.34:
	movzbl	14(%r12), %edx
	shll	$8, %edx
	movzbl	15(%r12), %ecx
	orl	%edx, %ecx
	cmpl	%ecx, %eax
	jge	LBB56_58
## %bb.35:
	imull	%ecx, %r15d
	addl	%r15d, %r15d
	movslq	%r15d, %rcx
	addq	%rcx, %r12
	cltq
	movzbl	16(%r12,%rax,2), %ecx
	shll	$8, %ecx
	movzbl	17(%r12,%rax,2), %eax
	movswl	%cx, %r13d
	orl	%eax, %r13d
	jmp	LBB56_58
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointKernAdvance ## -- Begin function stbtt_GetCodepointKernAdvance
	.p2align	4, 0x90
_stbtt_GetCodepointKernAdvance:         ## @stbtt_GetCodepointKernAdvance
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movq	%rdi, %rbx
	cmpl	$0, 44(%rdi)
	jne	LBB57_3
## %bb.1:
	cmpl	$0, 48(%rbx)
	je	LBB57_2
LBB57_3:
	movq	%rbx, %rdi
	callq	_stbtt_FindGlyphIndex
	movl	%eax, %r15d
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movl	%r15d, %esi
	movl	%eax, %edx
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphKernAdvance ## TAILCALL
LBB57_2:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointHMetrics ## -- Begin function stbtt_GetCodepointHMetrics
	.p2align	4, 0x90
_stbtt_GetCodepointHMetrics:            ## @stbtt_GetCodepointHMetrics
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	8(%rbx), %rcx
	movslq	36(%rbx), %rdx
	movzbl	34(%rcx,%rdx), %esi
	shlq	$8, %rsi
	movzbl	35(%rcx,%rdx), %edx
	orq	%rsi, %rdx
	movl	%eax, %esi
	subl	%edx, %esi
	jge	LBB58_5
## %bb.1:
	testq	%r15, %r15
	je	LBB58_3
## %bb.2:
	movslq	40(%rbx), %rdx
	addq	%rcx, %rdx
	movslq	%eax, %rsi
	movzbl	(%rdx,%rsi,4), %edi
	shll	$8, %edi
	movzbl	1(%rdx,%rsi,4), %edx
	movswl	%di, %esi
	orl	%edx, %esi
	movl	%esi, (%r15)
LBB58_3:
	testq	%r14, %r14
	je	LBB58_10
## %bb.4:
	movslq	40(%rbx), %rdx
	addq	%rdx, %rcx
	cltq
	movzbl	2(%rcx,%rax,4), %edx
	shll	$8, %edx
	movzbl	3(%rcx,%rax,4), %eax
	jmp	LBB58_9
LBB58_5:
	testq	%r15, %r15
	je	LBB58_7
## %bb.6:
	movslq	40(%rbx), %rax
	addq	%rcx, %rax
	movzbl	-4(%rax,%rdx,4), %edi
	shll	$8, %edi
	movzbl	-3(%rax,%rdx,4), %eax
	movswl	%di, %edi
	orl	%eax, %edi
	movl	%edi, (%r15)
LBB58_7:
	testq	%r14, %r14
	je	LBB58_10
## %bb.8:
	movslq	40(%rbx), %rax
	addq	%rax, %rcx
	movl	%edx, %eax
	leaq	(%rcx,%rax,4), %rax
	movslq	%esi, %rcx
	movzbl	(%rax,%rcx,2), %edx
	shll	$8, %edx
	movzbl	1(%rax,%rcx,2), %eax
LBB58_9:
	movswl	%dx, %ecx
	orl	%eax, %ecx
	movl	%ecx, (%r14)
LBB58_10:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetFontVMetrics  ## -- Begin function stbtt_GetFontVMetrics
	.p2align	4, 0x90
_stbtt_GetFontVMetrics:                 ## @stbtt_GetFontVMetrics
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testq	%rsi, %rsi
	je	LBB59_2
## %bb.1:
	movq	8(%rdi), %r8
	movslq	36(%rdi), %r9
	movzbl	4(%r8,%r9), %eax
	shll	$8, %eax
	movzbl	5(%r8,%r9), %r8d
	cwtl
	orl	%r8d, %eax
	movl	%eax, (%rsi)
LBB59_2:
	testq	%rdx, %rdx
	je	LBB59_4
## %bb.3:
	movq	8(%rdi), %r8
	movslq	36(%rdi), %rsi
	movzbl	6(%r8,%rsi), %eax
	shll	$8, %eax
	movzbl	7(%r8,%rsi), %esi
	cwtl
	orl	%esi, %eax
	movl	%eax, (%rdx)
LBB59_4:
	testq	%rcx, %rcx
	je	LBB59_6
## %bb.5:
	movq	8(%rdi), %rax
	movslq	36(%rdi), %rdx
	movzbl	8(%rax,%rdx), %esi
	shll	$8, %esi
	movzbl	9(%rax,%rdx), %eax
	movswl	%si, %edx
	orl	%eax, %edx
	movl	%edx, (%rcx)
LBB59_6:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetFontVMetricsOS2 ## -- Begin function stbtt_GetFontVMetricsOS2
	.p2align	4, 0x90
_stbtt_GetFontVMetricsOS2:              ## @stbtt_GetFontVMetricsOS2
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %r8
	movl	16(%rdi), %eax
	movzbl	4(%r8,%rax), %edi
	shlq	$8, %rdi
	movzbl	5(%r8,%rax), %r9d
	orq	%rdi, %r9
	testl	%r9d, %r9d
	je	LBB60_1
## %bb.2:
	addl	$12, %eax
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB60_3:                                ## =>This Inner Loop Header: Depth=1
	movl	%eax, %eax
	cmpb	$79, (%r8,%rax)
	jne	LBB60_7
## %bb.4:                               ##   in Loop: Header=BB60_3 Depth=1
	cmpb	$83, 1(%r8,%rax)
	jne	LBB60_7
## %bb.5:                               ##   in Loop: Header=BB60_3 Depth=1
	cmpb	$47, 2(%r8,%rax)
	jne	LBB60_7
## %bb.6:                               ##   in Loop: Header=BB60_3 Depth=1
	cmpb	$50, 3(%r8,%rax)
	je	LBB60_9
	.p2align	4, 0x90
LBB60_7:                                ##   in Loop: Header=BB60_3 Depth=1
	incq	%rdi
	addl	$16, %eax
	cmpq	%r9, %rdi
	jb	LBB60_3
## %bb.8:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB60_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB60_9:
	movzbl	8(%r8,%rax), %r9d
	shll	$24, %r9d
	movzbl	9(%r8,%rax), %edi
	shlq	$16, %rdi
	movslq	%r9d, %r9
	orq	%rdi, %r9
	movzbl	10(%r8,%rax), %edi
	shlq	$8, %rdi
	orq	%r9, %rdi
	movzbl	11(%r8,%rax), %r9d
	orq	%rdi, %r9
	testl	%r9d, %r9d
	je	LBB60_10
## %bb.11:
	testq	%rsi, %rsi
	je	LBB60_13
## %bb.12:
	movzbl	68(%r8,%r9), %eax
	shll	$8, %eax
	movzbl	69(%r8,%r9), %edi
	cwtl
	orl	%edi, %eax
	movl	%eax, (%rsi)
LBB60_13:
	testq	%rdx, %rdx
	je	LBB60_15
## %bb.14:
	movzbl	70(%r8,%r9), %eax
	shll	$8, %eax
	movzbl	71(%r8,%r9), %esi
	cwtl
	orl	%esi, %eax
	movl	%eax, (%rdx)
LBB60_15:
	movl	$1, %eax
	testq	%rcx, %rcx
	je	LBB60_17
## %bb.16:
	movzbl	72(%r8,%r9), %edx
	shll	$8, %edx
	movzbl	73(%r8,%r9), %esi
	movswl	%dx, %edx
	orl	%esi, %edx
	movl	%edx, (%rcx)
LBB60_17:
	popq	%rbp
	retq
LBB60_10:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetFontBoundingBox ## -- Begin function stbtt_GetFontBoundingBox
	.p2align	4, 0x90
_stbtt_GetFontBoundingBox:              ## @stbtt_GetFontBoundingBox
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %r11
	movslq	28(%rdi), %r9
	movzbl	36(%r11,%r9), %r10d
	shll	$8, %r10d
	movzbl	37(%r11,%r9), %r9d
	movswl	%r10w, %eax
	orl	%r9d, %eax
	movl	%eax, (%rsi)
	movslq	28(%rdi), %rax
	movzbl	38(%r11,%rax), %esi
	shll	$8, %esi
	movzbl	39(%r11,%rax), %eax
	movswl	%si, %esi
	orl	%eax, %esi
	movl	%esi, (%rdx)
	movslq	28(%rdi), %rax
	movzbl	40(%r11,%rax), %edx
	shll	$8, %edx
	movzbl	41(%r11,%rax), %eax
	movswl	%dx, %edx
	orl	%eax, %edx
	movl	%edx, (%rcx)
	movslq	28(%rdi), %rax
	movzbl	42(%r11,%rax), %ecx
	shll	$8, %ecx
	movzbl	43(%r11,%rax), %eax
	movswl	%cx, %ecx
	orl	%eax, %ecx
	movl	%ecx, (%r8)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_ScaleForPixelHeight ## -- Begin function stbtt_ScaleForPixelHeight
	.p2align	4, 0x90
_stbtt_ScaleForPixelHeight:             ## @stbtt_ScaleForPixelHeight
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %rax
	movslq	36(%rdi), %rcx
	movzbl	4(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%rax,%rcx), %esi
	movswl	%dx, %edx
	orl	%esi, %edx
	movzbl	6(%rax,%rcx), %esi
	shll	$8, %esi
	movzbl	7(%rax,%rcx), %eax
	movswl	%si, %ecx
	orl	%eax, %ecx
	subl	%ecx, %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_ScaleForMappingEmToPixels ## -- Begin function stbtt_ScaleForMappingEmToPixels
	.p2align	4, 0x90
_stbtt_ScaleForMappingEmToPixels:       ## @stbtt_ScaleForMappingEmToPixels
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %rax
	movslq	28(%rdi), %rcx
	movzwl	18(%rax,%rcx), %eax
	rolw	$8, %ax
	movzwl	%ax, %eax
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_FreeShape        ## -- Begin function stbtt_FreeShape
	.p2align	4, 0x90
_stbtt_FreeShape:                       ## @stbtt_FreeShape
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, %rdi
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_FindSVGDoc       ## -- Begin function stbtt_FindSVGDoc
	.p2align	4, 0x90
_stbtt_FindSVGDoc:                      ## @stbtt_FindSVGDoc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %rax
	movl	52(%rdi), %ecx
	testl	%ecx, %ecx
	jns	LBB65_11
## %bb.1:
	movl	16(%rdi), %ecx
	movzbl	4(%rax,%rcx), %edx
	shlq	$8, %rdx
	movzbl	5(%rax,%rcx), %r8d
	orq	%rdx, %r8
	testl	%r8d, %r8d
	je	LBB65_9
## %bb.2:
	addl	$12, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB65_3:                                ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %ecx
	cmpb	$83, (%rax,%rcx)
	jne	LBB65_7
## %bb.4:                               ##   in Loop: Header=BB65_3 Depth=1
	cmpb	$86, 1(%rax,%rcx)
	jne	LBB65_7
## %bb.5:                               ##   in Loop: Header=BB65_3 Depth=1
	cmpb	$71, 2(%rax,%rcx)
	jne	LBB65_7
## %bb.6:                               ##   in Loop: Header=BB65_3 Depth=1
	cmpb	$32, 3(%rax,%rcx)
	je	LBB65_18
	.p2align	4, 0x90
LBB65_7:                                ##   in Loop: Header=BB65_3 Depth=1
	incq	%rdx
	addl	$16, %ecx
	cmpq	%r8, %rdx
	jb	LBB65_3
LBB65_9:
	xorl	%ecx, %ecx
LBB65_10:
	movl	%ecx, 52(%rdi)
LBB65_11:
	movslq	%ecx, %rdx
	movzbl	(%rax,%rdx), %edi
	shlq	$8, %rdi
	movzbl	1(%rax,%rdx), %r8d
	orq	%rdi, %r8
	testl	%r8d, %r8d
	je	LBB65_16
## %bb.12:
	leaq	2(%rax,%rdx), %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB65_13:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax), %edi
	shll	$8, %edi
	movzbl	1(%rax), %ecx
	orl	%edi, %ecx
	cmpl	%esi, %ecx
	jg	LBB65_15
## %bb.14:                              ##   in Loop: Header=BB65_13 Depth=1
	movzbl	2(%rax), %ecx
	shll	$8, %ecx
	movzbl	3(%rax), %edi
	orl	%ecx, %edi
	cmpl	%esi, %edi
	jge	LBB65_17
LBB65_15:                               ##   in Loop: Header=BB65_13 Depth=1
	incq	%rdx
	addq	$12, %rax
	cmpq	%r8, %rdx
	jb	LBB65_13
LBB65_16:
	xorl	%eax, %eax
LBB65_17:
	popq	%rbp
	retq
LBB65_18:
	movzbl	8(%rax,%rcx), %r8d
	shlq	$24, %r8
	movzbl	9(%rax,%rcx), %r9d
	shlq	$16, %r9
	orq	%r8, %r9
	movzbl	10(%rax,%rcx), %edx
	shlq	$8, %rdx
	orq	%r9, %rdx
	movzbl	11(%rax,%rcx), %r8d
	orq	%rdx, %r8
	testl	%r8d, %r8d
	je	LBB65_9
## %bb.19:
	movl	2(%rax,%r8), %ecx
	bswapl	%ecx
	addl	%r8d, %ecx
	jmp	LBB65_10
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphSVG      ## -- Begin function stbtt_GetGlyphSVG
	.p2align	4, 0x90
_stbtt_GetGlyphSVG:                     ## @stbtt_GetGlyphSVG
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%r15d, %r15d
	cmpl	$0, 52(%rdi)
	je	LBB66_3
## %bb.1:
	movq	%rdx, %r14
	movq	%rdi, %rbx
	movq	8(%rdi), %r12
	callq	_stbtt_FindSVGDoc
	testq	%rax, %rax
	je	LBB66_3
## %bb.2:
	movslq	52(%rbx), %rcx
	addq	%rcx, %r12
	movzbl	4(%rax), %ecx
	shlq	$24, %rcx
	movzbl	5(%rax), %edx
	shlq	$16, %rdx
	orq	%rcx, %rdx
	movzbl	6(%rax), %ecx
	shlq	$8, %rcx
	orq	%rdx, %rcx
	movzbl	7(%rax), %edx
	orq	%rcx, %rdx
	addq	%r12, %rdx
	movq	%rdx, (%r14)
	movl	8(%rax), %r15d
	bswapl	%r15d
LBB66_3:
	movl	%r15d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointSVG  ## -- Begin function stbtt_GetCodepointSVG
	.p2align	4, 0x90
_stbtt_GetCodepointSVG:                 ## @stbtt_GetCodepointSVG
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	xorl	%r15d, %r15d
	cmpl	$0, 52(%rbx)
	je	LBB67_3
## %bb.1:
	movq	8(%rbx), %r12
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	_stbtt_FindSVGDoc
	testq	%rax, %rax
	je	LBB67_3
## %bb.2:
	movslq	52(%rbx), %rcx
	addq	%rcx, %r12
	movzbl	4(%rax), %ecx
	shlq	$24, %rcx
	movzbl	5(%rax), %edx
	shlq	$16, %rdx
	orq	%rcx, %rdx
	movzbl	6(%rax), %ecx
	shlq	$8, %rcx
	orq	%rdx, %rcx
	movzbl	7(%rax), %edx
	orq	%rcx, %rdx
	addq	%r12, %rdx
	movq	%rdx, (%r14)
	movl	8(%rax), %r15d
	bswapl	%r15d
LBB67_3:
	movl	%r15d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphBitmapBoxSubpixel ## -- Begin function stbtt_GetGlyphBitmapBoxSubpixel
	.p2align	4, 0x90
_stbtt_GetGlyphBitmapBoxSubpixel:       ## @stbtt_GetGlyphBitmapBoxSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -48(%rbp)        ## 4-byte Spill
	movss	%xmm1, -52(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	$0, -40(%rbp)
	movl	$0, -36(%rbp)
	leaq	-40(%rbp), %rdx
	leaq	-36(%rbp), %rcx
	leaq	-64(%rbp), %r8
	leaq	-60(%rbp), %r9
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB68_1
## %bb.9:
	testq	%rbx, %rbx
	movss	-48(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movss	-44(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	je	LBB68_11
## %bb.10:
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-40(%rbp), %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm3, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, (%rbx)
LBB68_11:
	testq	%r12, %r12
	movss	-56(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	je	LBB68_13
## %bb.12:
	xorl	%eax, %eax
	subl	-60(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, (%r12)
LBB68_13:
	testq	%r15, %r15
	je	LBB68_15
## %bb.14:
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-64(%rbp), %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm3, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, (%r15)
LBB68_15:
	testq	%r14, %r14
	je	LBB68_17
## %bb.16:
	xorl	%eax, %eax
	subl	-36(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, (%r14)
	jmp	LBB68_17
LBB68_1:
	testq	%rbx, %rbx
	je	LBB68_3
## %bb.2:
	movl	$0, (%rbx)
LBB68_3:
	testq	%r12, %r12
	je	LBB68_5
## %bb.4:
	movl	$0, (%r12)
LBB68_5:
	testq	%r15, %r15
	je	LBB68_7
## %bb.6:
	movl	$0, (%r15)
LBB68_7:
	testq	%r14, %r14
	je	LBB68_17
## %bb.8:
	movl	$0, (%r14)
LBB68_17:
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphBitmapBox ## -- Begin function stbtt_GetGlyphBitmapBox
	.p2align	4, 0x90
_stbtt_GetGlyphBitmapBox:               ## @stbtt_GetGlyphBitmapBox
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapBoxSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointBitmapBoxSubpixel ## -- Begin function stbtt_GetCodepointBitmapBoxSubpixel
	.p2align	4, 0x90
_stbtt_GetCodepointBitmapBoxSubpixel:   ## @stbtt_GetCodepointBitmapBoxSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movl	%eax, %esi
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapBoxSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointBitmapBox ## -- Begin function stbtt_GetCodepointBitmapBox
	.p2align	4, 0x90
_stbtt_GetCodepointBitmapBox:           ## @stbtt_GetCodepointBitmapBox
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	movq	%rbx, %rdi
	movl	%eax, %esi
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapBoxSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt_Rasterize
LCPI72_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
LCPI72_4:
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI72_1:
	.long	1065353216              ## float 1
LCPI72_3:
	.long	1056964608              ## float 0.5
LCPI72_5:
	.long	1065437102              ## float 1.00999999
LCPI72_6:
	.long	3156465418              ## float -0.00999999977
LCPI72_7:
	.long	1132396544              ## float 255
	.section	__TEXT,__literal8,8byte_literals
	.p2align	2
LCPI72_2:
	.long	1065353216              ## float 1
	.long	3212836864              ## float -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_Rasterize
	.p2align	4, 0x90
_stbtt_Rasterize:                       ## @stbtt_Rasterize
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$808, %rsp              ## imm = 0x328
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, -580(%rbp)        ## 4-byte Spill
                                        ## kill: def $r8d killed $r8d def $r8
	movq	%r8, -744(%rbp)         ## 8-byte Spill
	movdqa	%xmm4, -800(%rbp)       ## 16-byte Spill
	movdqa	%xmm3, -832(%rbp)       ## 16-byte Spill
	movdqa	%xmm2, -720(%rbp)       ## 16-byte Spill
	movq	%rsi, -656(%rbp)        ## 8-byte Spill
	movss	%xmm0, -592(%rbp)       ## 4-byte Spill
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	$0, -576(%rbp)
	testl	%edx, %edx
	jle	LBB72_177
## %bb.1:
	movl	%ecx, %r12d
	movq	%rdi, %r14
	movl	%edx, %r8d
	leaq	-1(%r8), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB72_3
## %bb.2:
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
	jmp	LBB72_5
LBB72_3:
	movq	-656(%rbp), %rcx        ## 8-byte Reload
	leaq	54(%rcx), %rdx
	movq	%r8, %rsi
	subq	%rax, %rsi
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB72_4:                                ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	cmpb	$1, -42(%rdx)
	sete	%dil
	addl	%r13d, %edi
	xorl	%ebx, %ebx
	cmpb	$1, -28(%rdx)
	sete	%bl
	addl	%edi, %ebx
	xorl	%edi, %edi
	cmpb	$1, -14(%rdx)
	sete	%dil
	addl	%ebx, %edi
	xorl	%r13d, %r13d
	cmpb	$1, (%rdx)
	sete	%r13b
	addl	%edi, %r13d
	addq	$4, %rcx
	addq	$56, %rdx
	cmpq	%rcx, %rsi
	jne	LBB72_4
LBB72_5:
	movq	%r8, -600(%rbp)         ## 8-byte Spill
	testq	%rax, %rax
	je	LBB72_8
## %bb.6:
	movq	%rcx, %rdx
	shlq	$4, %rdx
	subq	%rcx, %rdx
	subq	%rcx, %rdx
	movq	-656(%rbp), %rcx        ## 8-byte Reload
	leaq	12(%rcx,%rdx), %rcx
	negq	%rax
	.p2align	4, 0x90
LBB72_7:                                ## =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	cmpb	$1, (%rcx)
	sete	%dl
	addl	%edx, %r13d
	addq	$14, %rcx
	incq	%rax
	jne	LBB72_7
LBB72_8:
	testl	%r13d, %r13d
	je	LBB72_177
## %bb.9:
	movl	%r13d, %ebx
	leaq	(,%rbx,4), %rdi
	movaps	%xmm1, -736(%rbp)       ## 16-byte Spill
	callq	_malloc
	movaps	-736(%rbp), %xmm1       ## 16-byte Reload
	testq	%rax, %rax
	je	LBB72_177
## %bb.10:
	movq	%rax, %r15
	movq	%rbx, -608(%rbp)        ## 8-byte Spill
	movl	%r12d, -612(%rbp)       ## 4-byte Spill
	movq	%r14, -752(%rbp)        ## 8-byte Spill
	movaps	-720(%rbp), %xmm0       ## 16-byte Reload
	minss	%xmm1, %xmm0
	movss	-592(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	mulss	%xmm1, %xmm1
	movss	%xmm1, -592(%rbp)       ## 4-byte Spill
	xorl	%eax, %eax
	leaq	-576(%rbp), %r14
	xorl	%ebx, %ebx
	movl	$0, -588(%rbp)          ## 4-byte Folded Spill
	xorl	%edi, %edi
	movq	%r15, -696(%rbp)        ## 8-byte Spill
	movq	%r14, -624(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB72_11:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB72_15 Depth 2
	cmpl	$1, %ebx
	jne	LBB72_14
## %bb.12:                              ##   in Loop: Header=BB72_11 Depth=1
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB72_34
## %bb.13:                              ##   in Loop: Header=BB72_11 Depth=1
	movq	%rax, %rdi
LBB72_14:                               ##   in Loop: Header=BB72_11 Depth=1
	movl	%ebx, -584(%rbp)        ## 4-byte Spill
	movl	$0, -576(%rbp)
	movl	$-1, %r14d
	xorps	%xmm1, %xmm1
	movq	-600(%rbp), %r15        ## 8-byte Reload
	movq	-656(%rbp), %r12        ## 8-byte Reload
	xorps	%xmm0, %xmm0
	movq	%rdi, -664(%rbp)        ## 8-byte Spill
	leaq	LJTI72_0(%rip), %rbx
	.p2align	4, 0x90
LBB72_15:                               ##   Parent Loop BB72_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	12(%r12), %eax
	decb	%al
	cmpb	$3, %al
	ja	LBB72_27
## %bb.16:                              ##   in Loop: Header=BB72_15 Depth=2
	movzbl	%al, %eax
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	jmpq	*%rax
LBB72_17:                               ##   in Loop: Header=BB72_15 Depth=2
	movl	-576(%rbp), %eax
	testl	%r14d, %r14d
	js	LBB72_19
## %bb.18:                              ##   in Loop: Header=BB72_15 Depth=2
	movl	%eax, %ecx
	subl	-588(%rbp), %ecx        ## 4-byte Folded Reload
	movslq	%r14d, %rdx
	movq	-696(%rbp), %rsi        ## 8-byte Reload
	movl	%ecx, (%rsi,%rdx,4)
LBB72_19:                               ##   in Loop: Header=BB72_15 Depth=2
	movswl	(%r12), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movswl	2(%r12), %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	incl	%r14d
	leal	1(%rax), %ecx
	movl	%ecx, -576(%rbp)
	testq	%rdi, %rdi
	je	LBB72_26
## %bb.20:                              ##   in Loop: Header=BB72_15 Depth=2
	movslq	%eax, %rcx
	movss	%xmm0, (%rdi,%rcx,8)
	movss	%xmm1, 4(%rdi,%rcx,8)
LBB72_26:                               ##   in Loop: Header=BB72_15 Depth=2
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, -588(%rbp)        ## 4-byte Spill
	jmp	LBB72_27
	.p2align	4, 0x90
LBB72_21:                               ##   in Loop: Header=BB72_15 Depth=2
	movswl	4(%r12), %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movswl	6(%r12), %eax
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	movswl	(%r12), %eax
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%eax, %xmm4
	movswl	2(%r12), %eax
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%eax, %xmm5
	leaq	-576(%rbp), %rsi
	movss	-592(%rbp), %xmm6       ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	xorl	%edx, %edx
	callq	_stbtt__tesselate_curve
	jmp	LBB72_23
	.p2align	4, 0x90
LBB72_22:                               ##   in Loop: Header=BB72_15 Depth=2
	movswl	4(%r12), %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movswl	6(%r12), %eax
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	movswl	8(%r12), %eax
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%eax, %xmm4
	movswl	10(%r12), %eax
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%eax, %xmm5
	movswl	(%r12), %eax
	xorps	%xmm6, %xmm6
	cvtsi2ssl	%eax, %xmm6
	movswl	2(%r12), %eax
	xorps	%xmm7, %xmm7
	cvtsi2ssl	%eax, %xmm7
	movss	-592(%rbp), %xmm8       ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	movss	%xmm8, (%rsp)
	leaq	-576(%rbp), %rsi
	xorl	%edx, %edx
	callq	_stbtt__tesselate_cubic
LBB72_23:                               ##   in Loop: Header=BB72_15 Depth=2
	movq	-664(%rbp), %rdi        ## 8-byte Reload
	movswl	(%r12), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movswl	2(%r12), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	jmp	LBB72_27
LBB72_24:                               ##   in Loop: Header=BB72_15 Depth=2
	movswl	(%r12), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movswl	2(%r12), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movslq	-576(%rbp), %rax
	leal	1(%rax), %ecx
	movl	%ecx, -576(%rbp)
	testq	%rdi, %rdi
	je	LBB72_27
## %bb.25:                              ##   in Loop: Header=BB72_15 Depth=2
	movss	%xmm0, (%rdi,%rax,8)
	movss	%xmm1, 4(%rdi,%rax,8)
	.p2align	4, 0x90
LBB72_27:                               ##   in Loop: Header=BB72_15 Depth=2
	addq	$14, %r12
	decq	%r15
	jne	LBB72_15
## %bb.28:                              ##   in Loop: Header=BB72_11 Depth=1
	movl	-576(%rbp), %eax
	movl	%eax, %ecx
	subl	-588(%rbp), %ecx        ## 4-byte Folded Reload
	movslq	%r14d, %rdx
	movq	-696(%rbp), %r15        ## 8-byte Reload
	movl	%ecx, (%r15,%rdx,4)
	movl	-584(%rbp), %ebx        ## 4-byte Reload
	incl	%ebx
	cmpl	$2, %ebx
	jb	LBB72_11
## %bb.29:
	testq	%rdi, %rdi
	je	LBB72_177
## %bb.30:
	cmpl	$0, -580(%rbp)          ## 4-byte Folded Reload
	je	LBB72_32
## %bb.31:
	movaps	-720(%rbp), %xmm0       ## 16-byte Reload
	xorps	LCPI72_0(%rip), %xmm0
	movaps	%xmm0, -720(%rbp)       ## 16-byte Spill
LBB72_32:
	movq	-608(%rbp), %rdi        ## 8-byte Reload
	cmpl	$8, %r13d
	jae	LBB72_35
## %bb.33:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	LBB72_43
LBB72_34:
	movq	%r15, %rdi
	jmp	LBB72_176
LBB72_35:
	movl	%edi, %eax
	andl	$2147483640, %eax       ## imm = 0x7FFFFFF8
	leaq	-8(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$3, %rdx
	incq	%rdx
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpq	$24, %rsi
	jae	LBB72_37
## %bb.36:
	xorps	%xmm0, %xmm0
	xorl	%edx, %edx
	xorps	%xmm1, %xmm1
	testq	%rcx, %rcx
	jne	LBB72_40
	jmp	LBB72_42
LBB72_37:
	movl	$1, %esi
	subq	%rdx, %rsi
	leaq	-1(%rcx,%rsi), %rsi
	xorps	%xmm0, %xmm0
	xorl	%edx, %edx
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
LBB72_38:                               ## =>This Inner Loop Header: Depth=1
	movdqu	(%r15,%rdx,4), %xmm2
	paddd	%xmm0, %xmm2
	movdqu	16(%r15,%rdx,4), %xmm0
	paddd	%xmm1, %xmm0
	movdqu	32(%r15,%rdx,4), %xmm1
	movdqu	48(%r15,%rdx,4), %xmm3
	movdqu	64(%r15,%rdx,4), %xmm4
	paddd	%xmm1, %xmm4
	paddd	%xmm2, %xmm4
	movdqu	80(%r15,%rdx,4), %xmm2
	paddd	%xmm3, %xmm2
	paddd	%xmm0, %xmm2
	movdqu	96(%r15,%rdx,4), %xmm0
	paddd	%xmm4, %xmm0
	movdqu	112(%r15,%rdx,4), %xmm1
	paddd	%xmm2, %xmm1
	addq	$32, %rdx
	addq	$4, %rsi
	jne	LBB72_38
## %bb.39:
	testq	%rcx, %rcx
	je	LBB72_42
LBB72_40:
	leaq	16(%r15,%rdx,4), %rdx
	negq	%rcx
	.p2align	4, 0x90
LBB72_41:                               ## =>This Inner Loop Header: Depth=1
	movdqu	-16(%rdx), %xmm2
	paddd	%xmm2, %xmm0
	movdqu	(%rdx), %xmm2
	paddd	%xmm2, %xmm1
	addq	$32, %rdx
	incq	%rcx
	jne	LBB72_41
LBB72_42:
	paddd	%xmm1, %xmm0
	pshufd	$78, %xmm0, %xmm1       ## xmm1 = xmm0[2,3,0,1]
	paddd	%xmm0, %xmm1
	pshufd	$229, %xmm1, %xmm0      ## xmm0 = xmm1[1,1,2,3]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %ecx
	cmpq	%rdi, %rax
	je	LBB72_44
	.p2align	4, 0x90
LBB72_43:                               ## =>This Inner Loop Header: Depth=1
	addl	(%r15,%rax,4), %ecx
	incq	%rax
	cmpq	%rax, %rdi
	jne	LBB72_43
LBB72_44:
	movslq	%ecx, %rax
	shlq	$2, %rax
	leaq	20(%rax,%rax,4), %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB72_175
## %bb.45:
	movq	%rax, %rsi
	movaps	-832(%rbp), %xmm0       ## 16-byte Reload
	insertps	$16, -800(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = xmm0[0],mem[0],xmm0[2,3]
	movddup	%xmm0, %xmm0            ## xmm0 = xmm0[0,0]
	movaps	-736(%rbp), %xmm1       ## 16-byte Reload
	insertps	$16, -720(%rbp), %xmm1 ## 16-byte Folded Reload
                                        ## xmm1 = xmm1[0],mem[0],xmm1[2,3]
	movddup	%xmm1, %xmm1            ## xmm1 = xmm1[0,0]
	movq	-664(%rbp), %rax        ## 8-byte Reload
	leaq	4(%rax), %r8
	xorl	%r10d, %r10d
	movabsq	$4294967296, %r11       ## imm = 0x100000000
	xorl	%r15d, %r15d
	xorl	%r9d, %r9d
	movq	%rsi, -632(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB72_46:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB72_48 Depth 2
	movq	-696(%rbp), %rax        ## 8-byte Reload
	movl	(%rax,%r10,4), %r12d
	testl	%r12d, %r12d
	jle	LBB72_57
## %bb.47:                              ##   in Loop: Header=BB72_46 Depth=1
	movslq	%r9d, %rax
	movq	-664(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax,8), %r13
	leal	-1(%r12), %edx
	leaq	(%r8,%rax,8), %r14
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB72_48:                               ##   Parent Loop BB72_46 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	%edx, %rdi
	movss	4(%r13,%rdi,8), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	movss	(%r14,%rcx,8), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	ucomiss	%xmm3, %xmm2
	jne	LBB72_49
	jnp	LBB72_56
LBB72_49:                               ##   in Loop: Header=BB72_48 Depth=2
	movslq	%r15d, %rax
	leaq	(%rax,%rax,4), %rax
	movl	$0, 16(%rsi,%rax,4)
	cmpl	$0, -580(%rbp)          ## 4-byte Folded Reload
	je	LBB72_52
## %bb.50:                              ##   in Loop: Header=BB72_48 Depth=2
	ucomiss	%xmm3, %xmm2
	jbe	LBB72_54
LBB72_53:                               ##   in Loop: Header=BB72_48 Depth=2
	leaq	16(%rsi,%rax,4), %rdi
	movl	$1, (%rdi)
	movq	%rbx, %rdi
	sarq	$32, %rdi
	movq	%rbx, %rsi
	sarq	$29, %rsi
	movss	4(%r13,%rsi), %xmm2     ## xmm2 = mem[0],zero,zero,zero
	movq	-632(%rbp), %rsi        ## 8-byte Reload
	jmp	LBB72_55
LBB72_52:                               ##   in Loop: Header=BB72_48 Depth=2
	ucomiss	%xmm2, %xmm3
	ja	LBB72_53
LBB72_54:                               ##   in Loop: Header=BB72_48 Depth=2
	movl	%ecx, %edx
LBB72_55:                               ##   in Loop: Header=BB72_48 Depth=2
	movslq	%edx, %rdx
	movsd	(%r13,%rdx,8), %xmm3    ## xmm3 = mem[0],zero
	insertps	$32, (%r13,%rdi,8), %xmm3 ## xmm3 = xmm3[0,1],mem[0],xmm3[3]
	insertps	$48, %xmm2, %xmm3 ## xmm3 = xmm3[0,1,2],xmm2[0]
	mulps	%xmm1, %xmm3
	addps	%xmm0, %xmm3
	movups	%xmm3, (%rsi,%rax,4)
	incl	%r15d
LBB72_56:                               ##   in Loop: Header=BB72_48 Depth=2
	movl	%ecx, %edx
	incq	%rcx
	addq	%r11, %rbx
	cmpq	%rcx, %r12
	jne	LBB72_48
LBB72_57:                               ##   in Loop: Header=BB72_46 Depth=1
	addl	%r12d, %r9d
	incq	%r10
	cmpq	-608(%rbp), %r10        ## 8-byte Folded Reload
	jne	LBB72_46
## %bb.58:
	movq	%rsi, %rdi
	movl	%r15d, %esi
	callq	_stbtt__sort_edges_quicksort
	movq	-632(%rbp), %rsi        ## 8-byte Reload
	cmpl	$2, %r15d
	movq	-752(%rbp), %r12        ## 8-byte Reload
	movl	-612(%rbp), %r13d       ## 4-byte Reload
	jl	LBB72_66
## %bb.59:
	movl	%r15d, %r8d
	movl	$1, %ecx
	movq	%rsi, %rbx
	.p2align	4, 0x90
LBB72_60:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB72_61 Depth 2
	leaq	(%rcx,%rcx,4), %rdx
	movl	(%rsi,%rdx,4), %r9d
	movss	4(%rsi,%rdx,4), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movl	16(%rsi,%rdx,4), %edi
	movl	%edi, -568(%rbp)
	movq	8(%rsi,%rdx,4), %rdx
	movq	%rdx, -576(%rbp)
	movq	%rbx, %rdx
	movq	%rcx, %rdi
	.p2align	4, 0x90
LBB72_61:                               ##   Parent Loop BB72_60 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	4(%rdx), %xmm1          ## xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm1
	jbe	LBB72_63
## %bb.62:                              ##   in Loop: Header=BB72_61 Depth=2
	decq	%rdi
	movl	16(%rdx), %eax
	movl	%eax, 36(%rdx)
	movq	(%rdx), %rax
	movq	8(%rdx), %rsi
	movq	%rsi, 28(%rdx)
	movq	-632(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, 20(%rdx)
	addq	$-20, %rdx
	testq	%rdi, %rdi
	jg	LBB72_61
LBB72_63:                               ##   in Loop: Header=BB72_60 Depth=1
	movl	%edi, %eax
	cmpq	%rax, %rcx
	je	LBB72_65
## %bb.64:                              ##   in Loop: Header=BB72_60 Depth=1
	movslq	%edi, %rax
	leaq	(%rax,%rax,4), %rax
	movl	%r9d, (%rsi,%rax,4)
	movss	%xmm0, 4(%rsi,%rax,4)
	movl	-568(%rbp), %edx
	movl	%edx, 16(%rsi,%rax,4)
	movq	-576(%rbp), %rdx
	movq	%rdx, 8(%rsi,%rax,4)
LBB72_65:                               ##   in Loop: Header=BB72_60 Depth=1
	incq	%rcx
	addq	$20, %rbx
	cmpq	%r8, %rcx
	jne	LBB72_60
LBB72_66:
	movq	$0, -672(%rbp)
	movslq	(%r12), %r14
	cmpq	$65, %r14
	jl	LBB72_68
## %bb.67:
	leaq	4(,%r14,8), %rdi
	callq	_malloc
	movq	-632(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, -624(%rbp)        ## 8-byte Spill
LBB72_68:
	movq	-744(%rbp), %rdx        ## 8-byte Reload
	movl	4(%r12), %eax
	leal	(%rax,%rdx), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	addss	LCPI72_1(%rip), %xmm0
	movslq	%r15d, %rcx
	leaq	(%rcx,%rcx,4), %rcx
	movss	%xmm0, 4(%rsi,%rcx,4)
	testl	%eax, %eax
	jle	LBB72_172
## %bb.69:
	movq	-624(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%r14,4), %r15
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r13d, %xmm0
	movss	%xmm0, -776(%rbp)       ## 4-byte Spill
	leaq	4(%r15), %rcx
	movq	%rcx, -808(%rbp)        ## 8-byte Spill
	leaq	4(%rax), %rax
	movq	%rax, -840(%rbp)        ## 8-byte Spill
	xorl	%ebx, %ebx
	movq	-632(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -760(%rbp)        ## 8-byte Spill
	movl	%edx, %eax
	movl	$0, -736(%rbp)          ## 4-byte Folded Spill
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%r15, -768(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB72_70:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB72_72 Depth 2
                                        ##     Child Loop BB72_80 Depth 2
                                        ##     Child Loop BB72_98 Depth 2
                                        ##       Child Loop BB72_126 Depth 3
                                        ##       Child Loop BB72_154 Depth 3
                                        ##     Child Loop BB72_164 Depth 2
                                        ##     Child Loop BB72_168 Depth 2
	movq	%rdi, -688(%rbp)        ## 8-byte Spill
	movq	%r8, -680(%rbp)         ## 8-byte Spill
	movq	%r9, %r13
	movl	%eax, -772(%rbp)        ## 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -608(%rbp)       ## 4-byte Spill
	movslq	%r14d, %rsi
	shlq	$2, %rsi
	movq	-624(%rbp), %rdi        ## 8-byte Reload
	callq	___bzero
	movslq	(%r12), %rax
	leaq	4(,%rax,4), %rsi
	movq	%r15, %rdi
	callq	___bzero
	testq	%rbx, %rbx
	je	LBB72_77
## %bb.71:                              ##   in Loop: Header=BB72_70 Depth=1
	leaq	-672(%rbp), %rax
	movq	-624(%rbp), %r12        ## 8-byte Reload
	xorps	%xmm15, %xmm15
	leaq	LCPI72_2(%rip), %r14
	movq	-760(%rbp), %r15        ## 8-byte Reload
	movq	%r13, %r9
	movq	-680(%rbp), %rsi        ## 8-byte Reload
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movq	-688(%rbp), %r13        ## 8-byte Reload
	.p2align	4, 0x90
LBB72_72:                               ##   Parent Loop BB72_70 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	ucomiss	28(%rbx), %xmm1
	jae	LBB72_74
## %bb.73:                              ##   in Loop: Header=BB72_72 Depth=2
	movq	%rbx, %rax
	jmp	LBB72_76
	.p2align	4, 0x90
LBB72_74:                               ##   in Loop: Header=BB72_72 Depth=2
	movq	(%rbx), %rcx
	movq	%rcx, (%rax)
	movss	20(%rbx), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm15, %xmm0
	jne	LBB72_75
	jnp	LBB72_181
LBB72_75:                               ##   in Loop: Header=BB72_72 Depth=2
	movl	$0, 20(%rbx)
	movq	%rsi, (%rbx)
	movq	%rbx, %rsi
LBB72_76:                               ##   in Loop: Header=BB72_72 Depth=2
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	LBB72_72
	jmp	LBB72_78
	.p2align	4, 0x90
LBB72_77:                               ##   in Loop: Header=BB72_70 Depth=1
	movq	-624(%rbp), %r12        ## 8-byte Reload
	xorps	%xmm15, %xmm15
	leaq	LCPI72_2(%rip), %r14
	movq	-760(%rbp), %r15        ## 8-byte Reload
	movq	%r13, %r9
	movq	-680(%rbp), %rsi        ## 8-byte Reload
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movq	-688(%rbp), %r13        ## 8-byte Reload
LBB72_78:                               ##   in Loop: Header=BB72_70 Depth=1
	movaps	%xmm1, %xmm2
	addss	LCPI72_1(%rip), %xmm2
	movss	4(%r15), %xmm0          ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm2, -600(%rbp)       ## 4-byte Spill
	ucomiss	%xmm0, %xmm2
	jb	LBB72_96
## %bb.79:                              ##   in Loop: Header=BB72_70 Depth=1
	cmpl	$0, -744(%rbp)          ## 4-byte Folded Reload
	setne	%al
	cmpl	$0, -736(%rbp)          ## 4-byte Folded Reload
	sete	%bl
	andb	%al, %bl
	.p2align	4, 0x90
LBB72_80:                               ##   Parent Loop BB72_70 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	ucomiss	12(%r15), %xmm0
	jne	LBB72_81
	jnp	LBB72_94
LBB72_81:                               ##   in Loop: Header=BB72_80 Depth=2
	testq	%rsi, %rsi
	je	LBB72_83
## %bb.82:                              ##   in Loop: Header=BB72_80 Depth=2
	movq	%rsi, %rax
	movq	(%rsi), %rsi
	testq	%rax, %rax
	jne	LBB72_88
	jmp	LBB72_183
	.p2align	4, 0x90
LBB72_83:                               ##   in Loop: Header=BB72_80 Depth=2
	testl	%r9d, %r9d
	je	LBB72_85
## %bb.84:                              ##   in Loop: Header=BB72_80 Depth=2
	decl	%r9d
	jmp	LBB72_87
LBB72_85:                               ##   in Loop: Header=BB72_80 Depth=2
	movl	$25608, %edi            ## imm = 0x6408
	callq	_malloc
	testq	%rax, %rax
	je	LBB72_95
## %bb.86:                              ##   in Loop: Header=BB72_80 Depth=2
	movq	%r13, (%rax)
	movl	$799, %r9d              ## imm = 0x31F
	movq	%rax, %r13
	xorps	%xmm15, %xmm15
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
LBB72_87:                               ##   in Loop: Header=BB72_80 Depth=2
	movslq	%r9d, %rax
	shlq	$5, %rax
	leaq	8(%r13,%rax), %rax
	xorl	%esi, %esi
	testq	%rax, %rax
	je	LBB72_183
LBB72_88:                               ##   in Loop: Header=BB72_80 Depth=2
	movss	8(%r15), %xmm3          ## xmm3 = mem[0],zero,zero,zero
	movss	(%r15), %xmm2           ## xmm2 = mem[0],zero,zero,zero
	movss	4(%r15), %xmm5          ## xmm5 = mem[0],zero,zero,zero
	subss	%xmm2, %xmm3
	movss	12(%r15), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm4
	subss	%xmm5, %xmm4
	divss	%xmm4, %xmm3
	movss	%xmm3, 12(%rax)
	xorps	%xmm4, %xmm4
	ucomiss	%xmm4, %xmm3
	jne	LBB72_89
	jnp	LBB72_90
LBB72_89:                               ##   in Loop: Header=BB72_80 Depth=2
	movss	LCPI72_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	divss	%xmm3, %xmm4
LBB72_90:                               ##   in Loop: Header=BB72_80 Depth=2
	movss	%xmm4, 16(%rax)
	movaps	%xmm1, %xmm4
	subss	%xmm5, %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	subss	-776(%rbp), %xmm2       ## 4-byte Folded Reload
	movss	%xmm2, 8(%rax)
	xorl	%ecx, %ecx
	cmpl	$0, 16(%r15)
	sete	%cl
	movss	(%r14,%rcx,4), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	movss	%xmm2, 20(%rax)
	movss	%xmm5, 24(%rax)
	movss	%xmm0, 28(%rax)
	movq	$0, (%rax)
	ucomiss	%xmm0, %xmm1
	setbe	%cl
	movl	%ebx, %edx
	xorb	$1, %dl
	orb	%cl, %dl
	jne	LBB72_92
## %bb.91:                              ##   in Loop: Header=BB72_80 Depth=2
	movss	%xmm1, 28(%rax)
	movaps	%xmm1, %xmm0
LBB72_92:                               ##   in Loop: Header=BB72_80 Depth=2
	ucomiss	%xmm1, %xmm0
	jb	LBB72_182
## %bb.93:                              ##   in Loop: Header=BB72_80 Depth=2
	movq	-672(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	%rax, -672(%rbp)
LBB72_94:                               ##   in Loop: Header=BB72_80 Depth=2
	movss	24(%r15), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	addq	$20, %r15
	movss	-600(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm2
	jae	LBB72_80
	jmp	LBB72_96
LBB72_95:                               ##   in Loop: Header=BB72_80 Depth=2
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	xorl	%eax, %eax
	xorps	%xmm15, %xmm15
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	testq	%rax, %rax
	jne	LBB72_88
	jmp	LBB72_183
	.p2align	4, 0x90
LBB72_96:                               ##   in Loop: Header=BB72_70 Depth=1
	movq	%rsi, -680(%rbp)        ## 8-byte Spill
	movq	%r15, -760(%rbp)        ## 8-byte Spill
	movq	%r13, -688(%rbp)        ## 8-byte Spill
	movq	-672(%rbp), %r15
	testq	%r15, %r15
	je	LBB72_162
## %bb.97:                              ##   in Loop: Header=BB72_70 Depth=1
	movq	-752(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, %r13d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -612(%rbp)       ## 4-byte Spill
	movq	%r9, -800(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB72_98:                               ##   Parent Loop BB72_70 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB72_126 Depth 3
                                        ##       Child Loop BB72_154 Depth 3
	movss	28(%r15), %xmm5         ## xmm5 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm5
	jb	LBB72_180
## %bb.99:                              ##   in Loop: Header=BB72_98 Depth=2
	movss	8(%r15), %xmm4          ## xmm4 = mem[0],zero,zero,zero
	movss	12(%r15), %xmm7         ## xmm7 = mem[0],zero,zero,zero
	ucomiss	%xmm15, %xmm7
	jne	LBB72_103
	jp	LBB72_103
## %bb.100:                             ##   in Loop: Header=BB72_98 Depth=2
	movss	-612(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm4, %xmm0
	jbe	LBB72_161
## %bb.101:                             ##   in Loop: Header=BB72_98 Depth=2
	ucomiss	%xmm15, %xmm4
	jae	LBB72_141
## %bb.102:                             ##   in Loop: Header=BB72_98 Depth=2
	movq	-768(%rbp), %rdi        ## 8-byte Reload
	xorl	%esi, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movaps	%xmm4, %xmm2
	jmp	LBB72_142
	.p2align	4, 0x90
LBB72_103:                              ##   in Loop: Header=BB72_98 Depth=2
	movss	24(%r15), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	movss	-600(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm2
	jb	LBB72_184
## %bb.104:                             ##   in Loop: Header=BB72_98 Depth=2
	movss	16(%r15), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm0
	movaps	%xmm1, %xmm11
	movaps	%xmm4, %xmm3
	jbe	LBB72_106
## %bb.105:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm0, %xmm3
	subss	%xmm1, %xmm3
	mulss	%xmm7, %xmm3
	addss	%xmm4, %xmm3
	movaps	%xmm0, %xmm11
LBB72_106:                              ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm7, %xmm9
	addss	%xmm4, %xmm9
	movss	-600(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm0
	movaps	%xmm9, %xmm14
	jbe	LBB72_108
## %bb.107:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm5, %xmm14
	subss	%xmm1, %xmm14
	mulss	%xmm7, %xmm14
	addss	%xmm4, %xmm14
	movaps	%xmm5, %xmm0
LBB72_108:                              ##   in Loop: Header=BB72_98 Depth=2
	ucomiss	%xmm15, %xmm3
	jb	LBB72_118
## %bb.109:                             ##   in Loop: Header=BB72_98 Depth=2
	ucomiss	%xmm15, %xmm14
	jb	LBB72_118
## %bb.110:                             ##   in Loop: Header=BB72_98 Depth=2
	movss	-612(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	ucomiss	%xmm3, %xmm5
	jbe	LBB72_118
## %bb.111:                             ##   in Loop: Header=BB72_98 Depth=2
	movss	-612(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	ucomiss	%xmm14, %xmm5
	jbe	LBB72_118
## %bb.112:                             ##   in Loop: Header=BB72_98 Depth=2
	cvttss2si	%xmm3, %eax
	cvttss2si	%xmm14, %ecx
	cmpl	%ecx, %eax
	jne	LBB72_143
## %bb.113:                             ##   in Loop: Header=BB72_98 Depth=2
	testl	%eax, %eax
	js	LBB72_185
## %bb.114:                             ##   in Loop: Header=BB72_98 Depth=2
	cmpl	%eax, %r13d
	jle	LBB72_185
## %bb.115:                             ##   in Loop: Header=BB72_98 Depth=2
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%eax, %xmm5
	addss	LCPI72_1(%rip), %xmm5
	movaps	%xmm5, %xmm2
	subss	%xmm3, %xmm2
	ucomiss	%xmm15, %xmm2
	jb	LBB72_190
## %bb.116:                             ##   in Loop: Header=BB72_98 Depth=2
	subss	%xmm14, %xmm5
	ucomiss	%xmm15, %xmm5
	jb	LBB72_191
## %bb.117:                             ##   in Loop: Header=BB72_98 Depth=2
	subss	%xmm11, %xmm0
	mulss	20(%r15), %xmm0
	addss	%xmm5, %xmm2
	mulss	LCPI72_3(%rip), %xmm2
	mulss	%xmm0, %xmm2
	cltq
	addss	(%r12,%rax,4), %xmm2
	movss	%xmm2, (%r12,%rax,4)
	jmp	LBB72_160
	.p2align	4, 0x90
LBB72_118:                              ##   in Loop: Header=BB72_98 Depth=2
	testl	%r13d, %r13d
	jle	LBB72_161
## %bb.119:                             ##   in Loop: Header=BB72_98 Depth=2
	xorl	%ebx, %ebx
	movaps	%xmm7, -832(%rbp)       ## 16-byte Spill
	movss	%xmm4, -720(%rbp)       ## 4-byte Spill
	movaps	%xmm9, -656(%rbp)       ## 16-byte Spill
	jmp	LBB72_126
LBB72_120:                              ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm4, %xmm2
	jbe	LBB72_122
## %bb.121:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm2, %xmm9
	ja	LBB72_124
LBB72_122:                              ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm9, %xmm2
	jbe	LBB72_125
## %bb.123:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm2, %xmm4
	jbe	LBB72_125
LBB72_124:                              ##   in Loop: Header=BB72_126 Depth=3
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movss	%xmm2, -580(%rbp)       ## 4-byte Spill
	movss	%xmm3, -584(%rbp)       ## 4-byte Spill
	jmp	LBB72_129
LBB72_125:                              ##   in Loop: Header=BB72_126 Depth=3
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movaps	%xmm9, %xmm2
	jmp	LBB72_140
	.p2align	4, 0x90
LBB72_126:                              ##   Parent Loop BB72_70 Depth=1
                                        ##     Parent Loop BB72_98 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	%ebx, %r14d
	xorps	%xmm6, %xmm6
	cvtsi2ssl	%ebx, %xmm6
	leal	1(%r14), %ebx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ebx, %xmm2
	movaps	%xmm6, %xmm5
	subss	%xmm4, %xmm5
	divss	%xmm7, %xmm5
	addss	%xmm1, %xmm5
	movaps	%xmm2, %xmm3
	subss	%xmm4, %xmm3
	divss	%xmm7, %xmm3
	addss	%xmm1, %xmm3
	ucomiss	%xmm4, %xmm6
	movss	%xmm5, -592(%rbp)       ## 4-byte Spill
	movss	%xmm6, -588(%rbp)       ## 4-byte Spill
	jbe	LBB72_130
## %bb.127:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm2, %xmm9
	jbe	LBB72_130
## %bb.128:                             ##   in Loop: Header=BB72_126 Depth=3
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movss	%xmm2, -580(%rbp)       ## 4-byte Spill
	movaps	%xmm6, %xmm2
	movss	%xmm3, -584(%rbp)       ## 4-byte Spill
	movaps	%xmm5, %xmm3
	callq	_stbtt__handle_clipped_edge
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movss	-588(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-592(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-580(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-584(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
LBB72_129:                              ##   in Loop: Header=BB72_126 Depth=3
	callq	_stbtt__handle_clipped_edge
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movss	-580(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-584(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	jmp	LBB72_139
	.p2align	4, 0x90
LBB72_130:                              ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm9, %xmm6
	jbe	LBB72_133
## %bb.131:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm2, %xmm4
	jbe	LBB72_133
## %bb.132:                             ##   in Loop: Header=BB72_126 Depth=3
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movss	%xmm2, -580(%rbp)       ## 4-byte Spill
	movss	%xmm3, -584(%rbp)       ## 4-byte Spill
	callq	_stbtt__handle_clipped_edge
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movss	-580(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-584(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-588(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-592(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	jmp	LBB72_138
	.p2align	4, 0x90
LBB72_133:                              ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm4, %xmm6
	jbe	LBB72_135
## %bb.134:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm6, %xmm9
	ja	LBB72_137
LBB72_135:                              ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm9, %xmm6
	jbe	LBB72_120
## %bb.136:                             ##   in Loop: Header=BB72_126 Depth=3
	ucomiss	%xmm6, %xmm4
	jbe	LBB72_120
LBB72_137:                              ##   in Loop: Header=BB72_126 Depth=3
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movaps	%xmm6, %xmm2
	movaps	%xmm5, %xmm3
LBB72_138:                              ##   in Loop: Header=BB72_126 Depth=3
	callq	_stbtt__handle_clipped_edge
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%r15, %rdx
	movss	-588(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-592(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
LBB72_139:                              ##   in Loop: Header=BB72_126 Depth=3
	movaps	-656(%rbp), %xmm2       ## 16-byte Reload
LBB72_140:                              ##   in Loop: Header=BB72_126 Depth=3
	movss	-600(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	callq	_stbtt__handle_clipped_edge
	cmpl	%ebx, %r13d
	xorps	%xmm15, %xmm15
	movq	-800(%rbp), %r9         ## 8-byte Reload
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movaps	-832(%rbp), %xmm7       ## 16-byte Reload
	movss	-720(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	movaps	-656(%rbp), %xmm9       ## 16-byte Reload
	jne	LBB72_126
	jmp	LBB72_161
LBB72_141:                              ##   in Loop: Header=BB72_98 Depth=2
	cvttss2si	%xmm4, %ebx
	movq	%r12, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	movaps	%xmm4, %xmm0
	movaps	%xmm4, %xmm2
	movss	-600(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movss	%xmm4, -720(%rbp)       ## 4-byte Spill
	callq	_stbtt__handle_clipped_edge
	incl	%ebx
	movq	-768(%rbp), %rdi        ## 8-byte Reload
	movl	%ebx, %esi
	movq	%r15, %rdx
	movss	-720(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm2
LBB72_142:                              ##   in Loop: Header=BB72_98 Depth=2
	movss	-600(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	callq	_stbtt__handle_clipped_edge
	movss	-608(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	xorps	%xmm15, %xmm15
	movq	-800(%rbp), %r9         ## 8-byte Reload
	jmp	LBB72_161
LBB72_143:                              ##   in Loop: Header=BB72_98 Depth=2
	ucomiss	%xmm14, %xmm3
	jbe	LBB72_145
## %bb.144:                             ##   in Loop: Header=BB72_98 Depth=2
	subss	%xmm1, %xmm11
	movss	-600(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	movaps	%xmm5, %xmm8
	subss	%xmm11, %xmm8
	subss	%xmm1, %xmm0
	movaps	%xmm5, %xmm11
	subss	%xmm0, %xmm11
	movaps	LCPI72_0(%rip), %xmm0   ## xmm0 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorps	%xmm0, %xmm7
	xorps	%xmm0, %xmm2
	movaps	%xmm8, %xmm0
	movaps	%xmm3, %xmm8
	ucomiss	%xmm15, %xmm2
	jae	LBB72_146
	jmp	LBB72_186
LBB72_145:                              ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm14, %xmm8
	movaps	%xmm3, %xmm14
	movaps	%xmm4, %xmm9
	ucomiss	%xmm15, %xmm2
	jb	LBB72_186
LBB72_146:                              ##   in Loop: Header=BB72_98 Depth=2
	ucomiss	%xmm15, %xmm7
	jb	LBB72_187
## %bb.147:                             ##   in Loop: Header=BB72_98 Depth=2
	cvttss2si	%xmm14, %ecx
	leal	1(%rcx), %edx
	xorps	%xmm7, %xmm7
	cvtsi2ssl	%edx, %xmm7
	cvttss2si	%xmm8, %eax
	movaps	%xmm7, %xmm5
	subss	%xmm9, %xmm5
	mulss	%xmm2, %xmm5
	addss	%xmm1, %xmm5
	cvtsi2ssl	%eax, %xmm10
	movaps	%xmm10, %xmm12
	subss	%xmm9, %xmm12
	mulss	%xmm2, %xmm12
	movss	-600(%rbp), %xmm13      ## 4-byte Reload
                                        ## xmm13 = mem[0],zero,zero,zero
	movaps	%xmm13, %xmm4
	minss	%xmm5, %xmm4
	movss	20(%r15), %xmm9         ## xmm9 = mem[0],zero,zero,zero
	movaps	%xmm4, %xmm5
	subss	%xmm11, %xmm5
	mulss	%xmm9, %xmm5
	subss	%xmm14, %xmm7
	mulss	%xmm5, %xmm7
	mulss	LCPI72_3(%rip), %xmm7
	movslq	%ecx, %rsi
	addss	(%r12,%rsi,4), %xmm7
	addss	%xmm1, %xmm12
	movss	%xmm7, (%r12,%rsi,4)
	ucomiss	%xmm13, %xmm12
	jbe	LBB72_149
## %bb.148:                             ##   in Loop: Header=BB72_98 Depth=2
	movss	-600(%rbp), %xmm12      ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	movaps	%xmm12, %xmm2
	subss	%xmm4, %xmm2
	movl	%eax, %esi
	subl	%edx, %esi
	cvtsi2ssl	%esi, %xmm3
	divss	%xmm3, %xmm2
LBB72_149:                              ##   in Loop: Header=BB72_98 Depth=2
	cmpl	%eax, %edx
	jge	LBB72_155
## %bb.150:                             ##   in Loop: Header=BB72_98 Depth=2
	mulss	%xmm9, %xmm2
	movaps	%xmm2, %xmm3
	mulss	LCPI72_3(%rip), %xmm3
	movslq	%edx, %rdx
	movl	%ecx, %ebx
	notl	%ebx
	addl	%eax, %ebx
	leal	-2(%rax), %esi
	testb	$1, %bl
	je	LBB72_152
## %bb.151:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	addss	(%r12,%rdx,4), %xmm4
	movss	%xmm4, (%r12,%rdx,4)
	addss	%xmm2, %xmm5
	incq	%rdx
LBB72_152:                              ##   in Loop: Header=BB72_98 Depth=2
	cmpl	%ecx, %esi
	je	LBB72_155
## %bb.153:                             ##   in Loop: Header=BB72_98 Depth=2
	movl	%eax, %ecx
	subl	%edx, %ecx
	movq	-840(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rdx,4), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB72_154:                              ##   Parent Loop BB72_70 Depth=1
                                        ##     Parent Loop BB72_98 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movaps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	addss	-4(%rdx,%rsi,4), %xmm4
	movss	%xmm4, -4(%rdx,%rsi,4)
	addss	%xmm2, %xmm5
	movaps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	addss	(%rdx,%rsi,4), %xmm4
	movss	%xmm4, (%rdx,%rsi,4)
	addss	%xmm2, %xmm5
	addq	$2, %rsi
	cmpl	%esi, %ecx
	jne	LBB72_154
LBB72_155:                              ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm5, %xmm2
	andps	LCPI72_4(%rip), %xmm2
	movss	LCPI72_5(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	ucomiss	%xmm2, %xmm3
	jb	LBB72_188
## %bb.156:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm12, %xmm2
	addss	LCPI72_6(%rip), %xmm2
	ucomiss	%xmm2, %xmm0
	jbe	LBB72_189
## %bb.157:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm10, %xmm3
	addss	LCPI72_1(%rip), %xmm3
	movaps	%xmm3, %xmm2
	subss	%xmm10, %xmm2
	ucomiss	%xmm15, %xmm2
	jb	LBB72_190
## %bb.158:                             ##   in Loop: Header=BB72_98 Depth=2
	subss	%xmm8, %xmm3
	ucomiss	%xmm15, %xmm3
	jb	LBB72_191
## %bb.159:                             ##   in Loop: Header=BB72_98 Depth=2
	movaps	%xmm0, %xmm4
	subss	%xmm12, %xmm4
	addss	%xmm3, %xmm2
	mulss	LCPI72_3(%rip), %xmm2
	mulss	%xmm4, %xmm2
	mulss	%xmm9, %xmm2
	addss	%xmm5, %xmm2
	cltq
	addss	(%r12,%rax,4), %xmm2
	movss	%xmm2, (%r12,%rax,4)
	subss	%xmm11, %xmm0
	mulss	%xmm9, %xmm0
LBB72_160:                              ##   in Loop: Header=BB72_98 Depth=2
	movq	-808(%rbp), %rcx        ## 8-byte Reload
	addss	(%rcx,%rax,4), %xmm0
	movss	%xmm0, (%rcx,%rax,4)
	.p2align	4, 0x90
LBB72_161:                              ##   in Loop: Header=BB72_98 Depth=2
	movq	(%r15), %r15
	testq	%r15, %r15
	jne	LBB72_98
LBB72_162:                              ##   in Loop: Header=BB72_70 Depth=1
	movq	-752(%rbp), %r12        ## 8-byte Reload
	movl	(%r12), %r14d
	testl	%r14d, %r14d
	movq	-768(%rbp), %r15        ## 8-byte Reload
	movq	-688(%rbp), %rdi        ## 8-byte Reload
	movq	-680(%rbp), %r8         ## 8-byte Reload
	jle	LBB72_167
## %bb.163:                             ##   in Loop: Header=BB72_70 Depth=1
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB72_164:                              ##   Parent Loop BB72_70 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	addss	(%r15,%rax,4), %xmm0
	movq	-624(%rbp), %rcx        ## 8-byte Reload
	movss	(%rcx,%rax,4), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm1
	andps	LCPI72_4(%rip), %xmm1
	mulss	LCPI72_7(%rip), %xmm1
	addss	LCPI72_3(%rip), %xmm1
	cvttss2si	%xmm1, %ecx
	cmpl	$255, %ecx
	jl	LBB72_166
## %bb.165:                             ##   in Loop: Header=BB72_164 Depth=2
	movb	$-1, %cl
LBB72_166:                              ##   in Loop: Header=BB72_164 Depth=2
	movq	16(%r12), %rdx
	movl	8(%r12), %esi
	imull	-736(%rbp), %esi        ## 4-byte Folded Reload
	addl	%eax, %esi
	movslq	%esi, %rsi
	movb	%cl, (%rdx,%rsi)
	incq	%rax
	movslq	(%r12), %r14
	cmpq	%r14, %rax
	jl	LBB72_164
LBB72_167:                              ##   in Loop: Header=BB72_70 Depth=1
	movq	-672(%rbp), %rbx
	movq	%rbx, %rax
	testq	%rbx, %rbx
	je	LBB72_169
	.p2align	4, 0x90
LBB72_168:                              ##   Parent Loop BB72_70 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	12(%rax), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	addss	8(%rax), %xmm0
	movss	%xmm0, 8(%rax)
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	LBB72_168
LBB72_169:                              ##   in Loop: Header=BB72_70 Depth=1
	movl	-772(%rbp), %eax        ## 4-byte Reload
	incl	%eax
	movl	-736(%rbp), %ecx        ## 4-byte Reload
	incl	%ecx
	movl	%ecx, -736(%rbp)        ## 4-byte Spill
	cmpl	4(%r12), %ecx
	jl	LBB72_70
## %bb.170:
	testq	%rdi, %rdi
	je	LBB72_172
	.p2align	4, 0x90
LBB72_171:                              ## =>This Inner Loop Header: Depth=1
	movq	(%rdi), %rbx
	callq	_free
	movq	%rbx, %rdi
	testq	%rbx, %rbx
	jne	LBB72_171
LBB72_172:
	leaq	-576(%rbp), %rax
	movq	-624(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rax, %rdi
	je	LBB72_174
## %bb.173:
	callq	_free
LBB72_174:
	movq	-632(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-696(%rbp), %r15        ## 8-byte Reload
LBB72_175:
	movq	%r15, %rdi
	callq	_free
	movq	-664(%rbp), %rdi        ## 8-byte Reload
LBB72_176:
	callq	_free
LBB72_177:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB72_179
## %bb.178:
	addq	$808, %rsp              ## imm = 0x328
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB72_179:
	callq	___stack_chk_fail
LBB72_180:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.102(%rip), %rcx
	movl	$3090, %edx             ## imm = 0xC12
	callq	___assert_rtn
LBB72_181:
	leaq	L___func__.stbtt__rasterize_sorted_edges(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.99(%rip), %rcx
	movl	$3331, %edx             ## imm = 0xD03
	callq	___assert_rtn
LBB72_182:
	leaq	L___func__.stbtt__rasterize_sorted_edges(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.100(%rip), %rcx
	movl	$3350, %edx             ## imm = 0xD16
	callq	___assert_rtn
LBB72_183:
	leaq	L___func__.stbtt__new_active(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.101(%rip), %rcx
	movl	$2861, %edx             ## imm = 0xB2D
	callq	___assert_rtn
LBB72_184:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.103(%rip), %rcx
	movl	$3109, %edx             ## imm = 0xC25
	callq	___assert_rtn
LBB72_185:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.104(%rip), %rcx
	movl	$3137, %edx             ## imm = 0xC41
	callq	___assert_rtn
LBB72_186:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.105(%rip), %rcx
	movl	$3155, %edx             ## imm = 0xC53
	callq	___assert_rtn
LBB72_187:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.106(%rip), %rcx
	movl	$3156, %edx             ## imm = 0xC54
	callq	___assert_rtn
LBB72_188:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.107(%rip), %rcx
	movl	$3220, %edx             ## imm = 0xC94
	callq	___assert_rtn
LBB72_189:
	leaq	L___func__.stbtt__fill_active_edges_new(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.108(%rip), %rcx
	movl	$3221, %edx             ## imm = 0xC95
	callq	___assert_rtn
LBB72_190:
	leaq	L___func__.stbtt__sized_trapezoid_area(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.117(%rip), %rcx
	movl	$3067, %edx             ## imm = 0xBFB
	callq	___assert_rtn
LBB72_191:
	leaq	L___func__.stbtt__sized_trapezoid_area(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.118(%rip), %rcx
	movl	$3068, %edx             ## imm = 0xBFC
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L72_0_set_17, LBB72_17-LJTI72_0
.set L72_0_set_24, LBB72_24-LJTI72_0
.set L72_0_set_21, LBB72_21-LJTI72_0
.set L72_0_set_22, LBB72_22-LJTI72_0
LJTI72_0:
	.long	L72_0_set_17
	.long	L72_0_set_24
	.long	L72_0_set_21
	.long	L72_0_set_22
	.end_data_region
                                        ## -- End function
	.globl	_stbtt_FreeBitmap       ## -- Begin function stbtt_FreeBitmap
	.p2align	4, 0x90
_stbtt_FreeBitmap:                      ## @stbtt_FreeBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt_GetGlyphBitmapSubpixel
LCPI74_0:
	.long	1051931443              ## float 0.349999994
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetGlyphBitmapSubpixel
	.p2align	4, 0x90
_stbtt_GetGlyphBitmapSubpixel:          ## @stbtt_GetGlyphBitmapSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, -96(%rbp)          ## 8-byte Spill
	movq	%r8, -88(%rbp)          ## 8-byte Spill
	movq	%rcx, %r13
	movq	%rdx, %r12
	movl	%esi, %r14d
	movss	%xmm3, -48(%rbp)        ## 4-byte Spill
	movss	%xmm2, -44(%rbp)        ## 4-byte Spill
	movaps	%xmm1, -160(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	movq	%rdi, %rbx
	leaq	-64(%rbp), %rdx
	callq	_stbtt_GetGlyphShape
	movaps	-160(%rbp), %xmm2       ## 16-byte Reload
	xorps	%xmm0, %xmm0
	movaps	-144(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, %xmm3
	cmpeqss	%xmm0, %xmm3
	movaps	%xmm3, %xmm1
	andps	%xmm2, %xmm1
	andnps	%xmm4, %xmm3
	orps	%xmm1, %xmm3
	ucomiss	%xmm0, %xmm2
	jne	LBB74_3
	jp	LBB74_3
## %bb.1:
	ucomiss	%xmm0, %xmm3
	movaps	%xmm3, %xmm2
	jne	LBB74_3
	jp	LBB74_3
## %bb.2:
	movq	-64(%rbp), %rdi
	callq	_free
	xorl	%ebx, %ebx
	jmp	LBB74_20
LBB74_3:
	movaps	%xmm3, -144(%rbp)       ## 16-byte Spill
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	movaps	%xmm2, -160(%rbp)       ## 16-byte Spill
	movl	$0, -120(%rbp)
	movl	$0, -52(%rbp)
	leaq	-120(%rbp), %rdx
	leaq	-52(%rbp), %rcx
	leaq	-76(%rbp), %r8
	leaq	-72(%rbp), %r9
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB74_4
## %bb.5:
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-120(%rbp), %xmm0
	movaps	-144(%rbp), %xmm4       ## 16-byte Reload
	mulss	%xmm4, %xmm0
	movss	-44(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	addss	%xmm2, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %esi
	xorl	%eax, %eax
	subl	-72(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movaps	-160(%rbp), %xmm3       ## 16-byte Reload
	mulss	%xmm3, %xmm0
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	addss	%xmm1, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %r15d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-76(%rbp), %xmm0
	xorl	%eax, %eax
	mulss	%xmm4, %xmm0
	addss	%xmm2, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %r14d
	subl	-52(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm1, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	jmp	LBB74_6
LBB74_4:
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	xorl	%eax, %eax
LBB74_6:
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	subl	%esi, %r14d
	movl	%r14d, -120(%rbp)
	subl	%r15d, %eax
	movl	%eax, -116(%rbp)
	movq	$0, -104(%rbp)
	testq	%r12, %r12
	je	LBB74_8
## %bb.7:
	movl	%r14d, (%r12)
LBB74_8:
	testq	%r13, %r13
	je	LBB74_10
## %bb.9:
	movl	%eax, (%r13)
LBB74_10:
	testq	%rdx, %rdx
	je	LBB74_12
## %bb.11:
	movl	%esi, (%rdx)
LBB74_12:
	testq	%rcx, %rcx
	je	LBB74_14
## %bb.13:
	movl	%r15d, (%rcx)
LBB74_14:
	xorl	%ebx, %ebx
	testl	%r14d, %r14d
	je	LBB74_19
## %bb.15:
	testl	%eax, %eax
	je	LBB74_19
## %bb.16:
	movl	%esi, %r12d
	imull	%r14d, %eax
	movslq	%eax, %rdi
	callq	_malloc
	movq	%rax, -104(%rbp)
	testq	%rax, %rax
	je	LBB74_17
## %bb.18:
	movq	%rax, %rbx
	movl	%r14d, -112(%rbp)
	movq	-64(%rbp), %rsi
	leaq	-120(%rbp), %rdi
	movss	LCPI74_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movl	-68(%rbp), %edx         ## 4-byte Reload
	movaps	-144(%rbp), %xmm1       ## 16-byte Reload
	movaps	-160(%rbp), %xmm2       ## 16-byte Reload
	movss	-44(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	movl	%r12d, %ecx
	movl	%r15d, %r8d
	movl	$1, %r9d
	callq	_stbtt_Rasterize
	jmp	LBB74_19
LBB74_17:
	xorl	%ebx, %ebx
LBB74_19:
	movq	-64(%rbp), %rdi
	callq	_free
LBB74_20:
	movq	%rbx, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetGlyphBitmap   ## -- Begin function stbtt_GetGlyphBitmap
	.p2align	4, 0x90
_stbtt_GetGlyphBitmap:                  ## @stbtt_GetGlyphBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt_MakeGlyphBitmapSubpixel
LCPI76_0:
	.long	1051931443              ## float 0.349999994
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_MakeGlyphBitmapSubpixel
	.p2align	4, 0x90
_stbtt_MakeGlyphBitmapSubpixel:         ## @stbtt_MakeGlyphBitmapSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r14d
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	%r8d, -64(%rbp)         ## 4-byte Spill
	movl	%ecx, %r12d
	movl	%edx, %ebx
	movq	%rsi, %r13
	movq	%rdi, %r15
	leaq	-80(%rbp), %rdx
	movl	%r9d, %esi
	callq	_stbtt_GetGlyphShape
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movl	$0, -104(%rbp)
	movl	$0, -72(%rbp)
	leaq	-104(%rbp), %rdx
	leaq	-72(%rbp), %rcx
	leaq	-108(%rbp), %r8
	leaq	-68(%rbp), %r9
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB76_1
## %bb.2:
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-104(%rbp), %xmm0
	movss	-44(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	movss	-52(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	addss	%xmm3, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %ecx
	xorl	%eax, %eax
	subl	-68(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	-48(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	movss	-56(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	addss	%xmm4, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %r8d
	jmp	LBB76_3
LBB76_1:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	movss	-56(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-44(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
LBB76_3:
	movq	%r13, -88(%rbp)
	movl	%ebx, -104(%rbp)
	movl	%r12d, -100(%rbp)
	movl	-64(%rbp), %eax         ## 4-byte Reload
	movl	%eax, -96(%rbp)
	testl	%ebx, %ebx
	je	LBB76_5
## %bb.4:
	testl	%r12d, %r12d
	je	LBB76_5
## %bb.6:
	movq	-80(%rbp), %rbx
	leaq	-104(%rbp), %rdi
	movss	LCPI76_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rsi
	movl	-60(%rbp), %edx         ## 4-byte Reload
	movl	$1, %r9d
	callq	_stbtt_Rasterize
	jmp	LBB76_7
LBB76_5:
	movq	-80(%rbp), %rbx
LBB76_7:
	movq	%rbx, %rdi
	callq	_free
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_MakeGlyphBitmap  ## -- Begin function stbtt_MakeGlyphBitmap
	.p2align	4, 0x90
_stbtt_MakeGlyphBitmap:                 ## @stbtt_MakeGlyphBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	popq	%rbp
	jmp	_stbtt_MakeGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointBitmapSubpixel ## -- Begin function stbtt_GetCodepointBitmapSubpixel
	.p2align	4, 0x90
_stbtt_GetCodepointBitmapSubpixel:      ## @stbtt_GetCodepointBitmapSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movl	%eax, %esi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_MakeCodepointBitmapSubpixelPrefilter ## -- Begin function stbtt_MakeCodepointBitmapSubpixelPrefilter
	.p2align	4, 0x90
_stbtt_MakeCodepointBitmapSubpixelPrefilter: ## @stbtt_MakeCodepointBitmapSubpixelPrefilter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movss	%xmm3, -60(%rbp)        ## 4-byte Spill
	movss	%xmm2, -56(%rbp)        ## 4-byte Spill
	movss	%xmm1, -52(%rbp)        ## 4-byte Spill
	movss	%xmm0, -48(%rbp)        ## 4-byte Spill
	movl	%r8d, %r12d
	movl	%ecx, %r13d
	movl	%edx, %r14d
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	movq	%rdi, %r15
	movl	40(%rbp), %esi
	callq	_stbtt_FindGlyphIndex
	movq	%r14, -72(%rbp)         ## 8-byte Spill
	leal	1(%r14), %edx
	movq	-88(%rbp), %r14         ## 8-byte Reload
	subl	%ebx, %edx
	movq	%r13, -80(%rbp)         ## 8-byte Spill
	leal	1(%r13), %ecx
	subl	16(%rbp), %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%r12d, -44(%rbp)        ## 4-byte Spill
	movl	%r12d, %r8d
	movss	-48(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-60(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movl	%eax, %r9d
	callq	_stbtt_MakeGlyphBitmapSubpixel
	cmpl	$2, %ebx
	jl	LBB79_2
## %bb.1:
	movq	%r14, %rdi
	movq	-72(%rbp), %rsi         ## 8-byte Reload
                                        ## kill: def $esi killed $esi killed $rsi
	movq	-80(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: def $edx killed $edx killed $rdx
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	movl	%ebx, %r8d
	callq	_stbtt__h_prefilter
LBB79_2:
	movl	16(%rbp), %r15d
	cmpl	$2, %r15d
	jl	LBB79_4
## %bb.3:
	movq	%r14, %rdi
	movq	-72(%rbp), %rsi         ## 8-byte Reload
                                        ## kill: def $esi killed $esi killed $rsi
	movq	-80(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: def $edx killed $edx killed $rdx
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	movl	%r15d, %r8d
	callq	_stbtt__v_prefilter
LBB79_4:
	movq	24(%rbp), %rax
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	testl	%ebx, %ebx
	je	LBB79_6
## %bb.5:
	movl	$1, %ecx
	subl	%ebx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ebx, %xmm2
	addss	%xmm2, %xmm2
	divss	%xmm2, %xmm1
LBB79_6:
	movq	32(%rbp), %rcx
	movss	%xmm1, (%rax)
	testl	%r15d, %r15d
	je	LBB79_8
## %bb.7:
	movl	$1, %eax
	subl	%r15d, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%r15d, %xmm1
	addss	%xmm1, %xmm1
	divss	%xmm1, %xmm0
LBB79_8:
	movss	%xmm0, (%rcx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_MakeGlyphBitmapSubpixelPrefilter ## -- Begin function stbtt_MakeGlyphBitmapSubpixelPrefilter
	.p2align	4, 0x90
_stbtt_MakeGlyphBitmapSubpixelPrefilter: ## @stbtt_MakeGlyphBitmapSubpixelPrefilter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movl	%r8d, %r15d
	movl	%ecx, %r12d
	movl	%edx, %r13d
	movq	%rsi, %r14
	movl	40(%rbp), %r9d
	leal	1(%r13), %edx
	subl	%ebx, %edx
	leal	1(%r12), %ecx
	subl	16(%rbp), %ecx
	callq	_stbtt_MakeGlyphBitmapSubpixel
	cmpl	$2, %ebx
	jl	LBB80_2
## %bb.1:
	movq	%r14, %rdi
	movl	%r13d, %esi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movl	%ebx, %r8d
	callq	_stbtt__h_prefilter
LBB80_2:
	movl	16(%rbp), %edx
	cmpl	$2, %edx
	jl	LBB80_4
## %bb.3:
	movq	%r14, %rdi
	movl	%r13d, %esi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movl	16(%rbp), %r8d
	callq	_stbtt__v_prefilter
	movl	16(%rbp), %edx
LBB80_4:
	movq	24(%rbp), %rax
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	testl	%ebx, %ebx
	je	LBB80_6
## %bb.5:
	movl	$1, %ecx
	subl	%ebx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ebx, %xmm2
	addss	%xmm2, %xmm2
	divss	%xmm2, %xmm1
LBB80_6:
	movq	32(%rbp), %rcx
	movss	%xmm1, (%rax)
	testl	%edx, %edx
	je	LBB80_8
## %bb.7:
	movl	$1, %eax
	subl	%edx, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	addss	%xmm1, %xmm1
	divss	%xmm1, %xmm0
LBB80_8:
	movss	%xmm0, (%rcx)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_MakeCodepointBitmapSubpixel ## -- Begin function stbtt_MakeCodepointBitmapSubpixel
	.p2align	4, 0x90
_stbtt_MakeCodepointBitmapSubpixel:     ## @stbtt_MakeCodepointBitmapSubpixel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	%r8d, %r14d
	movl	%ecx, %r15d
	movl	%edx, %r12d
	movq	%rsi, %r13
	movq	%rdi, %rbx
	movl	%r9d, %esi
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movl	%r14d, %r8d
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movl	%eax, %r9d
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_MakeGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointBitmap ## -- Begin function stbtt_GetCodepointBitmap
	.p2align	4, 0x90
_stbtt_GetCodepointBitmap:              ## @stbtt_GetCodepointBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	movq	%rbx, %rdi
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movl	%eax, %esi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_MakeCodepointBitmap ## -- Begin function stbtt_MakeCodepointBitmap
	.p2align	4, 0x90
_stbtt_MakeCodepointBitmap:             ## @stbtt_MakeCodepointBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	%r8d, %r14d
	movl	%ecx, %r15d
	movl	%edx, %r12d
	movq	%rsi, %r13
	movq	%rdi, %rbx
	movl	%r9d, %esi
	callq	_stbtt_FindGlyphIndex
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movl	%r14d, %r8d
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movl	%eax, %r9d
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_MakeGlyphBitmapSubpixel ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt_GetBakedQuad
LCPI84_0:
	.long	3204448256              ## float -0.5
LCPI84_1:
	.long	1065353216              ## float 1
LCPI84_2:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetBakedQuad
	.p2align	4, 0x90
_stbtt_GetBakedQuad:                    ## @stbtt_GetBakedQuad
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	16(%rbp), %r10
	cmpl	$0, 24(%rbp)
	je	LBB84_1
## %bb.2:
	xorps	%xmm0, %xmm0
	jmp	LBB84_3
LBB84_1:
	movss	LCPI84_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
LBB84_3:
	cvtsi2ssl	%esi, %xmm1
	cvtsi2ssl	%edx, %xmm2
	movslq	%ecx, %rcx
	movss	(%r8), %xmm3            ## xmm3 = mem[0],zero,zero,zero
	leaq	(%rcx,%rcx,4), %rcx
	addss	8(%rdi,%rcx,4), %xmm3
	movss	LCPI84_2(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	addss	%xmm4, %xmm3
	roundss	$9, %xmm3, %xmm3
	cvttss2si	%xmm3, %edx
	movss	(%r9), %xmm3            ## xmm3 = mem[0],zero,zero,zero
	addss	12(%rdi,%rcx,4), %xmm3
	addss	%xmm4, %xmm3
	roundss	$9, %xmm3, %xmm3
	cvttss2si	%xmm3, %esi
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%edx, %xmm4
	movss	LCPI84_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	cvtsi2ssl	%esi, %xmm5
	addss	%xmm0, %xmm4
	movss	%xmm4, (%r10)
	movaps	%xmm3, %xmm4
	addss	%xmm0, %xmm5
	movss	%xmm5, 4(%r10)
	movzwl	4(%rdi,%rcx,4), %r9d
	addl	%r9d, %edx
	movzwl	(%rdi,%rcx,4), %eax
	subl	%eax, %edx
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%edx, %xmm5
	addss	%xmm0, %xmm5
	movss	%xmm5, 16(%r10)
	movzwl	6(%rdi,%rcx,4), %r11d
	addl	%r11d, %esi
	movzwl	2(%rdi,%rcx,4), %edx
	subl	%edx, %esi
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%esi, %xmm5
	divss	%xmm1, %xmm4
	divss	%xmm2, %xmm3
	addss	%xmm0, %xmm5
	movss	%xmm5, 20(%r10)
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%r10)
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	mulss	%xmm3, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%r9d, %xmm1
	movss	%xmm0, 12(%r10)
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r11d, %xmm0
	mulss	%xmm4, %xmm1
	movss	%xmm1, 24(%r10)
	mulss	%xmm3, %xmm0
	movss	%xmm0, 28(%r10)
	movss	16(%rdi,%rcx,4), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	addss	(%r8), %xmm0
	movss	%xmm0, (%r8)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackBegin        ## -- Begin function stbtt_PackBegin
	.p2align	4, 0x90
_stbtt_PackBegin:                       ## @stbtt_PackBegin
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movl	%r8d, -44(%rbp)         ## 4-byte Spill
	movl	%ecx, -56(%rbp)         ## 4-byte Spill
	movl	%edx, %r13d
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, %r15
	movl	$20, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	%r13d, -52(%rbp)        ## 4-byte Spill
	movl	%ebx, -48(%rbp)         ## 4-byte Spill
	subl	%ebx, %r13d
	movslq	%r13d, %rdi
	callq	_malloc
	movq	%rax, %r12
	testq	%r14, %r14
	je	LBB85_2
## %bb.1:
	testq	%r12, %r12
	je	LBB85_2
## %bb.6:
	movq	16(%rbp), %rax
	movq	%rax, (%r15)
	movl	-52(%rbp), %edx         ## 4-byte Reload
	movl	%edx, 16(%r15)
	movl	-56(%rbp), %ecx         ## 4-byte Reload
	movl	%ecx, 20(%r15)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movq	%rdi, 48(%r15)
	movq	%r14, 8(%r15)
	movq	%r12, 56(%r15)
	movl	-44(%rbp), %eax         ## 4-byte Reload
	testl	%eax, %eax
	cmovel	%edx, %eax
	movl	-48(%rbp), %esi         ## 4-byte Reload
	movl	%esi, 28(%r15)
	movl	%eax, 24(%r15)
	movl	$1, 40(%r15)
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	movq	%rax, 32(%r15)
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%r13d, (%r14)
	movl	%eax, 4(%r14)
	movq	$0, 8(%r14)
	movl	$0, 16(%r14)
	movl	$1, %ebx
	testq	%rdi, %rdi
	je	LBB85_8
## %bb.7:
	imull	%edx, %ecx
	movslq	%ecx, %rsi
	callq	___bzero
	jmp	LBB85_8
LBB85_2:
	testq	%r14, %r14
	je	LBB85_4
## %bb.3:
	movq	%r14, %rdi
	callq	_free
LBB85_4:
	xorl	%ebx, %ebx
	testq	%r12, %r12
	je	LBB85_8
## %bb.5:
	movq	%r12, %rdi
	callq	_free
LBB85_8:
	movl	%ebx, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackEnd          ## -- Begin function stbtt_PackEnd
	.p2align	4, 0x90
_stbtt_PackEnd:                         ## @stbtt_PackEnd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	56(%rdi), %rdi
	callq	_free
	movq	8(%rbx), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackSetOversampling ## -- Begin function stbtt_PackSetOversampling
	.p2align	4, 0x90
_stbtt_PackSetOversampling:             ## @stbtt_PackSetOversampling
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpl	$9, %esi
	jae	LBB87_3
## %bb.1:
	cmpl	$9, %edx
	jae	LBB87_4
## %bb.2:
	movl	%esi, 36(%rdi)
	movl	%edx, 40(%rdi)
	popq	%rbp
	retq
LBB87_3:
	leaq	L___func__.stbtt_PackSetOversampling(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.5(%rip), %rcx
	movl	$3997, %edx             ## imm = 0xF9D
	callq	___assert_rtn
LBB87_4:
	leaq	L___func__.stbtt_PackSetOversampling(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.6(%rip), %rcx
	movl	$3998, %edx             ## imm = 0xF9E
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackSetSkipMissingCodepoints ## -- Begin function stbtt_PackSetSkipMissingCodepoints
	.p2align	4, 0x90
_stbtt_PackSetSkipMissingCodepoints:    ## @stbtt_PackSetSkipMissingCodepoints
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, 32(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt_PackFontRangesGatherRects
LCPI89_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI89_1:
	.long	0                       ## float 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_PackFontRangesGatherRects
	.p2align	4, 0x90
_stbtt_PackFontRangesGatherRects:       ## @stbtt_PackFontRangesGatherRects
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	testl	%ecx, %ecx
	jle	LBB89_1
## %bb.2:
	movq	%rdi, %r15
	movl	%ecx, %eax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	addq	$16, %r8
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%r11d, %r11d
	movq	%r8, -112(%rbp)         ## 8-byte Spill
	movq	%rdx, -104(%rbp)        ## 8-byte Spill
	movq	%rdi, -96(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB89_3:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB89_8 Depth 2
	leaq	(%rbx,%rbx,4), %r10
	movss	(%rdx,%r10,8), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	ucomiss	LCPI89_1(%rip), %xmm1
	jbe	LBB89_5
## %bb.4:                               ##   in Loop: Header=BB89_3 Depth=1
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	movq	8(%rsi), %r9
	movslq	36(%rsi), %rcx
	movzbl	4(%r9,%rcx), %esi
	shll	$8, %esi
	movzbl	5(%r9,%rcx), %edi
	movswl	%si, %esi
	orl	%edi, %esi
	movzbl	6(%r9,%rcx), %edi
	shll	$8, %edi
	movzbl	7(%r9,%rcx), %ecx
	movswl	%di, %edi
	orl	%ecx, %edi
	subl	%edi, %esi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	jmp	LBB89_6
	.p2align	4, 0x90
LBB89_5:                                ##   in Loop: Header=BB89_3 Depth=1
	xorps	LCPI89_0(%rip), %xmm1
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	movq	8(%rsi), %rcx
	movslq	28(%rsi), %rsi
	movzwl	18(%rcx,%rsi), %ecx
	rolw	$8, %cx
	movzwl	%cx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
LBB89_6:                                ##   in Loop: Header=BB89_3 Depth=1
	divss	%xmm0, %xmm1
	movb	36(%r15), %cl
	movb	%cl, 32(%rdx,%r10,8)
	movb	40(%r15), %cl
	movb	%cl, 33(%rdx,%r10,8)
	cmpl	$0, 16(%rdx,%r10,8)
	jle	LBB89_20
## %bb.7:                               ##   in Loop: Header=BB89_3 Depth=1
	movq	%rbx, -128(%rbp)        ## 8-byte Spill
	leaq	16(%rdx,%r10,8), %rdx
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	cltq
	leaq	(%rax,%rax,2), %rax
	leaq	(%r8,%rax,8), %r13
	xorl	%r12d, %r12d
	movl	%r11d, %ebx
	movaps	%xmm1, -144(%rbp)       ## 16-byte Spill
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB89_8:                                ##   Parent Loop BB89_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-8(%rdx), %rax
	testq	%rax, %rax
	je	LBB89_9
## %bb.10:                              ##   in Loop: Header=BB89_8 Depth=2
	movl	(%rax,%r12,4), %esi
	jmp	LBB89_11
	.p2align	4, 0x90
LBB89_9:                                ##   in Loop: Header=BB89_8 Depth=2
	movl	-12(%rdx), %esi
	addl	%r12d, %esi
LBB89_11:                               ##   in Loop: Header=BB89_8 Depth=2
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	callq	_stbtt_FindGlyphIndex
	movl	%eax, %r14d
	testl	%eax, %eax
	je	LBB89_12
LBB89_14:                               ##   in Loop: Header=BB89_8 Depth=2
	movl	%ebx, -44(%rbp)         ## 4-byte Spill
	movl	36(%r15), %ebx
	movl	40(%r15), %r15d
	movl	$0, -52(%rbp)
	movl	$0, -48(%rbp)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movl	%r14d, %esi
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-84(%rbp), %r8
	leaq	-80(%rbp), %r9
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB89_15
## %bb.16:                              ##   in Loop: Header=BB89_8 Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2ssq	%rbx, %xmm0
	movaps	-144(%rbp), %xmm4       ## 16-byte Reload
	mulss	%xmm4, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssq	%r15, %xmm1
	xorps	%xmm2, %xmm2
	cvtsi2ssl	-52(%rbp), %xmm2
	mulss	%xmm0, %xmm2
	xorps	%xmm3, %xmm3
	addss	%xmm3, %xmm2
	roundss	$9, %xmm2, %xmm2
	cvttss2si	%xmm2, %eax
	mulss	%xmm4, %xmm1
	xorl	%ecx, %ecx
	subl	-80(%rbp), %ecx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	mulss	%xmm1, %xmm2
	addss	%xmm3, %xmm2
	roundss	$9, %xmm2, %xmm2
	cvttss2si	%xmm2, %ecx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	-84(%rbp), %xmm2
	mulss	%xmm0, %xmm2
	addss	%xmm3, %xmm2
	xorps	%xmm0, %xmm0
	roundss	$10, %xmm2, %xmm0
	cvttss2si	%xmm0, %r8d
	xorl	%esi, %esi
	subl	-48(%rbp), %esi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm3, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %esi
	jmp	LBB89_17
	.p2align	4, 0x90
LBB89_12:                               ##   in Loop: Header=BB89_8 Depth=2
	movl	32(%r15), %eax
	orl	%ebx, %eax
	je	LBB89_14
## %bb.13:                              ##   in Loop: Header=BB89_8 Depth=2
	movq	$0, -4(%r13)
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	jmp	LBB89_18
	.p2align	4, 0x90
LBB89_15:                               ##   in Loop: Header=BB89_8 Depth=2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%esi, %esi
LBB89_17:                               ##   in Loop: Header=BB89_8 Depth=2
	movq	-96(%rbp), %r15         ## 8-byte Reload
	movl	-44(%rbp), %ebx         ## 4-byte Reload
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	movl	28(%r15), %edi
	notl	%eax
	addl	%edi, %eax
	addl	%r8d, %eax
	addl	36(%r15), %eax
	movl	%eax, -4(%r13)
	notl	%ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	addl	40(%r15), %ecx
	testl	%r14d, %r14d
	movl	%ecx, (%r13)
	movl	$1, %eax
	cmovel	%eax, %ebx
LBB89_18:                               ##   in Loop: Header=BB89_8 Depth=2
	incq	%r12
	movslq	(%rdx), %rax
	addq	$24, %r13
	cmpq	%rax, %r12
	jl	LBB89_8
## %bb.19:                              ##   in Loop: Header=BB89_3 Depth=1
	movl	%ebx, %r11d
	movl	-76(%rbp), %eax         ## 4-byte Reload
	addl	%r12d, %eax
	movq	-112(%rbp), %r8         ## 8-byte Reload
	movq	-104(%rbp), %rdx        ## 8-byte Reload
	movq	-128(%rbp), %rbx        ## 8-byte Reload
LBB89_20:                               ##   in Loop: Header=BB89_3 Depth=1
	incq	%rbx
	cmpq	-120(%rbp), %rbx        ## 8-byte Folded Reload
	jne	LBB89_3
	jmp	LBB89_21
LBB89_1:
	xorl	%eax, %eax
LBB89_21:
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__h_prefilter
_stbtt__h_prefilter:                    ## @stbtt__h_prefilter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	$0, -48(%rbp)
	movl	%edx, -68(%rbp)         ## 4-byte Spill
	testl	%edx, %edx
	jle	LBB90_35
## %bb.1:
	movl	%r8d, %r12d
	movl	%esi, %r15d
	movq	%rdi, %rbx
	movl	%esi, %eax
	subl	%r8d, %eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	movl	%r8d, %r9d
	movslq	%ecx, %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	leal	1(%r15), %r11d
	subl	%r8d, %r11d
	leaq	-1(%r11), %rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movl	%r11d, %eax
	andl	$1, %eax
	movq	%r11, %r14
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	subq	%rax, %r14
	xorl	%eax, %eax
	movq	%r11, -64(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB90_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB90_26 Depth 2
                                        ##     Child Loop BB90_22 Depth 2
                                        ##     Child Loop BB90_11 Depth 2
                                        ##     Child Loop BB90_18 Depth 2
                                        ##     Child Loop BB90_28 Depth 2
                                        ##     Child Loop BB90_32 Depth 2
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	movl	$8, %ecx
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	movq	%r9, %r13
	movq	%r9, %rdx
	callq	___memset_chk
	leal	-2(%r12), %eax
	cmpl	$3, %eax
	ja	LBB90_15
## %bb.3:                               ##   in Loop: Header=BB90_2 Depth=1
	leaq	LJTI90_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB90_12:                               ##   in Loop: Header=BB90_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	%r13, %r9
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB90_5
## %bb.13:                              ##   in Loop: Header=BB90_2 Depth=1
	cmpq	$0, -80(%rbp)           ## 8-byte Folded Reload
	je	LBB90_14
## %bb.17:                              ##   in Loop: Header=BB90_2 Depth=1
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB90_18:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rbx,%rdx), %esi
	movl	%edx, %eax
	andl	$6, %eax
	movzbl	-48(%rbp,%rax), %r8d
	leaq	2(%rdx), %rdi
	movl	%edi, %eax
	andl	$6, %eax
	movb	%sil, -48(%rbp,%rax)
	subl	%r8d, %esi
	addl	%ecx, %esi
	movl	%esi, %eax
	shrl	%eax
	movb	%al, (%rbx,%rdx)
	leal	1(%rdx), %eax
	movzbl	1(%rbx,%rdx), %ecx
	andl	$7, %eax
	movzbl	-48(%rbp,%rax), %r8d
	leal	3(%rdx), %eax
	andl	$7, %eax
	movb	%cl, -48(%rbp,%rax)
                                        ## kill: def $ecx killed $ecx def $rcx
	subl	%r8d, %ecx
	addl	%esi, %ecx
	movl	%ecx, %eax
	shrl	%eax
	movb	%al, 1(%rbx,%rdx)
	movq	%rdi, %rdx
	cmpq	%rdi, %r14
	jne	LBB90_18
	jmp	LBB90_19
	.p2align	4, 0x90
LBB90_9:                                ##   in Loop: Header=BB90_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	%r13, %r9
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB90_5
## %bb.10:                              ##   in Loop: Header=BB90_2 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	$2863311531, %r8d       ## imm = 0xAAAAAAAB
	.p2align	4, 0x90
LBB90_11:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rbx,%rax), %edx
	movl	%eax, %esi
	andl	$7, %esi
	movzbl	-48(%rbp,%rsi), %esi
	leal	3(%rax), %edi
	andl	$7, %edi
	movb	%dl, -48(%rbp,%rdi)
	subl	%esi, %edx
	addl	%edx, %ecx
	movq	%rcx, %rdx
	imulq	%r8, %rdx
	shrq	$33, %rdx
	movb	%dl, (%rbx,%rax)
	incq	%rax
	cmpq	%rax, %r11
	jne	LBB90_11
	jmp	LBB90_29
	.p2align	4, 0x90
LBB90_6:                                ##   in Loop: Header=BB90_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	%r13, %r9
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB90_5
## %bb.7:                               ##   in Loop: Header=BB90_2 Depth=1
	cmpq	$0, -80(%rbp)           ## 8-byte Folded Reload
	je	LBB90_8
## %bb.21:                              ##   in Loop: Header=BB90_2 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB90_22:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rbx,%rax), %edx
	movl	%eax, %esi
	andl	$6, %esi
	movzbl	-48(%rbp,%rsi), %esi
	leal	4(%rax), %edi
	andl	$6, %edi
	movb	%dl, -48(%rbp,%rdi)
	subl	%esi, %edx
	addl	%ecx, %edx
	movl	%edx, %ecx
	shrl	$2, %ecx
	movb	%cl, (%rbx,%rax)
	leal	1(%rax), %ecx
	movzbl	1(%rbx,%rax), %esi
	andl	$7, %ecx
	movzbl	-48(%rbp,%rcx), %edi
	leal	5(%rax), %ecx
	andl	$7, %ecx
	movb	%sil, -48(%rbp,%rcx)
	movl	%esi, %ecx
	subl	%edi, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edx
	shrl	$2, %edx
	movb	%dl, 1(%rbx,%rax)
	addq	$2, %rax
	cmpq	%rax, %r14
	jne	LBB90_22
	jmp	LBB90_23
	.p2align	4, 0x90
LBB90_4:                                ##   in Loop: Header=BB90_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	%r13, %r9
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB90_5
## %bb.25:                              ##   in Loop: Header=BB90_2 Depth=1
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$3435973837, %r8d       ## imm = 0xCCCCCCCD
	.p2align	4, 0x90
LBB90_26:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rbx,%rdx), %eax
	movl	%edx, %esi
	andl	$7, %esi
	movzbl	-48(%rbp,%rsi), %esi
	leal	5(%rdx), %edi
	andl	$7, %edi
	movb	%al, -48(%rbp,%rdi)
	subl	%esi, %eax
	addl	%eax, %ecx
	movq	%rcx, %rax
	imulq	%r8, %rax
	shrq	$34, %rax
	movb	%al, (%rbx,%rdx)
	incq	%rdx
	cmpq	%rdx, %r11
	jne	LBB90_26
	jmp	LBB90_30
	.p2align	4, 0x90
LBB90_5:                                ##   in Loop: Header=BB90_2 Depth=1
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	cmpl	%r15d, %edx
	jl	LBB90_31
	jmp	LBB90_34
LBB90_15:                               ##   in Loop: Header=BB90_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	js	LBB90_16
## %bb.27:                              ##   in Loop: Header=BB90_2 Depth=1
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movq	%r13, %r9
	movq	-64(%rbp), %r11         ## 8-byte Reload
	.p2align	4, 0x90
LBB90_28:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rbx,%rsi), %eax
	movl	%esi, %edx
	andl	$7, %edx
	movzbl	-48(%rbp,%rdx), %edx
	leal	(%r9,%rsi), %edi
	andl	$7, %edi
	movb	%al, -48(%rbp,%rdi)
	subl	%edx, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	%r12d
	movb	%al, (%rbx,%rsi)
	incq	%rsi
	cmpq	%rsi, %r11
	jne	LBB90_28
	jmp	LBB90_29
LBB90_16:                               ##   in Loop: Header=BB90_2 Depth=1
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r13, %r9
	cmpl	%r15d, %edx
	jl	LBB90_31
	jmp	LBB90_34
LBB90_14:                               ##   in Loop: Header=BB90_2 Depth=1
	xorl	%edi, %edi
	xorl	%ecx, %ecx
LBB90_19:                               ##   in Loop: Header=BB90_2 Depth=1
	movl	%r11d, %edx
	testb	$1, %r11b
	je	LBB90_30
## %bb.20:                              ##   in Loop: Header=BB90_2 Depth=1
	movzbl	(%rbx,%rdi), %eax
	movl	%edi, %edx
	andl	$7, %edx
	movzbl	-48(%rbp,%rdx), %edx
	leal	2(%rdi), %esi
	andl	$7, %esi
	movb	%al, -48(%rbp,%rsi)
	subl	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	%eax
	movb	%al, (%rbx,%rdi)
	jmp	LBB90_29
LBB90_8:                                ##   in Loop: Header=BB90_2 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
LBB90_23:                               ##   in Loop: Header=BB90_2 Depth=1
	movl	%r11d, %edx
	cmpq	$0, -88(%rbp)           ## 8-byte Folded Reload
	je	LBB90_30
## %bb.24:                              ##   in Loop: Header=BB90_2 Depth=1
	movzbl	(%rbx,%rax), %edx
	movl	%eax, %esi
	andl	$7, %esi
	movzbl	-48(%rbp,%rsi), %esi
	leal	4(%rax), %edi
	andl	$7, %edi
	movb	%dl, -48(%rbp,%rdi)
	subl	%esi, %edx
	addl	%ecx, %edx
	movl	%edx, %ecx
	shrl	$2, %edx
	movb	%dl, (%rbx,%rax)
	.p2align	4, 0x90
LBB90_29:                               ##   in Loop: Header=BB90_2 Depth=1
	movl	%r11d, %edx
LBB90_30:                               ##   in Loop: Header=BB90_2 Depth=1
	cmpl	%r15d, %edx
	jge	LBB90_34
LBB90_31:                               ##   in Loop: Header=BB90_2 Depth=1
	movl	%edx, %esi
	.p2align	4, 0x90
LBB90_32:                               ##   Parent Loop BB90_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rbx,%rsi)
	jne	LBB90_36
## %bb.33:                              ##   in Loop: Header=BB90_32 Depth=2
	movl	%esi, %eax
	andl	$7, %eax
	movzbl	-48(%rbp,%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	%r12d
	movb	%al, (%rbx,%rsi)
	incq	%rsi
	cmpl	%r15d, %esi
	jl	LBB90_32
LBB90_34:                               ##   in Loop: Header=BB90_2 Depth=1
	addq	-96(%rbp), %rbx         ## 8-byte Folded Reload
	movl	-72(%rbp), %eax         ## 4-byte Reload
	incl	%eax
	cmpl	-68(%rbp), %eax         ## 4-byte Folded Reload
	jl	LBB90_2
LBB90_35:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB90_36:
	leaq	L___func__.stbtt__h_prefilter(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.119(%rip), %rcx
	movl	$4065, %edx             ## imm = 0xFE1
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L90_0_set_12, LBB90_12-LJTI90_0
.set L90_0_set_9, LBB90_9-LJTI90_0
.set L90_0_set_6, LBB90_6-LJTI90_0
.set L90_0_set_4, LBB90_4-LJTI90_0
LJTI90_0:
	.long	L90_0_set_12
	.long	L90_0_set_9
	.long	L90_0_set_6
	.long	L90_0_set_4
	.end_data_region
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__v_prefilter
_stbtt__v_prefilter:                    ## @stbtt__v_prefilter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $edx killed $edx def $rdx
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	$0, -48(%rbp)
	movl	%esi, -76(%rbp)         ## 4-byte Spill
	testl	%esi, %esi
	jle	LBB91_29
## %bb.1:
	movl	%r8d, %r12d
	movq	%rdi, %rbx
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movl	%eax, %edx
	subl	%r8d, %edx
	movl	%edx, -52(%rbp)         ## 4-byte Spill
	movl	%r8d, %r9d
	movslq	%ecx, %r15
	leal	1(%rax), %r14d
	subl	%r8d, %r14d
	movslq	%eax, %r11
	xorl	%eax, %eax
	leal	-2(%r12), %r10d
	movq	%r9, -72(%rbp)          ## 8-byte Spill
	movq	%r11, -64(%rbp)         ## 8-byte Spill
	jmp	LBB91_2
LBB91_17:                               ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	cmpl	-88(%rbp), %eax         ## 4-byte Folded Reload
	jl	LBB91_22
	jmp	LBB91_28
	.p2align	4, 0x90
LBB91_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB91_19 Depth 2
                                        ##     Child Loop BB91_8 Depth 2
                                        ##     Child Loop BB91_12 Depth 2
                                        ##     Child Loop BB91_15 Depth 2
                                        ##     Child Loop BB91_26 Depth 2
                                        ##     Child Loop BB91_23 Depth 2
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movl	$8, %ecx
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	movq	%r9, %rdx
	movq	%r10, %r13
	callq	___memset_chk
	movq	%r13, %r10
	cmpl	$3, %r10d
	ja	LBB91_16
## %bb.3:                               ##   in Loop: Header=BB91_2 Depth=1
	leaq	LJTI91_0(%rip), %rax
	movq	%rax, %rcx
	movslq	(%rax,%r10,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB91_13:                               ##   in Loop: Header=BB91_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB91_5
## %bb.14:                              ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	movq	%rbx, %r8
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB91_15:                               ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	andl	$7, %edi
	movzbl	-48(%rbp,%rdi), %edi
	leal	2(%rax), %ebx
	andl	$7, %ebx
	movb	%sil, -48(%rbp,%rbx)
	subl	%edi, %esi
	addl	%esi, %ecx
	movl	%ecx, %esi
	shrl	%esi
	movb	%sil, (%rdx)
	incq	%rax
	addq	%r15, %rdx
	cmpq	%rax, %r14
	jne	LBB91_15
	jmp	LBB91_9
	.p2align	4, 0x90
LBB91_10:                               ##   in Loop: Header=BB91_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	movl	$2863311531, %r13d      ## imm = 0xAAAAAAAB
	js	LBB91_5
## %bb.11:                              ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	movq	%rbx, %r8
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB91_12:                               ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	andl	$7, %edi
	movzbl	-48(%rbp,%rdi), %edi
	leal	3(%rax), %ebx
	andl	$7, %ebx
	movb	%sil, -48(%rbp,%rbx)
	subl	%edi, %esi
	addl	%esi, %ecx
	movq	%rcx, %rsi
	imulq	%r13, %rsi
	shrq	$33, %rsi
	movb	%sil, (%rdx)
	incq	%rax
	addq	%r15, %rdx
	cmpq	%rax, %r14
	jne	LBB91_12
	jmp	LBB91_9
	.p2align	4, 0x90
LBB91_6:                                ##   in Loop: Header=BB91_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB91_5
## %bb.7:                               ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	movq	%rbx, %r8
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB91_8:                                ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	andl	$7, %edi
	movzbl	-48(%rbp,%rdi), %edi
	leal	4(%rax), %ebx
	andl	$7, %ebx
	movb	%sil, -48(%rbp,%rbx)
	subl	%edi, %esi
	addl	%esi, %ecx
	movl	%ecx, %esi
	shrl	$2, %esi
	movb	%sil, (%rdx)
	incq	%rax
	addq	%r15, %rdx
	cmpq	%rax, %r14
	jne	LBB91_8
	jmp	LBB91_9
	.p2align	4, 0x90
LBB91_4:                                ##   in Loop: Header=BB91_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	js	LBB91_5
## %bb.18:                              ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	movq	%rbx, %r8
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movl	$3435973837, %r13d      ## imm = 0xCCCCCCCD
	.p2align	4, 0x90
LBB91_19:                               ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	andl	$7, %edi
	movzbl	-48(%rbp,%rdi), %edi
	leal	5(%rax), %ebx
	andl	$7, %ebx
	movb	%sil, -48(%rbp,%rbx)
	subl	%edi, %esi
	addl	%esi, %ecx
	movq	%rcx, %rsi
	imulq	%r13, %rsi
	shrq	$34, %rsi
	movb	%sil, (%rdx)
	incq	%rax
	addq	%r15, %rdx
	cmpq	%rax, %r14
	jne	LBB91_19
	jmp	LBB91_20
	.p2align	4, 0x90
LBB91_5:                                ##   in Loop: Header=BB91_2 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	cmpl	-88(%rbp), %eax         ## 4-byte Folded Reload
	jl	LBB91_22
	jmp	LBB91_28
LBB91_16:                               ##   in Loop: Header=BB91_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	js	LBB91_17
## %bb.25:                              ##   in Loop: Header=BB91_2 Depth=1
	xorl	%esi, %esi
	movq	%rbx, %r8
	movq	%rbx, %rdi
	xorl	%ecx, %ecx
	movq	-72(%rbp), %r9          ## 8-byte Reload
	movq	-64(%rbp), %r11         ## 8-byte Reload
	.p2align	4, 0x90
LBB91_26:                               ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdi), %eax
	movl	%esi, %edx
	andl	$7, %edx
	movzbl	-48(%rbp,%rdx), %edx
	leal	(%r9,%rsi), %ebx
	andl	$7, %ebx
	movb	%al, -48(%rbp,%rbx)
	subl	%edx, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	%r12d
	movb	%al, (%rdi)
	incq	%rsi
	addq	%r15, %rdi
	cmpq	%rsi, %r14
	jne	LBB91_26
LBB91_9:                                ##   in Loop: Header=BB91_2 Depth=1
	movl	%r14d, %eax
LBB91_20:                               ##   in Loop: Header=BB91_2 Depth=1
	movq	%r8, %rbx
	cmpl	-88(%rbp), %eax         ## 4-byte Folded Reload
	jge	LBB91_28
LBB91_22:                               ##   in Loop: Header=BB91_2 Depth=1
	movslq	%eax, %rsi
	movq	%r15, %rdi
	imulq	%rsi, %rdi
	addq	%rbx, %rdi
	.p2align	4, 0x90
LBB91_23:                               ##   Parent Loop BB91_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rdi)
	jne	LBB91_24
## %bb.27:                              ##   in Loop: Header=BB91_23 Depth=2
	movl	%esi, %eax
	andl	$7, %eax
	movzbl	-48(%rbp,%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	%r12d
	movb	%al, (%rdi)
	incq	%rsi
	addq	%r15, %rdi
	cmpq	%r11, %rsi
	jl	LBB91_23
LBB91_28:                               ##   in Loop: Header=BB91_2 Depth=1
	incq	%rbx
	movl	-80(%rbp), %eax         ## 4-byte Reload
	incl	%eax
	cmpl	-76(%rbp), %eax         ## 4-byte Folded Reload
	jl	LBB91_2
LBB91_29:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB91_24:
	leaq	L___func__.stbtt__v_prefilter(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.120(%rip), %rcx
	movl	$4127, %edx             ## imm = 0x101F
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L91_0_set_13, LBB91_13-LJTI91_0
.set L91_0_set_10, LBB91_10-LJTI91_0
.set L91_0_set_6, LBB91_6-LJTI91_0
.set L91_0_set_4, LBB91_4-LJTI91_0
LJTI91_0:
	.long	L91_0_set_13
	.long	L91_0_set_10
	.long	L91_0_set_6
	.long	L91_0_set_4
	.end_data_region
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt_PackFontRangesRenderIntoRects
LCPI92_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI92_1:
	.long	1065353216              ## float 1
LCPI92_2:
	.long	0                       ## float 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_PackFontRangesRenderIntoRects
	.p2align	4, 0x90
_stbtt_PackFontRangesRenderIntoRects:   ## @stbtt_PackFontRangesRenderIntoRects
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, -160(%rbp)         ## 8-byte Spill
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	movq	%rdi, %r14
	movl	36(%rdi), %eax
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movl	40(%rdi), %eax
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	testl	%ecx, %ecx
	jle	LBB92_40
## %bb.1:
	movl	%ecx, %eax
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	movl	$1, %ebx
	movl	$-1, %r9d
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	movq	%r14, -184(%rbp)        ## 8-byte Spill
	movq	%rdx, -152(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB92_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB92_16 Depth 2
	leaq	(%r10,%r10,4), %r8
	movss	(%rdx,%r8,8), %xmm3     ## xmm3 = mem[0],zero,zero,zero
	ucomiss	LCPI92_2(%rip), %xmm3
	jbe	LBB92_4
## %bb.3:                               ##   in Loop: Header=BB92_2 Depth=1
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movq	8(%rsi), %rcx
	movslq	36(%rsi), %rax
	movzbl	4(%rcx,%rax), %esi
	shll	$8, %esi
	movzbl	5(%rcx,%rax), %edi
	movswl	%si, %esi
	orl	%edi, %esi
	movzbl	6(%rcx,%rax), %edi
	shll	$8, %edi
	movzbl	7(%rcx,%rax), %ecx
	movswl	%di, %edi
	orl	%ecx, %edi
	subl	%edi, %esi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	jmp	LBB92_5
	.p2align	4, 0x90
LBB92_4:                                ##   in Loop: Header=BB92_2 Depth=1
	xorps	LCPI92_0(%rip), %xmm3
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movq	8(%rsi), %rcx
	movslq	28(%rsi), %rsi
	movzwl	18(%rcx,%rsi), %ecx
	rolw	$8, %cx
	movzwl	%cx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
LBB92_5:                                ##   in Loop: Header=BB92_2 Depth=1
	divss	%xmm0, %xmm3
	movzbl	32(%rdx,%r8,8), %edi
	movl	%edi, 36(%r14)
	movzbl	33(%rdx,%r8,8), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	movl	%ecx, 40(%r14)
	xorps	%xmm1, %xmm1
	movss	%xmm1, -56(%rbp)        ## 4-byte Spill
	xorps	%xmm1, %xmm1
	movss	%xmm1, -52(%rbp)        ## 4-byte Spill
	testl	%edi, %edi
	je	LBB92_7
## %bb.6:                               ##   in Loop: Header=BB92_2 Depth=1
	movl	$1, %esi
	subl	%edi, %esi
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%esi, %xmm2
	movaps	%xmm0, %xmm1
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm2
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
LBB92_7:                                ##   in Loop: Header=BB92_2 Depth=1
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	testb	%cl, %cl
	je	LBB92_9
## %bb.8:                               ##   in Loop: Header=BB92_2 Depth=1
	movl	$1, %esi
	subl	%ecx, %esi
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%esi, %xmm4
	movaps	%xmm1, %xmm2
	addss	%xmm1, %xmm2
	divss	%xmm2, %xmm4
	movss	%xmm4, -56(%rbp)        ## 4-byte Spill
LBB92_9:                                ##   in Loop: Header=BB92_2 Depth=1
	cmpl	$0, 16(%rdx,%r8,8)
	jle	LBB92_39
## %bb.10:                              ##   in Loop: Header=BB92_2 Depth=1
	movq	%r10, -176(%rbp)        ## 8-byte Spill
	movss	LCPI92_1(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	movaps	%xmm2, %xmm4
	divss	%xmm0, %xmm4
	movss	%xmm4, -92(%rbp)        ## 4-byte Spill
	divss	%xmm1, %xmm2
	movss	%xmm2, -88(%rbp)        ## 4-byte Spill
	leaq	16(%rdx,%r8,8), %rsi
	movl	%r11d, -84(%rbp)        ## 4-byte Spill
	movslq	%r11d, %rax
	leaq	(%rax,%rax,2), %rax
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax,8), %r13
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movaps	%xmm3, -144(%rbp)       ## 16-byte Spill
	movq	%rsi, -192(%rbp)        ## 8-byte Spill
	jmp	LBB92_16
LBB92_11:                               ##   in Loop: Header=BB92_16 Depth=2
	testl	%r9d, %r9d
	js	LBB92_25
## %bb.12:                              ##   in Loop: Header=BB92_16 Depth=2
	movl	16(%r13), %eax
	testl	%eax, %eax
	jne	LBB92_25
## %bb.13:                              ##   in Loop: Header=BB92_16 Depth=2
	movq	8(%rsi), %rax
	movslq	%r9d, %rcx
	leaq	(%rcx,%rcx,8), %rdx
	leaq	(%rdx,%rdx,2), %rdx
	addq	%rcx, %rdx
	movl	24(%rax,%rdx), %ecx
	movl	%ecx, 24(%rax,%r15)
	movq	16(%rax,%rdx), %rcx
	movq	%rcx, 16(%rax,%r15)
	movq	(%rax,%rdx), %rcx
	movq	8(%rax,%rdx), %rdx
	movq	%rdx, 8(%rax,%r15)
	movq	%rcx, (%rax,%r15)
	jmp	LBB92_37
	.p2align	4, 0x90
LBB92_16:                               ##   Parent Loop BB92_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	20(%r13), %eax
	testl	%eax, %eax
	je	LBB92_25
## %bb.17:                              ##   in Loop: Header=BB92_16 Depth=2
	cmpl	$0, 12(%r13)
	je	LBB92_21
## %bb.18:                              ##   in Loop: Header=BB92_16 Depth=2
	cmpl	$0, 16(%r13)
	je	LBB92_21
## %bb.19:                              ##   in Loop: Header=BB92_16 Depth=2
	movq	8(%rsi), %rax
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	movq	-8(%rsi), %rax
	testq	%rax, %rax
	movl	%ebx, -100(%rbp)        ## 4-byte Spill
	movl	%r9d, -96(%rbp)         ## 4-byte Spill
	je	LBB92_28
## %bb.20:                              ##   in Loop: Header=BB92_16 Depth=2
	movl	(%rax,%r12,4), %esi
	jmp	LBB92_29
	.p2align	4, 0x90
LBB92_21:                               ##   in Loop: Header=BB92_16 Depth=2
	testl	%eax, %eax
	je	LBB92_25
## %bb.22:                              ##   in Loop: Header=BB92_16 Depth=2
	movl	32(%r14), %eax
	testl	%eax, %eax
	jne	LBB92_25
## %bb.23:                              ##   in Loop: Header=BB92_16 Depth=2
	cmpl	$0, 12(%r13)
	je	LBB92_11
	.p2align	4, 0x90
LBB92_25:                               ##   in Loop: Header=BB92_16 Depth=2
	xorl	%ebx, %ebx
	jmp	LBB92_37
LBB92_28:                               ##   in Loop: Header=BB92_16 Depth=2
	movl	-12(%rsi), %esi
	addl	%r12d, %esi
LBB92_29:                               ##   in Loop: Header=BB92_16 Depth=2
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	movq	%rbx, %rdi
	callq	_stbtt_FindGlyphIndex
	movl	28(%r14), %ecx
	addl	%ecx, (%r13)
	addl	%ecx, 4(%r13)
	subl	%ecx, 12(%r13)
	subl	%ecx, 16(%r13)
                                        ## kill: def $eax killed $eax def $rax
	movq	8(%rbx), %rsi
	movslq	36(%rbx), %rcx
	movzbl	34(%rsi,%rcx), %edx
	shll	$8, %edx
	movzbl	35(%rsi,%rcx), %ecx
	orl	%edx, %ecx
	movslq	40(%rbx), %rdx
	addq	%rsi, %rdx
	leal	(,%rax,4), %esi
	cmpl	%ecx, %eax
	leal	-4(,%rcx,4), %ecx
	cmovll	%esi, %ecx
	movslq	%ecx, %rcx
	movzwl	(%rcx,%rdx), %ecx
	movw	%cx, -48(%rbp)          ## 2-byte Spill
	movl	36(%r14), %ecx
	movl	%ecx, -44(%rbp)         ## 4-byte Spill
	movl	40(%r14), %r14d
	movl	$0, -60(%rbp)
	movl	$0, -108(%rbp)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%rax, -120(%rbp)        ## 8-byte Spill
                                        ## kill: def $esi killed $esi killed $rsi
	leaq	-60(%rbp), %rdx
	leaq	-108(%rbp), %rcx
	leaq	-204(%rbp), %r8
	leaq	-104(%rbp), %r9
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB92_31
## %bb.30:                              ##   in Loop: Header=BB92_16 Depth=2
	movl	%r14d, %eax
	cvtsi2ssq	%rax, %xmm0
	movl	-44(%rbp), %eax         ## 4-byte Reload
	cvtsi2ssq	%rax, %xmm1
	movaps	-144(%rbp), %xmm4       ## 16-byte Reload
	mulss	%xmm4, %xmm1
	cvtsi2ssl	-60(%rbp), %xmm2
	mulss	%xmm1, %xmm2
	xorps	%xmm3, %xmm3
	addss	%xmm3, %xmm2
	xorps	%xmm1, %xmm1
	roundss	$9, %xmm2, %xmm1
	cvttss2si	%xmm1, %ebx
	mulss	%xmm4, %xmm0
	xorl	%eax, %eax
	subl	-104(%rbp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	addss	%xmm3, %xmm1
	xorps	%xmm0, %xmm0
	roundss	$9, %xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB92_32
LBB92_31:                               ##   in Loop: Header=BB92_16 Depth=2
	xorl	%ebx, %ebx
	movl	$0, -44(%rbp)           ## 4-byte Folded Spill
	movaps	-144(%rbp), %xmm4       ## 16-byte Reload
LBB92_32:                               ##   in Loop: Header=BB92_16 Depth=2
	movslq	(%r13), %rax
	movq	-184(%rbp), %r14        ## 8-byte Reload
	addq	48(%r14), %rax
	movslq	4(%r13), %rsi
	movslq	24(%r14), %r8
	imulq	%r8, %rsi
	addq	%rax, %rsi
	movl	36(%r14), %eax
	movl	40(%r14), %edi
	movl	12(%r13), %edx
	movl	16(%r13), %ecx
	incl	%edx
	subl	%eax, %edx
	incl	%ecx
	subl	%edi, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	mulss	%xmm4, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssq	%rdi, %xmm1
	mulss	%xmm4, %xmm1
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
	movq	-72(%rbp), %rdi         ## 8-byte Reload
                                        ## kill: def $r8d killed $r8d killed $r8
	movq	-120(%rbp), %r9         ## 8-byte Reload
                                        ## kill: def $r9d killed $r9d killed $r9
	callq	_stbtt_MakeGlyphBitmapSubpixel
	movl	36(%r14), %r8d
	cmpl	$2, %r8d
	jb	LBB92_34
## %bb.33:                              ##   in Loop: Header=BB92_16 Depth=2
	movslq	(%r13), %rax
	addq	48(%r14), %rax
	movslq	4(%r13), %rdi
	movslq	24(%r14), %rcx
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	movl	12(%r13), %esi
	movl	16(%r13), %edx
                                        ## kill: def $ecx killed $ecx killed $rcx
	callq	_stbtt__h_prefilter
LBB92_34:                               ##   in Loop: Header=BB92_16 Depth=2
	movzwl	-48(%rbp), %esi         ## 2-byte Folded Reload
	rolw	$8, %si
	movl	40(%r14), %r8d
	cmpl	$2, %r8d
	jb	LBB92_36
## %bb.35:                              ##   in Loop: Header=BB92_16 Depth=2
	movslq	(%r13), %rax
	addq	48(%r14), %rax
	movslq	4(%r13), %rdi
	movslq	24(%r14), %rcx
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	movl	%ebx, -48(%rbp)         ## 4-byte Spill
	movl	%esi, %ebx
	movl	12(%r13), %esi
	movl	16(%r13), %edx
                                        ## kill: def $ecx killed $ecx killed $rcx
	callq	_stbtt__v_prefilter
	movl	%ebx, %esi
	movl	-48(%rbp), %ebx         ## 4-byte Reload
LBB92_36:                               ##   in Loop: Header=BB92_16 Depth=2
	movl	(%r13), %eax
	movq	-200(%rbp), %rdi        ## 8-byte Reload
	movw	%ax, (%rdi,%r15)
	movl	4(%r13), %ecx
	movw	%cx, 2(%rdi,%r15)
	movl	12(%r13), %edx
	addl	%edx, %eax
	movw	%ax, 4(%rdi,%r15)
	movl	16(%r13), %eax
	addl	%eax, %ecx
	movswl	%si, %esi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	movw	%cx, 6(%rdi,%r15)
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ebx, %xmm1
	mulss	-144(%rbp), %xmm0       ## 16-byte Folded Reload
	movss	%xmm0, 16(%rdi,%r15)
	movss	-92(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	mulss	%xmm4, %xmm1
	movss	-52(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	addss	%xmm3, %xmm1
	movss	%xmm1, 8(%rdi,%r15)
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	-88(%rbp), %xmm5        ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	mulss	%xmm5, %xmm0
	movss	-56(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	addss	%xmm2, %xmm0
	movss	%xmm0, 12(%rdi,%r15)
	addl	%ebx, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	mulss	%xmm4, %xmm0
	addl	%ecx, %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	addss	%xmm3, %xmm0
	movss	%xmm0, 20(%rdi,%r15)
	mulss	%xmm5, %xmm1
	addss	%xmm2, %xmm1
	movss	%xmm1, 24(%rdi,%r15)
	cmpl	$0, -120(%rbp)          ## 4-byte Folded Reload
	movl	-96(%rbp), %r9d         ## 4-byte Reload
	cmovel	%r12d, %r9d
	movl	-100(%rbp), %ebx        ## 4-byte Reload
	movq	-192(%rbp), %rsi        ## 8-byte Reload
LBB92_37:                               ##   in Loop: Header=BB92_16 Depth=2
	incq	%r12
	movslq	(%rsi), %rax
	addq	$24, %r13
	addq	$28, %r15
	cmpq	%rax, %r12
	jl	LBB92_16
## %bb.38:                              ##   in Loop: Header=BB92_2 Depth=1
	movl	-84(%rbp), %r11d        ## 4-byte Reload
	addl	%r12d, %r11d
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	movq	-176(%rbp), %r10        ## 8-byte Reload
LBB92_39:                               ##   in Loop: Header=BB92_2 Depth=1
	incq	%r10
	cmpq	-168(%rbp), %r10        ## 8-byte Folded Reload
	jne	LBB92_2
	jmp	LBB92_41
LBB92_40:
	movl	$1, %ebx
LBB92_41:
	movl	-80(%rbp), %eax         ## 4-byte Reload
	movl	%eax, 36(%r14)
	movl	-76(%rbp), %eax         ## 4-byte Reload
	movl	%eax, 40(%r14)
	movl	%ebx, %eax
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackFontRangesPackRects ## -- Begin function stbtt_PackFontRangesPackRects
	.p2align	4, 0x90
_stbtt_PackFontRangesPackRects:         ## @stbtt_PackFontRangesPackRects
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $edx killed $edx def $rdx
	testl	%edx, %edx
	jle	LBB93_1
## %bb.2:
	movq	8(%rdi), %r11
	movl	(%r11), %r8d
	movl	4(%r11), %r10d
	movslq	%edx, %r9
	movl	8(%r11), %ecx
	leaq	20(%rsi), %rdi
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB93_3:                                ## =>This Inner Loop Header: Depth=1
	movl	-8(%rdi), %r14d
	leal	(%r14,%rcx), %eax
	cmpl	%r8d, %eax
	jle	LBB93_4
## %bb.5:                               ##   in Loop: Header=BB93_3 Depth=1
	movl	$0, 8(%r11)
	movl	16(%r11), %ebx
	movl	%ebx, 12(%r11)
	xorl	%r15d, %r15d
	jmp	LBB93_6
	.p2align	4, 0x90
LBB93_4:                                ##   in Loop: Header=BB93_3 Depth=1
	movl	12(%r11), %ebx
	movl	%ecx, %r15d
LBB93_6:                                ##   in Loop: Header=BB93_3 Depth=1
	movl	-4(%rdi), %eax
	addl	%ebx, %eax
	cmpl	%r10d, %eax
	jg	LBB93_10
## %bb.7:                               ##   in Loop: Header=BB93_3 Depth=1
	movl	%r15d, -20(%rdi)
	movl	%ebx, -16(%rdi)
	movl	$1, (%rdi)
	movl	%r14d, %ecx
	addl	%r15d, %ecx
	movl	%ecx, 8(%r11)
	cmpl	16(%r11), %eax
	jle	LBB93_9
## %bb.8:                               ##   in Loop: Header=BB93_3 Depth=1
	movl	%eax, 16(%r11)
LBB93_9:                                ##   in Loop: Header=BB93_3 Depth=1
	incq	%r12
	addq	$24, %rdi
	cmpq	%r9, %r12
	jl	LBB93_3
LBB93_10:
	cmpl	%edx, %r12d
	jl	LBB93_11
	jmp	LBB93_18
LBB93_1:
	xorl	%r12d, %r12d
	cmpl	%edx, %r12d
	jge	LBB93_18
LBB93_11:
	movl	%r12d, %r8d
	movl	%edx, %ecx
	subl	%r12d, %edx
	movq	%r8, %rax
	notq	%rax
	addq	%rcx, %rax
	andq	$3, %rdx
	je	LBB93_15
## %bb.12:
	leaq	(%r8,%r8,2), %rdi
	leaq	20(%rsi,%rdi,8), %rbx
	negq	%rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB93_13:                               ## =>This Inner Loop Header: Depth=1
	movl	$0, (%rbx)
	decq	%rdi
	addq	$24, %rbx
	cmpq	%rdi, %rdx
	jne	LBB93_13
## %bb.14:
	subq	%rdi, %r8
LBB93_15:
	cmpq	$3, %rax
	jb	LBB93_18
## %bb.16:
	subq	%r8, %rcx
	leaq	(%r8,%r8,2), %rax
	leaq	92(%rsi,%rax,8), %rax
	.p2align	4, 0x90
LBB93_17:                               ## =>This Inner Loop Header: Depth=1
	movl	$0, -72(%rax)
	movl	$0, -48(%rax)
	movl	$0, -24(%rax)
	movl	$0, (%rax)
	addq	$96, %rax
	addq	$-4, %rcx
	jne	LBB93_17
LBB93_18:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackFontRanges   ## -- Begin function stbtt_PackFontRanges
	.p2align	4, 0x90
_stbtt_PackFontRanges:                  ## @stbtt_PackFontRanges
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r12
	movl	%edx, %r15d
	movq	%rdi, %r14
	testl	%r8d, %r8d
	movl	%r8d, -44(%rbp)         ## 4-byte Spill
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	jle	LBB94_1
## %bb.2:
	movl	%r8d, %r9d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB94_3:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB94_11 Depth 2
                                        ##     Child Loop BB94_14 Depth 2
	leaq	(%rcx,%rcx,4), %rax
	movslq	16(%r12,%rax,8), %rdi
	testq	%rdi, %rdi
	jle	LBB94_15
## %bb.4:                               ##   in Loop: Header=BB94_3 Depth=1
	movq	24(%r12,%rax,8), %rax
	leaq	-1(%rdi), %rdx
	movl	%edi, %r11d
	andl	$7, %r11d
	cmpq	$7, %rdx
	jae	LBB94_10
## %bb.5:                               ##   in Loop: Header=BB94_3 Depth=1
	xorl	%ebx, %ebx
	testq	%r11, %r11
	jne	LBB94_13
	jmp	LBB94_15
	.p2align	4, 0x90
LBB94_10:                               ##   in Loop: Header=BB94_3 Depth=1
	subq	%r11, %rdi
	movq	%rax, %rdx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB94_11:                               ##   Parent Loop BB94_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	$0, (%rdx)
	movq	$0, 28(%rdx)
	movq	$0, 56(%rdx)
	movq	$0, 84(%rdx)
	movq	$0, 112(%rdx)
	movq	$0, 140(%rdx)
	movq	$0, 168(%rdx)
	addq	$8, %rbx
	movq	$0, 196(%rdx)
	addq	$224, %rdx
	cmpq	%rbx, %rdi
	jne	LBB94_11
## %bb.12:                              ##   in Loop: Header=BB94_3 Depth=1
	testq	%r11, %r11
	je	LBB94_15
LBB94_13:                               ##   in Loop: Header=BB94_3 Depth=1
	leaq	(%rbx,%rbx,8), %rdx
	leaq	(%rdx,%rdx,2), %rdx
	addq	%rbx, %rdx
	addq	%rdx, %rax
	leaq	(%r11,%r11,8), %rdx
	leaq	(%rdx,%rdx,2), %rdx
	addq	%r11, %rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB94_14:                               ##   Parent Loop BB94_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	$0, (%rax,%rdi)
	addq	$28, %rdi
	cmpq	%rdi, %rdx
	jne	LBB94_14
LBB94_15:                               ##   in Loop: Header=BB94_3 Depth=1
	incq	%rcx
	cmpq	%r9, %rcx
	jne	LBB94_3
## %bb.6:
	xorl	%edi, %edi
	testl	%r8d, %r8d
	jle	LBB94_7
## %bb.8:
	leaq	-1(%r9), %rax
	movl	%r9d, %ecx
	andl	$3, %ecx
	movq	%r14, %rbx
	cmpq	$3, %rax
	jae	LBB94_16
## %bb.9:
	xorl	%edx, %edx
	jmp	LBB94_18
LBB94_1:
	movq	%r14, %rbx
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	jmp	LBB94_22
LBB94_7:
	movq	%r14, %rbx
	xorl	%r14d, %r14d
	jmp	LBB94_22
LBB94_16:
	leaq	136(%r12), %rsi
	subq	%rcx, %r9
	xorl	%edx, %edx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB94_17:                               ## =>This Inner Loop Header: Depth=1
	addl	-120(%rsi), %edi
	addl	-80(%rsi), %edi
	addl	-40(%rsi), %edi
	addl	(%rsi), %edi
	addq	$4, %rdx
	addq	$160, %rsi
	cmpq	%rdx, %r9
	jne	LBB94_17
LBB94_18:
	xorl	%r14d, %r14d
	testq	%rcx, %rcx
	je	LBB94_21
## %bb.19:
	leaq	(%rdx,%rdx,4), %rax
	leaq	16(%r12,%rax,8), %rax
	negq	%rcx
	.p2align	4, 0x90
LBB94_20:                               ## =>This Inner Loop Header: Depth=1
	addl	(%rax), %edi
	addq	$40, %rax
	incq	%rcx
	jne	LBB94_20
LBB94_21:
	movslq	%edi, %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %rdi
LBB94_22:
	callq	_malloc
	testq	%rax, %rax
	je	LBB94_43
## %bb.23:
	movq	%rax, %r13
	movq	%rbx, %r14
	movq	(%rbx), %rax
	movq	%rax, -224(%rbp)
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt_GetFontOffsetForIndex
	leaq	-224(%rbp), %r15
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movl	%eax, %edx
	callq	_stbtt_InitFont
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	movq	%r13, %r8
	callq	_stbtt_PackFontRangesGatherRects
                                        ## kill: def $eax killed $eax def $rax
	testl	%eax, %eax
	movq	%r14, -64(%rbp)         ## 8-byte Spill
	jle	LBB94_24
## %bb.25:
	movq	8(%r14), %r11
	movl	(%r11), %r9d
	movl	4(%r11), %r10d
	movslq	%eax, %r8
	movl	8(%r11), %edi
	movq	%r13, -56(%rbp)         ## 8-byte Spill
	leaq	20(%r13), %rsi
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB94_26:                               ## =>This Inner Loop Header: Depth=1
	movl	-8(%rsi), %r13d
	leal	(%r13,%rdi), %edx
	cmpl	%r9d, %edx
	jle	LBB94_27
## %bb.28:                              ##   in Loop: Header=BB94_26 Depth=1
	movl	$0, 8(%r11)
	movl	16(%r11), %ebx
	movl	%ebx, 12(%r11)
	xorl	%edx, %edx
	jmp	LBB94_29
	.p2align	4, 0x90
LBB94_27:                               ##   in Loop: Header=BB94_26 Depth=1
	movl	12(%r11), %ebx
	movl	%edi, %edx
LBB94_29:                               ##   in Loop: Header=BB94_26 Depth=1
	movl	-4(%rsi), %r14d
	addl	%ebx, %r14d
	cmpl	%r10d, %r14d
	jg	LBB94_33
## %bb.30:                              ##   in Loop: Header=BB94_26 Depth=1
	movl	%edx, -20(%rsi)
	movl	%ebx, -16(%rsi)
	movl	$1, (%rsi)
	movl	%r13d, %edi
	addl	%edx, %edi
	movl	%edi, 8(%r11)
	cmpl	16(%r11), %r14d
	jle	LBB94_32
## %bb.31:                              ##   in Loop: Header=BB94_26 Depth=1
	movl	%r14d, 16(%r11)
LBB94_32:                               ##   in Loop: Header=BB94_26 Depth=1
	incq	%r15
	addq	$24, %rsi
	cmpq	%r8, %r15
	jl	LBB94_26
LBB94_33:
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	movq	-56(%rbp), %r13         ## 8-byte Reload
	cmpl	%eax, %r15d
	jl	LBB94_35
	jmp	LBB94_42
LBB94_24:
	xorl	%r15d, %r15d
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	cmpl	%eax, %r15d
	jge	LBB94_42
LBB94_35:
	movl	%r15d, %r8d
	movl	%eax, %edx
	subl	%r15d, %eax
	movq	%r8, %rsi
	notq	%rsi
	addq	%rdx, %rsi
	andq	$3, %rax
	je	LBB94_39
## %bb.36:
	leaq	(%r8,%r8,2), %rdi
	leaq	20(%r13,%rdi,8), %rdi
	negq	%rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB94_37:                               ## =>This Inner Loop Header: Depth=1
	movl	$0, (%rdi)
	decq	%rbx
	addq	$24, %rdi
	cmpq	%rbx, %rax
	jne	LBB94_37
## %bb.38:
	subq	%rbx, %r8
LBB94_39:
	cmpq	$3, %rsi
	jb	LBB94_42
## %bb.40:
	subq	%r8, %rdx
	leaq	(%r8,%r8,2), %rax
	leaq	92(%r13,%rax,8), %rax
	.p2align	4, 0x90
LBB94_41:                               ## =>This Inner Loop Header: Depth=1
	movl	$0, -72(%rax)
	movl	$0, -48(%rax)
	movl	$0, -24(%rax)
	movl	$0, (%rax)
	addq	$96, %rax
	addq	$-4, %rdx
	jne	LBB94_41
LBB94_42:
	leaq	-224(%rbp), %rsi
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movq	%r12, %rdx
	movq	%r13, %r8
	callq	_stbtt_PackFontRangesRenderIntoRects
	movl	%eax, %r14d
	movq	%r13, %rdi
	callq	_free
LBB94_43:
	movl	%r14d, %eax
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_InitFont         ## -- Begin function stbtt_InitFont
	.p2align	4, 0x90
_stbtt_InitFont:                        ## @stbtt_InitFont
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	%rsi, 8(%rdi)
	movl	%edx, 16(%rdi)
	movl	%edx, %r12d
	movq	$0, 72(%rdi)
	movq	$0, 64(%rdi)
	movzbl	4(%rsi,%r12), %eax
	shlq	$8, %rax
	movzbl	5(%rsi,%r12), %edx
	orq	%rax, %rdx
	addl	$12, %r15d
	xorl	%r9d, %r9d
	movl	$0, %r13d
	movl	$0, %r8d
	testl	%edx, %edx
	je	LBB95_17
## %bb.1:
	xorl	%eax, %eax
	movl	%r15d, %ecx
	.p2align	4, 0x90
LBB95_2:                                ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %ecx
	cmpb	$99, (%rbx,%rcx)
	jne	LBB95_7
## %bb.3:                               ##   in Loop: Header=BB95_2 Depth=1
	cmpb	$109, 1(%rbx,%rcx)
	jne	LBB95_7
## %bb.4:                               ##   in Loop: Header=BB95_2 Depth=1
	cmpb	$97, 2(%rbx,%rcx)
	jne	LBB95_7
## %bb.5:                               ##   in Loop: Header=BB95_2 Depth=1
	cmpb	$112, 3(%rbx,%rcx)
	je	LBB95_6
	.p2align	4, 0x90
LBB95_7:                                ##   in Loop: Header=BB95_2 Depth=1
	incq	%rax
	addl	$16, %ecx
	cmpq	%rdx, %rax
	jb	LBB95_2
## %bb.8:
	xorl	%r13d, %r13d
LBB95_9:
	xorl	%eax, %eax
	movl	%r15d, %ecx
	.p2align	4, 0x90
LBB95_10:                               ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %ecx
	cmpb	$108, (%rbx,%rcx)
	jne	LBB95_15
## %bb.11:                              ##   in Loop: Header=BB95_10 Depth=1
	cmpb	$111, 1(%rbx,%rcx)
	jne	LBB95_15
## %bb.12:                              ##   in Loop: Header=BB95_10 Depth=1
	cmpb	$99, 2(%rbx,%rcx)
	jne	LBB95_15
## %bb.13:                              ##   in Loop: Header=BB95_10 Depth=1
	cmpb	$97, 3(%rbx,%rcx)
	je	LBB95_14
	.p2align	4, 0x90
LBB95_15:                               ##   in Loop: Header=BB95_10 Depth=1
	incq	%rax
	addl	$16, %ecx
	cmpq	%rdx, %rax
	jb	LBB95_10
## %bb.16:
	xorl	%r8d, %r8d
LBB95_17:
	movl	%r8d, 24(%r14)
	movzbl	4(%rbx,%r12), %ecx
	shlq	$8, %rcx
	movzbl	5(%rbx,%r12), %eax
	orq	%rcx, %rax
	testl	%eax, %eax
	je	LBB95_26
## %bb.18:
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	.p2align	4, 0x90
LBB95_19:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edx
	cmpb	$104, (%rbx,%rdx)
	jne	LBB95_24
## %bb.20:                              ##   in Loop: Header=BB95_19 Depth=1
	cmpb	$101, 1(%rbx,%rdx)
	jne	LBB95_24
## %bb.21:                              ##   in Loop: Header=BB95_19 Depth=1
	cmpb	$97, 2(%rbx,%rdx)
	jne	LBB95_24
## %bb.22:                              ##   in Loop: Header=BB95_19 Depth=1
	cmpb	$100, 3(%rbx,%rdx)
	je	LBB95_23
	.p2align	4, 0x90
LBB95_24:                               ##   in Loop: Header=BB95_19 Depth=1
	incq	%rcx
	addl	$16, %edx
	cmpq	%rax, %rcx
	jb	LBB95_19
## %bb.25:
	xorl	%r9d, %r9d
LBB95_26:
	movl	%r9d, 28(%r14)
	movzbl	4(%rbx,%r12), %eax
	shlq	$8, %rax
	movzbl	5(%rbx,%r12), %ecx
	orq	%rax, %rcx
	xorl	%r11d, %r11d
	movl	$0, %r10d
	testl	%ecx, %ecx
	je	LBB95_35
## %bb.27:
	xorl	%eax, %eax
	movl	%r15d, %edx
	.p2align	4, 0x90
LBB95_28:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edx
	cmpb	$103, (%rbx,%rdx)
	jne	LBB95_33
## %bb.29:                              ##   in Loop: Header=BB95_28 Depth=1
	cmpb	$108, 1(%rbx,%rdx)
	jne	LBB95_33
## %bb.30:                              ##   in Loop: Header=BB95_28 Depth=1
	cmpb	$121, 2(%rbx,%rdx)
	jne	LBB95_33
## %bb.31:                              ##   in Loop: Header=BB95_28 Depth=1
	cmpb	$102, 3(%rbx,%rdx)
	je	LBB95_32
	.p2align	4, 0x90
LBB95_33:                               ##   in Loop: Header=BB95_28 Depth=1
	incq	%rax
	addl	$16, %edx
	cmpq	%rcx, %rax
	jb	LBB95_28
## %bb.34:
	xorl	%r10d, %r10d
LBB95_35:
	movl	%r10d, 32(%r14)
	movzbl	4(%rbx,%r12), %ecx
	shlq	$8, %rcx
	movzbl	5(%rbx,%r12), %eax
	orq	%rcx, %rax
	testl	%eax, %eax
	je	LBB95_44
## %bb.36:
	xorl	%ecx, %ecx
	movl	%r15d, %esi
	.p2align	4, 0x90
LBB95_37:                               ## =>This Inner Loop Header: Depth=1
	movl	%esi, %esi
	cmpb	$104, (%rbx,%rsi)
	jne	LBB95_42
## %bb.38:                              ##   in Loop: Header=BB95_37 Depth=1
	cmpb	$104, 1(%rbx,%rsi)
	jne	LBB95_42
## %bb.39:                              ##   in Loop: Header=BB95_37 Depth=1
	cmpb	$101, 2(%rbx,%rsi)
	jne	LBB95_42
## %bb.40:                              ##   in Loop: Header=BB95_37 Depth=1
	cmpb	$97, 3(%rbx,%rsi)
	je	LBB95_41
	.p2align	4, 0x90
LBB95_42:                               ##   in Loop: Header=BB95_37 Depth=1
	incq	%rcx
	addl	$16, %esi
	cmpq	%rax, %rcx
	jb	LBB95_37
## %bb.43:
	xorl	%r11d, %r11d
LBB95_44:
	movl	%r11d, 36(%r14)
	movzbl	4(%rbx,%r12), %ecx
	shlq	$8, %rcx
	movzbl	5(%rbx,%r12), %eax
	orq	%rcx, %rax
	xorl	%ecx, %ecx
	movl	$0, %edi
	testl	%eax, %eax
	je	LBB95_53
## %bb.45:
	xorl	%edi, %edi
	movl	%r15d, %edx
	.p2align	4, 0x90
LBB95_46:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edx
	cmpb	$104, (%rbx,%rdx)
	jne	LBB95_51
## %bb.47:                              ##   in Loop: Header=BB95_46 Depth=1
	cmpb	$109, 1(%rbx,%rdx)
	jne	LBB95_51
## %bb.48:                              ##   in Loop: Header=BB95_46 Depth=1
	cmpb	$116, 2(%rbx,%rdx)
	jne	LBB95_51
## %bb.49:                              ##   in Loop: Header=BB95_46 Depth=1
	cmpb	$120, 3(%rbx,%rdx)
	je	LBB95_50
	.p2align	4, 0x90
LBB95_51:                               ##   in Loop: Header=BB95_46 Depth=1
	incq	%rdi
	addl	$16, %edx
	cmpq	%rax, %rdi
	jb	LBB95_46
## %bb.52:
	xorl	%edi, %edi
LBB95_53:
	movl	%edi, 40(%r14)
	movzbl	4(%rbx,%r12), %edx
	shlq	$8, %rdx
	movzbl	5(%rbx,%r12), %eax
	orq	%rdx, %rax
	testl	%eax, %eax
	je	LBB95_62
## %bb.54:
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	.p2align	4, 0x90
LBB95_55:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edx
	cmpb	$107, (%rbx,%rdx)
	jne	LBB95_60
## %bb.56:                              ##   in Loop: Header=BB95_55 Depth=1
	cmpb	$101, 1(%rbx,%rdx)
	jne	LBB95_60
## %bb.57:                              ##   in Loop: Header=BB95_55 Depth=1
	cmpb	$114, 2(%rbx,%rdx)
	jne	LBB95_60
## %bb.58:                              ##   in Loop: Header=BB95_55 Depth=1
	cmpb	$110, 3(%rbx,%rdx)
	je	LBB95_59
	.p2align	4, 0x90
LBB95_60:                               ##   in Loop: Header=BB95_55 Depth=1
	incq	%rcx
	addl	$16, %edx
	cmpq	%rax, %rcx
	jb	LBB95_55
## %bb.61:
	xorl	%ecx, %ecx
LBB95_62:
	movl	%ecx, 44(%r14)
	movzbl	4(%rbx,%r12), %ecx
	shlq	$8, %rcx
	movzbl	5(%rbx,%r12), %esi
	orq	%rcx, %rsi
	xorl	%eax, %eax
	movl	$0, %ecx
	testl	%esi, %esi
	je	LBB95_71
## %bb.63:
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	.p2align	4, 0x90
LBB95_64:                               ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edx
	cmpb	$71, (%rbx,%rdx)
	jne	LBB95_69
## %bb.65:                              ##   in Loop: Header=BB95_64 Depth=1
	cmpb	$80, 1(%rbx,%rdx)
	jne	LBB95_69
## %bb.66:                              ##   in Loop: Header=BB95_64 Depth=1
	cmpb	$79, 2(%rbx,%rdx)
	jne	LBB95_69
## %bb.67:                              ##   in Loop: Header=BB95_64 Depth=1
	cmpb	$83, 3(%rbx,%rdx)
	je	LBB95_68
	.p2align	4, 0x90
LBB95_69:                               ##   in Loop: Header=BB95_64 Depth=1
	incq	%rcx
	addl	$16, %edx
	cmpq	%rsi, %rcx
	jb	LBB95_64
## %bb.70:
	xorl	%ecx, %ecx
LBB95_71:
	movl	%ecx, 48(%r14)
	testl	%r13d, %r13d
	je	LBB95_121
## %bb.72:
	testl	%r9d, %r9d
	je	LBB95_121
## %bb.73:
	testl	%r11d, %r11d
	je	LBB95_121
## %bb.74:
	testl	%edi, %edi
	je	LBB95_121
## %bb.75:
	testl	%r10d, %r10d
	je	LBB95_77
## %bb.76:
	testl	%r8d, %r8d
	je	LBB95_121
LBB95_101:
	movzbl	4(%rbx,%r12), %edx
	shlq	$8, %rdx
	movzbl	5(%rbx,%r12), %ecx
	orq	%rdx, %rcx
	movl	$65535, %edi            ## imm = 0xFFFF
	testl	%ecx, %ecx
	je	LBB95_110
## %bb.102:
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB95_103:                              ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %r15d
	cmpb	$109, (%rbx,%r15)
	jne	LBB95_107
## %bb.104:                             ##   in Loop: Header=BB95_103 Depth=1
	cmpb	$97, 1(%rbx,%r15)
	jne	LBB95_107
## %bb.105:                             ##   in Loop: Header=BB95_103 Depth=1
	cmpb	$120, 2(%rbx,%r15)
	jne	LBB95_107
## %bb.106:                             ##   in Loop: Header=BB95_103 Depth=1
	cmpb	$112, 3(%rbx,%r15)
	je	LBB95_108
	.p2align	4, 0x90
LBB95_107:                              ##   in Loop: Header=BB95_103 Depth=1
	incq	%rdx
	addl	$16, %r15d
	cmpq	%rcx, %rdx
	jb	LBB95_103
LBB95_110:
	movl	%edi, 20(%r14)
	movl	$-1, 52(%r14)
	movl	%r13d, %edx
	movzbl	2(%rbx,%rdx), %ecx
	shlq	$8, %rcx
	movzbl	3(%rbx,%rdx), %edi
	orq	%rcx, %rdi
	movl	$0, 56(%r14)
	testl	%edi, %edi
	je	LBB95_121
## %bb.111:
	leal	4(%r13), %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB95_112:                              ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %ecx
	movzwl	(%rbx,%rcx), %esi
	rolw	$8, %si
	testw	%si, %si
	je	LBB95_116
## %bb.113:                             ##   in Loop: Header=BB95_112 Depth=1
	cmpw	$3, %si
	jne	LBB95_117
## %bb.114:                             ##   in Loop: Header=BB95_112 Depth=1
	movzwl	2(%rbx,%rcx), %esi
	rolw	$8, %si
	cmpw	$10, %si
	je	LBB95_116
## %bb.115:                             ##   in Loop: Header=BB95_112 Depth=1
	cmpw	$1, %si
	jne	LBB95_117
	.p2align	4, 0x90
LBB95_116:                              ##   in Loop: Header=BB95_112 Depth=1
	movl	4(%rbx,%rcx), %edx
	bswapl	%edx
	addl	%r13d, %edx
	movl	%edx, 56(%r14)
LBB95_117:                              ##   in Loop: Header=BB95_112 Depth=1
	addl	$8, %ecx
	decq	%rdi
	jne	LBB95_112
## %bb.118:
	testl	%edx, %edx
	je	LBB95_119
## %bb.120:
	movslq	28(%r14), %rax
	movzbl	50(%rbx,%rax), %ecx
	shll	$8, %ecx
	movzbl	51(%rbx,%rax), %eax
	orl	%ecx, %eax
	movl	%eax, 60(%r14)
	movl	$1, %eax
	jmp	LBB95_121
LBB95_77:
	movl	$2, -72(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -60(%rbp)
	movzbl	4(%rbx,%r12), %edx
	shlq	$8, %rdx
	movzbl	5(%rbx,%r12), %ecx
	orq	%rdx, %rcx
	testl	%ecx, %ecx
	je	LBB95_121
## %bb.78:
	xorl	%edx, %edx
	movl	%r15d, %esi
	.p2align	4, 0x90
LBB95_79:                               ## =>This Inner Loop Header: Depth=1
	movl	%esi, %esi
	cmpb	$67, (%rbx,%rsi)
	jne	LBB95_83
## %bb.80:                              ##   in Loop: Header=BB95_79 Depth=1
	cmpb	$70, 1(%rbx,%rsi)
	jne	LBB95_83
## %bb.81:                              ##   in Loop: Header=BB95_79 Depth=1
	cmpb	$70, 2(%rbx,%rsi)
	jne	LBB95_83
## %bb.82:                              ##   in Loop: Header=BB95_79 Depth=1
	cmpb	$32, 3(%rbx,%rsi)
	je	LBB95_84
	.p2align	4, 0x90
LBB95_83:                               ##   in Loop: Header=BB95_79 Depth=1
	incq	%rdx
	addl	$16, %esi
	cmpq	%rcx, %rdx
	jb	LBB95_79
	jmp	LBB95_121
LBB95_6:
	movl	8(%rbx,%rcx), %r13d
	bswapl	%r13d
	jmp	LBB95_9
LBB95_14:
	movl	8(%rbx,%rcx), %r8d
	bswapl	%r8d
	jmp	LBB95_17
LBB95_23:
	movl	8(%rbx,%rdx), %r9d
	bswapl	%r9d
	jmp	LBB95_26
LBB95_32:
	movl	8(%rbx,%rdx), %r10d
	bswapl	%r10d
	jmp	LBB95_35
LBB95_41:
	movl	8(%rbx,%rsi), %r11d
	bswapl	%r11d
	jmp	LBB95_44
LBB95_50:
	movl	8(%rbx,%rdx), %edi
	bswapl	%edi
	jmp	LBB95_53
LBB95_59:
	movl	8(%rbx,%rdx), %ecx
	bswapl	%ecx
	jmp	LBB95_62
LBB95_68:
	movl	8(%rbx,%rdx), %ecx
	bswapl	%ecx
	jmp	LBB95_71
LBB95_119:
	xorl	%eax, %eax
LBB95_121:
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB95_108:
	movzbl	8(%rbx,%r15), %ecx
	shlq	$24, %rcx
	movzbl	9(%rbx,%r15), %edx
	shlq	$16, %rdx
	orq	%rcx, %rdx
	movzbl	10(%rbx,%r15), %esi
	shlq	$8, %rsi
	orq	%rdx, %rsi
	movzbl	11(%rbx,%r15), %ecx
	orq	%rsi, %rcx
	testl	%ecx, %ecx
	je	LBB95_110
## %bb.109:
	movzbl	4(%rbx,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%rbx,%rcx), %edi
	orl	%edx, %edi
	jmp	LBB95_110
LBB95_84:
	movzbl	8(%rbx,%rsi), %ecx
	shlq	$24, %rcx
	movzbl	9(%rbx,%rsi), %edx
	shlq	$16, %rdx
	orq	%rcx, %rdx
	movzbl	10(%rbx,%rsi), %ecx
	shlq	$8, %rcx
	orq	%rdx, %rcx
	movzbl	11(%rbx,%rsi), %edx
	orq	%rcx, %rdx
	testl	%edx, %edx
	je	LBB95_121
## %bb.85:
	addq	%rbx, %rdx
	movq	$0, 152(%r14)
	movq	$0, 144(%r14)
	movq	$0, 136(%r14)
	movq	$0, 128(%r14)
	movq	%rdx, 64(%r14)
	movabsq	$2305843009213693952, %rcx ## imm = 0x2000000000000000
	movq	%rcx, 72(%r14)
	movq	%rcx, -48(%rbp)
	movq	%rdx, -56(%rbp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB95_122
## %bb.86:
	movl	$2, %edx
	movl	-44(%rbp), %eax
	cmpl	%edx, %eax
	jl	LBB95_122
## %bb.87:
	movl	%edx, -48(%rbp)
	xorl	%ecx, %ecx
	cmpl	%eax, %edx
	jge	LBB95_89
## %bb.88:
	movl	$2, %ecx
	movq	-56(%rbp), %rdx
	movl	$3, -48(%rbp)
	movzbl	(%rdx,%rcx), %ecx
LBB95_89:
	cmpl	%ecx, %eax
	jl	LBB95_122
## %bb.90:
	movl	%ecx, -48(%rbp)
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	movq	%rax, %rdi
	movq	%rdx, %rsi
	xorl	%edx, %edx
	callq	_stbtt__cff_index_get
	movq	%rax, -88(%rbp)
	movq	%rdx, -80(%rbp)
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	movq	%rax, 96(%r14)
	movq	%rdx, 104(%r14)
	leaq	-88(%rbp), %rdi
	leaq	-68(%rbp), %rcx
	movl	$17, %esi
	movl	$1, %edx
	callq	_stbtt__dict_get_ints
	leaq	-72(%rbp), %rcx
	leaq	-88(%rbp), %rdi
	movl	$262, %esi              ## imm = 0x106
	movl	$1, %edx
	callq	_stbtt__dict_get_ints
	leaq	-64(%rbp), %rcx
	leaq	-88(%rbp), %rdi
	movl	$292, %esi              ## imm = 0x124
	movl	$1, %edx
	callq	_stbtt__dict_get_ints
	leaq	-60(%rbp), %rcx
	leaq	-88(%rbp), %rdi
	movl	$293, %esi              ## imm = 0x125
	movl	$1, %edx
	callq	_stbtt__dict_get_ints
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	callq	_stbtt__get_subrs
	movq	%rax, 112(%r14)
	movq	%rdx, 120(%r14)
	cmpl	$2, -72(%rbp)
	movl	$0, %eax
	jne	LBB95_121
## %bb.91:
	movl	-68(%rbp), %edx
	testl	%edx, %edx
	je	LBB95_121
## %bb.92:
	movl	-64(%rbp), %ecx
	testl	%ecx, %ecx
	je	LBB95_93
## %bb.94:
	movslq	-60(%rbp), %rsi
	testq	%rsi, %rsi
	je	LBB95_121
## %bb.95:
	movq	%rsi, -104(%rbp)        ## 8-byte Spill
	movl	%edx, -92(%rbp)         ## 4-byte Spill
	testl	%ecx, %ecx
	js	LBB95_122
## %bb.96:
	cmpl	%ecx, -44(%rbp)
	jl	LBB95_122
## %bb.97:
	movl	%ecx, -48(%rbp)
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	movq	%rax, 128(%r14)
	movq	%rdx, 136(%r14)
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	subl	%edi, %ecx
	setl	%r8b
	movl	%ecx, %esi
	orl	%edi, %esi
	sets	%dl
	orb	%r8b, %dl
	addq	-56(%rbp), %rdi
	shlq	$32, %rcx
	xorl	%esi, %esi
	testb	%dl, %dl
	cmovneq	%rsi, %rdi
	cmovneq	%rsi, %rcx
	movq	%rdi, 144(%r14)
	movq	%rcx, 152(%r14)
	movl	-92(%rbp), %edx         ## 4-byte Reload
	testl	%edx, %edx
	jns	LBB95_99
	jmp	LBB95_122
LBB95_93:
	movl	-44(%rbp), %eax
	testl	%edx, %edx
	js	LBB95_122
LBB95_99:
	cmpl	%edx, %eax
	jl	LBB95_122
## %bb.100:
	movl	%edx, -48(%rbp)
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	movq	%rax, 80(%r14)
	movq	%rdx, 88(%r14)
	xorl	%eax, %eax
	jmp	LBB95_101
LBB95_122:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetFontOffsetForIndex ## -- Begin function stbtt_GetFontOffsetForIndex
	.p2align	4, 0x90
_stbtt_GetFontOffsetForIndex:           ## @stbtt_GetFontOffsetForIndex
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	callq	_stbtt__isfont
	testl	%eax, %eax
	je	LBB96_2
## %bb.1:
	negl	%r14d
	sbbl	%eax, %eax
	jmp	LBB96_10
LBB96_2:
	movl	$-1, %eax
	cmpb	$116, (%rbx)
	jne	LBB96_10
## %bb.3:
	cmpb	$116, 1(%rbx)
	jne	LBB96_10
## %bb.4:
	cmpb	$99, 2(%rbx)
	jne	LBB96_10
## %bb.5:
	cmpb	$102, 3(%rbx)
	jne	LBB96_10
## %bb.6:
	movl	4(%rbx), %ecx
	bswapl	%ecx
	cmpl	$131072, %ecx           ## imm = 0x20000
	je	LBB96_8
## %bb.7:
	cmpl	$65536, %ecx            ## imm = 0x10000
	jne	LBB96_10
LBB96_8:
	movl	8(%rbx), %ecx
	bswapl	%ecx
	cmpl	%r14d, %ecx
	jle	LBB96_10
## %bb.9:
	movslq	%r14d, %rax
	movl	12(%rbx,%rax,4), %eax
	bswapl	%eax
LBB96_10:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_PackFontRange    ## -- Begin function stbtt_PackFontRange
	.p2align	4, 0x90
_stbtt_PackFontRange:                   ## @stbtt_PackFontRange
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	%ecx, -36(%rbp)
	movq	$0, -32(%rbp)
	movl	%r8d, -24(%rbp)
	movq	%r9, -16(%rbp)
	movss	%xmm0, -40(%rbp)
	leaq	-40(%rbp), %rcx
	movl	$1, %r8d
	callq	_stbtt_PackFontRanges
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt_GetScaledFontVMetrics
LCPI98_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetScaledFontVMetrics
	.p2align	4, 0x90
_stbtt_GetScaledFontVMetrics:           ## @stbtt_GetScaledFontVMetrics
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$176, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_GetFontOffsetForIndex
	leaq	-208(%rbp), %rdi
	movq	%rbx, %rsi
	movl	%eax, %edx
	callq	_stbtt_InitFont
	movaps	-48(%rbp), %xmm2        ## 16-byte Reload
	xorps	%xmm0, %xmm0
	ucomiss	%xmm0, %xmm2
	jbe	LBB98_2
## %bb.1:
	movq	-200(%rbp), %rax
	movslq	-172(%rbp), %rcx
	movzbl	4(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%rax,%rcx), %esi
	movswl	%dx, %edx
	orl	%esi, %edx
	movzbl	6(%rax,%rcx), %esi
	shll	$8, %esi
	movzbl	7(%rax,%rcx), %edi
	movswl	%si, %esi
	orl	%edi, %esi
	movl	%edx, %edi
	subl	%esi, %edi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	divss	%xmm0, %xmm2
	jmp	LBB98_3
LBB98_2:
	xorps	LCPI98_0(%rip), %xmm2
	movq	-200(%rbp), %rax
	movslq	-180(%rbp), %rcx
	movzwl	18(%rax,%rcx), %ecx
	rolw	$8, %cx
	movzwl	%cx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	divss	%xmm0, %xmm2
	movslq	-172(%rbp), %rcx
	movzwl	4(%rax,%rcx), %edx
	movzwl	6(%rax,%rcx), %esi
	rolw	$8, %dx
	rolw	$8, %si
LBB98_3:
	movzwl	8(%rax,%rcx), %eax
	movswl	%dx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	rolw	$8, %ax
	mulss	%xmm2, %xmm0
	movss	%xmm0, (%r12)
	movswl	%si, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	cwtl
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm2, %xmm0
	movss	%xmm0, (%r15)
	mulss	%xmm2, %xmm1
	movss	%xmm1, (%r14)
	addq	$176, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt_GetPackedQuad
LCPI99_0:
	.long	1065353216              ## float 1
LCPI99_1:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetPackedQuad
	.p2align	4, 0x90
_stbtt_GetPackedQuad:                   ## @stbtt_GetPackedQuad
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cvtsi2ssl	%esi, %xmm2
	movq	16(%rbp), %rax
	cvtsi2ssl	%edx, %xmm3
	movss	LCPI99_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	divss	%xmm2, %xmm1
	movslq	%ecx, %rdx
	leaq	(%rdx,%rdx,8), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	addq	%rdx, %rcx
	cmpl	$0, 24(%rbp)
	divss	%xmm3, %xmm0
	movss	8(%rdi,%rcx), %xmm2     ## xmm2 = mem[0],zero,zero,zero
	movss	(%r8), %xmm3            ## xmm3 = mem[0],zero,zero,zero
	addss	%xmm2, %xmm3
	je	LBB99_2
## %bb.1:
	movss	LCPI99_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	addss	%xmm4, %xmm3
	roundss	$9, %xmm3, %xmm3
	cvttss2si	%xmm3, %edx
	cvtsi2ssl	%edx, %xmm5
	movss	12(%rdi,%rcx), %xmm6    ## xmm6 = mem[0],zero,zero,zero
	movss	(%r9), %xmm3            ## xmm3 = mem[0],zero,zero,zero
	addss	%xmm6, %xmm3
	addss	%xmm4, %xmm3
	roundss	$9, %xmm3, %xmm3
	cvttss2si	%xmm3, %edx
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%edx, %xmm3
	movss	%xmm5, (%rax)
	movss	%xmm3, 4(%rax)
	addss	20(%rdi,%rcx), %xmm5
	subss	%xmm2, %xmm5
	movss	%xmm5, 16(%rax)
	addss	24(%rdi,%rcx), %xmm3
	subss	%xmm6, %xmm3
	jmp	LBB99_3
LBB99_2:
	movss	%xmm3, (%rax)
	movss	(%r9), %xmm2            ## xmm2 = mem[0],zero,zero,zero
	addss	12(%rdi,%rcx), %xmm2
	movss	%xmm2, 4(%rax)
	movss	(%r8), %xmm2            ## xmm2 = mem[0],zero,zero,zero
	addss	20(%rdi,%rcx), %xmm2
	movss	%xmm2, 16(%rax)
	movss	(%r9), %xmm3            ## xmm3 = mem[0],zero,zero,zero
	addss	24(%rdi,%rcx), %xmm3
LBB99_3:
	movss	%xmm3, 20(%rax)
	movzwl	(%rdi,%rcx), %edx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%edx, %xmm2
	mulss	%xmm1, %xmm2
	movss	%xmm2, 8(%rax)
	movzwl	2(%rdi,%rcx), %edx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%edx, %xmm2
	mulss	%xmm0, %xmm2
	movss	%xmm2, 12(%rax)
	movzwl	4(%rdi,%rcx), %edx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%edx, %xmm2
	mulss	%xmm1, %xmm2
	movss	%xmm2, 24(%rax)
	movzwl	6(%rdi,%rcx), %edx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 28(%rax)
	movss	16(%rdi,%rcx), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	addss	(%r8), %xmm0
	movss	%xmm0, (%r8)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt_GetGlyphSDF
LCPI100_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
LCPI100_23:
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI100_1:
	.long	1065353216              ## float 1
LCPI100_2:
	.long	1056964608              ## float 0.5
LCPI100_3:
	.long	1008981770              ## float 0.00999999977
LCPI100_4:
	.long	3156465418              ## float -0.00999999977
LCPI100_5:
	.long	1065185444              ## float 0.990000009
LCPI100_6:
	.long	3379831792              ## float -999999
LCPI100_7:
	.long	2147483648              ## float -0
LCPI100_8:
	.long	3221225472              ## float -2
LCPI100_9:
	.long	3212836864              ## float -1
LCPI100_10:
	.long	1073741824              ## float 2
LCPI100_11:
	.long	1232348144              ## float 999999
LCPI100_12:
	.long	1077936128              ## float 3
LCPI100_13:
	.long	3225419776              ## float -3
LCPI100_14:
	.long	3239051264              ## float -9
LCPI100_15:
	.long	1104674816              ## float 27
LCPI100_16:
	.long	1082130432              ## float 4
LCPI100_18:
	.long	3252158464              ## float -27
LCPI100_21:
	.long	1071494103              ## float 1.73205078
LCPI100_22:
	.long	3229614080              ## float -4
LCPI100_24:
	.long	1132396544              ## float 255
LCPI100_25:
	.long	0                       ## float 0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI100_17:
	.quad	4599676419600023552     ## double 0.3333333432674408
LCPI100_19:
	.quad	-4620693217682128896    ## double -0.5
LCPI100_20:
	.quad	-4613618981401853830    ## double -1.5707960000000001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_stbtt_GetGlyphSDF
	.p2align	4, 0x90
_stbtt_GetGlyphSDF:                     ## @stbtt_GetGlyphSDF
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$440, %rsp              ## imm = 0x1B8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorps	%xmm2, %xmm2
	ucomiss	%xmm2, %xmm0
	jne	LBB100_2
	jp	LBB100_2
LBB100_1:
	xorl	%eax, %eax
	jmp	LBB100_137
LBB100_2:
	movq	%r8, %r12
	movl	%edx, %r13d
	movl	%esi, %r15d
	movq	%rdi, %r14
	movq	%r9, -80(%rbp)          ## 8-byte Spill
	movl	%ecx, -272(%rbp)        ## 4-byte Spill
	xorl	%ebx, %ebx
	movss	%xmm1, -56(%rbp)        ## 4-byte Spill
	movl	$0, -88(%rbp)
	movl	$0, -100(%rbp)
	leaq	-88(%rbp), %rdx
	leaq	-100(%rbp), %rcx
	leaq	-228(%rbp), %r8
	leaq	-224(%rbp), %r9
	movaps	%xmm0, -160(%rbp)       ## 16-byte Spill
	callq	_stbtt_GetGlyphBox
	movaps	-160(%rbp), %xmm2       ## 16-byte Reload
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	testl	%eax, %eax
	je	LBB100_4
## %bb.3:
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-88(%rbp), %xmm0
	mulss	%xmm2, %xmm0
	xorps	%xmm1, %xmm1
	addss	%xmm1, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %ebx
	xorl	%eax, %eax
	subl	-224(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-228(%rbp), %xmm0
	xorl	%eax, %eax
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %edx
	subl	-100(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %esi
LBB100_4:
	cmpl	%edx, %ebx
	je	LBB100_1
## %bb.5:
	cmpl	%esi, %ecx
	movl	$0, %eax
	je	LBB100_137
## %bb.6:
	movl	%edx, %r8d
	movl	%esi, %edi
	subl	%r13d, %ebx
	subl	%r13d, %ecx
	movl	%ecx, -48(%rbp)         ## 4-byte Spill
	movl	%edx, %eax
	addl	%r13d, %eax
	addl	%r13d, %edi
	movl	%eax, %esi
	movl	%eax, %r13d
	movq	%rbx, -112(%rbp)        ## 8-byte Spill
	subl	%ebx, %r13d
	testq	%r12, %r12
	je	LBB100_8
## %bb.7:
	movl	%r13d, (%r12)
LBB100_8:
	movq	16(%rbp), %rax
	movl	%edi, %ebx
	movl	-48(%rbp), %edx         ## 4-byte Reload
	subl	%edx, %ebx
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	testq	%rcx, %rcx
	je	LBB100_10
## %bb.9:
	movl	%ebx, (%rcx)
LBB100_10:
	movq	24(%rbp), %rcx
	testq	%rax, %rax
	movq	-112(%rbp), %r12        ## 8-byte Reload
	je	LBB100_12
## %bb.11:
	movl	%r12d, (%rax)
LBB100_12:
	movl	%edi, -96(%rbp)         ## 4-byte Spill
	movl	%esi, -92(%rbp)         ## 4-byte Spill
	testq	%rcx, %rcx
	je	LBB100_14
## %bb.13:
	movl	%edx, (%rcx)
LBB100_14:
	movaps	LCPI100_0(%rip), %xmm0  ## xmm0 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorps	%xmm2, %xmm0
	movaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	leaq	-88(%rbp), %rdx
	movq	%r14, %rdi
	movl	%r15d, %esi
	callq	_stbtt_GetGlyphShape
	movl	%eax, %r15d
	movl	%r13d, -212(%rbp)       ## 4-byte Spill
	imull	%r13d, %ebx
	movslq	%ebx, %rdi
	callq	_malloc
	movq	%rax, %r14
	movslq	%r15d, %r13
	leaq	(,%r13,4), %rdi
	callq	_malloc
	movq	%rax, %rsi
	testl	%r13d, %r13d
	jle	LBB100_23
## %bb.15:
	leal	-1(%r15), %edi
	movq	-88(%rbp), %r9
	movl	%r15d, %r8d
	xorl	%ecx, %ecx
	movss	LCPI100_1(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movq	%r9, %rax
	movaps	-144(%rbp), %xmm7       ## 16-byte Reload
	.p2align	4, 0x90
LBB100_16:                              ## =>This Inner Loop Header: Depth=1
	movzbl	12(%rax), %ebx
	cmpb	$3, %bl
	je	LBB100_19
## %bb.17:                              ##   in Loop: Header=BB100_16 Depth=1
	xorps	%xmm2, %xmm2
	cmpb	$2, %bl
	jne	LBB100_22
## %bb.18:                              ##   in Loop: Header=BB100_16 Depth=1
	movswl	(%rax), %ebx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ebx, %xmm1
	movaps	-160(%rbp), %xmm4       ## 16-byte Reload
	mulss	%xmm4, %xmm1
	movswl	2(%rax), %ebx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ebx, %xmm2
	movslq	%edi, %rbx
	movq	%rbx, %rdi
	shlq	$4, %rdi
	subq	%rbx, %rdi
	subq	%rbx, %rdi
	movswl	(%r9,%rdi), %ebx
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%ebx, %xmm3
	movaps	-144(%rbp), %xmm5       ## 16-byte Reload
	mulss	%xmm5, %xmm2
	mulss	%xmm4, %xmm3
	subss	%xmm1, %xmm3
	movswl	2(%r9,%rdi), %edi
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edi, %xmm1
	mulss	%xmm5, %xmm1
	subss	%xmm2, %xmm1
	mulss	%xmm3, %xmm3
	mulss	%xmm1, %xmm1
	addss	%xmm3, %xmm1
	sqrtss	%xmm1, %xmm1
	jmp	LBB100_20
	.p2align	4, 0x90
LBB100_19:                              ##   in Loop: Header=BB100_16 Depth=1
	movslq	%edi, %rbx
	movq	%rbx, %rdi
	shlq	$4, %rdi
	subq	%rbx, %rdi
	subq	%rbx, %rdi
	movswl	(%r9,%rdi), %ebx
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ebx, %xmm2
	movaps	-160(%rbp), %xmm1       ## 16-byte Reload
	mulss	%xmm1, %xmm2
	movswl	2(%r9,%rdi), %edi
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%edi, %xmm3
	mulss	%xmm7, %xmm3
	movswl	4(%rax), %edi
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%edi, %xmm4
	movswl	6(%rax), %edi
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%edi, %xmm5
	movswl	(%rax), %edi
	xorps	%xmm6, %xmm6
	cvtsi2ssl	%edi, %xmm6
	mulss	%xmm1, %xmm4
	mulss	%xmm7, %xmm5
	mulss	%xmm1, %xmm6
	movswl	2(%rax), %edi
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edi, %xmm1
	mulss	%xmm7, %xmm1
	addss	%xmm4, %xmm4
	subss	%xmm4, %xmm6
	addss	%xmm2, %xmm6
	addss	%xmm5, %xmm5
	subss	%xmm5, %xmm1
	addss	%xmm3, %xmm1
	mulss	%xmm6, %xmm6
	mulss	%xmm1, %xmm1
	addss	%xmm6, %xmm1
LBB100_20:                              ##   in Loop: Header=BB100_16 Depth=1
	xorps	%xmm2, %xmm2
	ucomiss	%xmm2, %xmm1
	jne	LBB100_21
	jnp	LBB100_22
LBB100_21:                              ##   in Loop: Header=BB100_16 Depth=1
	movaps	%xmm0, %xmm2
	divss	%xmm1, %xmm2
LBB100_22:                              ##   in Loop: Header=BB100_16 Depth=1
	movss	%xmm2, (%rsi,%rcx,4)
	movl	%ecx, %edi
	leaq	1(%rcx), %rdx
	addq	$14, %rax
	movq	%rdx, %rcx
	cmpq	%rdx, %r8
	jne	LBB100_16
LBB100_23:
	movl	-48(%rbp), %ecx         ## 4-byte Reload
	cmpl	%ecx, -96(%rbp)         ## 4-byte Folded Reload
	movq	%r14, -200(%rbp)        ## 8-byte Spill
	jle	LBB100_135
## %bb.24:
	movzbl	-272(%rbp), %eax        ## 1-byte Folded Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -220(%rbp)       ## 4-byte Spill
	movq	-88(%rbp), %rax
	movl	%r15d, %edx
	movq	%rdx, -376(%rbp)        ## 8-byte Spill
	movslq	%r12d, %rdx
	movq	%rdx, -360(%rbp)        ## 8-byte Spill
	movslq	-92(%rbp), %rdx         ## 4-byte Folded Reload
	movq	%rdx, -392(%rbp)        ## 8-byte Spill
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	leaq	-14(%rax), %rax
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	movaps	-144(%rbp), %xmm14      ## 16-byte Reload
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB100_25:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB100_29 Depth 2
                                        ##       Child Loop BB100_54 Depth 3
                                        ##       Child Loop BB100_75 Depth 3
	cmpl	%r12d, -92(%rbp)        ## 4-byte Folded Reload
	jle	LBB100_132
## %bb.26:                              ##   in Loop: Header=BB100_25 Depth=1
	movl	-52(%rbp), %ebx         ## 4-byte Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	addss	LCPI100_2(%rip), %xmm0
	movaps	%xmm0, -192(%rbp)       ## 16-byte Spill
	divss	%xmm14, %xmm0
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	movaps	%xmm11, %xmm1
	callq	_fmodf
	movl	%ebx, %eax
	subl	-48(%rbp), %eax         ## 4-byte Folded Reload
	imull	-212(%rbp), %eax        ## 4-byte Folded Reload
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	movss	LCPI100_3(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm1, %xmm2
	ucomiss	%xmm0, %xmm1
	movaps	-80(%rbp), %xmm4        ## 16-byte Reload
	movaps	%xmm4, %xmm1
	addss	%xmm2, %xmm1
	movaps	%xmm0, %xmm3
	cmpltss	%xmm2, %xmm3
	andps	%xmm3, %xmm1
	andnps	%xmm4, %xmm3
	orps	%xmm1, %xmm3
	ja	LBB100_28
## %bb.27:                              ##   in Loop: Header=BB100_25 Depth=1
	movaps	%xmm4, %xmm2
	addss	LCPI100_4(%rip), %xmm2
	movss	LCPI100_5(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	cmpnltss	%xmm0, %xmm1
	andps	%xmm1, %xmm3
	andnps	%xmm2, %xmm1
	orps	%xmm1, %xmm3
LBB100_28:                              ##   in Loop: Header=BB100_25 Depth=1
	movq	-112(%rbp), %rax        ## 8-byte Reload
	xorps	%xmm0, %xmm0
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	subl	%eax, %ecx
	movq	%rcx, -208(%rbp)        ## 8-byte Spill
	movaps	%xmm3, -256(%rbp)       ## 16-byte Spill
	mulss	%xmm0, %xmm3
	movss	%xmm3, -216(%rbp)       ## 4-byte Spill
	movq	-360(%rbp), %r12        ## 8-byte Reload
	movss	-56(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movaps	-160(%rbp), %xmm13      ## 16-byte Reload
	movaps	-144(%rbp), %xmm14      ## 16-byte Reload
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB100_29:                              ##   Parent Loop BB100_25 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB100_54 Depth 3
                                        ##       Child Loop BB100_75 Depth 3
	movss	LCPI100_6(%rip), %xmm9  ## xmm9 = mem[0],zero,zero,zero
	testl	%r15d, %r15d
	jle	LBB100_128
## %bb.30:                              ##   in Loop: Header=BB100_29 Depth=2
	xorps	%xmm6, %xmm6
	cvtsi2ssl	%r12d, %xmm6
	addss	LCPI100_2(%rip), %xmm6
	movaps	%xmm6, %xmm12
	divss	%xmm13, %xmm12
	movaps	%xmm12, %xmm11
	mulss	LCPI100_7(%rip), %xmm11
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	addss	%xmm3, %xmm11
	movaps	%xmm12, %xmm0
	addss	-216(%rbp), %xmm0       ## 4-byte Folded Reload
	movaps	%xmm0, -272(%rbp)       ## 16-byte Spill
	xorl	%eax, %eax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movq	-376(%rbp), %r10        ## 8-byte Reload
	movq	-296(%rbp), %rcx        ## 8-byte Reload
                                        ## implicit-def: $xmm0
                                        ## kill: killed $xmm0
                                        ## implicit-def: $xmm0
                                        ## kill: killed $xmm0
	movaps	%xmm6, -176(%rbp)       ## 16-byte Spill
	jmp	LBB100_54
LBB100_31:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	%xmm7, %xmm2
	xorps	%xmm3, %xmm3
	mulss	%xmm3, %xmm2
	movaps	%xmm1, %xmm5
	subss	%xmm2, %xmm5
	movaps	%xmm0, %xmm2
	mulss	%xmm3, %xmm2
	movaps	%xmm4, %xmm14
	subss	%xmm2, %xmm14
	movaps	%xmm13, %xmm2
	mulss	%xmm3, %xmm2
	movaps	%xmm10, %xmm3
	subss	%xmm2, %xmm3
	movaps	%xmm14, %xmm2
	addss	%xmm14, %xmm2
	xorps	%xmm8, %xmm8
	movaps	%xmm5, %xmm9
	subss	%xmm2, %xmm9
	addss	%xmm3, %xmm9
	subss	%xmm5, %xmm14
	subss	%xmm11, %xmm5
	ucomiss	%xmm8, %xmm9
	jne	LBB100_32
	jnp	LBB100_39
LBB100_32:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	%xmm14, %xmm3
	mulss	%xmm14, %xmm3
	mulss	%xmm9, %xmm5
	subss	%xmm5, %xmm3
	ucomiss	%xmm8, %xmm3
	jbe	LBB100_42
## %bb.33:                              ##   in Loop: Header=BB100_54 Depth=3
	movss	LCPI100_9(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	divss	%xmm9, %xmm2
	sqrtss	%xmm3, %xmm3
	movaps	%xmm14, %xmm5
	addss	%xmm3, %xmm5
	mulss	%xmm2, %xmm5
	movaps	%xmm14, %xmm15
	subss	%xmm3, %xmm15
	ucomiss	%xmm8, %xmm5
	mulss	%xmm2, %xmm15
	setb	%al
	movss	LCPI100_1(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm2
	setb	%bl
	orb	%al, %bl
	ucomiss	%xmm15, %xmm2
	jb	LBB100_43
## %bb.34:                              ##   in Loop: Header=BB100_54 Depth=3
	ucomiss	%xmm8, %xmm3
	jbe	LBB100_43
## %bb.35:                              ##   in Loop: Header=BB100_54 Depth=3
	ucomiss	%xmm8, %xmm15
	jb	LBB100_43
## %bb.36:                              ##   in Loop: Header=BB100_54 Depth=3
	movss	LCPI100_1(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm2
	setae	%al
	ucomiss	%xmm8, %xmm5
	setae	%dl
	movaps	%xmm15, %xmm2
	testb	%bl, %bl
	jne	LBB100_38
## %bb.37:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	%xmm5, %xmm2
LBB100_38:                              ##   in Loop: Header=BB100_54 Depth=3
	andb	%al, %dl
	movaps	%xmm2, %xmm5
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	jmp	LBB100_46
LBB100_39:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	%xmm14, %xmm2
	mulss	LCPI100_8(%rip), %xmm2
	divss	%xmm2, %xmm5
	xorps	%xmm15, %xmm15
	ucomiss	%xmm15, %xmm5
	jb	LBB100_53
## %bb.40:                              ##   in Loop: Header=BB100_54 Depth=3
	movss	LCPI100_1(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm2
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	jb	LBB100_41
LBB100_45:                              ##   in Loop: Header=BB100_54 Depth=3
	xorl	%edx, %edx
LBB100_46:                              ##   in Loop: Header=BB100_54 Depth=3
	xorps	%xmm2, %xmm2
	mulss	%xmm2, %xmm1
	addss	%xmm7, %xmm1
	mulss	%xmm2, %xmm4
	addss	%xmm0, %xmm4
	mulss	%xmm2, %xmm10
	addss	%xmm13, %xmm10
	subss	%xmm1, %xmm4
	subss	%xmm1, %xmm10
	subss	-272(%rbp), %xmm1       ## 16-byte Folded Reload
	movaps	%xmm5, %xmm0
	addss	%xmm5, %xmm0
	movss	LCPI100_10(%rip), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm2
	mulss	%xmm5, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm1, %xmm2
	movaps	%xmm5, %xmm0
	mulss	%xmm5, %xmm0
	mulss	%xmm10, %xmm0
	addss	%xmm2, %xmm0
	movl	$1, %esi
	testb	%dl, %dl
	je	LBB100_48
## %bb.47:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	%xmm15, %xmm2
	addss	%xmm15, %xmm2
	movss	LCPI100_10(%rip), %xmm7 ## xmm7 = mem[0],zero,zero,zero
	subss	%xmm2, %xmm7
	mulss	%xmm15, %xmm7
	mulss	%xmm7, %xmm4
	addss	%xmm4, %xmm1
	movaps	%xmm9, %xmm2
	mulss	%xmm15, %xmm2
	mulss	%xmm15, %xmm15
	mulss	%xmm15, %xmm10
	addss	%xmm1, %xmm10
	addss	%xmm14, %xmm2
	movss	%xmm2, -288(%rbp)       ## 4-byte Spill
	movl	$2, %esi
	movss	%xmm10, -44(%rbp)       ## 4-byte Spill
LBB100_48:                              ##   in Loop: Header=BB100_54 Depth=3
	xorps	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	LBB100_50
## %bb.49:                              ##   in Loop: Header=BB100_54 Depth=3
	mulss	%xmm5, %xmm9
	addss	%xmm9, %xmm14
	xorl	%eax, %eax
	ucomiss	%xmm14, %xmm1
	setbe	%al
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	leal	-1(%rdx,%rax,2), %edx
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
LBB100_50:                              ##   in Loop: Header=BB100_54 Depth=3
	xorps	%xmm1, %xmm1
	movaps	-176(%rbp), %xmm6       ## 16-byte Reload
	xorps	%xmm0, %xmm0
	ucomiss	-44(%rbp), %xmm1        ## 4-byte Folded Reload
	jbe	LBB100_72
## %bb.51:                              ##   in Loop: Header=BB100_54 Depth=3
	cmpl	$2, %esi
	jb	LBB100_72
## %bb.52:                              ##   in Loop: Header=BB100_54 Depth=3
	xorl	%eax, %eax
	ucomiss	-288(%rbp), %xmm0       ## 4-byte Folded Reload
	setbe	%al
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	leal	-1(%rdx,%rax,2), %edx
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
	jmp	LBB100_72
LBB100_42:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	jmp	LBB100_72
LBB100_43:                              ##   in Loop: Header=BB100_54 Depth=3
	testb	%bl, %bl
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	je	LBB100_45
LBB100_41:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	-176(%rbp), %xmm6       ## 16-byte Reload
	jmp	LBB100_72
LBB100_53:                              ##   in Loop: Header=BB100_54 Depth=3
	movaps	-256(%rbp), %xmm3       ## 16-byte Reload
	movaps	-176(%rbp), %xmm6       ## 16-byte Reload
	jmp	LBB100_72
	.p2align	4, 0x90
LBB100_54:                              ##   Parent Loop BB100_25 Depth=1
                                        ##     Parent Loop BB100_29 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	12(%rcx), %eax
	cmpb	$3, %al
	je	LBB100_60
## %bb.55:                              ##   in Loop: Header=BB100_54 Depth=3
	cmpb	$2, %al
	jne	LBB100_72
## %bb.56:                              ##   in Loop: Header=BB100_54 Depth=3
	movswl	-12(%rcx), %edx
	movswl	2(%rcx), %esi
	cmpw	%dx, %si
	movl	%edx, %eax
	cmovlel	%esi, %eax
	cwtl
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	ucomiss	%xmm0, %xmm3
	jbe	LBB100_72
## %bb.57:                              ##   in Loop: Header=BB100_54 Depth=3
	cmpw	%dx, %si
	movl	%edx, %eax
	cmovgel	%esi, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	ucomiss	%xmm3, %xmm0
	jbe	LBB100_72
## %bb.58:                              ##   in Loop: Header=BB100_54 Depth=3
	movswl	-14(%rcx), %edi
	movswl	(%rcx), %eax
	movl	%eax, %ebx
	subl	%edi, %ebx
	cmovgl	%edi, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	ucomiss	%xmm0, %xmm12
	jbe	LBB100_72
## %bb.59:                              ##   in Loop: Header=BB100_54 Depth=3
	xorl	%eax, %eax
	cmpw	%dx, %si
	setg	%al
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movaps	%xmm3, %xmm1
	subss	%xmm0, %xmm1
	subl	%edx, %esi
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	divss	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	mulss	%xmm1, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edi, %xmm1
	addss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm12
	leal	-1(%rax,%rax), %eax
	jmp	LBB100_71
	.p2align	4, 0x90
LBB100_60:                              ##   in Loop: Header=BB100_54 Depth=3
	movswl	-14(%rcx), %r8d
	movswl	4(%rcx), %r14d
	movzwl	6(%rcx), %eax
	movswl	(%rcx), %r9d
	movswl	2(%rcx), %r11d
	cmpl	%r9d, %r14d
	movl	%r9d, %edi
	cmovlel	%r14d, %edi
	cmpl	%r8d, %edi
	cmovgl	%r8d, %edi
	cmpw	%r11w, %ax
	movl	%r11d, %edx
	cmovlel	%eax, %edx
	movl	%eax, %esi
	cmovll	%r11d, %esi
	movswl	-12(%rcx), %ebx
	cmpw	%dx, %bx
	cmovlel	%ebx, %edx
	cmpw	%si, %bx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edi, %xmm0
	cmovgel	%ebx, %esi
	ucomiss	%xmm0, %xmm12
	jbe	LBB100_72
## %bb.61:                              ##   in Loop: Header=BB100_54 Depth=3
	movswl	%dx, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	ucomiss	%xmm0, %xmm3
	jbe	LBB100_72
## %bb.62:                              ##   in Loop: Header=BB100_54 Depth=3
	movswl	%si, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	ucomiss	%xmm3, %xmm0
	jbe	LBB100_72
## %bb.63:                              ##   in Loop: Header=BB100_54 Depth=3
	xorps	%xmm7, %xmm7
	cvtsi2ssl	%r8d, %xmm7
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ebx, %xmm1
	movswl	%r14w, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	cwtl
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%eax, %xmm4
	ucomiss	%xmm0, %xmm7
	jne	LBB100_65
	jp	LBB100_65
## %bb.64:                              ##   in Loop: Header=BB100_54 Depth=3
	ucomiss	%xmm4, %xmm1
	jne	LBB100_65
	jnp	LBB100_67
LBB100_65:                              ##   in Loop: Header=BB100_54 Depth=3
	xorps	%xmm13, %xmm13
	cvtsi2ssl	%r9d, %xmm13
	xorps	%xmm10, %xmm10
	cvtsi2ssl	%r11d, %xmm10
	ucomiss	%xmm13, %xmm0
	jne	LBB100_31
	jp	LBB100_31
## %bb.66:                              ##   in Loop: Header=BB100_54 Depth=3
	ucomiss	%xmm10, %xmm4
	jne	LBB100_31
	jp	LBB100_31
LBB100_67:                              ##   in Loop: Header=BB100_54 Depth=3
	cmpw	%bx, %r11w
	movl	%ebx, %eax
	cmovlel	%r11d, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	ucomiss	%xmm0, %xmm3
	jbe	LBB100_72
## %bb.68:                              ##   in Loop: Header=BB100_54 Depth=3
	cmpw	%bx, %r11w
	movl	%ebx, %eax
	cmovgel	%r11d, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	ucomiss	%xmm3, %xmm0
	jbe	LBB100_72
## %bb.69:                              ##   in Loop: Header=BB100_54 Depth=3
	movl	%r9d, %eax
	subl	%r8d, %eax
	cmovgl	%r8d, %r9d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r9d, %xmm0
	ucomiss	%xmm0, %xmm12
	jbe	LBB100_72
## %bb.70:                              ##   in Loop: Header=BB100_54 Depth=3
	xorl	%edx, %edx
	cmpw	%bx, %r11w
	setg	%dl
	movaps	%xmm3, %xmm0
	subss	%xmm1, %xmm0
	subl	%ebx, %r11d
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%r11d, %xmm1
	divss	%xmm1, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	addss	%xmm7, %xmm1
	ucomiss	%xmm1, %xmm12
	leal	-1(%rdx,%rdx), %eax
LBB100_71:                              ##   in Loop: Header=BB100_54 Depth=3
	movl	$0, %edx
	cmovbel	%edx, %eax
	addl	-80(%rbp), %eax         ## 4-byte Folded Reload
                                        ## kill: def $eax killed $eax def $rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB100_72:                              ##   in Loop: Header=BB100_54 Depth=3
	addq	$14, %rcx
	decq	%r10
	jne	LBB100_54
## %bb.73:                              ##   in Loop: Header=BB100_29 Depth=2
	movss	LCPI100_11(%rip), %xmm9 ## xmm9 = mem[0],zero,zero,zero
	movq	%r15, %rbx
	testl	%r15d, %r15d
	movaps	-160(%rbp), %xmm13      ## 16-byte Reload
	movaps	-144(%rbp), %xmm14      ## 16-byte Reload
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	movaps	-192(%rbp), %xmm8       ## 16-byte Reload
	xorps	%xmm12, %xmm12
	jle	LBB100_125
## %bb.74:                              ##   in Loop: Header=BB100_29 Depth=2
	movq	-368(%rbp), %r15        ## 8-byte Reload
	xorl	%r14d, %r14d
	movss	LCPI100_11(%rip), %xmm9 ## xmm9 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB100_75:                              ##   Parent Loop BB100_25 Depth=1
                                        ##     Parent Loop BB100_29 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movswl	14(%r15), %eax
	xorps	%xmm5, %xmm5
	cvtsi2ssl	%eax, %xmm5
	movswl	16(%r15), %eax
	xorps	%xmm7, %xmm7
	cvtsi2ssl	%eax, %xmm7
	mulss	%xmm13, %xmm5
	mulss	%xmm14, %xmm7
	movzbl	26(%r15), %eax
	cmpb	$3, %al
	je	LBB100_81
## %bb.76:                              ##   in Loop: Header=BB100_75 Depth=3
	cmpb	$2, %al
	jne	LBB100_124
## %bb.77:                              ##   in Loop: Header=BB100_75 Depth=3
	movss	(%rsi,%r14,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm12, %xmm0
	jne	LBB100_78
	jnp	LBB100_124
LBB100_78:                              ##   in Loop: Header=BB100_75 Depth=3
	testq	%r14, %r14
	je	LBB100_138
## %bb.79:                              ##   in Loop: Header=BB100_75 Depth=3
	movswl	(%r15), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm13, %xmm1
	movswl	2(%r15), %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	mulss	%xmm14, %xmm2
	movaps	%xmm6, %xmm3
	insertps	$16, %xmm5, %xmm3 ## xmm3 = xmm3[0],xmm5[0],xmm3[2,3]
	insertps	$16, %xmm1, %xmm5 ## xmm5 = xmm5[0],xmm1[0],xmm5[2,3]
	subps	%xmm3, %xmm5
	movshdup	%xmm5, %xmm1    ## xmm1 = xmm5[1,1,3,3]
	movaps	%xmm5, %xmm3
	mulss	%xmm5, %xmm3
	movaps	%xmm8, %xmm4
	insertps	$16, %xmm7, %xmm4 ## xmm4 = xmm4[0],xmm7[0],xmm4[2,3]
	insertps	$16, %xmm2, %xmm7 ## xmm7 = xmm7[0],xmm2[0],xmm7[2,3]
	subps	%xmm4, %xmm7
	movshdup	%xmm7, %xmm2    ## xmm2 = xmm7[1,1,3,3]
	movaps	%xmm7, %xmm4
	mulss	%xmm7, %xmm4
	addss	%xmm3, %xmm4
	movaps	%xmm9, %xmm3
	mulss	%xmm9, %xmm3
	movaps	%xmm5, %xmm12
	xorps	%xmm5, %xmm5
	sqrtss	%xmm4, %xmm5
	cmpltss	%xmm3, %xmm4
	andps	%xmm4, %xmm5
	andnps	%xmm9, %xmm4
	orps	%xmm5, %xmm4
	movaps	%xmm4, %xmm9
	movaps	%xmm7, %xmm3
	mulss	%xmm1, %xmm3
	movaps	%xmm12, %xmm5
	mulss	%xmm2, %xmm5
	subss	%xmm5, %xmm3
	andps	LCPI100_23(%rip), %xmm3
	mulss	%xmm3, %xmm0
	ucomiss	%xmm0, %xmm4
	jbe	LBB100_89
## %bb.80:                              ##   in Loop: Header=BB100_75 Depth=3
	mulps	%xmm1, %xmm12
	mulps	%xmm2, %xmm7
	addps	%xmm12, %xmm7
	movshdup	%xmm7, %xmm1    ## xmm1 = xmm7[1,1,3,3]
	xorps	LCPI100_0(%rip), %xmm7
	divss	%xmm1, %xmm7
	xorps	%xmm1, %xmm1
	cmpless	%xmm7, %xmm1
	cmpless	%xmm11, %xmm7
	andps	%xmm7, %xmm0
	andnps	%xmm9, %xmm7
	orps	%xmm0, %xmm7
	andps	%xmm1, %xmm7
	andnps	%xmm9, %xmm1
	orps	%xmm7, %xmm1
	movaps	%xmm1, %xmm9
	xorps	%xmm12, %xmm12
	jmp	LBB100_124
	.p2align	4, 0x90
LBB100_81:                              ##   in Loop: Header=BB100_75 Depth=3
	movswl	2(%r15), %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movswl	20(%r15), %eax
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%eax, %xmm4
	mulss	%xmm14, %xmm2
	mulss	%xmm14, %xmm4
	movaps	%xmm4, %xmm0
	maxss	%xmm7, %xmm0
	movaps	%xmm2, %xmm1
	maxss	%xmm0, %xmm1
	addss	%xmm9, %xmm1
	ucomiss	%xmm8, %xmm1
	jbe	LBB100_124
## %bb.82:                              ##   in Loop: Header=BB100_75 Depth=3
	movswl	(%r15), %eax
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	movswl	18(%r15), %eax
	xorps	%xmm15, %xmm15
	cvtsi2ssl	%eax, %xmm15
	mulss	%xmm13, %xmm3
	mulss	%xmm13, %xmm15
	movaps	%xmm5, %xmm0
	minss	%xmm15, %xmm0
	minss	%xmm3, %xmm0
	subss	%xmm9, %xmm0
	ucomiss	%xmm0, %xmm6
	jbe	LBB100_100
## %bb.83:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm15, %xmm0
	maxss	%xmm5, %xmm0
	movaps	%xmm3, %xmm1
	maxss	%xmm0, %xmm1
	addss	%xmm9, %xmm1
	ucomiss	%xmm6, %xmm1
	jbe	LBB100_100
## %bb.84:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm7, %xmm0
	minss	%xmm4, %xmm0
	minss	%xmm2, %xmm0
	subss	%xmm9, %xmm0
	ucomiss	%xmm0, %xmm8
	jbe	LBB100_100
## %bb.85:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm15, %xmm1
	addss	%xmm15, %xmm1
	movaps	%xmm5, %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm3, -60(%rbp)        ## 4-byte Spill
	addss	%xmm3, %xmm0
	movaps	%xmm4, %xmm1
	addss	%xmm4, %xmm1
	movaps	%xmm7, %xmm3
	subss	%xmm1, %xmm3
	movss	%xmm2, -44(%rbp)        ## 4-byte Spill
	addss	%xmm2, %xmm3
	movaps	%xmm6, %xmm2
	movaps	%xmm15, %xmm6
	insertps	$16, %xmm5, %xmm6 ## xmm6 = xmm6[0],xmm5[0],xmm6[2,3]
	movaps	%xmm5, %xmm1
	movaps	%xmm8, %xmm10
	movaps	%xmm2, %xmm8
	insertps	$16, %xmm2, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	subps	%xmm1, %xmm6
	movaps	%xmm4, -288(%rbp)       ## 16-byte Spill
	insertps	$16, %xmm7, %xmm4 ## xmm4 = xmm4[0],xmm7[0],xmm4[2,3]
	movaps	%xmm7, %xmm1
	insertps	$16, %xmm10, %xmm1 ## xmm1 = xmm1[0],xmm10[0],xmm1[2,3]
	movaps	%xmm4, %xmm10
	subps	%xmm1, %xmm10
	movaps	%xmm6, %xmm1
	mulss	%xmm0, %xmm1
	movaps	%xmm10, %xmm2
	mulss	%xmm3, %xmm2
	addss	%xmm1, %xmm2
	movss	(%rsi,%r14,4), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	mulss	LCPI100_12(%rip), %xmm2
	ucomiss	%xmm12, %xmm1
	movaps	%xmm7, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm15, -352(%rbp)      ## 16-byte Spill
	jne	LBB100_90
	jp	LBB100_90
## %bb.86:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm6, %xmm1
	mulss	%xmm6, %xmm1
	movaps	%xmm10, %xmm4
	mulss	%xmm10, %xmm4
	addss	%xmm1, %xmm4
	addss	%xmm4, %xmm4
	movshdup	%xmm6, %xmm1    ## xmm1 = xmm6[1,1,3,3]
	mulss	%xmm1, %xmm0
	movshdup	%xmm10, %xmm11  ## xmm11 = xmm10[1,1,3,3]
	mulss	%xmm11, %xmm3
	addss	%xmm0, %xmm3
	addss	%xmm4, %xmm3
	movaps	%xmm6, %xmm4
	mulss	%xmm6, %xmm1
	mulss	%xmm10, %xmm11
	addss	%xmm1, %xmm11
	ucomiss	%xmm12, %xmm2
	jne	LBB100_93
	jp	LBB100_93
## %bb.87:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm0, %xmm0
	ucomiss	%xmm0, %xmm3
	movaps	%xmm8, %xmm6
	jne	LBB100_88
	jnp	LBB100_97
LBB100_88:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm11, %xmm7
	xorps	LCPI100_0(%rip), %xmm7
	divss	%xmm3, %xmm7
	movl	$1, %eax
	xorps	%xmm1, %xmm1
	movaps	-192(%rbp), %xmm8       ## 16-byte Reload
	jmp	LBB100_106
LBB100_89:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm12, %xmm12
	jmp	LBB100_124
LBB100_100:                             ##   in Loop: Header=BB100_75 Depth=3
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	jmp	LBB100_124
LBB100_90:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm5, -464(%rbp)       ## 16-byte Spill
	mulss	%xmm1, %xmm2
	movaps	%xmm6, %xmm4
	insertps	$16, %xmm0, %xmm4 ## xmm4 = xmm4[0],xmm0[0],xmm4[2,3]
	mulps	%xmm6, %xmm4
	movaps	%xmm10, %xmm5
	insertps	$16, %xmm3, %xmm5 ## xmm5 = xmm5[0],xmm3[0],xmm5[2,3]
	mulps	%xmm10, %xmm5
	addps	%xmm4, %xmm5
	movshdup	%xmm5, %xmm0    ## xmm0 = xmm5[1,1,3,3]
	addss	%xmm5, %xmm5
	addss	%xmm0, %xmm5
	mulss	%xmm1, %xmm5
	movshdup	%xmm6, %xmm0    ## xmm0 = xmm6[1,1,3,3]
	movaps	%xmm6, -448(%rbp)       ## 16-byte Spill
	mulss	%xmm6, %xmm0
	movshdup	%xmm10, %xmm3   ## xmm3 = xmm10[1,1,3,3]
	mulss	%xmm10, %xmm3
	addss	%xmm0, %xmm3
	mulss	%xmm1, %xmm3
	movaps	%xmm2, %xmm6
	movss	LCPI100_13(%rip), %xmm4 ## xmm4 = mem[0],zero,zero,zero
	movaps	%xmm4, %xmm8
	divss	%xmm4, %xmm6
	movaps	%xmm2, %xmm0
	mulss	%xmm2, %xmm0
	divss	%xmm4, %xmm0
	addss	%xmm5, %xmm0
	movaps	%xmm2, %xmm1
	addss	%xmm2, %xmm1
	mulss	%xmm2, %xmm1
	mulss	LCPI100_14(%rip), %xmm5
	addss	%xmm1, %xmm5
	mulss	%xmm2, %xmm5
	movss	LCPI100_15(%rip), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm1, %xmm4
	divss	%xmm1, %xmm5
	addss	%xmm3, %xmm5
	movaps	%xmm0, %xmm1
	mulss	%xmm0, %xmm1
	mulss	%xmm0, %xmm1
	movaps	%xmm5, %xmm3
	mulss	%xmm5, %xmm3
	movaps	%xmm1, %xmm2
	mulss	LCPI100_16(%rip), %xmm2
	divss	%xmm4, %xmm2
	addss	%xmm3, %xmm2
	ucomiss	%xmm12, %xmm2
	movaps	%xmm9, -480(%rbp)       ## 16-byte Spill
	movaps	%xmm10, -432(%rbp)      ## 16-byte Spill
	movaps	%xmm6, -416(%rbp)       ## 16-byte Spill
	jae	LBB100_95
## %bb.91:                              ##   in Loop: Header=BB100_75 Depth=3
	divss	%xmm8, %xmm0
	sqrtss	%xmm0, %xmm0
	movss	%xmm0, -336(%rbp)       ## 4-byte Spill
	movss	LCPI100_18(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	sqrtsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm5, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	LCPI100_19(%rip), %xmm0
	callq	_acos
	cvtsd2ss	%xmm0, %xmm0
	divss	LCPI100_12(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -384(%rbp)       ## 8-byte Spill
	callq	_cos
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -320(%rbp)       ## 4-byte Spill
	movsd	-384(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	LCPI100_20(%rip), %xmm0
	callq	_cos
	movaps	-432(%rbp), %xmm10      ## 16-byte Reload
	movaps	-480(%rbp), %xmm9       ## 16-byte Reload
	movaps	-176(%rbp), %xmm6       ## 16-byte Reload
	movaps	-192(%rbp), %xmm1       ## 16-byte Reload
	xorps	%xmm12, %xmm12
	movaps	%xmm1, %xmm8
	movaps	-144(%rbp), %xmm14      ## 16-byte Reload
	movaps	-160(%rbp), %xmm13      ## 16-byte Reload
	cvtsd2ss	%xmm0, %xmm0
	mulss	LCPI100_21(%rip), %xmm0
	movss	-336(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm1, %xmm2
	addss	%xmm1, %xmm2
	movss	-320(%rbp), %xmm7       ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	mulss	%xmm7, %xmm2
	movaps	-416(%rbp), %xmm5       ## 16-byte Reload
	addss	%xmm5, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm7, %xmm3
	mulss	%xmm1, %xmm3
	movaps	%xmm1, %xmm4
	movaps	%xmm5, %xmm1
	subss	%xmm3, %xmm1
	subss	%xmm0, %xmm7
	mulss	%xmm4, %xmm7
	subss	%xmm7, %xmm5
	movaps	%xmm5, %xmm0
	movl	$3, %eax
	movaps	%xmm2, %xmm7
	movaps	-464(%rbp), %xmm5       ## 16-byte Reload
	movaps	-448(%rbp), %xmm4       ## 16-byte Reload
	jmp	LBB100_106
LBB100_93:                              ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm3, %xmm0
	mulss	%xmm3, %xmm0
	movaps	%xmm2, %xmm1
	mulss	LCPI100_22(%rip), %xmm1
	mulss	%xmm1, %xmm11
	addss	%xmm0, %xmm11
	xorl	%eax, %eax
	xorps	%xmm0, %xmm0
	ucomiss	%xmm11, %xmm0
	movaps	%xmm8, %xmm6
	ja	LBB100_98
## %bb.94:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm1, %xmm1
	sqrtss	%xmm11, %xmm1
	movaps	%xmm3, %xmm7
	xorps	LCPI100_0(%rip), %xmm7
	subss	%xmm1, %xmm7
	addss	%xmm2, %xmm2
	divss	%xmm2, %xmm7
	subss	%xmm3, %xmm1
	divss	%xmm2, %xmm1
	movl	$2, %eax
	movaps	-192(%rbp), %xmm8       ## 16-byte Reload
	jmp	LBB100_106
LBB100_95:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm1, %xmm1
	sqrtss	%xmm2, %xmm1
	movaps	%xmm1, %xmm0
	subss	%xmm5, %xmm0
	movaps	LCPI100_0(%rip), %xmm3  ## xmm3 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorps	%xmm3, %xmm5
	movss	LCPI100_2(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm5
	mulss	%xmm2, %xmm5
	movaps	%xmm5, -336(%rbp)       ## 16-byte Spill
	ucomiss	%xmm0, %xmm12
	jbe	LBB100_101
## %bb.96:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm3, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	LCPI100_17(%rip), %xmm1 ## xmm1 = mem[0],zero
	callq	_pow
	movaps	LCPI100_0(%rip), %xmm1  ## xmm1 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	cvtsd2ss	%xmm0, %xmm0
	xorps	%xmm1, %xmm0
	jmp	LBB100_102
LBB100_97:                              ##   in Loop: Header=BB100_75 Depth=3
	xorl	%eax, %eax
LBB100_98:                              ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm1, %xmm1
	xorps	%xmm7, %xmm7
	movaps	-192(%rbp), %xmm8       ## 16-byte Reload
	jmp	LBB100_106
LBB100_101:                             ##   in Loop: Header=BB100_75 Depth=3
	cvtss2sd	%xmm0, %xmm0
	movsd	LCPI100_17(%rip), %xmm1 ## xmm1 = mem[0],zero
	callq	_pow
	movaps	LCPI100_0(%rip), %xmm1  ## xmm1 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	cvtsd2ss	%xmm0, %xmm0
LBB100_102:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm0, -320(%rbp)       ## 16-byte Spill
	xorps	%xmm0, %xmm0
	movaps	-336(%rbp), %xmm2       ## 16-byte Reload
	ucomiss	%xmm2, %xmm0
	jbe	LBB100_104
## %bb.103:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm1, %xmm2
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	movsd	LCPI100_17(%rip), %xmm1 ## xmm1 = mem[0],zero
	callq	_pow
	movaps	LCPI100_0(%rip), %xmm10 ## xmm10 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	cvtsd2ss	%xmm0, %xmm0
	xorps	%xmm10, %xmm0
	jmp	LBB100_105
LBB100_104:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	movsd	LCPI100_17(%rip), %xmm1 ## xmm1 = mem[0],zero
	callq	_pow
	cvtsd2ss	%xmm0, %xmm0
LBB100_105:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	-416(%rbp), %xmm7       ## 16-byte Reload
	addss	-320(%rbp), %xmm7       ## 16-byte Folded Reload
	addss	%xmm0, %xmm7
	movl	$1, %eax
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	movaps	-160(%rbp), %xmm13      ## 16-byte Reload
	movaps	-144(%rbp), %xmm14      ## 16-byte Reload
	xorps	%xmm12, %xmm12
	movaps	-192(%rbp), %xmm8       ## 16-byte Reload
	movaps	-176(%rbp), %xmm6       ## 16-byte Reload
	movaps	-480(%rbp), %xmm9       ## 16-byte Reload
	movaps	-464(%rbp), %xmm5       ## 16-byte Reload
	movaps	-448(%rbp), %xmm4       ## 16-byte Reload
	movaps	-432(%rbp), %xmm10      ## 16-byte Reload
LBB100_106:                             ##   in Loop: Header=BB100_75 Depth=3
	movshdup	%xmm4, %xmm2    ## xmm2 = xmm4[1,1,3,3]
	mulss	%xmm2, %xmm2
	movshdup	%xmm10, %xmm3   ## xmm3 = xmm10[1,1,3,3]
	mulss	%xmm3, %xmm3
	addss	%xmm2, %xmm3
	movaps	%xmm9, %xmm2
	mulss	%xmm9, %xmm2
	xorps	%xmm4, %xmm4
	sqrtss	%xmm3, %xmm4
	cmpltss	%xmm2, %xmm3
	andps	%xmm3, %xmm4
	andnps	%xmm9, %xmm3
	orps	%xmm4, %xmm3
	movaps	%xmm3, %xmm9
	testl	%eax, %eax
	je	LBB100_121
## %bb.107:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm8, %xmm10
	movaps	%xmm6, %xmm8
	ucomiss	%xmm12, %xmm7
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	jb	LBB100_122
## %bb.108:                             ##   in Loop: Header=BB100_75 Depth=3
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	ucomiss	%xmm7, %xmm11
	movaps	-272(%rbp), %xmm12      ## 16-byte Reload
	jb	LBB100_111
## %bb.109:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm11, %xmm2
	subss	%xmm7, %xmm2
	movaps	%xmm7, %xmm3
	addss	%xmm7, %xmm3
	mulss	%xmm2, %xmm3
	mulss	%xmm2, %xmm2
	movaps	%xmm5, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm7, %xmm6
	movaps	%xmm5, %xmm7
	movaps	-352(%rbp), %xmm5       ## 16-byte Reload
	mulss	%xmm3, %xmm5
	addss	%xmm4, %xmm5
	mulss	%xmm6, %xmm6
	movss	-60(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	mulss	%xmm6, %xmm4
	addss	%xmm5, %xmm4
	movaps	%xmm7, %xmm5
	mulss	%xmm12, %xmm2
	mulss	-288(%rbp), %xmm3       ## 16-byte Folded Reload
	addss	%xmm2, %xmm3
	mulss	-44(%rbp), %xmm6        ## 4-byte Folded Reload
	addss	%xmm3, %xmm6
	subss	%xmm8, %xmm4
	mulss	%xmm4, %xmm4
	subss	%xmm10, %xmm6
	mulss	%xmm6, %xmm6
	addss	%xmm4, %xmm6
	movaps	%xmm9, %xmm2
	mulss	%xmm9, %xmm2
	ucomiss	%xmm6, %xmm2
	jbe	LBB100_111
## %bb.110:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm9, %xmm9
	sqrtss	%xmm6, %xmm9
LBB100_111:                             ##   in Loop: Header=BB100_75 Depth=3
	cmpl	$2, %eax
	jb	LBB100_123
LBB100_112:                             ##   in Loop: Header=BB100_75 Depth=3
	ucomiss	LCPI100_25(%rip), %xmm1
	jb	LBB100_116
## %bb.113:                             ##   in Loop: Header=BB100_75 Depth=3
	ucomiss	%xmm1, %xmm11
	jb	LBB100_116
## %bb.114:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm11, %xmm2
	subss	%xmm1, %xmm2
	movaps	%xmm1, %xmm3
	addss	%xmm1, %xmm3
	mulss	%xmm2, %xmm3
	mulss	%xmm2, %xmm2
	movaps	%xmm5, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm5, %xmm7
	movaps	-352(%rbp), %xmm5       ## 16-byte Reload
	mulss	%xmm3, %xmm5
	addss	%xmm4, %xmm5
	mulss	%xmm1, %xmm1
	movss	-60(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm4
	addss	%xmm5, %xmm4
	movaps	%xmm7, %xmm5
	mulss	%xmm12, %xmm2
	mulss	-288(%rbp), %xmm3       ## 16-byte Folded Reload
	addss	%xmm2, %xmm3
	mulss	-44(%rbp), %xmm1        ## 4-byte Folded Reload
	addss	%xmm3, %xmm1
	subss	%xmm8, %xmm4
	mulss	%xmm4, %xmm4
	subss	%xmm10, %xmm1
	mulss	%xmm1, %xmm1
	addss	%xmm4, %xmm1
	movaps	%xmm9, %xmm2
	mulss	%xmm9, %xmm2
	ucomiss	%xmm1, %xmm2
	jbe	LBB100_116
## %bb.115:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm9, %xmm9
	sqrtss	%xmm1, %xmm9
LBB100_116:                             ##   in Loop: Header=BB100_75 Depth=3
	cmpl	$3, %eax
	jne	LBB100_123
## %bb.117:                             ##   in Loop: Header=BB100_75 Depth=3
	ucomiss	LCPI100_25(%rip), %xmm0
	jb	LBB100_123
## %bb.118:                             ##   in Loop: Header=BB100_75 Depth=3
	ucomiss	%xmm0, %xmm11
	jb	LBB100_123
## %bb.119:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	%xmm11, %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	addss	%xmm0, %xmm2
	mulss	%xmm1, %xmm2
	mulss	%xmm1, %xmm1
	mulss	%xmm1, %xmm5
	movaps	-352(%rbp), %xmm6       ## 16-byte Reload
	mulss	%xmm2, %xmm6
	addss	%xmm5, %xmm6
	mulss	%xmm0, %xmm0
	movss	-60(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm4
	addss	%xmm6, %xmm4
	mulss	%xmm1, %xmm12
	movaps	-288(%rbp), %xmm3       ## 16-byte Reload
	mulss	%xmm2, %xmm3
	addss	%xmm12, %xmm3
	movss	-44(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm1
	addss	%xmm3, %xmm1
	movaps	%xmm8, %xmm6
	subss	%xmm8, %xmm4
	mulss	%xmm4, %xmm4
	movaps	%xmm10, %xmm8
	subss	%xmm10, %xmm1
	mulss	%xmm1, %xmm1
	addss	%xmm4, %xmm1
	movaps	%xmm9, %xmm0
	mulss	%xmm9, %xmm0
	ucomiss	%xmm1, %xmm0
	xorps	%xmm12, %xmm12
	jbe	LBB100_124
## %bb.120:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm9, %xmm9
	sqrtss	%xmm1, %xmm9
	jmp	LBB100_124
LBB100_121:                             ##   in Loop: Header=BB100_75 Depth=3
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	jmp	LBB100_124
LBB100_122:                             ##   in Loop: Header=BB100_75 Depth=3
	movaps	-272(%rbp), %xmm12      ## 16-byte Reload
	movss	LCPI100_1(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	cmpl	$2, %eax
	jae	LBB100_112
LBB100_123:                             ##   in Loop: Header=BB100_75 Depth=3
	xorps	%xmm12, %xmm12
	movaps	%xmm8, %xmm6
	movaps	%xmm10, %xmm8
	.p2align	4, 0x90
LBB100_124:                             ##   in Loop: Header=BB100_75 Depth=3
	incq	%r14
	addq	$14, %r15
	cmpq	%r13, %r14
	jl	LBB100_75
LBB100_125:                             ##   in Loop: Header=BB100_29 Depth=2
	cmpl	$0, -80(%rbp)           ## 4-byte Folded Reload
	jne	LBB100_127
## %bb.126:                             ##   in Loop: Header=BB100_29 Depth=2
	xorps	LCPI100_0(%rip), %xmm9
LBB100_127:                             ##   in Loop: Header=BB100_29 Depth=2
	movq	-200(%rbp), %r14        ## 8-byte Reload
	movq	%rbx, %r15
	movss	-56(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
LBB100_128:                             ##   in Loop: Header=BB100_29 Depth=2
	mulss	%xmm1, %xmm9
	addss	-220(%rbp), %xmm9       ## 4-byte Folded Reload
	xorps	%xmm0, %xmm0
	ucomiss	%xmm9, %xmm0
	ja	LBB100_131
## %bb.129:                             ##   in Loop: Header=BB100_29 Depth=2
	ucomiss	LCPI100_24(%rip), %xmm9
	movaps	%xmm9, %xmm0
	jbe	LBB100_131
## %bb.130:                             ##   in Loop: Header=BB100_29 Depth=2
	movss	LCPI100_24(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
LBB100_131:                             ##   in Loop: Header=BB100_29 Depth=2
	cvttss2si	%xmm0, %eax
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	leal	(%rcx,%r12), %ecx
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
	incq	%r12
	cmpq	-392(%rbp), %r12        ## 8-byte Folded Reload
	jl	LBB100_29
LBB100_132:                             ##   in Loop: Header=BB100_25 Depth=1
	movl	-52(%rbp), %eax         ## 4-byte Reload
	incl	%eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	cmpl	-96(%rbp), %eax         ## 4-byte Folded Reload
	movq	-112(%rbp), %r12        ## 8-byte Reload
	jl	LBB100_25
## %bb.133:
	movq	-296(%rbp), %rbx        ## 8-byte Reload
	jmp	LBB100_136
LBB100_135:
	movq	-88(%rbp), %rbx
LBB100_136:
	movq	%rsi, %rdi
	callq	_free
	movq	%rbx, %rdi
	callq	_free
	movq	-200(%rbp), %rax        ## 8-byte Reload
LBB100_137:
	addq	$440, %rsp              ## imm = 0x1B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB100_138:
	leaq	L___func__.stbtt_GetGlyphSDF(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.7(%rip), %rcx
	movl	$4659, %edx             ## imm = 0x1233
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetCodepointSDF  ## -- Begin function stbtt_GetCodepointSDF
	.p2align	4, 0x90
_stbtt_GetCodepointSDF:                 ## @stbtt_GetCodepointSDF
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r15
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movl	%ecx, %r12d
	movl	%edx, %r13d
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, %rbx
	callq	_stbtt_FindGlyphIndex
	movq	%rbx, %rdi
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movl	%eax, %esi
	movl	%r13d, %edx
	movl	%r12d, %ecx
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_stbtt_GetGlyphSDF      ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_FreeSDF          ## -- Begin function stbtt_FreeSDF
	.p2align	4, 0x90
_stbtt_FreeSDF:                         ## @stbtt_FreeSDF
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetFontNameString ## -- Begin function stbtt_GetFontNameString
	.p2align	4, 0x90
_stbtt_GetFontNameString:               ## @stbtt_GetFontNameString
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	8(%rdi), %r10
	movl	16(%rdi), %edi
	movzbl	4(%r10,%rdi), %eax
	shlq	$8, %rax
	movzbl	5(%r10,%rdi), %r11d
	orq	%rax, %r11
	testl	%r11d, %r11d
	je	LBB103_7
## %bb.1:
	addl	$12, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB103_2:                               ## =>This Inner Loop Header: Depth=1
	movl	%edi, %edi
	cmpb	$110, (%r10,%rdi)
	jne	LBB103_6
## %bb.3:                               ##   in Loop: Header=BB103_2 Depth=1
	cmpb	$97, 1(%r10,%rdi)
	jne	LBB103_6
## %bb.4:                               ##   in Loop: Header=BB103_2 Depth=1
	cmpb	$109, 2(%r10,%rdi)
	jne	LBB103_6
## %bb.5:                               ##   in Loop: Header=BB103_2 Depth=1
	cmpb	$101, 3(%r10,%rdi)
	je	LBB103_9
	.p2align	4, 0x90
LBB103_6:                               ##   in Loop: Header=BB103_2 Depth=1
	incq	%rbx
	addl	$16, %edi
	cmpq	%r11, %rbx
	jb	LBB103_2
	jmp	LBB103_8
LBB103_9:
	movzbl	8(%r10,%rdi), %eax
	shlq	$24, %rax
	movzbl	9(%r10,%rdi), %ebx
	shlq	$16, %rbx
	orq	%rax, %rbx
	movzbl	10(%r10,%rdi), %eax
	shlq	$8, %rax
	orq	%rbx, %rax
	movzbl	11(%r10,%rdi), %edi
	orq	%rax, %rdi
	testl	%edi, %edi
	je	LBB103_7
## %bb.10:
	movzbl	2(%r10,%rdi), %eax
	shlq	$8, %rax
	movzbl	3(%r10,%rdi), %r11d
	orq	%rax, %r11
	testl	%r11d, %r11d
	je	LBB103_7
## %bb.11:
	movzbl	4(%r10,%rdi), %eax
	shll	$8, %eax
	movzbl	5(%r10,%rdi), %r14d
	orl	%eax, %r14d
	addl	%edi, %r14d
	leal	6(%rdi), %r12d
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB103_12:                              ## =>This Inner Loop Header: Depth=1
	movl	%r12d, %r12d
	movzbl	(%r10,%r12), %ebx
	shll	$8, %ebx
	movzbl	1(%r10,%r12), %edi
	orl	%ebx, %edi
	cmpl	%edx, %edi
	jne	LBB103_16
## %bb.13:                              ##   in Loop: Header=BB103_12 Depth=1
	movzbl	2(%r10,%r12), %edi
	shll	$8, %edi
	movzbl	3(%r10,%r12), %ebx
	orl	%edi, %ebx
	cmpl	%ecx, %ebx
	jne	LBB103_16
## %bb.14:                              ##   in Loop: Header=BB103_12 Depth=1
	movzbl	4(%r10,%r12), %edi
	shll	$8, %edi
	movzbl	5(%r10,%r12), %ebx
	orl	%edi, %ebx
	cmpl	%r8d, %ebx
	jne	LBB103_16
## %bb.15:                              ##   in Loop: Header=BB103_12 Depth=1
	movzbl	6(%r10,%r12), %edi
	shll	$8, %edi
	movzbl	7(%r10,%r12), %ebx
	orl	%edi, %ebx
	cmpl	%r9d, %ebx
	je	LBB103_19
	.p2align	4, 0x90
LBB103_16:                              ##   in Loop: Header=BB103_12 Depth=1
	incq	%r15
	addl	$12, %r12d
	cmpq	%r11, %r15
	jb	LBB103_12
	jmp	LBB103_8
LBB103_7:
	xorl	%eax, %eax
LBB103_8:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB103_19:
	movzbl	8(%r10,%r12), %eax
	shll	$8, %eax
	movzbl	9(%r10,%r12), %ecx
	orl	%eax, %ecx
	movl	%ecx, (%rsi)
	movslq	%r14d, %rcx
	addq	%r10, %rcx
	movzbl	10(%r10,%r12), %edx
	shlq	$8, %rdx
	movzbl	11(%r10,%r12), %eax
	orq	%rdx, %rax
	addq	%rcx, %rax
	jmp	LBB103_8
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_BakeFontBitmap   ## -- Begin function stbtt_BakeFontBitmap
	.p2align	4, 0x90
_stbtt_BakeFontBitmap:                  ## @stbtt_BakeFontBitmap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$264, %rsp              ## imm = 0x108
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movl	%r8d, -52(%rbp)         ## 4-byte Spill
	movl	%ecx, %r14d
	movq	%rdx, %r13
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	%esi, %edx
	movq	%rdi, %rsi
	movq	$0, -304(%rbp)
	leaq	-304(%rbp), %rdi
	callq	_stbtt_InitFont
	testl	%eax, %eax
	je	LBB104_1
## %bb.2:
	movl	16(%rbp), %r15d
	movl	-52(%rbp), %eax         ## 4-byte Reload
	movl	%r14d, -76(%rbp)        ## 4-byte Spill
	imull	%r14d, %eax
	movslq	%eax, %rsi
	movq	%r13, %rdi
	callq	___bzero
	testl	%r15d, %r15d
	jle	LBB104_3
## %bb.4:
	movq	%r13, -128(%rbp)        ## 8-byte Spill
	movq	-296(%rbp), %rax
	movslq	-268(%rbp), %rcx
	movzbl	4(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%rax,%rcx), %esi
	movswl	%dx, %edx
	orl	%esi, %edx
	movzbl	6(%rax,%rcx), %esi
	shll	$8, %esi
	movzbl	7(%rax,%rcx), %eax
	movswl	%si, %ecx
	orl	%eax, %ecx
	subl	%ecx, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movq	24(%rbp), %rdx
	movss	-44(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	%xmm1, -44(%rbp)        ## 4-byte Spill
	movslq	%r15d, %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movl	%ebx, %eax
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	leaq	-304(%rbp), %r14
	movl	$1, %r15d
	movl	$1, %ecx
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movl	$1, %r13d
	.p2align	4, 0x90
LBB104_5:                               ## =>This Inner Loop Header: Depth=1
	movq	%rdx, -144(%rbp)        ## 8-byte Spill
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	leal	(%rcx,%rax), %esi
	movq	%r14, %rdi
	callq	_stbtt_FindGlyphIndex
	movl	%eax, %r12d
	movq	-296(%rbp), %rax
	movslq	-268(%rbp), %rcx
	movzbl	34(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	35(%rax,%rcx), %ecx
	orl	%edx, %ecx
	movslq	-264(%rbp), %rdx
	addq	%rax, %rdx
	leal	(,%r12,4), %eax
	cmpl	%ecx, %r12d
	leal	-4(,%rcx,4), %ecx
	cmovll	%eax, %ecx
	movslq	%ecx, %rax
	movzwl	(%rax,%rdx), %eax
	movw	%ax, -48(%rbp)          ## 2-byte Spill
	movl	$0, -60(%rbp)
	movl	$0, -56(%rbp)
	movq	%r14, %rdi
	movl	%r12d, %esi
	leaq	-60(%rbp), %rdx
	leaq	-56(%rbp), %rcx
	leaq	-100(%rbp), %r8
	leaq	-96(%rbp), %r9
	callq	_stbtt_GetGlyphBox
	movl	$0, %edi
	movl	$0, %ebx
	movl	$0, %edx
	movl	$0, %ecx
	testl	%eax, %eax
	je	LBB104_7
## %bb.6:                               ##   in Loop: Header=BB104_5 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-60(%rbp), %xmm0
	movss	-44(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	xorps	%xmm2, %xmm2
	addss	%xmm2, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %edi
	xorl	%eax, %eax
	subl	-96(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %ebx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-100(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %edx
	xorl	%eax, %eax
	subl	-56(%rbp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %ecx
LBB104_7:                               ##   in Loop: Header=BB104_5 Depth=1
	subl	%edi, %edx
	subl	%ebx, %ecx
	leal	1(%r15,%rdx), %eax
	movl	-76(%rbp), %r8d         ## 4-byte Reload
	cmpl	%r8d, %eax
	movl	%r13d, -92(%rbp)        ## 4-byte Spill
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	cmovgel	%r13d, %esi
	movl	$1, %eax
	cmovgel	%eax, %r15d
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	leal	1(%rsi,%rcx), %eax
	cmpl	-52(%rbp), %eax         ## 4-byte Folded Reload
	jge	LBB104_10
## %bb.8:                               ##   in Loop: Header=BB104_5 Depth=1
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movl	%ebx, -84(%rbp)         ## 4-byte Spill
	movl	%edi, -88(%rbp)         ## 4-byte Spill
	movq	%r12, %r9
	leal	(%r15,%rdx), %r12d
	cmpl	%r8d, %r12d
	jge	LBB104_9
## %bb.11:                              ##   in Loop: Header=BB104_5 Depth=1
	movq	%r14, %rdi
	movzwl	-48(%rbp), %r13d        ## 2-byte Folded Reload
	rolw	$8, %r13w
	movq	-72(%rbp), %r14         ## 8-byte Reload
	leal	(%r14,%rcx), %eax
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	movslq	%r15d, %rbx
	movq	-128(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rbx), %rax
	movl	%r14d, %esi
	imull	%r8d, %esi
	movslq	%esi, %rsi
	addq	%rax, %rsi
	xorps	%xmm2, %xmm2
	xorps	%xmm3, %xmm3
                                        ## kill: def $edx killed $edx killed $rdx
                                        ## kill: def $ecx killed $ecx killed $rcx
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
                                        ## kill: def $r9d killed $r9d killed $r9
	callq	_stbtt_MakeGlyphBitmapSubpixel
	movq	-144(%rbp), %rdx        ## 8-byte Reload
	movw	%bx, (%rdx)
	movw	%r14w, 2(%rdx)
	movw	%r12w, 4(%rdx)
	movl	-48(%rbp), %ecx         ## 4-byte Reload
	movw	%cx, 6(%rdx)
	movswl	%r13w, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	-44(%rbp), %xmm0        ## 4-byte Folded Reload
	movss	%xmm0, 16(%rdx)
	movl	-88(%rbp), %eax         ## 4-byte Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, 8(%rdx)
	movl	-84(%rbp), %eax         ## 4-byte Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	incl	%r12d
	movl	-92(%rbp), %r13d        ## 4-byte Reload
	cmpl	%r13d, %ecx
	cmovgel	-80(%rbp), %r13d        ## 4-byte Folded Reload
	movss	%xmm0, 12(%rdx)
	movq	-112(%rbp), %rax        ## 8-byte Reload
	incq	%rax
	addq	$20, %rdx
	movl	%r12d, %r15d
	leaq	-304(%rbp), %r14
	cmpq	-120(%rbp), %rax        ## 8-byte Folded Reload
	jl	LBB104_5
	jmp	LBB104_12
LBB104_1:
	movl	$-1, %r13d
	jmp	LBB104_12
LBB104_3:
	movl	$1, %r13d
	jmp	LBB104_12
LBB104_10:
	movq	-112(%rbp), %rax        ## 8-byte Reload
	negl	%eax
	movl	%eax, %r13d
LBB104_12:
	movl	%r13d, %eax
	addq	$264, %rsp              ## imm = 0x108
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB104_9:
	leaq	L___func__.stbtt_BakeFontBitmap_internal(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.121(%rip), %rcx
	movl	$3842, %edx             ## imm = 0xF02
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_GetNumberOfFonts ## -- Begin function stbtt_GetNumberOfFonts
	.p2align	4, 0x90
_stbtt_GetNumberOfFonts:                ## @stbtt_GetNumberOfFonts
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	_stbtt__isfont
	movl	%eax, %ecx
	movl	$1, %eax
	testl	%ecx, %ecx
	jne	LBB105_8
## %bb.1:
	xorl	%eax, %eax
	cmpb	$116, (%rbx)
	jne	LBB105_8
## %bb.2:
	cmpb	$116, 1(%rbx)
	jne	LBB105_8
## %bb.3:
	cmpb	$99, 2(%rbx)
	jne	LBB105_8
## %bb.4:
	cmpb	$102, 3(%rbx)
	jne	LBB105_8
## %bb.5:
	movl	4(%rbx), %ecx
	bswapl	%ecx
	cmpl	$131072, %ecx           ## imm = 0x20000
	je	LBB105_7
## %bb.6:
	cmpl	$65536, %ecx            ## imm = 0x10000
	jne	LBB105_8
LBB105_7:
	movl	8(%rbx), %eax
	bswapl	%eax
LBB105_8:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_FindMatchingFont ## -- Begin function stbtt_FindMatchingFont
	.p2align	4, 0x90
_stbtt_FindMatchingFont:                ## @stbtt_FindMatchingFont
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movq	%rsi, %rbx
	movq	%rdi, %r15
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	callq	_stbtt_GetFontOffsetForIndex
	movl	%eax, %r12d
	testl	%eax, %eax
	js	LBB106_31
## %bb.1:
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, %rdi
	callq	_strlen
	movq	%rax, %rcx
	movl	%r14d, -52(%rbp)        ## 4-byte Spill
	andl	$7, %r14d
	movl	%r14d, -68(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB106_2:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB106_7 Depth 2
                                        ##     Child Loop BB106_17 Depth 2
	movl	%r12d, %ebx
	addq	%r15, %rbx
	movq	%rbx, %rdi
	movq	%rcx, %r14
	callq	_stbtt__isfont
	testl	%eax, %eax
	je	LBB106_30
## %bb.3:                               ##   in Loop: Header=BB106_2 Depth=1
	movq	%r14, %rcx
	movzbl	4(%rbx), %edi
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	je	LBB106_4
## %bb.5:                               ##   in Loop: Header=BB106_2 Depth=1
	movl	%edi, %eax
	shlq	$8, %rax
	movzbl	5(%rbx), %edi
	orq	%rax, %rdi
	leal	12(%r12), %eax
	testl	%edi, %edi
	je	LBB106_13
## %bb.6:                               ##   in Loop: Header=BB106_2 Depth=1
	movl	%eax, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB106_7:                               ##   Parent Loop BB106_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%edx, %edx
	cmpb	$104, (%r15,%rdx)
	jne	LBB106_12
## %bb.8:                               ##   in Loop: Header=BB106_7 Depth=2
	cmpb	$101, 1(%r15,%rdx)
	jne	LBB106_12
## %bb.9:                               ##   in Loop: Header=BB106_7 Depth=2
	cmpb	$97, 2(%r15,%rdx)
	jne	LBB106_12
## %bb.10:                              ##   in Loop: Header=BB106_7 Depth=2
	cmpb	$100, 3(%r15,%rdx)
	je	LBB106_11
	.p2align	4, 0x90
LBB106_12:                              ##   in Loop: Header=BB106_7 Depth=2
	incq	%rsi
	addl	$16, %edx
	cmpq	%rdi, %rsi
	jb	LBB106_7
LBB106_13:                              ##   in Loop: Header=BB106_2 Depth=1
	xorl	%edx, %edx
LBB106_14:                              ##   in Loop: Header=BB106_2 Depth=1
	movzbl	45(%r15,%rdx), %edx
	andl	$7, %edx
	cmpl	%edx, -68(%rbp)         ## 4-byte Folded Reload
	jne	LBB106_30
## %bb.15:                              ##   in Loop: Header=BB106_2 Depth=1
	testl	%edi, %edi
	jne	LBB106_16
	jmp	LBB106_30
	.p2align	4, 0x90
LBB106_4:                               ##   in Loop: Header=BB106_2 Depth=1
	movzbl	5(%rbx), %eax
	shll	$8, %edi
	orl	%eax, %edi
	leal	12(%r12), %eax
	testl	%edi, %edi
	je	LBB106_30
LBB106_16:                              ##   in Loop: Header=BB106_2 Depth=1
	movl	%edi, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB106_17:                              ##   Parent Loop BB106_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%eax, %eax
	cmpb	$110, (%r15,%rax)
	jne	LBB106_21
## %bb.18:                              ##   in Loop: Header=BB106_17 Depth=2
	cmpb	$97, 1(%r15,%rax)
	jne	LBB106_21
## %bb.19:                              ##   in Loop: Header=BB106_17 Depth=2
	cmpb	$109, 2(%r15,%rax)
	jne	LBB106_21
## %bb.20:                              ##   in Loop: Header=BB106_17 Depth=2
	cmpb	$101, 3(%r15,%rax)
	je	LBB106_22
	.p2align	4, 0x90
LBB106_21:                              ##   in Loop: Header=BB106_17 Depth=2
	incq	%rdx
	addl	$16, %eax
	cmpq	%rsi, %rdx
	jb	LBB106_17
LBB106_30:                              ##   in Loop: Header=BB106_2 Depth=1
	incl	%r13d
	movq	%r15, %rdi
	movl	%r13d, %esi
	callq	_stbtt_GetFontOffsetForIndex
	movq	%r14, %rcx
	movl	%eax, %r12d
	testl	%eax, %eax
	jns	LBB106_2
	jmp	LBB106_31
LBB106_22:                              ##   in Loop: Header=BB106_2 Depth=1
	movl	8(%r15,%rax), %ebx
	bswapl	%ebx
	testl	%ebx, %ebx
	je	LBB106_30
## %bb.23:                              ##   in Loop: Header=BB106_2 Depth=1
	cmpl	$0, -52(%rbp)           ## 4-byte Folded Reload
	movq	%r14, -64(%rbp)         ## 8-byte Spill
	movq	%r15, %rdi
	movl	%ebx, %esi
	je	LBB106_26
## %bb.24:                              ##   in Loop: Header=BB106_2 Depth=1
	movq	-48(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	$16, %r8d
	movl	$-1, %r9d
	callq	_stbtt__matchpair
	testl	%eax, %eax
	jne	LBB106_31
## %bb.25:                              ##   in Loop: Header=BB106_2 Depth=1
	movq	%r15, %rdi
	movl	%ebx, %esi
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	$1, %r8d
	movl	$-1, %r9d
	jmp	LBB106_28
LBB106_11:                              ##   in Loop: Header=BB106_2 Depth=1
	movzbl	8(%r15,%rdx), %esi
	shlq	$24, %rsi
	movzbl	9(%r15,%rdx), %ebx
	shlq	$16, %rbx
	orq	%rsi, %rbx
	movzbl	10(%r15,%rdx), %esi
	shlq	$8, %rsi
	orq	%rbx, %rsi
	movzbl	11(%r15,%rdx), %edx
	orq	%rsi, %rdx
	jmp	LBB106_14
LBB106_26:                              ##   in Loop: Header=BB106_2 Depth=1
	movq	-48(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	$16, %r8d
	movl	$17, %r9d
	callq	_stbtt__matchpair
	testl	%eax, %eax
	jne	LBB106_31
## %bb.27:                              ##   in Loop: Header=BB106_2 Depth=1
	movq	%r15, %rdi
	movl	%ebx, %esi
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	$1, %r8d
	movl	$2, %r9d
LBB106_28:                              ##   in Loop: Header=BB106_2 Depth=1
	callq	_stbtt__matchpair
	testl	%eax, %eax
	jne	LBB106_31
## %bb.29:                              ##   in Loop: Header=BB106_2 Depth=1
	movq	%r15, %rdi
	movl	%ebx, %esi
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	$3, %r8d
	movl	$-1, %r9d
	callq	_stbtt__matchpair
	testl	%eax, %eax
	je	LBB106_30
LBB106_31:
	movl	%r12d, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stbtt_CompareUTF8toUTF16_bigendian ## -- Begin function stbtt_CompareUTF8toUTF16_bigendian
	.p2align	4, 0x90
_stbtt_CompareUTF8toUTF16_bigendian:    ## @stbtt_CompareUTF8toUTF16_bigendian
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%esi, %ebx
	callq	_stbtt__CompareUTF8toUTF16_bigendian_prefix
	xorl	%ecx, %ecx
	cmpl	%ebx, %eax
	sete	%cl
	movl	%ecx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_load_image             ## -- Begin function load_image
	.p2align	4, 0x90
_load_image:                            ## @load_image
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	leaq	L_.str(%rip), %rsi
	movq	%r15, %rdi
	callq	_fopen
	testq	%rax, %rax
	je	LBB108_1
## %bb.3:
	movq	%rax, %r12
	leaq	-44(%rbp), %rsi
	leaq	-40(%rbp), %rdx
	leaq	-36(%rbp), %rcx
	movq	%rax, %rdi
	movl	$4, %r8d
	callq	_stbi_load_from_file
	movq	%rax, %rbx
	movq	%r12, %rdi
	callq	_fclose
	testq	%rbx, %rbx
	je	LBB108_2
## %bb.4:
	movl	-36(%rbp), %eax
	addl	$-3, %eax
	cmpl	$2, %eax
	jae	LBB108_13
## %bb.5:
	movl	-44(%rbp), %ecx
	movl	%ecx, (%r14)
	movl	-40(%rbp), %edx
	movl	%edx, 4(%r14)
	movl	%ecx, 8(%r14)
	movq	%rbx, 16(%r14)
	testl	%edx, %edx
	jle	LBB108_12
## %bb.6:
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB108_7:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB108_9 Depth 2
	testl	%ecx, %ecx
	jle	LBB108_11
## %bb.8:                               ##   in Loop: Header=BB108_7 Depth=1
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB108_9:                               ##   Parent Loop BB108_7 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%rbx), %ecx
	bswapl	%ecx
	movl	%ecx, (%rbx)
	addq	$4, %rbx
	incl	%edx
	movl	(%r14), %ecx
	cmpl	%ecx, %edx
	jl	LBB108_9
## %bb.10:                              ##   in Loop: Header=BB108_7 Depth=1
	movl	4(%r14), %edx
LBB108_11:                              ##   in Loop: Header=BB108_7 Depth=1
	incl	%eax
	cmpl	%edx, %eax
	jl	LBB108_7
LBB108_12:
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB108_1:
	leaq	L_.str.1(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB108_2:
	leaq	L_.str.9(%rip), %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_printf
	leaq	L___func__.load_image(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$36, %edx
	callq	___assert_rtn
LBB108_13:
	leaq	L___func__.load_image(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.11(%rip), %rcx
	movl	$38, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_load_entire_file       ## -- Begin function load_entire_file
	.p2align	4, 0x90
_load_entire_file:                      ## @load_entire_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	leaq	L_.str.12(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB109_9
## %bb.1:
	movq	%rax, %r15
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	_fseek
	movq	%r15, %rdi
	callq	_ftell
	movq	%rax, %r12
	movq	%r15, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_fseek
	leaq	1(%r12), %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB109_10
## %bb.2:
	movq	%rax, %r14
	movl	$1, %esi
	movq	%rax, %rdi
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	_fread
	movb	$0, (%r14,%r12)
	movq	%r15, %rdi
	callq	_fclose
	testq	%r12, %r12
	jle	LBB109_8
## %bb.3:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB109_4:                               ## =>This Inner Loop Header: Depth=1
	cmpb	$13, (%r14,%rax)
	jne	LBB109_6
## %bb.5:                               ##   in Loop: Header=BB109_4 Depth=1
	leaq	(%r14,%rax), %rdi
	movq	%r12, %rdx
	subq	%rax, %rdx
	leaq	1(%rdi), %rsi
	callq	_memmove
	decq	%r12
	jmp	LBB109_7
	.p2align	4, 0x90
LBB109_6:                               ##   in Loop: Header=BB109_4 Depth=1
	incl	%ebx
LBB109_7:                               ##   in Loop: Header=BB109_4 Depth=1
	movslq	%ebx, %rax
	cmpq	%rax, %r12
	jg	LBB109_4
LBB109_8:
	movq	%r14, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB109_9:
	leaq	L_.str.13(%rip), %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	_printf
	leaq	L___func__.load_entire_file(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.14(%rip), %rcx
	movl	$69, %edx
	callq	___assert_rtn
LBB109_10:
	leaq	L___func__.load_entire_file(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.15(%rip), %rcx
	movl	$76, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_lerp                   ## -- Begin function lerp
	.p2align	4, 0x90
_lerp:                                  ## @lerp
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subss	%xmm0, %xmm2
	mulss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_image_buffer           ## -- Begin function image_buffer
	.p2align	4, 0x90
_image_buffer:                          ## @image_buffer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movl	%r8d, (%rdi)
	movl	%r9d, 4(%rdi)
	movl	8(%rsi), %edi
	movl	%edi, 8(%rax)
	imull	%edi, %ecx
	movslq	%ecx, %rcx
	shlq	$2, %rcx
	addq	16(%rsi), %rcx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,4), %rcx
	movq	%rcx, 16(%rax)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function compute_color_from_src
LCPI112_0:
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
LCPI112_1:
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
LCPI112_2:
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
LCPI112_3:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_compute_color_from_src
	.p2align	4, 0x90
_compute_color_from_src:                ## @compute_color_from_src
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movd	%edi, %xmm3
	psrld	%xmm3, %xmm1
	movdqa	LCPI112_0(%rip), %xmm4  ## xmm4 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	pand	%xmm4, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	movaps	LCPI112_1(%rip), %xmm5  ## xmm5 = [3.92156886E-3,3.92156886E-3,3.92156886E-3,3.92156886E-3]
	mulps	%xmm5, %xmm1
	psrld	%xmm3, %xmm0
	pand	%xmm4, %xmm0
	cvtdq2ps	%xmm0, %xmm0
	mulps	%xmm5, %xmm0
	subps	%xmm0, %xmm1
	mulps	%xmm2, %xmm1
	addps	%xmm0, %xmm1
	mulps	LCPI112_2(%rip), %xmm1
	addps	LCPI112_3(%rip), %xmm1
	cvttps2dq	%xmm1, %xmm0
	pslld	%xmm3, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function draw_img
LCPI113_0:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI113_1:
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
LCPI113_2:
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
LCPI113_3:
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
LCPI113_4:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
LCPI113_5:
	.byte	2                       ## 0x2
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	6                       ## 0x6
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	10                      ## 0xa
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	14                      ## 0xe
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI113_6:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_draw_img
	.p2align	4, 0x90
_draw_img:                              ## @draw_img
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %eax
	subl	%edx, %eax
	je	LBB113_10
## %bb.1:
	movl	%r9d, %r14d
	subl	%ecx, %r14d
	je	LBB113_10
## %bb.2:
	xorl	%r11d, %r11d
	testl	%edx, %edx
	movl	$0, %r10d
	cmovnsl	%edx, %r10d
	testl	%ecx, %ecx
	cmovnsl	%ecx, %r11d
	movl	(%rdi), %ebx
	movl	4(%rdi), %r15d
	cmpl	%r8d, %ebx
	cmovlel	%ebx, %r8d
	cmpl	%r9d, %r15d
	cmovlel	%r15d, %r9d
	movl	%r8d, %ebx
	subl	%r10d, %ebx
	testb	$3, %bl
	jne	LBB113_11
## %bb.3:
	cmpl	%r9d, %r11d
	jge	LBB113_10
## %bb.4:
	cvtsi2ssl	%edx, %xmm6
	cvtsi2ssl	%ecx, %xmm1
	movss	%xmm1, -32(%rbp)        ## 4-byte Spill
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	cvtsi2ssl	%r14d, %xmm2
	movss	LCPI113_0(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	movaps	%xmm3, %xmm9
	divss	%xmm1, %xmm9
	divss	%xmm2, %xmm3
	movss	%xmm3, -28(%rbp)        ## 4-byte Spill
	shufps	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movl	8(%rdi), %eax
	movl	%eax, %ecx
	imull	%r11d, %ecx
	movslq	%ecx, %rcx
	shlq	$2, %rcx
	addq	16(%rdi), %rcx
	movl	%r10d, %edx
	leaq	(%rcx,%rdx,4), %r14
	shufps	$0, %xmm9, %xmm9        ## xmm9 = xmm9[0,0,0,0]
	shufps	$0, %xmm6, %xmm6        ## xmm6 = xmm6[0,0,0,0]
	movaps	LCPI113_1(%rip), %xmm7  ## xmm7 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	movaps	LCPI113_2(%rip), %xmm12 ## xmm12 = [3.92156886E-3,3.92156886E-3,3.92156886E-3,3.92156886E-3]
	movaps	LCPI113_3(%rip), %xmm10 ## xmm10 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	movaps	LCPI113_4(%rip), %xmm11 ## xmm11 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	movdqa	LCPI113_5(%rip), %xmm13 ## xmm13 = [2,255,255,255,6,255,255,255,10,255,255,255,14,255,255,255]
	movdqa	LCPI113_6(%rip), %xmm14 ## xmm14 = [1,255,255,255,5,255,255,255,9,255,255,255,13,255,255,255]
	.p2align	4, 0x90
LBB113_5:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB113_7 Depth 2
	cmpl	%r10d, %r8d
	jle	LBB113_9
## %bb.6:                               ##   in Loop: Header=BB113_5 Depth=1
	cvtsi2ssl	%r11d, %xmm15
	subss	-32(%rbp), %xmm15       ## 4-byte Folded Reload
	mulss	-28(%rbp), %xmm15       ## 4-byte Folded Reload
	movq	%r14, %r15
	movl	%r10d, %eax
	.p2align	4, 0x90
LBB113_7:                               ##   Parent Loop BB113_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	1(%rax), %ebx
	leal	2(%rax), %ecx
	movd	%eax, %xmm1
	xorps	%xmm3, %xmm3
	cvtsi2ssl	4(%rsi), %xmm3
	pinsrd	$1, %ebx, %xmm1
	pinsrd	$2, %ecx, %xmm1
	xorps	%xmm4, %xmm4
	cvtsi2ssl	(%rsi), %xmm4
	leal	3(%rax), %ecx
	pinsrd	$3, %ecx, %xmm1
	mulss	%xmm15, %xmm3
	movq	16(%rsi), %rcx
	cvtdq2ps	%xmm1, %xmm1
	cvttss2si	%xmm3, %ebx
	subps	%xmm6, %xmm1
	mulps	%xmm9, %xmm1
	imull	8(%rsi), %ebx
	shufps	$0, %xmm4, %xmm4        ## xmm4 = xmm4[0,0,0,0]
	mulps	%xmm1, %xmm4
	cvttps2dq	%xmm4, %xmm1
	movd	%ebx, %xmm3
	pshufd	$0, %xmm3, %xmm3        ## xmm3 = xmm3[0,0,0,0]
	paddd	%xmm1, %xmm3
	movd	%xmm3, %ebx
	movslq	%ebx, %rbx
	movl	(%rcx,%rbx,4), %ebx
	pextrd	$1, %xmm3, %edx
	movl	%ebx, -48(%rbp)
	movslq	%edx, %rdx
	movl	(%rcx,%rdx,4), %edx
	pextrd	$2, %xmm3, %ebx
	movl	%edx, -44(%rbp)
	movslq	%ebx, %rdx
	movl	(%rcx,%rdx,4), %edx
	movl	%edx, -40(%rbp)
	pextrd	$3, %xmm3, %edx
	movslq	%edx, %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, -36(%rbp)
	movaps	%xmm9, %xmm2
	movaps	-48(%rbp), %xmm9
	movdqu	(%r15), %xmm8
	movaps	%xmm9, %xmm1
	andps	%xmm7, %xmm1
	cvtdq2ps	%xmm1, %xmm4
	movaps	%xmm9, %xmm1
	psrld	$24, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	mulps	%xmm12, %xmm4
	mulps	%xmm12, %xmm1
	movdqa	%xmm8, %xmm3
	psrld	$24, %xmm3
	cvtdq2ps	%xmm3, %xmm3
	mulps	%xmm0, %xmm4
	mulps	%xmm12, %xmm3
	subps	%xmm3, %xmm1
	mulps	%xmm4, %xmm1
	movaps	%xmm9, %xmm5
	addps	%xmm3, %xmm1
	pshufb	%xmm13, %xmm5
	cvtdq2ps	%xmm5, %xmm3
	mulps	%xmm12, %xmm3
	movdqa	%xmm8, %xmm5
	mulps	%xmm10, %xmm1
	pshufb	%xmm13, %xmm5
	cvtdq2ps	%xmm5, %xmm5
	mulps	%xmm12, %xmm5
	addps	%xmm11, %xmm1
	subps	%xmm5, %xmm3
	mulps	%xmm4, %xmm3
	addps	%xmm5, %xmm3
	cvttps2dq	%xmm1, %xmm1
	mulps	%xmm10, %xmm3
	addps	%xmm11, %xmm3
	pshufb	%xmm14, %xmm9
	cvttps2dq	%xmm3, %xmm3
	cvtdq2ps	%xmm9, %xmm5
	movaps	%xmm2, %xmm9
	mulps	%xmm12, %xmm5
	pshufb	%xmm14, %xmm8
	pslld	$24, %xmm1
	movaps	%xmm7, %xmm2
	cvtdq2ps	%xmm8, %xmm7
	mulps	%xmm12, %xmm7
	subps	%xmm7, %xmm5
	pslld	$16, %xmm3
	mulps	%xmm4, %xmm5
	addps	%xmm7, %xmm5
	movaps	%xmm2, %xmm7
	mulps	%xmm10, %xmm5
	por	%xmm1, %xmm3
	addps	%xmm11, %xmm5
	cvttps2dq	%xmm5, %xmm1
	pslld	$8, %xmm1
	por	%xmm3, %xmm1
	movdqu	%xmm1, (%r15)
	addq	$16, %r15
	addl	$4, %eax
	cmpl	%r8d, %eax
	jl	LBB113_7
## %bb.8:                               ##   in Loop: Header=BB113_5 Depth=1
	movl	8(%rdi), %eax
LBB113_9:                               ##   in Loop: Header=BB113_5 Depth=1
	movslq	%eax, %rdx
	leaq	(%r14,%rdx,4), %r14
	incl	%r11d
	cmpl	%r9d, %r11d
	jl	LBB113_5
LBB113_10:
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB113_11:
	leaq	L___func__.draw_img(%rip), %rdi
	leaq	L_.str.16(%rip), %rsi
	leaq	L_.str.17(%rip), %rcx
	movl	$83, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function draw_rect
LCPI114_0:
	.long	1065353216              ## float 1
LCPI114_7:
	.long	1132396544              ## float 255
LCPI114_8:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI114_1:
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
LCPI114_2:
	.byte	2                       ## 0x2
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	6                       ## 0x6
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	10                      ## 0xa
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	14                      ## 0xe
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI114_3:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI114_4:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
LCPI114_5:
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
LCPI114_6:
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_draw_rect
	.p2align	4, 0x90
_draw_rect:                             ## @draw_rect
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $ecx killed $ecx def $rcx
                                        ## kill: def $esi killed $esi def $rsi
	movl	(%rdi), %r10d
	cmpl	%esi, %r10d
	jl	LBB114_11
## %bb.1:
	movl	4(%rdi), %eax
	cmpl	%edx, %eax
	jl	LBB114_11
## %bb.2:
	xorl	%r9d, %r9d
	testl	%esi, %esi
	cmovsl	%r9d, %esi
	testl	%edx, %edx
	cmovnsl	%edx, %r9d
	cmpl	%ecx, %r10d
	movl	%ecx, %r12d
	cmovlel	%r10d, %r12d
	cmpl	%r8d, %eax
	cmovlel	%eax, %r8d
	cmpl	%r8d, %r9d
	jge	LBB114_11
## %bb.3:
	movaps	%xmm1, %xmm9
	movl	8(%rdi), %eax
	movl	%eax, %edx
	imull	%r9d, %edx
	movslq	%edx, %rdx
	shlq	$2, %rdx
	addq	16(%rdi), %rdx
	movl	%esi, %ebx
	leaq	(%rdx,%rbx,4), %r13
	movss	LCPI114_0(%rip), %xmm10 ## xmm10 = mem[0],zero,zero,zero
	subss	%xmm3, %xmm10
	mulss	%xmm3, %xmm0
	mulss	%xmm3, %xmm9
	cmpl	%ecx, %r10d
	cmovlel	%r10d, %ecx
	mulss	%xmm3, %xmm2
	movl	%esi, %edx
	notl	%edx
	leal	(%rcx,%rdx), %r10d
	incq	%r10
	leal	1(%rcx,%rdx), %r11d
	andl	$3, %r11d
	movq	%r10, %r15
	subq	%r11, %r15
	leal	(%r15,%rsi), %ecx
	movl	%ecx, -44(%rbp)         ## 4-byte Spill
	movaps	%xmm10, %xmm12
	shufps	$0, %xmm10, %xmm12      ## xmm12 = xmm12[0,0],xmm10[0,0]
	movaps	%xmm0, %xmm3
	shufps	$0, %xmm0, %xmm3        ## xmm3 = xmm3[0,0],xmm0[0,0]
	movaps	%xmm9, %xmm8
	shufps	$0, %xmm9, %xmm8        ## xmm8 = xmm8[0,0],xmm9[0,0]
	movaps	%xmm2, %xmm5
	shufps	$0, %xmm2, %xmm5        ## xmm5 = xmm5[0,0],xmm2[0,0]
	movss	LCPI114_7(%rip), %xmm7  ## xmm7 = mem[0],zero,zero,zero
	movss	LCPI114_8(%rip), %xmm15 ## xmm15 = mem[0],zero,zero,zero
	movaps	LCPI114_1(%rip), %xmm11 ## xmm11 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	movaps	LCPI114_4(%rip), %xmm13 ## xmm13 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	movaps	LCPI114_5(%rip), %xmm14 ## xmm14 = [2.14748365E+9,2.14748365E+9,2.14748365E+9,2.14748365E+9]
	movaps	%xmm2, -96(%rbp)        ## 16-byte Spill
	movaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	movaps	%xmm3, -128(%rbp)       ## 16-byte Spill
	movaps	%xmm9, -64(%rbp)        ## 16-byte Spill
	movaps	%xmm8, -112(%rbp)       ## 16-byte Spill
	movaps	LCPI114_6(%rip), %xmm1  ## xmm1 = [2147483648,2147483648,2147483648,2147483648]
	.p2align	4, 0x90
LBB114_4:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB114_7 Depth 2
                                        ##     Child Loop BB114_12 Depth 2
	cmpl	%r12d, %esi
	jge	LBB114_10
## %bb.5:                               ##   in Loop: Header=BB114_4 Depth=1
	movl	%esi, %ecx
	movq	%r13, %rax
	cmpq	$3, %r10
	jbe	LBB114_12
## %bb.6:                               ##   in Loop: Header=BB114_4 Depth=1
	leaq	(%r13,%r15,4), %rax
	xorl	%ecx, %ecx
	movaps	%xmm13, %xmm6
	.p2align	4, 0x90
LBB114_7:                               ##   Parent Loop BB114_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r13,%rcx,4), %xmm4
	movdqa	%xmm4, %xmm0
	psrld	$24, %xmm0
	cvtdq2ps	%xmm0, %xmm0
	divps	%xmm11, %xmm0
	movdqa	%xmm4, %xmm3
	pshufb	LCPI114_2(%rip), %xmm3  ## xmm3 = xmm3[2],zero,zero,zero,xmm3[6],zero,zero,zero,xmm3[10],zero,zero,zero,xmm3[14],zero,zero,zero
	cvtdq2ps	%xmm3, %xmm8
	divps	%xmm11, %xmm8
	pshufb	LCPI114_3(%rip), %xmm4  ## xmm4 = xmm4[1],zero,zero,zero,xmm4[5],zero,zero,zero,xmm4[9],zero,zero,zero,xmm4[13],zero,zero,zero
	cvtdq2ps	%xmm4, %xmm13
	divps	%xmm11, %xmm13
	mulps	%xmm12, %xmm0
	addps	-128(%rbp), %xmm0       ## 16-byte Folded Reload
	mulps	%xmm12, %xmm8
	addps	-112(%rbp), %xmm8       ## 16-byte Folded Reload
	mulps	%xmm12, %xmm13
	addps	%xmm5, %xmm13
	mulps	%xmm11, %xmm0
	addps	%xmm6, %xmm0
	movaps	%xmm0, %xmm9
	cmpltps	%xmm14, %xmm9
	cvttps2dq	%xmm0, %xmm3
	subps	%xmm14, %xmm0
	cvttps2dq	%xmm0, %xmm4
	xorps	%xmm1, %xmm4
	movaps	%xmm9, %xmm0
	blendvps	%xmm0, %xmm3, %xmm4
	pslld	$24, %xmm4
	mulps	%xmm11, %xmm8
	addps	%xmm6, %xmm8
	movaps	%xmm8, %xmm0
	cmpltps	%xmm14, %xmm0
	cvttps2dq	%xmm8, %xmm3
	subps	%xmm14, %xmm8
	cvttps2dq	%xmm8, %xmm2
	xorps	%xmm1, %xmm2
	blendvps	%xmm0, %xmm3, %xmm2
	pslld	$16, %xmm2
	por	%xmm4, %xmm2
	mulps	%xmm11, %xmm13
	addps	%xmm6, %xmm13
	movaps	%xmm13, %xmm0
	cmpltps	%xmm14, %xmm0
	cvttps2dq	%xmm13, %xmm3
	subps	%xmm14, %xmm13
	cvttps2dq	%xmm13, %xmm4
	xorps	%xmm1, %xmm4
	blendvps	%xmm0, %xmm3, %xmm4
	pslld	$8, %xmm4
	por	%xmm2, %xmm4
	movdqu	%xmm4, (%r13,%rcx,4)
	addq	$4, %rcx
	cmpq	%rcx, %r15
	jne	LBB114_7
## %bb.8:                               ##   in Loop: Header=BB114_4 Depth=1
	movl	-44(%rbp), %ecx         ## 4-byte Reload
	testl	%r11d, %r11d
	movaps	-96(%rbp), %xmm2        ## 16-byte Reload
	movaps	-64(%rbp), %xmm9        ## 16-byte Reload
	movaps	-80(%rbp), %xmm0        ## 16-byte Reload
	movaps	%xmm6, %xmm13
	je	LBB114_9
	.p2align	4, 0x90
LBB114_12:                              ##   Parent Loop BB114_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%rax), %ebx
	movl	%ebx, %edx
	shrl	$24, %edx
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%edx, %xmm4
	movl	%ebx, %edx
	movzbl	%bh, %ebx
	divss	%xmm7, %xmm4
	shrl	$16, %edx
	movzbl	%dl, %edx
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%edx, %xmm3
	divss	%xmm7, %xmm3
	xorps	%xmm6, %xmm6
	cvtsi2ssl	%ebx, %xmm6
	divss	%xmm7, %xmm6
	mulss	%xmm10, %xmm4
	addss	%xmm0, %xmm4
	mulss	%xmm10, %xmm3
	addss	%xmm9, %xmm3
	mulss	%xmm10, %xmm6
	addss	%xmm2, %xmm6
	mulss	%xmm7, %xmm4
	addss	%xmm15, %xmm4
	cvttss2si	%xmm4, %rdx
	shll	$24, %edx
	mulss	%xmm7, %xmm3
	addss	%xmm15, %xmm3
	cvttss2si	%xmm3, %rbx
	mulss	%xmm7, %xmm6
	addss	%xmm15, %xmm6
	cvttss2si	%xmm6, %r14
	shll	$16, %ebx
	shll	$8, %r14d
	orl	%edx, %r14d
	orl	%ebx, %r14d
	movl	%r14d, (%rax)
	addq	$4, %rax
	incl	%ecx
	cmpl	%r12d, %ecx
	jl	LBB114_12
LBB114_9:                               ##   in Loop: Header=BB114_4 Depth=1
	movl	8(%rdi), %eax
LBB114_10:                              ##   in Loop: Header=BB114_4 Depth=1
	movslq	%eax, %rcx
	leaq	(%r13,%rcx,4), %r13
	incl	%r9d
	cmpl	%r8d, %r9d
	jl	LBB114_4
LBB114_11:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_draw_rect_outline      ## -- Begin function draw_rect_outline
	.p2align	4, 0x90
_draw_rect_outline:                     ## @draw_rect_outline
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movss	%xmm3, -56(%rbp)        ## 4-byte Spill
	movss	%xmm2, -52(%rbp)        ## 4-byte Spill
	movss	%xmm1, -48(%rbp)        ## 4-byte Spill
	movss	%xmm0, -44(%rbp)        ## 4-byte Spill
	movl	%r9d, %r13d
	movl	%r8d, -60(%rbp)         ## 4-byte Spill
	movl	%ecx, %r15d
	movl	%edx, %r12d
	movl	%esi, %r14d
	movq	%rdi, %rbx
	leal	(%r13,%r14), %ecx
	callq	_draw_rect
	leal	(%r13,%r12), %r8d
	movq	%rbx, %rdi
	movl	%r14d, %esi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	callq	_draw_rect
	movl	-60(%rbp), %r8d         ## 4-byte Reload
	movl	%r8d, %edx
	subl	%r13d, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	movl	%r15d, %ecx
	movl	%r8d, %r14d
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	callq	_draw_rect
	movl	%r15d, %esi
	subl	%r13d, %esi
	movq	%rbx, %rdi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movl	%r14d, %r8d
	movss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_draw_rect              ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function compute_color
LCPI116_0:
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
LCPI116_1:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_compute_color
	.p2align	4, 0x90
_compute_color:                         ## @compute_color
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movd	%edi, %xmm3
	psrld	%xmm3, %xmm0
	pand	LCPI116_0(%rip), %xmm0
	cvtdq2ps	%xmm0, %xmm0
	movaps	%xmm0, %xmm4
	mulps	%xmm1, %xmm4
	subps	%xmm4, %xmm0
	mulps	%xmm1, %xmm2
	addps	%xmm0, %xmm2
	addps	LCPI116_1(%rip), %xmm2
	cvttps2dq	%xmm2, %xmm0
	pslld	%xmm3, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function draw_char
LCPI117_0:
	.long	1132396544              ## float 255
LCPI117_5:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI117_1:
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
	.long	998277249               ## float 0.00392156886
LCPI117_2:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
LCPI117_3:
	.byte	2                       ## 0x2
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	6                       ## 0x6
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	10                      ## 0xa
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	14                      ## 0xe
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI117_4:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_draw_char
	.p2align	4, 0x90
_draw_char:                             ## @draw_char
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $edx killed $edx def $rdx
                                        ## kill: def $esi killed $esi def $rsi
	movl	4(%rdi), %eax
	cmpl	%ecx, %eax
	jl	LBB117_12
## %bb.1:
	movl	(%rdi), %ebx
	cmpl	%edx, %ebx
	jl	LBB117_12
## %bb.2:
	movl	%ecx, %r10d
	leal	-32(%rsi), %r11d
	movslq	_font_advance_x(%rip), %r9
	leal	(%r9,%rdx), %ecx
	xorl	%r14d, %r14d
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %r8d
	cmovel	%r14d, %r8d
	addl	%r10d, %r8d
	cmpl	$95, %r11d
	jb	LBB117_3
## %bb.13:
	movss	LCPI117_5(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	movl	%edx, %esi
	movl	%r10d, %edx
	movaps	%xmm0, %xmm2
	movaps	%xmm0, %xmm3
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_draw_rect              ## TAILCALL
LBB117_3:
	testb	$3, %r9b
	jne	LBB117_14
## %bb.4:
	xorl	%r14d, %r14d
	testl	%edx, %edx
	movl	$0, %r11d
	cmovnsl	%edx, %r11d
	testl	%r10d, %r10d
	cmovnsl	%r10d, %r14d
	cmpl	%ebx, %ecx
	cmovgl	%ebx, %ecx
	cmpl	%eax, %r8d
	cmovgl	%eax, %r8d
	movl	%ecx, %eax
	subl	%r11d, %eax
	testb	$3, %al
	jne	LBB117_12
## %bb.5:
	cmpl	%r8d, %r14d
	jge	LBB117_12
## %bb.6:
	movss	LCPI117_0(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm0
	mulss	%xmm3, %xmm1
	mulss	%xmm3, %xmm2
	shufps	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	shufps	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	shufps	$0, %xmm2, %xmm2        ## xmm2 = xmm2[0,0,0,0]
	movslq	%esi, %rax
	leaq	_font_bitmaps(%rip), %rsi
	movl	%r11d, %ebx
	subl	%edx, %ebx
	movl	%r14d, %edx
	subl	%r10d, %edx
	imull	%r9d, %edx
	addl	%ebx, %edx
	movslq	%edx, %rdx
	addq	(%rsi,%rax,8), %rdx
	movl	8(%rdi), %r10d
	movl	%r10d, %eax
	imull	%r14d, %eax
	cltq
	shlq	$2, %rax
	addq	16(%rdi), %rax
	movl	%r11d, %r15d
	leaq	(%rax,%r15,4), %rax
	movaps	LCPI117_1(%rip), %xmm8  ## xmm8 = [3.92156886E-3,3.92156886E-3,3.92156886E-3,3.92156886E-3]
	movaps	LCPI117_2(%rip), %xmm11 ## xmm11 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	movdqa	LCPI117_3(%rip), %xmm9  ## xmm9 = [2,255,255,255,6,255,255,255,10,255,255,255,14,255,255,255]
	movdqa	LCPI117_4(%rip), %xmm10 ## xmm10 = [1,255,255,255,5,255,255,255,9,255,255,255,13,255,255,255]
	.p2align	4, 0x90
LBB117_7:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB117_9 Depth 2
	cmpl	%r11d, %ecx
	jle	LBB117_11
## %bb.8:                               ##   in Loop: Header=BB117_7 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB117_9:                               ##   Parent Loop BB117_7 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx,%rbx), %esi
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%esi, %xmm4
	movzbl	1(%rdx,%rbx), %esi
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%esi, %xmm3
	insertps	$16, %xmm3, %xmm4 ## xmm4 = xmm4[0],xmm3[0],xmm4[2,3]
	movzbl	2(%rdx,%rbx), %esi
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%esi, %xmm3
	insertps	$32, %xmm3, %xmm4 ## xmm4 = xmm4[0,1],xmm3[0],xmm4[3]
	movzbl	3(%rdx,%rbx), %esi
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%esi, %xmm3
	insertps	$48, %xmm3, %xmm4 ## xmm4 = xmm4[0,1,2],xmm3[0]
	mulps	%xmm8, %xmm4
	movdqu	(%rax,%rbx,4), %xmm5
	movdqa	%xmm5, %xmm3
	psrld	$24, %xmm3
	cvtdq2ps	%xmm3, %xmm3
	movaps	%xmm4, %xmm7
	mulps	%xmm3, %xmm7
	subps	%xmm7, %xmm3
	movaps	%xmm0, %xmm7
	mulps	%xmm4, %xmm7
	addps	%xmm3, %xmm7
	addps	%xmm11, %xmm7
	cvttps2dq	%xmm7, %xmm3
	pslld	$24, %xmm3
	movdqa	%xmm5, %xmm7
	pshufb	%xmm9, %xmm7
	cvtdq2ps	%xmm7, %xmm7
	movaps	%xmm4, %xmm6
	mulps	%xmm7, %xmm6
	subps	%xmm6, %xmm7
	movaps	%xmm1, %xmm6
	mulps	%xmm4, %xmm6
	addps	%xmm7, %xmm6
	addps	%xmm11, %xmm6
	cvttps2dq	%xmm6, %xmm6
	pslld	$16, %xmm6
	por	%xmm3, %xmm6
	pshufb	%xmm10, %xmm5
	cvtdq2ps	%xmm5, %xmm3
	movaps	%xmm2, %xmm5
	mulps	%xmm4, %xmm5
	mulps	%xmm3, %xmm4
	subps	%xmm4, %xmm3
	addps	%xmm5, %xmm3
	addps	%xmm11, %xmm3
	cvttps2dq	%xmm3, %xmm3
	pslld	$8, %xmm3
	por	%xmm6, %xmm3
	movdqu	%xmm3, (%rax,%rbx,4)
	addq	$4, %rbx
	leal	(%rbx,%r15), %esi
	cmpl	%ecx, %esi
	jl	LBB117_9
## %bb.10:                              ##   in Loop: Header=BB117_7 Depth=1
	movl	8(%rdi), %r10d
LBB117_11:                              ##   in Loop: Header=BB117_7 Depth=1
	addq	%r9, %rdx
	movslq	%r10d, %rbx
	leaq	(%rax,%rbx,4), %rax
	incl	%r14d
	cmpl	%r8d, %r14d
	jl	LBB117_7
LBB117_12:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB117_14:
	leaq	L___func__.draw_char(%rip), %rdi
	leaq	L_.str.16(%rip), %rsi
	leaq	L_.str.17(%rip), %rcx
	movl	$269, %edx              ## imm = 0x10D
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	__draw_text             ## -- Begin function _draw_text
	.p2align	4, 0x90
__draw_text:                            ## @_draw_text
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movss	%xmm2, -40(%rbp)        ## 4-byte Spill
	movss	%xmm1, -36(%rbp)        ## 4-byte Spill
	movss	%xmm0, -32(%rbp)        ## 4-byte Spill
	xorl	%eax, %eax
	cmpl	%ecx, 4(%rdi)
	jl	LBB118_7
## %bb.1:
	movq	%rdi, %r14
	cmpl	%edx, (%rdi)
	jl	LBB118_7
## %bb.2:
	movq	%rsi, %rbx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	cvttss2si	%xmm0, %r15d
	movss	%xmm1, -44(%rbp)        ## 4-byte Spill
	jmp	LBB118_3
	.p2align	4, 0x90
LBB118_9:                               ##   in Loop: Header=BB118_3 Depth=1
	movl	%r15d, %ecx
	movss	-32(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	movss	-28(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm1
	incq	%rbx
LBB118_3:                               ## =>This Inner Loop Header: Depth=1
	movsbl	(%rbx), %esi
	cmpl	$9, %esi
	movss	%xmm1, -28(%rbp)        ## 4-byte Spill
	je	LBB118_10
## %bb.4:                               ##   in Loop: Header=BB118_3 Depth=1
	testb	%sil, %sil
	je	LBB118_6
## %bb.5:                               ##   in Loop: Header=BB118_3 Depth=1
	cmpb	$10, %sil
	je	LBB118_6
## %bb.8:                               ##   in Loop: Header=BB118_3 Depth=1
	cvttss2si	%xmm1, %edx
	movq	%r14, %rdi
	jmp	LBB118_9
	.p2align	4, 0x90
LBB118_10:                              ##   in Loop: Header=BB118_3 Depth=1
	cvttss2si	%xmm1, %edx
	movq	%r14, %rdi
	movl	$32, %esi
	movl	%r15d, %ecx
	movss	-32(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-28(%rbp), %xmm0        ## 4-byte Folded Reload
	movss	%xmm0, -28(%rbp)        ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%r14, %rdi
	movl	$32, %esi
	movl	%r15d, %ecx
	movss	-32(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-28(%rbp), %xmm0        ## 4-byte Folded Reload
	movss	%xmm0, -28(%rbp)        ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%r14, %rdi
	movl	$32, %esi
	movl	%r15d, %ecx
	movss	-32(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm1        ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-28(%rbp), %xmm0        ## 4-byte Folded Reload
	movss	%xmm0, -28(%rbp)        ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%r14, %rdi
	movl	$32, %esi
	jmp	LBB118_9
LBB118_6:
	subss	-44(%rbp), %xmm1        ## 4-byte Folded Reload
	cvttss2si	%xmm1, %eax
LBB118_7:
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_thread_proc            ## -- Begin function thread_proc
	.p2align	4, 0x90
_thread_proc:                           ## @thread_proc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	_entry_curr@GOTPCREL(%rip), %rbx
	movq	_entry_count@GOTPCREL(%rip), %r15
	movq	_semaphore@GOTPCREL(%rip), %r14
	jmp	LBB119_1
	.p2align	4, 0x90
LBB119_7:                               ##   in Loop: Header=BB119_1 Depth=1
	movq	(%r14), %rdi
	callq	_sem_wait
LBB119_1:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB119_5 Depth 2
	movslq	(%rbx), %rcx
	cmpl	(%r15), %ecx
	jge	LBB119_7
## %bb.2:                               ##   in Loop: Header=BB119_1 Depth=1
	leal	1(%rcx), %edx
	movl	%ecx, %eax
	lock		cmpxchgl	%edx, (%rbx)
	jne	LBB119_1
## %bb.3:                               ##   in Loop: Header=BB119_1 Depth=1
	imulq	$88, %rcx, %rax
	leaq	_entries(%rip), %rcx
	leaq	80(%rax,%rcx), %r12
	cmpl	$0, 80(%rax,%rcx)
	jle	LBB119_6
## %bb.4:                               ##   in Loop: Header=BB119_1 Depth=1
	leaq	_entries(%rip), %rcx
	leaq	32(%rax,%rcx), %r13
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB119_5:                               ##   Parent Loop BB119_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-32(%r13), %rdi
	movq	-24(%r13), %rsi
	movl	-16(%r13), %edx
	movl	-12(%r13), %ecx
	movss	-8(%r13), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	movss	-4(%r13), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	movss	(%r13), %xmm2           ## xmm2 = mem[0],zero,zero,zero
	callq	__draw_text
	incq	%r15
	movq	$0, -24(%r13)
	movq	$0, -32(%r13)
	movslq	(%r12), %rax
	addq	$40, %r13
	cmpq	%rax, %r15
	jl	LBB119_5
LBB119_6:                               ##   in Loop: Header=BB119_1 Depth=1
	movl	$0, (%r12)
	movq	_entry_completed@GOTPCREL(%rip), %rax
	lock		incl	(%rax)
	movq	_entry_count@GOTPCREL(%rip), %rbx
	movq	%rbx, %r15
	movq	_entry_curr@GOTPCREL(%rip), %rbx
	jmp	LBB119_1
	.cfi_endproc
                                        ## -- End function
	.globl	_draw_text              ## -- Begin function draw_text
	.p2align	4, 0x90
_draw_text:                             ## @draw_text
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movaps	%xmm2, %xmm1
	popq	%rbp
	jmp	__draw_text             ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_swap                   ## -- Begin function swap
	.p2align	4, 0x90
_swap:                                  ## @swap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_clamp                  ## -- Begin function clamp
	.p2align	4, 0x90
_clamp:                                 ## @clamp
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %eax
	cmpl	%edi, %esi
	cmovll	%edi, %eax
	cmpl	%edx, %eax
	cmovgl	%edx, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_uint_len               ## -- Begin function uint_len
	.p2align	4, 0x90
_uint_len:                              ## @uint_len
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%edi, %edi
	je	LBB123_1
## %bb.2:
	xorl	%eax, %eax
	movl	$3435973837, %ecx       ## imm = 0xCCCCCCCD
	.p2align	4, 0x90
LBB123_3:                               ## =>This Inner Loop Header: Depth=1
	movl	%edi, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	incl	%eax
	cmpl	$9, %edi
	movl	%edx, %edi
	ja	LBB123_3
## %bb.4:
	popq	%rbp
	retq
LBB123_1:
	movl	$1, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_identifier          ## -- Begin function is_identifier
	.p2align	4, 0x90
_is_identifier:                         ## @is_identifier
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	testb	%bl, %bl
	js	LBB124_2
## %bb.1:
	movsbq	%bl, %rcx
	movq	__DefaultRuneLocale@GOTPCREL(%rip), %rdx
	movl	$1280, %eax             ## imm = 0x500
	andl	60(%rdx,%rcx,4), %eax
	jmp	LBB124_3
LBB124_2:
	movsbl	%bl, %edi
	movl	$1280, %esi             ## imm = 0x500
	callq	___maskrune
LBB124_3:
	testl	%eax, %eax
	setne	%al
	cmpb	$95, %bl
	sete	%cl
	orb	%al, %cl
	movzbl	%cl, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_line_count         ## -- Begin function get_line_count
	.p2align	4, 0x90
_get_line_count:                        ## @get_line_count
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rcx
	movb	(%rcx), %dl
	testb	%dl, %dl
	je	LBB125_1
## %bb.3:
	incq	%rcx
	movl	$1, %eax
	.p2align	4, 0x90
LBB125_4:                               ## =>This Inner Loop Header: Depth=1
	xorl	%esi, %esi
	cmpb	$10, %dl
	sete	%sil
	addl	%esi, %eax
	movzbl	(%rcx), %edx
	incq	%rcx
	testb	%dl, %dl
	jne	LBB125_4
## %bb.2:
	popq	%rbp
	retq
LBB125_1:
	movl	$1, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_line_and_col_from_pos ## -- Begin function get_line_and_col_from_pos
	.p2align	4, 0x90
_get_line_and_col_from_pos:             ## @get_line_and_col_from_pos
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	xorl	%eax, %eax
	testl	%esi, %esi
	je	LBB126_1
## %bb.2:
	movq	(%rdi), %r8
	movb	(%r8), %r11b
	movl	$0, %edi
	testb	%r11b, %r11b
	je	LBB126_6
## %bb.3:
	movl	%esi, %r10d
	xorl	%r9d, %r9d
	movl	$1, %esi
	xorl	%edi, %edi
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB126_4:                               ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ebx
	incl	%edi
	xorl	%eax, %eax
	cmpb	$10, %r11b
	sete	%al
	cmovel	%r9d, %edi
	addl	%ebx, %eax
	cmpq	%rsi, %r10
	je	LBB126_6
## %bb.5:                               ##   in Loop: Header=BB126_4 Depth=1
	movzbl	(%r8,%rsi), %r11d
	incq	%rsi
	testb	%r11b, %r11b
	jne	LBB126_4
LBB126_6:
	testq	%rdx, %rdx
	je	LBB126_8
LBB126_7:
	movl	%eax, (%rdx)
LBB126_8:
	testq	%rcx, %rcx
	je	LBB126_10
## %bb.9:
	movl	%edi, (%rcx)
LBB126_10:
	popq	%rbx
	popq	%rbp
	retq
LBB126_1:
	xorl	%edi, %edi
	testq	%rdx, %rdx
	jne	LBB126_7
	jmp	LBB126_8
	.cfi_endproc
                                        ## -- End function
	.globl	_get_pos_from_line_and_col ## -- Begin function get_pos_from_line_and_col
	.p2align	4, 0x90
_get_pos_from_line_and_col:             ## @get_pos_from_line_and_col
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%esi, %esi
	js	LBB127_1
## %bb.2:
	xorl	%r10d, %r10d
	testl	%edx, %edx
	cmovsl	%r10d, %edx
	movq	(%rdi), %r8
	movb	(%r8), %r9b
	testb	%r9b, %r9b
	je	LBB127_11
## %bb.3:
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB127_4:                               ## =>This Inner Loop Header: Depth=1
	cmpl	%esi, %r10d
	je	LBB127_5
## %bb.10:                              ##   in Loop: Header=BB127_4 Depth=1
	xorl	%ecx, %ecx
	cmpb	$10, %r9b
	sete	%cl
	addl	%ecx, %r10d
	movzbl	1(%r8,%rax), %r9d
	incq	%rax
	testb	%r9b, %r9b
	jne	LBB127_4
LBB127_11:
	movl	8(%rdi), %eax
	jmp	LBB127_12
LBB127_1:
	xorl	%eax, %eax
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
LBB127_5:
	movl	%eax, %ecx
	addq	%rcx, %r8
	movl	$-1, %edi
	xorl	%esi, %esi
	jmp	LBB127_6
	.p2align	4, 0x90
LBB127_8:                               ##   in Loop: Header=BB127_6 Depth=1
	incq	%rsi
	decl	%edi
LBB127_6:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%r8,%rsi), %ecx
	testb	%cl, %cl
	je	LBB127_9
## %bb.7:                               ##   in Loop: Header=BB127_6 Depth=1
	cmpb	$10, %cl
	jne	LBB127_8
LBB127_9:
	notl	%edx
	cmpl	%edx, %edi
	cmovgel	%edi, %edx
	subl	%edx, %eax
LBB127_12:
	decl	%eax
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_visual_col_to_text_col ## -- Begin function visual_col_to_text_col
	.p2align	4, 0x90
_visual_col_to_text_col:                ## @visual_col_to_text_col
	.cfi_startproc
## %bb.0:
	testl	%esi, %esi
	js	LBB128_1
## %bb.2:
	movq	(%rdi), %r8
	movb	(%r8), %r10b
	testb	%r10b, %r10b
	je	LBB128_11
## %bb.3:
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB128_4:                               ## =>This Inner Loop Header: Depth=1
	cmpl	%esi, %eax
	je	LBB128_5
## %bb.10:                              ##   in Loop: Header=BB128_4 Depth=1
	xorl	%ecx, %ecx
	cmpb	$10, %r10b
	sete	%cl
	addl	%ecx, %eax
	movzbl	1(%r8,%r9), %r10d
	incq	%r9
	testb	%r10b, %r10b
	jne	LBB128_4
LBB128_11:
	movl	8(%rdi), %r9d
	jmp	LBB128_12
LBB128_1:
	xorl	%r9d, %r9d
	cmpl	8(%rdi), %r9d
	jl	LBB128_14
	jmp	LBB128_18
LBB128_5:
	movl	%r9d, %eax
	addq	%rax, %r8
	movl	$-1, %esi
	xorl	%eax, %eax
	jmp	LBB128_6
	.p2align	4, 0x90
LBB128_8:                               ##   in Loop: Header=BB128_6 Depth=1
	incq	%rax
	decl	%esi
LBB128_6:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%r8,%rax), %ecx
	testb	%cl, %cl
	je	LBB128_9
## %bb.7:                               ##   in Loop: Header=BB128_6 Depth=1
	cmpb	$10, %cl
	jne	LBB128_8
LBB128_9:
	cmpl	$-2, %esi
	movl	$-1, %eax
	cmovgl	%esi, %eax
	subl	%eax, %r9d
LBB128_12:
	decl	%r9d
	cmpl	8(%rdi), %r9d
	jge	LBB128_18
LBB128_14:
	testl	%edx, %edx
	jle	LBB128_15
## %bb.16:
	movq	(%rdi), %rax
	movslq	%r9d, %rsi
	movb	(%rax,%rsi), %cl
	testb	%cl, %cl
	je	LBB128_17
## %bb.19:
	leaq	1(%rax,%rsi), %rsi
	xorl	%edi, %edi
	movl	%edx, %eax
	.p2align	4, 0x90
LBB128_20:                              ## =>This Inner Loop Header: Depth=1
	cmpb	$9, %cl
	jne	LBB128_24
## %bb.21:                              ##   in Loop: Header=BB128_20 Depth=1
	leal	4(%rdi), %ecx
	cmpl	%edx, %ecx
	jg	LBB128_22
## %bb.23:                              ##   in Loop: Header=BB128_20 Depth=1
	addl	$-3, %eax
	movl	%ecx, %edi
	cmpl	%edx, %edi
	jl	LBB128_26
	jmp	LBB128_27
	.p2align	4, 0x90
LBB128_24:                              ##   in Loop: Header=BB128_20 Depth=1
	incl	%edi
	cmpl	%edx, %edi
	jge	LBB128_27
LBB128_26:                              ##   in Loop: Header=BB128_20 Depth=1
	movzbl	(%rsi), %ecx
	incq	%rsi
	testb	%cl, %cl
	jne	LBB128_20
LBB128_27:
	retq
LBB128_17:
	movl	%edx, %eax
	retq
LBB128_15:
	movl	%edx, %eax
	retq
LBB128_22:
	subl	%edx, %edi
	addl	%eax, %edi
	movl	%edi, %eax
	retq
LBB128_18:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L___func__.visual_col_to_text_col(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$108, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_text_col_to_visual_col ## -- Begin function text_col_to_visual_col
	.p2align	4, 0x90
_text_col_to_visual_col:                ## @text_col_to_visual_col
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%esi, %esi
	js	LBB129_1
## %bb.2:
	movl	%edx, %eax
	movq	(%rdi), %r8
	movb	(%r8), %r10b
	testb	%r10b, %r10b
	je	LBB129_10
## %bb.3:
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB129_4:                               ## =>This Inner Loop Header: Depth=1
	cmpl	%esi, %edx
	je	LBB129_5
## %bb.9:                               ##   in Loop: Header=BB129_4 Depth=1
	xorl	%ecx, %ecx
	cmpb	$10, %r10b
	sete	%cl
	addl	%ecx, %edx
	movzbl	1(%r8,%r9), %r10d
	incq	%r9
	testb	%r10b, %r10b
	jne	LBB129_4
LBB129_10:
	movl	8(%rdi), %ecx
	decl	%ecx
LBB129_12:
	testl	%eax, %eax
	jle	LBB129_17
## %bb.13:
	movslq	%ecx, %rdx
	movb	(%r8,%rdx), %cl
	testb	%cl, %cl
	je	LBB129_17
## %bb.14:
	leal	(%rdx,%rax), %esi
	movslq	%esi, %rsi
	incq	%rdx
	.p2align	4, 0x90
LBB129_15:                              ## =>This Inner Loop Header: Depth=1
	movl	%eax, %edi
	leal	3(%rdi), %eax
	cmpb	$9, %cl
	cmovnel	%edi, %eax
	cmpq	%rsi, %rdx
	jge	LBB129_17
## %bb.16:                              ##   in Loop: Header=BB129_15 Depth=1
	movzbl	(%r8,%rdx), %ecx
	incq	%rdx
	testb	%cl, %cl
	jne	LBB129_15
	jmp	LBB129_17
LBB129_1:
	xorl	%eax, %eax
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
LBB129_5:
	movl	%r9d, %r10d
	addq	%r8, %r10
	movl	$-1, %esi
	xorl	%edx, %edx
	jmp	LBB129_6
	.p2align	4, 0x90
LBB129_8:                               ##   in Loop: Header=BB129_6 Depth=1
	incq	%rdx
	decl	%esi
LBB129_6:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%r10,%rdx), %ecx
	testb	%cl, %cl
	je	LBB129_11
## %bb.7:                               ##   in Loop: Header=BB129_6 Depth=1
	cmpb	$10, %cl
	jne	LBB129_8
LBB129_11:
	cmpl	$-2, %esi
	movl	$-1, %ecx
	cmovgl	%esi, %ecx
	negl	%ecx
	leaq	-1(%rcx,%r9), %rcx
	cmpl	8(%rdi), %ecx
	jl	LBB129_12
LBB129_17:
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function screen_pos_to_buffer_pos
LCPI130_0:
	.long	1101529088              ## float 21
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_screen_pos_to_buffer_pos
	.p2align	4, 0x90
_screen_pos_to_buffer_pos:              ## @screen_pos_to_buffer_pos
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	cvtsi2ssl	%edx, %xmm0
	addss	524320(%rdi), %xmm0
	cmpb	$0, _font_line_height(%rip)
	jne	LBB130_1
## %bb.2:
	xorps	%xmm1, %xmm1
	jmp	LBB130_3
LBB130_1:
	movss	LCPI130_0(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
LBB130_3:
	divss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r15d
	movss	524324(%r14), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	movl	_font_advance_x(%rip), %r8d
	testl	%r15d, %r15d
	js	LBB130_4
## %bb.5:
	movq	(%r14), %rax
	movb	(%rax), %cl
	testb	%cl, %cl
	je	LBB130_14
## %bb.6:
	xorl	%edx, %edx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB130_7:                               ## =>This Inner Loop Header: Depth=1
	cmpl	%r15d, %edi
	je	LBB130_8
## %bb.13:                              ##   in Loop: Header=BB130_7 Depth=1
	xorl	%ebx, %ebx
	cmpb	$10, %cl
	sete	%bl
	addl	%ebx, %edi
	movzbl	1(%rax,%rdx), %ecx
	incq	%rdx
	testb	%cl, %cl
	jne	LBB130_7
LBB130_14:
	movl	8(%r14), %edx
	jmp	LBB130_15
LBB130_4:
	xorl	%edx, %edx
	jmp	LBB130_16
LBB130_8:
	movl	%edx, %ecx
	addq	%rcx, %rax
	movl	$-1, %edi
	xorl	%ecx, %ecx
	jmp	LBB130_9
	.p2align	4, 0x90
LBB130_11:                              ##   in Loop: Header=BB130_9 Depth=1
	incq	%rcx
	decl	%edi
LBB130_9:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rcx), %ebx
	testb	%bl, %bl
	je	LBB130_12
## %bb.10:                              ##   in Loop: Header=BB130_9 Depth=1
	cmpb	$10, %bl
	jne	LBB130_11
LBB130_12:
	cmpl	$-2, %edi
	movl	$-1, %eax
	cmovgl	%edi, %eax
	subl	%eax, %edx
LBB130_15:
	decl	%edx
LBB130_16:
	movl	8(%r14), %eax
	cmpl	%eax, %edx
	jge	LBB130_30
## %bb.17:
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%esi, %xmm1
	cvtsi2ssl	%r8d, %xmm2
	addss	%xmm1, %xmm0
	divss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edx
	movq	%r14, %rdi
	movl	%r15d, %esi
	callq	_visual_col_to_text_col
	testl	%r15d, %r15d
	js	LBB130_18
## %bb.19:
	movl	%eax, %edi
	xorl	%esi, %esi
	testl	%eax, %eax
	cmovsl	%esi, %edi
	movq	(%r14), %rdx
	movb	(%rdx), %cl
	testb	%cl, %cl
	je	LBB130_28
## %bb.20:
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB130_21:                              ## =>This Inner Loop Header: Depth=1
	cmpl	%r15d, %esi
	je	LBB130_22
## %bb.27:                              ##   in Loop: Header=BB130_21 Depth=1
	xorl	%ebx, %ebx
	cmpb	$10, %cl
	sete	%bl
	addl	%ebx, %esi
	movzbl	1(%rdx,%rax), %ecx
	incq	%rax
	testb	%cl, %cl
	jne	LBB130_21
LBB130_28:
	movl	8(%r14), %eax
	jmp	LBB130_29
LBB130_18:
	xorl	%eax, %eax
	jmp	LBB130_30
LBB130_22:
	movl	%eax, %ecx
	addq	%rcx, %rdx
	movl	$-1, %esi
	xorl	%ecx, %ecx
	jmp	LBB130_23
	.p2align	4, 0x90
LBB130_25:                              ##   in Loop: Header=BB130_23 Depth=1
	incq	%rcx
	decl	%esi
LBB130_23:                              ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx,%rcx), %ebx
	testb	%bl, %bl
	je	LBB130_26
## %bb.24:                              ##   in Loop: Header=BB130_23 Depth=1
	cmpb	$10, %bl
	jne	LBB130_25
LBB130_26:
	notl	%edi
	cmpl	%edi, %esi
	cmovgel	%esi, %edi
	subl	%edi, %eax
LBB130_29:
	decl	%eax
LBB130_30:
                                        ## kill: def $eax killed $eax killed $rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_buffer_insert_at       ## -- Begin function buffer_insert_at
	.p2align	4, 0x90
_buffer_insert_at:                      ## @buffer_insert_at
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r15
	movl	%esi, %r12d
	movq	%rdi, %r13
	movq	(%rdi), %rdi
	movslq	8(%r13), %rsi
	movslq	%ecx, %r14
	addq	%r14, %rsi
	callq	_realloc
	movq	%rax, (%r13)
	movslq	%r12d, %rbx
	addq	%rbx, %rax
	leaq	(%rax,%r14), %rdi
	movslq	8(%r13), %rdx
	subq	%rbx, %rdx
	movq	%rax, %rsi
	callq	_memmove
	addq	(%r13), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	_memcpy
	addl	%r14d, 8(%r13)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_buffer_erase_range     ## -- Begin function buffer_erase_range
	.p2align	4, 0x90
_buffer_erase_range:                    ## @buffer_erase_range
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpl	%esi, %edx
	jl	LBB132_2
## %bb.1:
	movl	%edx, %ebx
	movl	%esi, %r15d
	movq	%rdi, %r14
	movq	(%rdi), %rax
	movslq	%esi, %rdi
	addq	%rax, %rdi
	movslq	%edx, %rcx
	leaq	1(%rax,%rcx), %rsi
	notl	%ebx
	movl	8(%r14), %eax
	addl	%ebx, %eax
	movslq	%eax, %rdx
	callq	_memmove
	addl	%r15d, %ebx
	addl	8(%r14), %ebx
	movl	%ebx, 8(%r14)
	movq	(%r14), %rdi
	movslq	%ebx, %rsi
	callq	_realloc
	movq	%rax, (%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB132_2:
	leaq	L___func__.buffer_erase_range(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.19(%rip), %rcx
	movl	$168, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_do_command_            ## -- Begin function do_command_
	.p2align	4, 0x90
_do_command_:                           ## @do_command_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movslq	524312(%rdi), %r13
	cmpq	$4096, %r13             ## imm = 0x1000
	jge	LBB133_22
## %bb.1:
	movq	%rdi, %r15
	shlq	$6, %r13
	movq	56(%rsi), %rax
	movq	%rax, 80(%rdi,%r13)
	movq	48(%rsi), %rax
	movq	%rax, 72(%rdi,%r13)
	movq	40(%rsi), %rax
	movq	%rax, 64(%rdi,%r13)
	movq	32(%rsi), %rax
	movq	%rax, 56(%rdi,%r13)
	movq	24(%rsi), %rax
	movq	%rax, 48(%rdi,%r13)
	movq	16(%rsi), %rax
	movq	%rax, 40(%rdi,%r13)
	movq	(%rsi), %rax
	movq	8(%rsi), %rcx
	movq	%rcx, 32(%rdi,%r13)
	movq	%rax, 24(%rdi,%r13)
	movl	524340(%rdi), %eax
	movl	%eax, 76(%rdi,%r13)
	movl	524332(%rdi), %eax
	movl	%eax, 80(%rdi,%r13)
	movl	524336(%rdi), %eax
	movl	%eax, 84(%rdi,%r13)
	incl	524312(%rdi)
	testl	%edx, %edx
	jne	LBB133_6
## %bb.2:
	movl	%edx, %r12d
	cmpl	$0, 524316(%r15)
	jle	LBB133_5
## %bb.3:
	leaq	262192(%r15), %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB133_4:                               ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbx), %rdi
	callq	_free
	movq	(%rbx), %rdi
	callq	_free
	incq	%r14
	movslq	524316(%r15), %rax
	addq	$64, %rbx
	cmpq	%rax, %r14
	jl	LBB133_4
LBB133_5:
	movl	$0, 524316(%r15)
	movl	%r12d, %edx
LBB133_6:
	leaq	24(%r15,%r13), %rbx
	movl	60(%r15,%r13), %r12d
	movl	64(%r15,%r13), %eax
	cmpl	%eax, %r12d
	jle	LBB133_7
## %bb.8:
	movl	%eax, 36(%rbx)
	movl	%r12d, 40(%rbx)
	movl	%eax, %ecx
	jmp	LBB133_9
LBB133_7:
	movl	%r12d, %ecx
	movl	%eax, %r12d
LBB133_9:
	movl	524348(%r15), %eax
	movl	%eax, 68(%r15,%r13)
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	LBB133_15
## %bb.10:
	cmpl	$1, %eax
	jne	LBB133_26
## %bb.11:
	testl	%edx, %edx
	je	LBB133_13
## %bb.12:
	movq	32(%r15,%r13), %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movl	40(%r15,%r13), %eax
	movslq	%eax, %rbx
	jmp	LBB133_14
LBB133_15:
	movl	%r12d, %eax
	subl	%ecx, %eax
	movslq	%eax, %r14
	incq	%r14
	testl	%edx, %edx
	je	LBB133_16
## %bb.17:
	movq	48(%r15,%r13), %rdi
	testq	%rdi, %rdi
	je	LBB133_23
## %bb.18:
	cmpl	8(%r15), %r12d
	jge	LBB133_24
LBB133_19:
	movslq	%ecx, %rsi
	addq	(%r15), %rsi
	movslq	%r14d, %rdx
	callq	_memcpy
	movslq	36(%rbx), %r12
	movslq	40(%rbx), %r14
	cmpl	%r12d, %r14d
	jl	LBB133_25
## %bb.20:
	movq	(%r15), %rax
	movq	%r12, %rdi
	addq	%rax, %rdi
	leaq	1(%rax,%r14), %rsi
	notl	%r14d
	movl	8(%r15), %eax
	addl	%r14d, %eax
	movslq	%eax, %rdx
	callq	_memmove
	addl	%r12d, %r14d
	addl	8(%r15), %r14d
	movl	%r14d, 8(%r15)
	movq	(%r15), %rdi
	movslq	%r14d, %rsi
	callq	_realloc
	movq	%rax, (%r15)
	jmp	LBB133_21
LBB133_13:
	movslq	40(%r15,%r13), %r14
	leaq	1(%r14), %rdi
	callq	_malloc
	movq	%rax, %rbx
	movq	32(%r15,%r13), %rsi
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	_memcpy
	movl	40(%r15,%r13), %eax
	movslq	%eax, %rcx
	movb	$0, (%rbx,%rcx)
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, 32(%r15,%r13)
	movq	%rcx, %rbx
LBB133_14:
	movslq	28(%r15,%r13), %r12
	movq	(%r15), %rdi
	movslq	8(%r15), %rsi
	movslq	%eax, %r14
	addq	%r14, %rsi
	callq	_realloc
	movq	%rax, (%r15)
	addq	%r12, %rax
	leaq	(%rax,%rbx), %rdi
	movslq	8(%r15), %rdx
	subq	%r12, %rdx
	movq	%rax, %rsi
	callq	_memmove
	addq	(%r15), %r12
	movq	%r12, %rdi
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	movq	%rbx, %rdx
	callq	_memcpy
	addl	%r14d, 8(%r15)
LBB133_21:
	movl	72(%r15,%r13), %eax
	movl	%eax, 524348(%r15)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB133_16:
	addl	$2, %eax
	movslq	%eax, %rdi
	movl	%ecx, -48(%rbp)         ## 4-byte Spill
	callq	_malloc
	movl	-48(%rbp), %ecx         ## 4-byte Reload
	movq	%rax, %rdi
	movq	%rax, 48(%r15,%r13)
	movl	%r14d, 56(%r15,%r13)
	movb	$0, (%rax,%r14)
	cmpl	8(%r15), %r12d
	jl	LBB133_19
LBB133_24:
	leaq	L___func__.do_command_(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.22(%rip), %rcx
	movl	$221, %edx
	callq	___assert_rtn
LBB133_22:
	leaq	L___func__.do_command_(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.20(%rip), %rcx
	movl	$176, %edx
	callq	___assert_rtn
LBB133_26:
	leaq	L___func__.do_command_(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$226, %edx
	callq	___assert_rtn
LBB133_25:
	leaq	L___func__.buffer_erase_range(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.19(%rip), %rcx
	movl	$168, %edx
	callq	___assert_rtn
LBB133_23:
	leaq	L___func__.do_command_(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.21(%rip), %rcx
	movl	$220, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_do_command             ## -- Begin function do_command
	.p2align	4, 0x90
_do_command:                            ## @do_command
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%edx, %edx
	popq	%rbp
	jmp	_do_command_            ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_redo_command           ## -- Begin function redo_command
	.p2align	4, 0x90
_redo_command:                          ## @redo_command
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$1, %edx
	popq	%rbp
	jmp	_do_command_            ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_undo_last_command      ## -- Begin function undo_last_command
	.p2align	4, 0x90
_undo_last_command:                     ## @undo_last_command
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movslq	524312(%rdi), %rax
	testq	%rax, %rax
	je	LBB136_6
## %bb.1:
	movq	%rdi, %rbx
	decq	%rax
	movq	%rax, %r13
	shlq	$6, %r13
	movl	%eax, 524312(%rdi)
	movslq	524316(%rdi), %rax
	shlq	$6, %rax
	movq	80(%rdi,%r13), %rcx
	movq	%rcx, 262224(%rdi,%rax)
	movq	72(%rdi,%r13), %rcx
	movq	%rcx, 262216(%rdi,%rax)
	movq	64(%rdi,%r13), %rcx
	movq	%rcx, 262208(%rdi,%rax)
	movq	56(%rdi,%r13), %rcx
	movq	%rcx, 262200(%rdi,%rax)
	movq	48(%rdi,%r13), %rcx
	movq	%rcx, 262192(%rdi,%rax)
	movq	40(%rdi,%r13), %rcx
	movq	%rcx, 262184(%rdi,%rax)
	movq	24(%rdi,%r13), %rcx
	movq	32(%rdi,%r13), %rdx
	movq	%rdx, 262176(%rdi,%rax)
	movq	%rcx, 262168(%rdi,%rax)
	incl	524316(%rdi)
	movl	76(%rdi,%r13), %eax
	movl	%eax, 524340(%rdi)
	movl	80(%rdi,%r13), %eax
	movl	%eax, 524332(%rdi)
	movl	84(%rdi,%r13), %eax
	movl	%eax, 524336(%rdi)
	cmpl	$1, 24(%rdi,%r13)
	jne	LBB136_4
## %bb.2:
	movslq	40(%rbx,%r13), %r14
	testq	%r14, %r14
	jle	LBB136_7
## %bb.3:
	movslq	28(%rbx,%r13), %rax
	movq	%r14, %rsi
	addq	%rax, %rsi
	movq	(%rbx), %rdi
	movl	8(%rbx), %ecx
	subl	%esi, %ecx
	addq	%rdi, %rsi
	addq	%rax, %rdi
	movslq	%ecx, %rdx
	callq	_memmove
	movl	8(%rbx), %eax
	subl	%r14d, %eax
	movl	%eax, 8(%rbx)
	movq	(%rbx), %rdi
	movslq	%eax, %rsi
	callq	_realloc
	movq	%rax, (%rbx)
	jmp	LBB136_5
LBB136_4:
	movslq	60(%rbx,%r13), %r15
	movq	48(%rbx,%r13), %r12
	movslq	56(%rbx,%r13), %r14
	movq	(%rbx), %rdi
	movslq	8(%rbx), %rsi
	addq	%r14, %rsi
	callq	_realloc
	movq	%rax, (%rbx)
	addq	%r15, %rax
	leaq	(%rax,%r14), %rdi
	movslq	8(%rbx), %rdx
	subq	%r15, %rdx
	movq	%rax, %rsi
	callq	_memmove
	addq	(%rbx), %r15
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%r14, %rdx
	callq	_memcpy
	addl	%r14d, 8(%rbx)
LBB136_5:
	movl	68(%rbx,%r13), %eax
	movl	%eax, 524348(%rbx)
LBB136_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB136_7:
	leaq	L___func__.buffer_erase_range(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.19(%rip), %rcx
	movl	$168, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_redo_last_command      ## -- Begin function redo_last_command
	.p2align	4, 0x90
_redo_last_command:                     ## @redo_last_command
	.cfi_startproc
## %bb.0:
	movslq	524316(%rdi), %rax
	testq	%rax, %rax
	je	LBB137_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	decq	%rax
	movq	%rax, %rcx
	shlq	$6, %rcx
	leaq	262168(%rdi,%rcx), %rsi
	movl	%eax, 524316(%rdi)
	movl	262212(%rdi,%rcx), %eax
	movl	%eax, 524348(%rdi)
	movl	$1, %edx
	callq	_do_command_
	movl	$0, 524340(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
LBB137_2:
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function update_and_render_buffer
LCPI138_0:
	.long	1176256512              ## float 1.0E+4
LCPI138_1:
	.long	3229614080              ## float -4
LCPI138_2:
	.long	1056964608              ## float 0.5
LCPI138_3:
	.long	1015580809              ## float 0.0166666675
LCPI138_4:
	.long	1101529088              ## float 21
LCPI138_5:
	.long	1063675494              ## float 0.899999976
LCPI138_6:
	.long	1058642330              ## float 0.600000024
LCPI138_7:
	.long	1065353216              ## float 1
LCPI138_8:
	.long	1050253722              ## float 0.300000012
LCPI138_9:
	.long	1061997773              ## float 0.800000011
LCPI138_10:
	.long	1036831949              ## float 0.100000001
LCPI138_11:
	.long	1053609165              ## float 0.400000006
LCPI138_19:
	.long	1132396544              ## float 255
LCPI138_20:
	.long	1040522936              ## float 0.129999995
LCPI138_21:
	.long	1060320051              ## float 0.699999988
LCPI138_22:
	.long	1045220557              ## float 0.200000003
LCPI138_23:
	.long	1120403456              ## float 100
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI138_12:
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
	.long	1132396544              ## float 255
LCPI138_13:
	.byte	2                       ## 0x2
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	6                       ## 0x6
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	10                      ## 0xa
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	14                      ## 0xe
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI138_14:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI138_15:
	.long	1040522936              ## float 0.129999995
	.long	1040522936              ## float 0.129999995
	.long	1040522936              ## float 0.129999995
	.long	1040522936              ## float 0.129999995
LCPI138_16:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
LCPI138_17:
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
	.long	1325400064              ## float 2.14748365E+9
LCPI138_18:
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.long	2147483648              ## 0x80000000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_update_and_render_buffer
	.p2align	4, 0x90
_update_and_render_buffer:              ## @update_and_render_buffer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$376, %rsp              ## imm = 0x178
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, -320(%rbp)        ## 8-byte Spill
	movq	%rdi, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	524348(%rdi), %edi
	testl	%edi, %edi
	js	LBB138_382
## %bb.1:
	cmpl	8(%r12), %edi
	jge	LBB138_382
## %bb.2:
	movq	%rdx, %r13
	movq	-320(%rbp), %rax        ## 8-byte Reload
	movl	4(%rax), %r14d
	addl	$-63, %r14d
	movslq	%r14d, %rax
	imulq	$818089009, %rax, %rax  ## imm = 0x30C30C31
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$34, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,4), %ecx
	leal	(%rax,%rcx,4), %edx
	movslq	%edx, %rax
	imulq	$818089009, %rax, %rax  ## imm = 0x30C30C31
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$34, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,4), %ecx
	leal	(%rax,%rcx,4), %eax
	movq	%rdx, -352(%rbp)        ## 8-byte Spill
	cmpl	%eax, %edx
	jne	LBB138_384
## %bb.3:
	movq	(%r12), %rcx
	movb	(%rcx), %dl
	testb	%dl, %dl
	movl	%edi, -332(%rbp)        ## 4-byte Spill
	je	LBB138_8
## %bb.4:
	incq	%rcx
	movl	$1, %eax
	.p2align	4, 0x90
LBB138_5:                               ## =>This Inner Loop Header: Depth=1
	xorl	%esi, %esi
	cmpb	$10, %dl
	sete	%sil
	addl	%esi, %eax
	movzbl	(%rcx), %edx
	incq	%rcx
	testb	%dl, %dl
	jne	LBB138_5
## %bb.6:
	testl	%eax, %eax
	jne	LBB138_9
## %bb.7:
	movl	$1, %ebx
	jmp	LBB138_11
LBB138_8:
	movl	$1, %eax
LBB138_9:
	xorl	%ebx, %ebx
	movl	$3435973837, %ecx       ## imm = 0xCCCCCCCD
	.p2align	4, 0x90
LBB138_10:                              ## =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	incl	%ebx
	cmpl	$9, %eax
	movl	%edx, %eax
	ja	LBB138_10
LBB138_11:
	imull	_font_advance_x(%rip), %ebx
	addl	$15, %ebx
	movl	24(%r13), %esi
	movl	28(%r13), %edx
	subl	%ebx, %esi
	movq	%r12, %rdi
	callq	_screen_pos_to_buffer_pos
	movl	%eax, -312(%rbp)        ## 4-byte Spill
	movl	32(%r13), %esi
	movl	36(%r13), %edx
	subl	%ebx, %esi
	movq	%r12, %rdi
	callq	_screen_pos_to_buffer_pos
	movq	16(%r13), %r8
	cmpl	$0, 320(%r8)
	je	LBB138_15
## %bb.12:
	movslq	524348(%r12), %rax
	testq	%rax, %rax
	je	LBB138_15
## %bb.13:
	movq	(%r12), %rcx
	cmpb	$10, -1(%rcx,%rax)
	je	LBB138_15
## %bb.14:
	decq	%rax
	movl	%eax, 524348(%r12)
LBB138_15:
	cmpl	$0, 316(%r8)
	movl	524348(%r12), %eax
	je	LBB138_19
## %bb.16:
	leal	1(%rax), %ecx
	cmpl	8(%r12), %ecx
	jge	LBB138_19
## %bb.17:
	movslq	%eax, %rdx
	movq	(%r12), %rsi
	cmpb	$10, (%rsi,%rdx)
	je	LBB138_19
## %bb.18:
	movl	%ecx, 524348(%r12)
	movl	%ecx, %eax
LBB138_19:
	movl	%r14d, -388(%rbp)       ## 4-byte Spill
	movq	(%r12), %r10
	movb	(%r10), %cl
	xorl	%ebx, %ebx
	testl	%eax, %eax
	je	LBB138_34
## %bb.20:
	movl	$0, %r15d
	testb	%cl, %cl
	je	LBB138_24
## %bb.21:
	movl	%eax, %esi
	xorl	%r9d, %r9d
	movl	$1, %eax
	movl	%ecx, %edx
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB138_22:                              ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	incl	%r15d
	xorl	%ebx, %ebx
	cmpb	$10, %dl
	sete	%bl
	cmovel	%r9d, %r15d
	addl	%edi, %ebx
	cmpq	%rax, %rsi
	je	LBB138_24
## %bb.23:                              ##   in Loop: Header=BB138_22 Depth=1
	movzbl	(%r10,%rax), %edx
	incq	%rax
	testb	%dl, %dl
	jne	LBB138_22
LBB138_24:
	testb	%cl, %cl
	je	LBB138_35
LBB138_25:
	xorl	%esi, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB138_26:                              ## =>This Inner Loop Header: Depth=1
	cmpl	%ebx, %eax
	je	LBB138_28
## %bb.27:                              ##   in Loop: Header=BB138_26 Depth=1
	xorl	%edx, %edx
	cmpb	$10, %cl
	sete	%dl
	addl	%edx, %eax
	movzbl	1(%r10,%rsi), %ecx
	incq	%rsi
	testb	%cl, %cl
	jne	LBB138_26
	jmp	LBB138_35
LBB138_28:
	movl	%esi, %edi
	addq	%r10, %rdi
	movl	$-1, %eax
	xorl	%ecx, %ecx
	jmp	LBB138_30
	.p2align	4, 0x90
LBB138_29:                              ##   in Loop: Header=BB138_30 Depth=1
	incq	%rcx
	decl	%eax
LBB138_30:                              ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rcx), %edx
	testb	%dl, %dl
	je	LBB138_32
## %bb.31:                              ##   in Loop: Header=BB138_30 Depth=1
	cmpb	$10, %dl
	jne	LBB138_29
LBB138_32:
	cmpl	$-2, %eax
	movl	$-1, %ecx
	cmovgl	%eax, %ecx
	negl	%ecx
	leaq	-1(%rcx,%rsi), %rax
	cmpl	8(%r12), %eax
	jge	LBB138_40
## %bb.33:
	testl	%r15d, %r15d
	jg	LBB138_36
	jmp	LBB138_40
LBB138_34:
	xorl	%r15d, %r15d
	testb	%cl, %cl
	jne	LBB138_25
LBB138_35:
	movl	8(%r12), %eax
	decl	%eax
	testl	%r15d, %r15d
	jle	LBB138_40
LBB138_36:
	movslq	%eax, %rdx
	movb	(%r10,%rdx), %al
	testb	%al, %al
	je	LBB138_40
## %bb.37:
	leal	(%rdx,%r15), %ecx
	movslq	%ecx, %rsi
	incq	%rdx
	.p2align	4, 0x90
LBB138_38:                              ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %ecx
	leal	3(%rcx), %r15d
	cmpb	$9, %al
	cmovnel	%ecx, %r15d
	cmpq	%rsi, %rdx
	jge	LBB138_40
## %bb.39:                              ##   in Loop: Header=BB138_38 Depth=1
	movzbl	(%r10,%rdx), %eax
	incq	%rdx
	testb	%al, %al
	jne	LBB138_38
LBB138_40:
	cmpl	$0, 328(%r8)
	je	LBB138_55
## %bb.41:
	leal	-1(%rbx), %r14d
	movq	%r12, %rdi
	movl	%r14d, %esi
	movl	%r15d, %edx
	callq	_visual_col_to_text_col
	testl	%ebx, %ebx
	jle	LBB138_47
## %bb.42:
	xorl	%esi, %esi
	testl	%eax, %eax
	cmovsl	%esi, %eax
	movq	(%r12), %r8
	movb	(%r8), %dl
	testb	%dl, %dl
	je	LBB138_46
## %bb.43:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB138_44:                              ## =>This Inner Loop Header: Depth=1
	cmpl	%r14d, %esi
	je	LBB138_48
## %bb.45:                              ##   in Loop: Header=BB138_44 Depth=1
	xorl	%edi, %edi
	cmpb	$10, %dl
	sete	%dil
	addl	%edi, %esi
	movzbl	1(%r8,%rcx), %edx
	incq	%rcx
	testb	%dl, %dl
	jne	LBB138_44
LBB138_46:
	movl	8(%r12), %ecx
	jmp	LBB138_53
LBB138_47:
	xorl	%ecx, %ecx
	jmp	LBB138_54
LBB138_48:
	movl	%ecx, %edx
	addq	%rdx, %r8
	movl	$-1, %esi
	xorl	%edi, %edi
	jmp	LBB138_50
	.p2align	4, 0x90
LBB138_49:                              ##   in Loop: Header=BB138_50 Depth=1
	incq	%rdi
	decl	%esi
LBB138_50:                              ## =>This Inner Loop Header: Depth=1
	movzbl	(%r8,%rdi), %edx
	testb	%dl, %dl
	je	LBB138_52
## %bb.51:                              ##   in Loop: Header=BB138_50 Depth=1
	cmpb	$10, %dl
	jne	LBB138_49
LBB138_52:
	notl	%eax
	cmpl	%eax, %esi
	cmovgel	%esi, %eax
	subl	%eax, %ecx
LBB138_53:
	decl	%ecx
LBB138_54:
	movl	%ecx, 524348(%r12)
	movq	16(%r13), %r8
LBB138_55:
	cmpl	$0, 324(%r8)
	je	LBB138_70
## %bb.56:
	leal	1(%rbx), %esi
	movq	%r12, %rdi
	movl	%r15d, %edx
	callq	_visual_col_to_text_col
	incl	%ebx
	js	LBB138_62
## %bb.57:
	xorl	%esi, %esi
	testl	%eax, %eax
	cmovsl	%esi, %eax
	movq	(%r12), %r8
	movb	(%r8), %dl
	testb	%dl, %dl
	je	LBB138_61
## %bb.58:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB138_59:                              ## =>This Inner Loop Header: Depth=1
	cmpl	%ebx, %esi
	je	LBB138_63
## %bb.60:                              ##   in Loop: Header=BB138_59 Depth=1
	xorl	%edi, %edi
	cmpb	$10, %dl
	sete	%dil
	addl	%edi, %esi
	movzbl	1(%r8,%rcx), %edx
	incq	%rcx
	testb	%dl, %dl
	jne	LBB138_59
LBB138_61:
	movl	8(%r12), %ecx
	jmp	LBB138_68
LBB138_62:
	xorl	%ecx, %ecx
	jmp	LBB138_69
LBB138_63:
	movl	%ecx, %edx
	addq	%rdx, %r8
	movl	$-1, %esi
	xorl	%edx, %edx
	jmp	LBB138_65
	.p2align	4, 0x90
LBB138_64:                              ##   in Loop: Header=BB138_65 Depth=1
	incq	%rdx
	decl	%esi
LBB138_65:                              ## =>This Inner Loop Header: Depth=1
	movzbl	(%r8,%rdx), %ebx
	testb	%bl, %bl
	je	LBB138_67
## %bb.66:                              ##   in Loop: Header=BB138_65 Depth=1
	cmpb	$10, %bl
	jne	LBB138_64
LBB138_67:
	notl	%eax
	cmpl	%eax, %esi
	cmovgel	%esi, %eax
	subl	%eax, %ecx
LBB138_68:
	decl	%ecx
LBB138_69:
	movl	%ecx, 524348(%r12)
LBB138_70:
	cmpl	$0, 8(%r13)
	je	LBB138_77
## %bb.71:
	movq	16(%r13), %rax
	cmpl	$0, 116(%rax)
	je	LBB138_74
## %bb.72:
	cmpl	$0, 524312(%r12)
	je	LBB138_74
## %bb.73:
	movq	%r12, %rdi
	callq	_undo_last_command
	cmpl	$0, 8(%r13)
	je	LBB138_77
LBB138_74:
	movq	16(%r13), %rax
	cmpl	$0, 84(%rax)
	je	LBB138_77
## %bb.75:
	movslq	524316(%r12), %rax
	testq	%rax, %rax
	je	LBB138_77
## %bb.76:
	decq	%rax
	movq	%rax, %rcx
	shlq	$6, %rcx
	leaq	262168(%r12,%rcx), %rsi
	movl	%eax, 524316(%r12)
	movl	262212(%r12,%rcx), %eax
	movl	%eax, 524348(%r12)
	movq	%r12, %rdi
	movl	$1, %edx
	callq	_do_command_
	movl	$0, 524340(%r12)
LBB138_77:
	movq	16(%r13), %rax
	cmpl	$0, 160(%rax)
	movq	%r12, -400(%rbp)        ## 8-byte Spill
	je	LBB138_88
## %bb.78:
	movslq	524348(%r12), %rax
	movq	(%r12), %r12
	xorl	%ecx, %ecx
	cmpb	$10, (%r12,%rax)
	sete	%cl
	movl	%eax, %ebx
	subl	%ecx, %ebx
	js	LBB138_82
## %bb.79:
	movslq	%ebx, %rbx
	.p2align	4, 0x90
LBB138_80:                              ## =>This Inner Loop Header: Depth=1
	cmpb	$10, (%r12,%rbx)
	je	LBB138_82
## %bb.81:                              ##   in Loop: Header=BB138_80 Depth=1
	testq	%rbx, %rbx
	leaq	-1(%rbx), %rbx
	jg	LBB138_80
LBB138_82:
	incl	%ebx
	movslq	%ebx, %r15
	cmpl	%eax, %ebx
	jge	LBB138_87
## %bb.83:
	movq	%r15, %rbx
	.p2align	4, 0x90
LBB138_84:                              ## =>This Inner Loop Header: Depth=1
	movzbl	(%r12,%rbx), %ecx
	cmpb	$32, %cl
	je	LBB138_86
## %bb.85:                              ##   in Loop: Header=BB138_84 Depth=1
	cmpb	$9, %cl
	jne	LBB138_87
LBB138_86:                              ##   in Loop: Header=BB138_84 Depth=1
	incq	%rbx
	cmpq	%rax, %rbx
	jl	LBB138_84
LBB138_87:
	subl	%r15d, %ebx
	leal	2(%rbx), %eax
	movslq	%eax, %rdi
	callq	_malloc
	movq	%rax, %r14
	movb	$10, (%rax)
	leaq	1(%rax), %rdi
	addq	%r15, %r12
	movslq	%ebx, %r15
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	_memcpy
	movb	$0, 1(%r14,%r15)
	movl	$1, -304(%rbp)
	movq	-400(%rbp), %r12        ## 8-byte Reload
	movl	524348(%r12), %ebx
	movl	%ebx, -300(%rbp)
	movq	%r14, -296(%rbp)
	movq	%r14, %rdi
	callq	_strlen
	movl	%eax, -288(%rbp)
	addl	%eax, %ebx
	movq	$0, -264(%rbp)
	movq	$0, -272(%rbp)
	movq	$0, -280(%rbp)
	movl	%ebx, -256(%rbp)
	movq	$0, -252(%rbp)
	movl	$0, -244(%rbp)
	leaq	-304(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	callq	_do_command_
	movq	16(%r13), %rax
LBB138_88:
	cmpl	$0, 168(%rax)
	je	LBB138_92
## %bb.89:
	cmpl	$0, 524340(%r12)
	jne	LBB138_92
## %bb.90:
	movl	524348(%r12), %eax
	testl	%eax, %eax
	je	LBB138_92
## %bb.91:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -288(%rbp)
	movl	$2, -304(%rbp)
	decl	%eax
	movl	%eax, -268(%rbp)
	movl	%eax, -264(%rbp)
	movl	%eax, -256(%rbp)
	leaq	-304(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	callq	_do_command_
LBB138_92:
	movl	524348(%r12), %eax
	cmpl	%eax, -332(%rbp)        ## 4-byte Folded Reload
	je	LBB138_94
## %bb.93:
	movl	$0, 524340(%r12)
LBB138_94:
	movl	8(%r13), %ecx
	testl	%ecx, %ecx
	je	LBB138_97
## %bb.95:
	movq	16(%r13), %rdx
	cmpl	$0, 176(%rdx)
	je	LBB138_97
## %bb.96:
	movl	%eax, 524356(%r12)
LBB138_97:
	cmpl	$0, 44(%r13)
	je	LBB138_99
## %bb.98:
	movl	-312(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 524348(%r12)
LBB138_99:
	movl	524356(%r12), %ebx
	cmpl	%eax, %ebx
	movl	%eax, %r15d
	cmovgel	%ebx, %r15d
	cmovgl	%eax, %ebx
	testl	%ecx, %ecx
	je	LBB138_111
## %bb.100:
	movq	16(%r13), %rax
	cmpl	$0, 24(%rax)
	jne	LBB138_102
## %bb.101:
	cmpl	$0, 108(%rax)
	je	LBB138_103
LBB138_102:
	movl	%r15d, %r14d
	subl	%ebx, %r14d
	movq	_clipboard(%rip), %rdi
	leal	1(%r14), %eax
	movslq	%eax, %rsi
	callq	_realloc
	movq	%rax, _clipboard(%rip)
	movslq	%ebx, %rsi
	addq	(%r12), %rsi
	movslq	%r14d, %r14
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	_memcpy
	movq	_clipboard(%rip), %rax
	movb	$0, (%rax,%r14)
	cmpl	$0, 8(%r13)
	je	LBB138_111
LBB138_103:
	movq	16(%r13), %rax
	cmpl	$0, 108(%rax)
	jne	LBB138_105
## %bb.104:
	cmpl	$0, 28(%rax)
	je	LBB138_108
LBB138_105:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -288(%rbp)
	movl	$2, -304(%rbp)
	movl	%ebx, -268(%rbp)
	decl	%r15d
	movl	%r15d, -264(%rbp)
	movl	%ebx, -256(%rbp)
	leaq	-304(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	callq	_do_command_
	movl	524348(%r12), %eax
	cmpl	%eax, 524356(%r12)
	jle	LBB138_107
## %bb.106:
	movl	%eax, 524356(%r12)
LBB138_107:
	movl	$0, 524340(%r12)
	cmpl	$0, 8(%r13)
	je	LBB138_111
LBB138_108:
	movq	16(%r13), %rax
	cmpl	$0, 100(%rax)
	je	LBB138_111
## %bb.109:
	movq	_clipboard(%rip), %rbx
	testq	%rbx, %rbx
	je	LBB138_111
## %bb.110:
	movq	%rbx, %rdi
	callq	_strlen
	movl	$1, -304(%rbp)
	movl	524348(%r12), %ecx
	movl	%ecx, -300(%rbp)
	movq	%rbx, -296(%rbp)
	movl	%eax, -288(%rbp)
	addl	%eax, %ecx
	movq	$0, -264(%rbp)
	movq	$0, -272(%rbp)
	movq	$0, -280(%rbp)
	movl	%ecx, -256(%rbp)
	movq	$0, -252(%rbp)
	movl	$0, -244(%rbp)
	leaq	-304(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	callq	_do_command_
	movl	$0, 524340(%r12)
LBB138_111:
	movq	(%r13), %rax
	cmpb	$0, (%rax)
	je	LBB138_114
## %bb.112:
	movl	$1, %ebx
	leaq	-280(%rbp), %r15
	leaq	-304(%rbp), %r14
	.p2align	4, 0x90
LBB138_113:                             ## =>This Inner Loop Header: Depth=1
	movl	$1, -304(%rbp)
	movl	524348(%r12), %ecx
	movl	%ecx, -300(%rbp)
	movq	%rax, -296(%rbp)
	movl	$1, -288(%rbp)
	incl	%ecx
	movq	$0, 16(%r15)
	movq	$0, 8(%r15)
	movq	$0, (%r15)
	movl	%ecx, -256(%rbp)
	movq	$0, -252(%rbp)
	movl	$0, -244(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	_do_command_
	movq	(%r13), %rax
	cmpb	$0, (%rax,%rbx)
	leaq	1(%rbx), %rbx
	jne	LBB138_113
LBB138_114:
	movl	524348(%r12), %r11d
	testl	%r11d, %r11d
	js	LBB138_383
## %bb.115:
	cmpl	8(%r12), %r11d
	jge	LBB138_383
## %bb.116:
	movq	(%r12), %r14
	movb	(%r14), %cl
	testb	%cl, %cl
	je	LBB138_121
## %bb.117:
	leaq	1(%r14), %rax
	movl	$1, %edi
	movl	%ecx, %edx
	.p2align	4, 0x90
LBB138_118:                             ## =>This Inner Loop Header: Depth=1
	xorl	%esi, %esi
	cmpb	$10, %dl
	sete	%sil
	addl	%esi, %edi
	movzbl	(%rax), %edx
	incq	%rax
	testb	%dl, %dl
	jne	LBB138_118
## %bb.119:
	testl	%edi, %edi
	jne	LBB138_122
## %bb.120:
	movl	$1, %r15d
	movl	$0, -344(%rbp)          ## 4-byte Folded Spill
	movb	$1, %al
	movl	%eax, -372(%rbp)        ## 4-byte Spill
	jmp	LBB138_125
LBB138_121:
	movl	$1, %edi
LBB138_122:
	movl	%edi, %edx
	xorl	%r15d, %r15d
	movl	$3435973837, %eax       ## imm = 0xCCCCCCCD
	movl	%edi, -344(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB138_123:                             ## =>This Inner Loop Header: Depth=1
	movl	%edx, %esi
	imulq	%rax, %rsi
	shrq	$35, %rsi
	incl	%r15d
	cmpl	$9, %edx
	movl	%esi, %edx
	ja	LBB138_123
## %bb.124:
	movl	$0, -372(%rbp)          ## 4-byte Folded Spill
LBB138_125:
	movl	_font_advance_x(%rip), %r10d
	movq	-320(%rbp), %rax        ## 8-byte Reload
	cmpl	$0, 4(%rax)
	jle	LBB138_129
## %bb.126:
	movq	%r10, -360(%rbp)        ## 8-byte Spill
	xorl	%ebx, %ebx
	movq	-320(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB138_127:                             ## =>This Inner Loop Header: Depth=1
	movslq	8(%r14), %rdi
	movslq	%ebx, %rbx
	imulq	%rbx, %rdi
	shlq	$2, %rdi
	addq	16(%r14), %rdi
	movslq	(%r14), %rdx
	shlq	$2, %rdx
	movl	$34, %esi
	callq	_memset
	incl	%ebx
	cmpl	4(%r14), %ebx
	jl	LBB138_127
## %bb.128:
	movl	524348(%r12), %r11d
	movq	(%r12), %r14
	movb	(%r14), %cl
	movq	-360(%rbp), %r10        ## 8-byte Reload
LBB138_129:
	xorl	%edi, %edi
	testl	%r11d, %r11d
	je	LBB138_134
## %bb.130:
	movl	$0, %ebx
	testb	%cl, %cl
	je	LBB138_135
## %bb.131:
	movl	%r11d, %r9d
	xorl	%r8d, %r8d
	movl	$1, %eax
	movl	%ecx, %edx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB138_132:                             ## =>This Inner Loop Header: Depth=1
	movl	%edi, %esi
	incl	%ebx
	xorl	%edi, %edi
	cmpb	$10, %dl
	sete	%dil
	cmovel	%r8d, %ebx
	addl	%esi, %edi
	cmpq	%rax, %r9
	je	LBB138_135
## %bb.133:                             ##   in Loop: Header=BB138_132 Depth=1
	movzbl	(%r14,%rax), %edx
	incq	%rax
	testb	%dl, %dl
	jne	LBB138_132
	jmp	LBB138_135
LBB138_134:
	xorl	%ebx, %ebx
LBB138_135:
	imull	%r15d, %r10d
	testb	%cl, %cl
	movl	-344(%rbp), %r15d       ## 4-byte Reload
	je	LBB138_139
## %bb.136:
	xorl	%esi, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB138_137:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%edi, %eax
	je	LBB138_145
## %bb.138:                             ##   in Loop: Header=BB138_137 Depth=1
	xorl	%edx, %edx
	cmpb	$10, %cl
	sete	%dl
	addl	%edx, %eax
	movzbl	1(%r14,%rsi), %ecx
	incq	%rsi
	testb	%cl, %cl
	jne	LBB138_137
LBB138_139:
	movl	8(%r12), %r8d
	leal	-1(%r8), %eax
LBB138_140:
	testl	%ebx, %ebx
	jle	LBB138_150
## %bb.141:
	cltq
	movb	(%r14,%rax), %cl
	testb	%cl, %cl
	je	LBB138_150
## %bb.142:
	leal	(%rax,%rbx), %edx
	movslq	%edx, %rdx
	incq	%rax
	.p2align	4, 0x90
LBB138_143:                             ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	leal	3(%rsi), %ebx
	cmpb	$9, %cl
	cmovnel	%esi, %ebx
	cmpq	%rdx, %rax
	jge	LBB138_150
## %bb.144:                             ##   in Loop: Header=BB138_143 Depth=1
	movzbl	(%r14,%rax), %ecx
	incq	%rax
	testb	%cl, %cl
	jne	LBB138_143
	jmp	LBB138_150
LBB138_145:
	movl	%esi, %r8d
	addq	%r14, %r8
	movl	$-1, %eax
	xorl	%edx, %edx
	jmp	LBB138_147
	.p2align	4, 0x90
LBB138_146:                             ##   in Loop: Header=BB138_147 Depth=1
	incq	%rdx
	decl	%eax
LBB138_147:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%r8,%rdx), %ecx
	testb	%cl, %cl
	je	LBB138_149
## %bb.148:                             ##   in Loop: Header=BB138_147 Depth=1
	cmpb	$10, %cl
	jne	LBB138_146
LBB138_149:
	cmpl	$-2, %eax
	movl	$-1, %ecx
	cmovgl	%eax, %ecx
	negl	%ecx
	leaq	-1(%rcx,%rsi), %rax
	movl	8(%r12), %r8d
	cmpl	%r8d, %eax
	jl	LBB138_140
LBB138_150:
	movss	40(%r13), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	mulss	LCPI138_0(%rip), %xmm0
	leal	15(%r10), %esi
	movss	524328(%r12), %xmm1     ## xmm1 = mem[0],zero,zero,zero
	movss	LCPI138_1(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	movss	LCPI138_2(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm3
	movss	LCPI138_3(%rip), %xmm4  ## xmm4 = mem[0],zero,zero,zero
	mulss	%xmm4, %xmm3
	mulss	%xmm4, %xmm3
	mulss	%xmm4, %xmm2
	addss	%xmm1, %xmm2
	movaps	%xmm1, %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm3, %xmm0
	addss	524320(%r12), %xmm0
	movss	%xmm0, 524320(%r12)
	movss	%xmm2, 524328(%r12)
	cmpl	524352(%r12), %r11d
	je	LBB138_159
## %bb.151:
	xorl	%ecx, %ecx
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %eax
	cmovel	%ecx, %eax
	movl	%eax, %ecx
	imull	%edi, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	movq	-352(%rbp), %rcx        ## 8-byte Reload
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	addss	%xmm0, %xmm2
	ucomiss	%xmm2, %xmm1
	movq	-320(%rbp), %rdx        ## 8-byte Reload
	jb	LBB138_153
## %bb.152:
	incl	%edi
	imull	%edi, %eax
	subl	-352(%rbp), %eax        ## 4-byte Folded Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, 524320(%r12)
LBB138_153:
	ucomiss	%xmm1, %xmm0
	jbe	LBB138_155
## %bb.154:
	movss	%xmm1, 524320(%r12)
	movaps	%xmm1, %xmm0
LBB138_155:
	movl	_font_advance_x(%rip), %eax
	movl	%eax, %ecx
	imull	%ebx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	movl	(%rdx), %ecx
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%ecx, %xmm3
	movss	524324(%r12), %xmm2     ## xmm2 = mem[0],zero,zero,zero
	xorps	%xmm4, %xmm4
	cvtsi2ssl	%esi, %xmm4
	addss	%xmm2, %xmm3
	subss	%xmm4, %xmm3
	ucomiss	%xmm3, %xmm1
	jb	LBB138_157
## %bb.156:
	incl	%ebx
	imull	%ebx, %eax
	addl	%esi, %eax
	subl	%ecx, %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movss	%xmm2, 524324(%r12)
LBB138_157:
	ucomiss	%xmm1, %xmm2
	jbe	LBB138_159
## %bb.158:
	movss	%xmm1, 524324(%r12)
LBB138_159:
	xorps	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	LBB138_161
## %bb.160:
	movl	$0, 524320(%r12)
	movl	$0, 524328(%r12)
	xorps	%xmm0, %xmm0
LBB138_161:
	movl	%esi, -384(%rbp)        ## 4-byte Spill
	ucomiss	524324(%r12), %xmm1
	jbe	LBB138_163
## %bb.162:
	movl	$0, 524324(%r12)
LBB138_163:
	movb	_font_line_height(%rip), %r9b
	xorl	%ecx, %ecx
	testb	%r9b, %r9b
	movl	$21, %eax
	cmovel	%ecx, %eax
	imull	%r15d, %eax
	xorps	%xmm1, %xmm1
	movl	%eax, %ecx
	subl	-352(%rbp), %ecx        ## 4-byte Folded Reload
	jl	LBB138_166
## %bb.164:
	movq	-352(%rbp), %rdx        ## 8-byte Reload
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	addss	%xmm0, %xmm1
	ucomiss	%xmm2, %xmm1
	jbe	LBB138_167
## %bb.165:
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
LBB138_166:
	movss	%xmm1, 524320(%r12)
	movl	$0, 524328(%r12)
	movaps	%xmm1, %xmm0
LBB138_167:
	movq	%r10, -360(%rbp)        ## 8-byte Spill
	xorl	%edi, %edi
	movb	(%r14), %r13b
	testl	%r11d, %r11d
	je	LBB138_174
## %bb.168:
	movl	$0, %esi
	testb	%r13b, %r13b
	je	LBB138_172
## %bb.169:
	movl	%r11d, %ecx
	xorl	%r10d, %r10d
	movl	$1, %ebx
	movl	%r13d, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB138_170:                             ## =>This Inner Loop Header: Depth=1
	movl	%edi, %eax
	incl	%esi
	xorl	%edi, %edi
	cmpb	$10, %dl
	sete	%dil
	cmovel	%r10d, %esi
	addl	%eax, %edi
	cmpq	%rbx, %rcx
	je	LBB138_172
## %bb.171:                             ##   in Loop: Header=BB138_170 Depth=1
	movzbl	(%r14,%rbx), %edx
	incq	%rbx
	testb	%dl, %dl
	jne	LBB138_170
LBB138_172:
	testb	%r9b, %r9b
	jne	LBB138_175
LBB138_173:
	xorps	%xmm1, %xmm1
	jmp	LBB138_176
LBB138_174:
	xorl	%esi, %esi
	testb	%r9b, %r9b
	je	LBB138_173
LBB138_175:
	movss	LCPI138_4(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
LBB138_176:
	movaps	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	cvttss2si	%xmm2, %ebx
	movq	-352(%rbp), %rax        ## 8-byte Reload
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	addss	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	cvttss2si	%xmm2, %r10d
	cmpl	%ebx, %edi
	jge	LBB138_190
## %bb.177:
	incl	%ebx
	js	LBB138_183
## %bb.178:
	xorl	%eax, %eax
	testl	%esi, %esi
	movl	$0, %r9d
	cmovnsl	%esi, %r9d
	testb	%r13b, %r13b
	je	LBB138_182
## %bb.179:
	xorl	%r11d, %r11d
	.p2align	4, 0x90
LBB138_180:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%ebx, %eax
	je	LBB138_184
## %bb.181:                             ##   in Loop: Header=BB138_180 Depth=1
	xorl	%ecx, %ecx
	cmpb	$10, %r13b
	sete	%cl
	addl	%ecx, %eax
	movzbl	1(%r14,%r11), %r13d
	incq	%r11
	testb	%r13b, %r13b
	jne	LBB138_180
LBB138_182:
	leal	-1(%r8), %r11d
	jmp	LBB138_189
LBB138_183:
	xorl	%r11d, %r11d
	jmp	LBB138_189
LBB138_184:
	movl	%r11d, %ecx
	addq	%r14, %rcx
	movl	$-1, %eax
	xorl	%edx, %edx
	jmp	LBB138_186
	.p2align	4, 0x90
LBB138_185:                             ##   in Loop: Header=BB138_186 Depth=1
	incq	%rdx
	decl	%eax
LBB138_186:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rdx), %ebx
	testb	%bl, %bl
	je	LBB138_188
## %bb.187:                             ##   in Loop: Header=BB138_186 Depth=1
	cmpb	$10, %bl
	jne	LBB138_185
LBB138_188:
	notl	%r9d
	cmpl	%r9d, %eax
	cmovgel	%eax, %r9d
	subl	%r9d, %r11d
	decl	%r11d
LBB138_189:
	movl	%r11d, 524348(%r12)
LBB138_190:
	cmpl	%r10d, %edi
	jle	LBB138_204
## %bb.191:
	testl	%r10d, %r10d
	jle	LBB138_197
## %bb.192:
	xorl	%ecx, %ecx
	testl	%esi, %esi
	cmovsl	%ecx, %esi
	movb	(%r14), %al
	testb	%al, %al
	je	LBB138_196
## %bb.193:
	decl	%r10d
	xorl	%r11d, %r11d
	.p2align	4, 0x90
LBB138_194:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%r10d, %ecx
	je	LBB138_198
## %bb.195:                             ##   in Loop: Header=BB138_194 Depth=1
	xorl	%edx, %edx
	cmpb	$10, %al
	sete	%dl
	addl	%edx, %ecx
	movzbl	1(%r14,%r11), %eax
	incq	%r11
	testb	%al, %al
	jne	LBB138_194
LBB138_196:
	leal	-1(%r8), %r11d
	jmp	LBB138_203
LBB138_197:
	xorl	%r11d, %r11d
	jmp	LBB138_203
LBB138_198:
	movl	%r11d, %ecx
	addq	%r14, %rcx
	movl	$-1, %eax
	xorl	%edx, %edx
	jmp	LBB138_200
	.p2align	4, 0x90
LBB138_199:                             ##   in Loop: Header=BB138_200 Depth=1
	incq	%rdx
	decl	%eax
LBB138_200:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rdx), %ebx
	testb	%bl, %bl
	je	LBB138_202
## %bb.201:                             ##   in Loop: Header=BB138_200 Depth=1
	cmpb	$10, %bl
	jne	LBB138_199
LBB138_202:
	notl	%esi
	cmpl	%esi, %eax
	cmovgel	%eax, %esi
	subl	%esi, %r11d
	decl	%r11d
LBB138_203:
	movl	%r11d, 524348(%r12)
LBB138_204:
	movb	(%r14), %dil
	xorl	%r13d, %r13d
	testl	%r11d, %r11d
	je	LBB138_209
## %bb.205:
	movl	$0, %ebx
	testb	%dil, %dil
	movq	-360(%rbp), %r10        ## 8-byte Reload
	je	LBB138_210
## %bb.206:
	movl	%r11d, %ecx
	xorl	%r9d, %r9d
	movl	$1, %esi
	movl	%edi, %edx
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB138_207:                             ## =>This Inner Loop Header: Depth=1
	movl	%r13d, %eax
	incl	%ebx
	xorl	%r13d, %r13d
	cmpb	$10, %dl
	sete	%r13b
	cmovel	%r9d, %ebx
	addl	%eax, %r13d
	cmpq	%rsi, %rcx
	je	LBB138_210
## %bb.208:                             ##   in Loop: Header=BB138_207 Depth=1
	movzbl	(%r14,%rsi), %edx
	incq	%rsi
	testb	%dl, %dl
	jne	LBB138_207
	jmp	LBB138_210
LBB138_209:
	xorl	%ebx, %ebx
	movq	-360(%rbp), %r10        ## 8-byte Reload
LBB138_210:
	leal	35(%r10), %r9d
	testb	%dil, %dil
	movl	%r9d, -312(%rbp)        ## 4-byte Spill
	je	LBB138_214
## %bb.211:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB138_212:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%r13d, %eax
	je	LBB138_219
## %bb.213:                             ##   in Loop: Header=BB138_212 Depth=1
	xorl	%edx, %edx
	cmpb	$10, %dil
	sete	%dl
	addl	%edx, %eax
	movzbl	1(%r14,%rcx), %edi
	incq	%rcx
	testb	%dil, %dil
	jne	LBB138_212
LBB138_214:
	decl	%r8d
	testl	%ebx, %ebx
	jle	LBB138_225
LBB138_215:
	movslq	%r8d, %rax
	movb	(%r14,%rax), %cl
	testb	%cl, %cl
	je	LBB138_225
## %bb.216:
	leal	(%rax,%rbx), %edx
	movslq	%edx, %rdx
	incq	%rax
	.p2align	4, 0x90
LBB138_217:                             ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	leal	3(%rsi), %ebx
	cmpb	$9, %cl
	cmovnel	%esi, %ebx
	cmpq	%rdx, %rax
	jge	LBB138_225
## %bb.218:                             ##   in Loop: Header=BB138_217 Depth=1
	movzbl	(%r14,%rax), %ecx
	incq	%rax
	testb	%cl, %cl
	jne	LBB138_217
	jmp	LBB138_225
LBB138_219:
	movl	%ecx, %edi
	addq	%r14, %rdi
	movl	$-1, %eax
	xorl	%esi, %esi
	jmp	LBB138_221
	.p2align	4, 0x90
LBB138_220:                             ##   in Loop: Header=BB138_221 Depth=1
	incq	%rsi
	decl	%eax
LBB138_221:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rsi), %edx
	testb	%dl, %dl
	je	LBB138_223
## %bb.222:                             ##   in Loop: Header=BB138_221 Depth=1
	cmpb	$10, %dl
	jne	LBB138_220
LBB138_223:
	cmpl	$-2, %eax
	movl	$-1, %edx
	cmovgl	%eax, %edx
	negl	%edx
	leaq	-1(%rdx,%rcx), %rax
	cmpl	%r8d, %eax
	jge	LBB138_225
## %bb.224:
	movl	%eax, %r8d
	testl	%ebx, %ebx
	jg	LBB138_215
LBB138_225:
	callq	_clock
	movss	524320(%r12), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	divss	LCPI138_4(%rip), %xmm1
	cvttss2si	%xmm1, %edx
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movslq	4(%rdi), %rax
	imulq	$818089009, %rax, %rax  ## imm = 0x30C30C31
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$34, %rax
	addl	%ecx, %eax
	movq	%rdx, -368(%rbp)        ## 8-byte Spill
	leal	1(%rdx,%rax), %ecx
	xorl	%r14d, %r14d
	testl	%ecx, %ecx
	cmovsl	%r14d, %ecx
	cmpl	%r15d, %ecx
	movl	_font_advance_x(%rip), %eax
	cvtsi2ssl	%eax, %xmm3
	cmovgl	%r15d, %ecx
	movl	%ecx, -332(%rbp)        ## 4-byte Spill
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %ecx
	cmovel	%r14d, %ecx
	cvtsi2ssl	%ecx, %xmm4
	imull	%eax, %ebx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ebx, %xmm1
	subss	524324(%r12), %xmm1
	movl	-312(%rbp), %eax        ## 4-byte Reload
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movss	%xmm2, -336(%rbp)       ## 4-byte Spill
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %esi
	imull	%r13d, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	subss	%xmm0, %xmm1
	cvttss2si	%xmm1, %edx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%esi, %xmm0
	movss	%xmm3, -312(%rbp)       ## 4-byte Spill
	addss	%xmm3, %xmm0
	cvttss2si	%xmm0, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movss	%xmm4, -324(%rbp)       ## 4-byte Spill
	addss	%xmm4, %xmm0
	cvttss2si	%xmm0, %r8d
	movss	LCPI138_5(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movss	LCPI138_6(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movss	LCPI138_7(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	xorps	%xmm2, %xmm2
	callq	_draw_rect
	movl	524356(%r12), %esi
	movq	(%r12), %r8
	movb	(%r8), %al
	testq	%rsi, %rsi
	je	LBB138_230
## %bb.226:
	movl	$0, %ecx
	testb	%al, %al
	movss	-312(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-324(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	je	LBB138_231
## %bb.227:
	xorl	%r9d, %r9d
	movl	$1, %ebx
	movl	%eax, %edx
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB138_228:                             ## =>This Inner Loop Header: Depth=1
	movl	%r14d, %edi
	incl	%ecx
	xorl	%r14d, %r14d
	cmpb	$10, %dl
	sete	%r14b
	cmovel	%r9d, %ecx
	addl	%edi, %r14d
	cmpq	%rbx, %rsi
	je	LBB138_231
## %bb.229:                             ##   in Loop: Header=BB138_228 Depth=1
	movzbl	(%r8,%rbx), %edx
	incq	%rbx
	testb	%dl, %dl
	jne	LBB138_228
	jmp	LBB138_231
LBB138_230:
	xorl	%ecx, %ecx
	movss	-312(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-324(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
LBB138_231:
	testb	%al, %al
	movl	%r15d, -344(%rbp)       ## 4-byte Spill
	je	LBB138_235
## %bb.232:
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB138_233:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%r14d, %edi
	je	LBB138_241
## %bb.234:                             ##   in Loop: Header=BB138_233 Depth=1
	xorl	%edx, %edx
	cmpb	$10, %al
	sete	%dl
	addl	%edx, %edi
	movzbl	1(%r8,%rsi), %eax
	incq	%rsi
	testb	%al, %al
	jne	LBB138_233
LBB138_235:
	movl	8(%r12), %eax
	decl	%eax
LBB138_236:
	testl	%ecx, %ecx
	jle	LBB138_246
## %bb.237:
	movslq	%eax, %rdx
	movb	(%r8,%rdx), %bl
	testb	%bl, %bl
	je	LBB138_246
## %bb.238:
	leal	(%rdx,%rcx), %eax
	movslq	%eax, %rsi
	incq	%rdx
	.p2align	4, 0x90
LBB138_239:                             ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %eax
	leal	3(%rax), %ecx
	cmpb	$9, %bl
	cmovnel	%eax, %ecx
	cmpq	%rsi, %rdx
	jge	LBB138_246
## %bb.240:                             ##   in Loop: Header=BB138_239 Depth=1
	movzbl	(%r8,%rdx), %ebx
	incq	%rdx
	testb	%bl, %bl
	jne	LBB138_239
	jmp	LBB138_246
LBB138_241:
	movl	%esi, %edi
	addq	%r8, %rdi
	movl	$-1, %edx
	xorl	%eax, %eax
	jmp	LBB138_243
	.p2align	4, 0x90
LBB138_242:                             ##   in Loop: Header=BB138_243 Depth=1
	incq	%rax
	decl	%edx
LBB138_243:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rax), %ebx
	testb	%bl, %bl
	je	LBB138_245
## %bb.244:                             ##   in Loop: Header=BB138_243 Depth=1
	cmpb	$10, %bl
	jne	LBB138_242
LBB138_245:
	cmpl	$-2, %edx
	movl	$-1, %eax
	cmovgl	%edx, %eax
	negl	%eax
	leaq	-1(%rax,%rsi), %rax
	cmpl	8(%r12), %eax
	jl	LBB138_236
LBB138_246:
	imull	_font_advance_x(%rip), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	subss	524324(%r12), %xmm0
	addss	-336(%rbp), %xmm0       ## 4-byte Folded Reload
	cvttss2si	%xmm0, %edx
	xorl	%r13d, %r13d
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %ecx
	movl	$0, %eax
	cmovnel	%ecx, %eax
	imull	%r14d, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	subss	524320(%r12), %xmm0
	cvttss2si	%xmm0, %r14d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r14d, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %r8d
	movq	%r8, -312(%rbp)         ## 8-byte Spill
	leal	1(%rdx), %ecx
	movq	%rdx, %r12
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	-320(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %rdi
	movl	%r12d, %esi
	movl	%r14d, %edx
                                        ## kill: def $r8d killed $r8d killed $r8
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	leal	1(%r14), %r8d
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%rbx, %rdi
	movl	%r12d, %esi
	movl	%r14d, %edx
	movl	%r15d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	movq	-312(%rbp), %r8         ## 8-byte Reload
	leal	-1(%r8), %edx
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%rbx, %rdi
	movl	%r12d, %esi
	movq	-400(%rbp), %r12        ## 8-byte Reload
	movl	%r15d, %ecx
                                        ## kill: def $r8d killed $r8d killed $r8
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	leal	-1(%r15), %esi
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%rbx, %rdi
	movl	%r14d, %edx
	movl	%r15d, %ecx
	movq	-312(%rbp), %r8         ## 8-byte Reload
                                        ## kill: def $r8d killed $r8d killed $r8
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	movq	_start@GOTPCREL(%rip), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %eax
	cmovel	%r13d, %eax
	movq	-368(%rbp), %rdi        ## 8-byte Reload
	imull	%edi, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	subss	524320(%r12), %xmm0
	movss	%xmm0, -328(%rbp)       ## 4-byte Spill
	movss	-336(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	subss	524324(%r12), %xmm2
	testl	%edi, %edi
	js	LBB138_258
## %bb.247:
	movq	(%r12), %rax
	movb	(%rax), %cl
	testb	%cl, %cl
	je	LBB138_251
## %bb.248:
	xorl	%r13d, %r13d
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB138_249:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%edi, %edx
	je	LBB138_252
## %bb.250:                             ##   in Loop: Header=BB138_249 Depth=1
	xorl	%esi, %esi
	cmpb	$10, %cl
	sete	%sil
	addl	%esi, %edx
	movzbl	1(%rax,%r13), %ecx
	incq	%r13
	testb	%cl, %cl
	jne	LBB138_249
LBB138_251:
	movl	8(%r12), %r13d
	jmp	LBB138_257
LBB138_252:
	movl	%r13d, %ecx
	addq	%rcx, %rax
	movl	$-1, %ecx
	xorl	%edx, %edx
	jmp	LBB138_254
	.p2align	4, 0x90
LBB138_253:                             ##   in Loop: Header=BB138_254 Depth=1
	incq	%rdx
	decl	%ecx
LBB138_254:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ebx
	testb	%bl, %bl
	je	LBB138_256
## %bb.255:                             ##   in Loop: Header=BB138_254 Depth=1
	cmpb	$10, %bl
	jne	LBB138_253
LBB138_256:
	cmpl	$-2, %ecx
	movl	$-1, %eax
	cmovgl	%ecx, %eax
	subl	%eax, %r13d
LBB138_257:
	decl	%r13d
LBB138_258:
	cmpl	%edi, -332(%rbp)        ## 4-byte Folded Reload
	jl	LBB138_315
## %bb.259:
	movss	LCPI138_9(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movl	$0, -376(%rbp)          ## 4-byte Folded Spill
	movl	$0, -324(%rbp)          ## 4-byte Folded Spill
	movl	$0, -340(%rbp)          ## 4-byte Folded Spill
	movq	-368(%rbp), %rax        ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, -380(%rbp)        ## 4-byte Spill
	jmp	LBB138_313
	.p2align	4, 0x90
LBB138_260:                             ##   in Loop: Header=BB138_313 Depth=1
	movslq	%r13d, %rax
	cmpb	$47, 1(%rdx,%rax)
	movl	$1, %eax
	movl	-324(%rbp), %ecx        ## 4-byte Reload
	cmovel	%eax, %ecx
	movl	%ecx, -324(%rbp)        ## 4-byte Spill
LBB138_261:                             ##   in Loop: Header=BB138_313 Depth=1
	movslq	%ebx, %rcx
	cmpl	$3, %r13d
	jl	LBB138_265
## %bb.262:                             ##   in Loop: Header=BB138_313 Depth=1
	movslq	%r13d, %rax
	cmpb	$47, -1(%rdx,%rax)
	jne	LBB138_265
## %bb.263:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$42, -2(%rdx,%rax)
	jne	LBB138_265
## %bb.264:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$47, -3(%rdx,%rax)
	movl	$0, %eax
	movl	-340(%rbp), %esi        ## 4-byte Reload
	cmovnel	%eax, %esi
	movl	%esi, -340(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB138_265:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$47, %cl
	movss	%xmm2, -312(%rbp)       ## 4-byte Spill
	jne	LBB138_268
## %bb.266:                             ##   in Loop: Header=BB138_313 Depth=1
	movslq	%r13d, %rax
	cmpb	$42, 1(%rdx,%rax)
	movl	$1, %eax
	movl	-340(%rbp), %edx        ## 4-byte Reload
	cmovel	%eax, %edx
	movl	$47, %eax
	movl	%edx, -340(%rbp)        ## 4-byte Spill
	orl	-324(%rbp), %edx        ## 4-byte Folded Reload
	je	LBB138_277
LBB138_267:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	%xmm2, %edx
	cvttss2si	-328(%rbp), %ecx ## 4-byte Folded Reload
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movl	%eax, %esi
	movss	LCPI138_2(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	jmp	LBB138_296
	.p2align	4, 0x90
LBB138_268:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	-340(%rbp), %eax        ## 4-byte Reload
	orl	-324(%rbp), %eax        ## 4-byte Folded Reload
	cmpb	$34, %bl
	sete	%sil
	jne	LBB138_273
## %bb.269:                             ##   in Loop: Header=BB138_313 Depth=1
	testl	%eax, %eax
	jne	LBB138_273
## %bb.270:                             ##   in Loop: Header=BB138_313 Depth=1
	testl	%r13d, %r13d
	je	LBB138_272
## %bb.271:                             ##   in Loop: Header=BB138_313 Depth=1
	movslq	%r13d, %rcx
	movl	$34, %eax
	cmpb	$92, -1(%rdx,%rcx)
	je	LBB138_295
LBB138_272:                             ##   in Loop: Header=BB138_313 Depth=1
	incl	-376(%rbp)              ## 4-byte Folded Spill
	movl	$34, %eax
	jmp	LBB138_295
	.p2align	4, 0x90
LBB138_273:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$32, %cl
	je	LBB138_286
## %bb.274:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$10, %cl
	je	LBB138_283
## %bb.275:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$9, %cl
	jne	LBB138_288
## %bb.276:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	-328(%rbp), %r14d ## 4-byte Folded Reload
	cvttss2si	%xmm2, %edx
	movq	-320(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %rdi
	movl	$32, %esi
	movl	%r14d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-312(%rbp), %xmm0       ## 4-byte Folded Reload
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%rbx, %rdi
	movl	$32, %esi
	movl	%r14d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-312(%rbp), %xmm0       ## 4-byte Folded Reload
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%rbx, %rdi
	movl	$32, %esi
	movl	%r14d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	-312(%rbp), %xmm0       ## 4-byte Folded Reload
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	cvttss2si	%xmm0, %edx
	movq	%rbx, %rdi
	movl	$32, %esi
	movl	%r14d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	xorps	%xmm2, %xmm2
	cvtsi2ssl	_font_advance_x(%rip), %xmm2
	addss	-312(%rbp), %xmm2       ## 4-byte Folded Reload
	jmp	LBB138_287
LBB138_277:                             ##   in Loop: Header=BB138_313 Depth=1
	xorl	%esi, %esi
	testb	$1, -376(%rbp)          ## 1-byte Folded Reload
	jne	LBB138_295
LBB138_278:                             ##   in Loop: Header=BB138_313 Depth=1
	testb	%sil, %sil
	jne	LBB138_295
## %bb.279:                             ##   in Loop: Header=BB138_313 Depth=1
	leal	-48(%rax), %edx
	cmpl	$9, %edx
	ja	LBB138_290
## %bb.280:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	-328(%rbp), %ebx ## 4-byte Folded Reload
	incq	%r14
	movq	%r12, %r15
	movq	-320(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB138_281:                             ##   Parent Loop BB138_313 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	%xmm2, -312(%rbp)       ## 4-byte Spill
	cvttss2si	%xmm2, %edx
	movq	%r12, %rdi
	movl	%eax, %esi
	movl	%ebx, %ecx
	movss	LCPI138_8(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm2
	callq	_draw_char
	movss	LCPI138_9(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	xorps	%xmm2, %xmm2
	cvtsi2ssl	_font_advance_x(%rip), %xmm2
	addss	-312(%rbp), %xmm2       ## 4-byte Folded Reload
	movq	(%r15), %rax
	movsbl	(%rax,%r14), %eax
	leal	-48(%rax), %ecx
	incl	%r13d
	incq	%r14
	cmpl	$10, %ecx
	jb	LBB138_281
## %bb.282:                             ##   in Loop: Header=BB138_313 Depth=1
	movq	%r15, %r12
	jmp	LBB138_298
LBB138_283:                             ##   in Loop: Header=BB138_313 Depth=1
	cmpb	$0, _font_line_height(%rip)
	movss	LCPI138_4(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	jne	LBB138_285
## %bb.284:                             ##   in Loop: Header=BB138_313 Depth=1
	xorps	%xmm0, %xmm0
LBB138_285:                             ##   in Loop: Header=BB138_313 Depth=1
	movss	-336(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	subss	524324(%r12), %xmm2
	movss	-328(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm1
	movss	%xmm1, -328(%rbp)       ## 4-byte Spill
	incl	%r13d
	incl	-380(%rbp)              ## 4-byte Folded Spill
	movl	$0, -324(%rbp)          ## 4-byte Folded Spill
	jmp	LBB138_297
LBB138_286:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	%xmm2, %edx
	cvttss2si	-328(%rbp), %ecx ## 4-byte Folded Reload
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movl	$32, %esi
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	%xmm0, %xmm2
LBB138_287:                             ##   in Loop: Header=BB138_313 Depth=1
	incl	%r13d
	jmp	LBB138_297
LBB138_288:                             ##   in Loop: Header=BB138_313 Depth=1
	testl	%eax, %eax
	je	LBB138_294
## %bb.289:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	%ebx, %eax
	jmp	LBB138_267
LBB138_290:                             ##   in Loop: Header=BB138_313 Depth=1
	testb	%cl, %cl
	js	LBB138_299
## %bb.291:                             ##   in Loop: Header=BB138_313 Depth=1
	movq	__DefaultRuneLocale@GOTPCREL(%rip), %rax
	movl	60(%rax,%rcx,4), %eax
	movl	$1280, %ecx             ## imm = 0x500
	andl	%ecx, %eax
	cmpb	$95, %bl
	je	LBB138_300
LBB138_292:                             ##   in Loop: Header=BB138_313 Depth=1
	testl	%eax, %eax
	jne	LBB138_300
## %bb.293:                             ##   in Loop: Header=BB138_313 Depth=1
	movq	(%r12), %rax
	movsbl	(%rax,%r14), %esi
	cvttss2si	%xmm2, %edx
	cvttss2si	-328(%rbp), %ecx ## 4-byte Folded Reload
	xorps	%xmm0, %xmm0
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movss	LCPI138_7(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm1, %xmm2
	callq	_draw_char
	movss	LCPI138_9(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	cvtsi2ssl	_font_advance_x(%rip), %xmm1
	addss	%xmm1, %xmm2
	incl	%r13d
	jmp	LBB138_298
LBB138_294:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	%ebx, %eax
	movss	LCPI138_9(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	testb	$1, -376(%rbp)          ## 1-byte Folded Reload
	je	LBB138_278
	.p2align	4, 0x90
LBB138_295:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	%xmm2, %edx
	cvttss2si	-328(%rbp), %ecx ## 4-byte Folded Reload
	xorps	%xmm0, %xmm0
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movl	%eax, %esi
	movss	LCPI138_6(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movss	LCPI138_10(%rip), %xmm2 ## xmm2 = mem[0],zero,zero,zero
LBB138_296:                             ##   in Loop: Header=BB138_313 Depth=1
	callq	_draw_char
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	incl	%r13d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	%xmm0, %xmm2
LBB138_297:                             ##   in Loop: Header=BB138_313 Depth=1
	movss	LCPI138_9(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
LBB138_298:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	-380(%rbp), %eax        ## 4-byte Reload
	cmpl	-332(%rbp), %eax        ## 4-byte Folded Reload
	jle	LBB138_313
	jmp	LBB138_315
LBB138_299:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	$1280, %esi             ## imm = 0x500
	movl	%eax, %edi
	callq	___maskrune
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	cmpb	$95, %bl
	jne	LBB138_292
LBB138_300:                             ##   in Loop: Header=BB138_313 Depth=1
	movq	%r14, %r13
	.p2align	4, 0x90
LBB138_301:                             ##   Parent Loop BB138_313 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	(%r12), %rax
	movsbq	(%rax,%r13), %rbx
	testq	%rbx, %rbx
	js	LBB138_303
## %bb.302:                             ##   in Loop: Header=BB138_301 Depth=2
	movq	__DefaultRuneLocale@GOTPCREL(%rip), %rax
	movl	60(%rax,%rbx,4), %eax
	movl	$1280, %ecx             ## imm = 0x500
	andl	%ecx, %eax
	jmp	LBB138_304
	.p2align	4, 0x90
LBB138_303:                             ##   in Loop: Header=BB138_301 Depth=2
	movl	$1280, %esi             ## imm = 0x500
	movl	%ebx, %edi
	callq	___maskrune
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
LBB138_304:                             ##   in Loop: Header=BB138_301 Depth=2
	incq	%r13
	cmpb	$95, %bl
	je	LBB138_301
## %bb.305:                             ##   in Loop: Header=BB138_301 Depth=2
	testl	%eax, %eax
	jne	LBB138_301
## %bb.306:                             ##   in Loop: Header=BB138_313 Depth=1
	cvttss2si	-328(%rbp), %r13d ## 4-byte Folded Reload
	jmp	LBB138_308
	.p2align	4, 0x90
LBB138_307:                             ##   in Loop: Header=BB138_308 Depth=2
	movq	(%r12), %rax
	movsbl	(%rax,%r14), %esi
	cvttss2si	%xmm2, %edx
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movl	%r13d, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_draw_char
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	incq	%r14
	xorps	%xmm0, %xmm0
	cvtsi2ssl	_font_advance_x(%rip), %xmm0
	addss	%xmm0, %xmm2
LBB138_308:                             ##   Parent Loop BB138_313 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	(%r12), %rax
	movsbq	(%rax,%r14), %rbx
	testq	%rbx, %rbx
	movss	%xmm2, -312(%rbp)       ## 4-byte Spill
	js	LBB138_311
## %bb.309:                             ##   in Loop: Header=BB138_308 Depth=2
	movq	__DefaultRuneLocale@GOTPCREL(%rip), %rax
	movl	60(%rax,%rbx,4), %eax
	movl	$1280, %ecx             ## imm = 0x500
	andl	%ecx, %eax
	cmpb	$95, %bl
	je	LBB138_307
LBB138_310:                             ##   in Loop: Header=BB138_308 Depth=2
	testl	%eax, %eax
	jne	LBB138_307
	jmp	LBB138_312
	.p2align	4, 0x90
LBB138_311:                             ##   in Loop: Header=BB138_308 Depth=2
	movl	$1280, %esi             ## imm = 0x500
	movl	%ebx, %edi
	callq	___maskrune
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	cmpb	$95, %bl
	jne	LBB138_310
	jmp	LBB138_307
LBB138_312:                             ##   in Loop: Header=BB138_313 Depth=1
	movl	%r14d, %r13d
	jmp	LBB138_297
	.p2align	4, 0x90
LBB138_313:                             ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB138_301 Depth 2
                                        ##     Child Loop BB138_308 Depth 2
                                        ##     Child Loop BB138_281 Depth 2
	movq	(%r12), %rdx
	movslq	%r13d, %r14
	movsbl	(%rdx,%r14), %ebx
	cmpl	$47, %ebx
	je	LBB138_260
## %bb.314:                             ##   in Loop: Header=BB138_313 Depth=1
	testb	%bl, %bl
	jne	LBB138_261
LBB138_315:
	movq	_main_is_waiting@GOTPCREL(%rip), %rax
	movl	$1, (%rax)
	movl	524348(%r12), %eax
	movl	%eax, 524352(%r12)
	cmpl	$0, 524340(%r12)
	je	LBB138_348
## %bb.316:
	xorl	%ecx, %ecx
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %eax
	cmovel	%ecx, %eax
	movq	-368(%rbp), %r8         ## 8-byte Reload
	imull	%r8d, %eax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	subss	524320(%r12), %xmm1
	movss	-336(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	subss	524324(%r12), %xmm0
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	movq	(%r12), %rax
	testl	%r8d, %r8d
	js	LBB138_328
## %bb.317:
	movb	(%rax), %dl
	testb	%dl, %dl
	je	LBB138_321
## %bb.318:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB138_319:                             ## =>This Inner Loop Header: Depth=1
	cmpl	%r8d, %esi
	je	LBB138_322
## %bb.320:                             ##   in Loop: Header=BB138_319 Depth=1
	xorl	%edi, %edi
	cmpb	$10, %dl
	sete	%dil
	addl	%edi, %esi
	movzbl	1(%rax,%rcx), %edx
	incq	%rcx
	testb	%dl, %dl
	jne	LBB138_319
LBB138_321:
	movl	8(%r12), %ecx
	jmp	LBB138_327
LBB138_322:
	movl	%ecx, %esi
	addq	%rax, %rsi
	movl	$-1, %edx
	xorl	%edi, %edi
	jmp	LBB138_324
	.p2align	4, 0x90
LBB138_323:                             ##   in Loop: Header=BB138_324 Depth=1
	incq	%rdi
	decl	%edx
LBB138_324:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%rdi), %ebx
	testb	%bl, %bl
	je	LBB138_326
## %bb.325:                             ##   in Loop: Header=BB138_324 Depth=1
	cmpb	$10, %bl
	jne	LBB138_323
LBB138_326:
	cmpl	$-2, %edx
	movl	$-1, %esi
	cmovgl	%edx, %esi
	subl	%esi, %ecx
LBB138_327:
	decl	%ecx
LBB138_328:
	cmpl	%r8d, -332(%rbp)        ## 4-byte Folded Reload
	jl	LBB138_348
## %bb.329:
	movslq	%ecx, %rbx
	movb	(%rax,%rbx), %cl
	testb	%cl, %cl
	je	LBB138_348
## %bb.330:
	movss	LCPI138_4(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	movq	-368(%rbp), %rdx        ## 8-byte Reload
	movl	%edx, %r14d
	.p2align	4, 0x90
LBB138_331:                             ## =>This Inner Loop Header: Depth=1
	movslq	524332(%r12), %rdx
	movslq	524336(%r12), %rsi
	cmpq	%rdx, %rbx
	jge	LBB138_334
## %bb.332:                             ##   in Loop: Header=BB138_331 Depth=1
	cmpq	%rsi, %rbx
	jl	LBB138_340
## %bb.333:                             ##   in Loop: Header=BB138_331 Depth=1
	cmpq	%rdx, %rbx
	jl	LBB138_335
	jmp	LBB138_340
	.p2align	4, 0x90
LBB138_334:                             ##   in Loop: Header=BB138_331 Depth=1
	cmpq	%rsi, %rbx
	jge	LBB138_340
LBB138_335:                             ##   in Loop: Header=BB138_331 Depth=1
	movl	_font_advance_x(%rip), %eax
	cmpb	$9, %cl
	jne	LBB138_337
## %bb.336:                             ##   in Loop: Header=BB138_331 Depth=1
	shll	$2, %eax
LBB138_337:                             ##   in Loop: Header=BB138_331 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	addss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	cvttss2si	%xmm2, %esi
	cvttss2si	%xmm1, %edx
	cmpb	$0, _font_line_height(%rip)
	movaps	%xmm3, %xmm0
	jne	LBB138_339
## %bb.338:                             ##   in Loop: Header=BB138_331 Depth=1
	xorps	%xmm0, %xmm0
LBB138_339:                             ##   in Loop: Header=BB138_331 Depth=1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r8d
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movss	LCPI138_10(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, -324(%rbp)       ## 4-byte Spill
	movss	LCPI138_2(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm2
	movss	LCPI138_11(%rip), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	callq	_draw_rect
	movss	-324(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movq	(%r12), %rax
	movss	LCPI138_4(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
LBB138_340:                             ##   in Loop: Header=BB138_331 Depth=1
	movzbl	(%rax,%rbx), %edx
	cmpb	$10, %dl
	jne	LBB138_344
## %bb.341:                             ##   in Loop: Header=BB138_331 Depth=1
	cmpb	$0, _font_line_height(%rip)
	movaps	%xmm3, %xmm0
	jne	LBB138_343
## %bb.342:                             ##   in Loop: Header=BB138_331 Depth=1
	xorps	%xmm0, %xmm0
LBB138_343:                             ##   in Loop: Header=BB138_331 Depth=1
	addss	%xmm0, %xmm1
	movss	-336(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	subss	524324(%r12), %xmm0
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	incl	%r14d
	cmpl	-332(%rbp), %r14d       ## 4-byte Folded Reload
	jle	LBB138_347
	jmp	LBB138_348
	.p2align	4, 0x90
LBB138_344:                             ##   in Loop: Header=BB138_331 Depth=1
	movl	_font_advance_x(%rip), %ecx
	cmpb	$9, %dl
	jne	LBB138_346
## %bb.345:                             ##   in Loop: Header=BB138_331 Depth=1
	shll	$2, %ecx
LBB138_346:                             ##   in Loop: Header=BB138_331 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	-312(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm2
	movss	%xmm2, -312(%rbp)       ## 4-byte Spill
	cmpl	-332(%rbp), %r14d       ## 4-byte Folded Reload
	jg	LBB138_348
LBB138_347:                             ##   in Loop: Header=BB138_331 Depth=1
	movzbl	1(%rax,%rbx), %ecx
	incq	%rbx
	testb	%cl, %cl
	jne	LBB138_331
LBB138_348:
	movq	-320(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	4(%rax), %r10d
	movl	%ecx, %eax
	orl	%r10d, %eax
	js	LBB138_359
## %bb.349:
	movl	-384(%rbp), %r15d       ## 4-byte Reload
	cmpl	%r15d, %ecx
	cmovlel	%ecx, %r15d
	testl	%r10d, %r10d
	jle	LBB138_359
## %bb.350:
	movq	-320(%rbp), %rax        ## 8-byte Reload
	movq	16(%rax), %rdx
	notl	%ecx
	movl	$-16, %r13d
	subl	-360(%rbp), %r13d       ## 4-byte Folded Reload
	cmpl	%ecx, %r13d
	cmovll	%ecx, %r13d
	movl	8(%rax), %ecx
	movl	$-2, %r9d
	subl	%r13d, %r9d
	incq	%r9
	notl	%r13d
	andl	$3, %r13d
	movq	%r9, %r14
	subq	%r13, %r14
	xorl	%r11d, %r11d
	movss	LCPI138_19(%rip), %xmm12 ## xmm12 = mem[0],zero,zero,zero
	xorps	%xmm14, %xmm14
	movss	LCPI138_20(%rip), %xmm15 ## xmm15 = mem[0],zero,zero,zero
	movss	LCPI138_2(%rip), %xmm9  ## xmm9 = mem[0],zero,zero,zero
	movaps	LCPI138_12(%rip), %xmm10 ## xmm10 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	movdqa	LCPI138_13(%rip), %xmm4 ## xmm4 = [2,255,255,255,6,255,255,255,10,255,255,255,14,255,255,255]
	movdqa	LCPI138_14(%rip), %xmm5 ## xmm5 = [1,255,255,255,5,255,255,255,9,255,255,255,13,255,255,255]
	xorps	%xmm7, %xmm7
	movaps	LCPI138_15(%rip), %xmm1 ## xmm1 = [1.29999995E-1,1.29999995E-1,1.29999995E-1,1.29999995E-1]
	movaps	LCPI138_16(%rip), %xmm8 ## xmm8 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	movaps	LCPI138_17(%rip), %xmm11 ## xmm11 = [2.14748365E+9,2.14748365E+9,2.14748365E+9,2.14748365E+9]
	movaps	LCPI138_18(%rip), %xmm13 ## xmm13 = [2147483648,2147483648,2147483648,2147483648]
	.p2align	4, 0x90
LBB138_351:                             ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB138_354 Depth 2
                                        ##     Child Loop BB138_356 Depth 2
	testl	%r15d, %r15d
	jle	LBB138_358
## %bb.352:                             ##   in Loop: Header=BB138_351 Depth=1
	xorl	%esi, %esi
	movq	%rdx, %rcx
	cmpq	$3, %r9
	movl	%r15d, %r8d
	jbe	LBB138_356
## %bb.353:                             ##   in Loop: Header=BB138_351 Depth=1
	leaq	(%rdx,%r14,4), %rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB138_354:                             ##   Parent Loop BB138_351 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rsi,4), %xmm0
	movdqa	%xmm0, %xmm2
	psrld	$24, %xmm2
	cvtdq2ps	%xmm2, %xmm3
	divps	%xmm10, %xmm3
	movdqa	%xmm0, %xmm2
	pshufb	%xmm4, %xmm2
	cvtdq2ps	%xmm2, %xmm2
	divps	%xmm10, %xmm2
	pshufb	%xmm5, %xmm0
	cvtdq2ps	%xmm0, %xmm6
	divps	%xmm10, %xmm6
	mulps	%xmm7, %xmm3
	addps	%xmm1, %xmm3
	mulps	%xmm7, %xmm2
	addps	%xmm1, %xmm2
	mulps	%xmm7, %xmm6
	addps	%xmm1, %xmm6
	mulps	%xmm10, %xmm3
	addps	%xmm8, %xmm3
	movaps	%xmm3, %xmm0
	cmpltps	%xmm11, %xmm0
	movaps	%xmm8, %xmm7
	cvttps2dq	%xmm3, %xmm8
	subps	%xmm11, %xmm3
	cvttps2dq	%xmm3, %xmm3
	xorps	%xmm13, %xmm3
	blendvps	%xmm0, %xmm8, %xmm3
	movaps	%xmm7, %xmm8
	pslld	$24, %xmm3
	mulps	%xmm10, %xmm2
	addps	%xmm7, %xmm2
	movaps	%xmm2, %xmm0
	cmpltps	%xmm11, %xmm0
	movdqa	%xmm5, %xmm7
	movdqa	%xmm4, %xmm5
	cvttps2dq	%xmm2, %xmm4
	subps	%xmm11, %xmm2
	cvttps2dq	%xmm2, %xmm2
	xorps	%xmm13, %xmm2
	blendvps	%xmm0, %xmm4, %xmm2
	pslld	$16, %xmm2
	por	%xmm3, %xmm2
	mulps	%xmm10, %xmm6
	addps	%xmm8, %xmm6
	movaps	%xmm6, %xmm0
	cmpltps	%xmm11, %xmm0
	cvttps2dq	%xmm6, %xmm3
	subps	%xmm11, %xmm6
	cvttps2dq	%xmm6, %xmm4
	xorps	%xmm13, %xmm4
	blendvps	%xmm0, %xmm3, %xmm4
	pslld	$8, %xmm4
	por	%xmm2, %xmm4
	movdqu	%xmm4, (%rdx,%rsi,4)
	movdqa	%xmm5, %xmm4
	movdqa	%xmm7, %xmm5
	pxor	%xmm7, %xmm7
	addq	$4, %rsi
	cmpq	%rsi, %r14
	jne	LBB138_354
## %bb.355:                             ##   in Loop: Header=BB138_351 Depth=1
	movl	%r14d, %esi
	testl	%r13d, %r13d
	movl	%r15d, %r8d
	je	LBB138_357
	.p2align	4, 0x90
LBB138_356:                             ##   Parent Loop BB138_351 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%rcx), %ebx
	movl	%ebx, %eax
	shrl	$24, %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	movl	%ebx, %eax
	movzbl	%bh, %ebx
	divss	%xmm12, %xmm2
	shrl	$16, %eax
	movzbl	%al, %eax
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	divss	%xmm12, %xmm3
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	divss	%xmm12, %xmm0
	mulss	%xmm14, %xmm2
	addss	%xmm15, %xmm2
	mulss	%xmm14, %xmm3
	addss	%xmm15, %xmm3
	mulss	%xmm14, %xmm0
	addss	%xmm15, %xmm0
	mulss	%xmm12, %xmm2
	addss	%xmm9, %xmm2
	cvttss2si	%xmm2, %rax
	shll	$24, %eax
	mulss	%xmm12, %xmm3
	addss	%xmm9, %xmm3
	cvttss2si	%xmm3, %rbx
	mulss	%xmm12, %xmm0
	addss	%xmm9, %xmm0
	cvttss2si	%xmm0, %rdi
	shll	$16, %ebx
	shll	$8, %edi
	orl	%eax, %edi
	orl	%ebx, %edi
	movl	%edi, (%rcx)
	addq	$4, %rcx
	incl	%esi
	cmpl	%r8d, %esi
	jl	LBB138_356
LBB138_357:                             ##   in Loop: Header=BB138_351 Depth=1
	movq	-320(%rbp), %rax        ## 8-byte Reload
	movl	8(%rax), %ecx
LBB138_358:                             ##   in Loop: Header=BB138_351 Depth=1
	movslq	%ecx, %rax
	leaq	(%rdx,%rax,4), %rdx
	incl	%r11d
	cmpl	%r10d, %r11d
	jne	LBB138_351
LBB138_359:
	movq	%r12, %r14
	movl	$1, %ebx
	cmpb	$0, -372(%rbp)          ## 1-byte Folded Reload
	movl	-344(%rbp), %edx        ## 4-byte Reload
	jne	LBB138_362
## %bb.360:
	xorl	%ebx, %ebx
	movl	$3435973837, %eax       ## imm = 0xCCCCCCCD
	.p2align	4, 0x90
LBB138_361:                             ## =>This Inner Loop Header: Depth=1
	movl	%edx, %ecx
	imulq	%rax, %rcx
	shrq	$35, %rcx
	incl	%ebx
	cmpl	$9, %edx
	movl	%ecx, %edx
	ja	LBB138_361
LBB138_362:
	movq	-368(%rbp), %r13        ## 8-byte Reload
	cmpl	%r13d, -332(%rbp)       ## 4-byte Folded Reload
	jl	LBB138_367
## %bb.363:
	imull	_font_advance_x(%rip), %ebx
	addl	$25, %ebx
	leaq	-304(%rbp), %r15
	.p2align	4, 0x90
LBB138_364:                             ## =>This Inner Loop Header: Depth=1
	movl	$10, %edx
	movq	%r15, %rdi
	xorl	%esi, %esi
	leaq	L_.str.26(%rip), %rcx
	movl	%r13d, %r8d
	xorl	%eax, %eax
	callq	___sprintf_chk
	movq	%r13, %r12
	leal	-1(%r13), %eax
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %ecx
	jne	LBB138_366
## %bb.365:                             ##   in Loop: Header=BB138_364 Depth=1
	xorl	%ecx, %ecx
LBB138_366:                             ##   in Loop: Header=BB138_364 Depth=1
	imull	%eax, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	subss	524320(%r14), %xmm0
	movss	%xmm0, -312(%rbp)       ## 4-byte Spill
	movq	%r15, %rdi
	callq	_strlen
	imull	_font_advance_x(%rip), %eax
	movl	%ebx, %edx
	subl	%eax, %edx
	cvttss2si	-312(%rbp), %ecx ## 4-byte Folded Reload
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	movss	LCPI138_21(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	__draw_text
	leal	1(%r12), %eax
	cmpl	-332(%rbp), %r12d       ## 4-byte Folded Reload
	movl	%eax, %r13d
	jl	LBB138_364
LBB138_367:
	movq	-320(%rbp), %r15        ## 8-byte Reload
	movl	(%r15), %ecx
	movq	-352(%rbp), %rbx        ## 8-byte Reload
	leal	21(%rbx), %r8d
	movss	LCPI138_22(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	LCPI138_8(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movss	LCPI138_7(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	movq	%r15, %rdi
	movl	$0, %esi
	movl	%ebx, %edx
	movaps	%xmm1, %xmm2
	callq	_draw_rect
	movq	%r14, %r12
	movq	16(%r14), %r8
	leaq	L_.str.27(%rip), %rcx
	leaq	-304(%rbp), %r14
	movl	$256, %edx              ## imm = 0x100
	movq	%r14, %rdi
	movl	$0, %esi
	xorl	%eax, %eax
	callq	___sprintf_chk
	movq	%r15, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	movl	%ebx, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	__draw_text
	movl	524348(%r12), %esi
	movq	(%r12), %rcx
	movb	(%rcx), %r10b
	movl	$1, %eax
	movl	$1, %r8d
	movl	$1, %r9d
	testq	%rsi, %rsi
	movl	-388(%rbp), %r15d       ## 4-byte Reload
	je	LBB138_373
## %bb.368:
	movl	$1, %r8d
	movl	$1, %r9d
	testb	%r10b, %r10b
	je	LBB138_373
## %bb.369:
	xorl	%r11d, %r11d
	movl	$1, %ebx
	movl	%r10d, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	.p2align	4, 0x90
LBB138_370:                             ## =>This Inner Loop Header: Depth=1
	movl	%r8d, %edi
	incl	%r9d
	xorl	%r8d, %r8d
	cmpb	$10, %dl
	sete	%r8b
	cmovel	%r11d, %r9d
	addl	%edi, %r8d
	cmpq	%rbx, %rsi
	je	LBB138_372
## %bb.371:                             ##   in Loop: Header=BB138_370 Depth=1
	movzbl	(%rcx,%rbx), %edx
	incq	%rbx
	testb	%dl, %dl
	jne	LBB138_370
LBB138_372:
	incl	%r8d
	incl	%r9d
LBB138_373:
	subl	-352(%rbp), %r15d       ## 4-byte Folded Reload
	testb	%r10b, %r10b
	je	LBB138_376
## %bb.374:
	incq	%rcx
	movl	$1, %eax
	.p2align	4, 0x90
LBB138_375:                             ## =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	cmpb	$10, %r10b
	sete	%dl
	addl	%edx, %eax
	movzbl	(%rcx), %r10d
	incq	%rcx
	testb	%r10b, %r10b
	jne	LBB138_375
LBB138_376:
	movss	524320(%r12), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	xorl	%ecx, %ecx
	cmpb	$0, _font_line_height(%rip)
	movl	$21, %edx
	cmovel	%ecx, %edx
	imull	%eax, %edx
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm1, %xmm0
	mulss	LCPI138_23(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, (%rsp)
	leaq	L_.str.28(%rip), %rcx
	leaq	-304(%rbp), %r14
	movl	$256, %edx              ## imm = 0x100
	movq	%r14, %rdi
	movl	$0, %esi
	xorl	%eax, %eax
	callq	___sprintf_chk
	movq	-320(%rbp), %r13        ## 8-byte Reload
	movl	(%r13), %ebx
	movq	%r14, %rdi
	callq	_strlen
	imull	_font_advance_x(%rip), %eax
	subl	%eax, %ebx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movq	%r13, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	movq	-352(%rbp), %rcx        ## 8-byte Reload
                                        ## kill: def $ecx killed $ecx killed $rcx
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	__draw_text
	movl	(%r13), %ecx
	movl	4(%r13), %r8d
	movl	$-42, %ebx
	subl	%r15d, %ebx
	addl	%r8d, %ebx
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%r13, %rdi
	xorl	%esi, %esi
	movl	%ebx, %edx
	movss	LCPI138_7(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	callq	_draw_rect
	leaq	L_.str.29(%rip), %rsi
	movq	%r13, %rdi
	movl	$0, %edx
	movl	%ebx, %ecx
	movss	LCPI138_7(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	__draw_text
	cmpq	%r12, _active_buffer(%rip)
	jne	LBB138_379
## %bb.377:
	testb	$1, _test_image_count(%rip)
	je	LBB138_379
## %bb.378:
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movl	(%rdi), %r8d
	movl	4(%rdi), %r9d
	movl	_update_and_render_buffer.frame(%rip), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rax
	imulq	$954437177, %rax, %rcx  ## imm = 0x38E38E39
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	shll	$2, %ecx
	leal	(%rcx,%rcx,8), %ecx
	subl	%ecx, %eax
	cltq
	leaq	(%rax,%rax,2), %rax
	leaq	_test_image(%rip), %rcx
	leaq	(%rcx,%rax,8), %rsi
	movss	LCPI138_11(%rip), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movl	$0, %edx
	xorl	%ecx, %ecx
	callq	_draw_img
	incl	_update_and_render_buffer.frame(%rip)
LBB138_379:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB138_381
## %bb.380:
	addq	$376, %rsp              ## imm = 0x178
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB138_381:
	callq	___stack_chk_fail
LBB138_382:
	leaq	L___func__.update_and_render_buffer(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.23(%rip), %rcx
	movl	$279, %edx              ## imm = 0x117
	callq	___assert_rtn
LBB138_383:
	leaq	L___func__.update_and_render_buffer(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.23(%rip), %rcx
	movl	$444, %edx              ## imm = 0x1BC
	callq	___assert_rtn
LBB138_384:
	leaq	L___func__.update_and_render_buffer(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.24(%rip), %rcx
	movl	$287, %edx              ## imm = 0x11F
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function update_and_render_the_editor
LCPI139_0:
	.long	1101529088              ## float 21
LCPI139_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI139_2:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_update_and_render_the_editor
	.p2align	4, 0x90
_update_and_render_the_editor:          ## @update_and_render_the_editor
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2184, %rsp             ## imm = 0x888
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, -2120(%rbp)       ## 8-byte Spill
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpb	$0, _update_and_render_the_editor.first_frame(%rip)
	movq	%rsi, -2216(%rbp)       ## 8-byte Spill
	jne	LBB139_14
## %bb.1:
	leaq	L_.str.30(%rip), %rdi
	movq	%rdi, _buffers+16(%rip)
	callq	_load_entire_file
	movq	%rax, _buffers(%rip)
	movq	%rax, %rdi
	callq	_strlen
	incl	%eax
	movl	%eax, _buffers+8(%rip)
	movl	$5, _buffers+524360(%rip)
	movq	-2120(%rbp), %rcx       ## 8-byte Reload
	movl	(%rcx), %eax
	addl	$-5, %eax
	movl	%eax, _buffers+524364(%rip)
	movl	$5, _buffers+524368(%rip)
	movl	4(%rcx), %eax
	addl	$-5, %eax
	movl	%eax, _buffers+524372(%rip)
	incl	_buffer_count(%rip)
	leaq	L_.str.31(%rip), %rsi
	leaq	-2208(%rbp), %rdi
	callq	_load_image
	movl	-2208(%rbp), %esi
	movl	-2204(%rbp), %ebx
	leaq	L_.str.32(%rip), %rdi
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	_printf
	movb	$1, _test_image_count(%rip)
	addl	$-50, %ebx
	movslq	-2200(%rbp), %rax
	movq	-2192(%rbp), %rcx
	imulq	$200, %rax, %rdx
	leaq	400(%rcx,%rdx), %rcx
	movl	$16, %edx
	leaq	_test_image(%rip), %rsi
	.p2align	4, 0x90
LBB139_2:                               ## =>This Inner Loop Header: Depth=1
	movl	$200, -16(%rdx,%rsi)
	movl	%ebx, -12(%rdx,%rsi)
	movl	%eax, -8(%rdx,%rsi)
	movq	%rcx, (%rdx,%rsi)
	addq	$24, %rdx
	addq	$1200, %rcx             ## imm = 0x4B0
	cmpq	$880, %rdx              ## imm = 0x370
	jne	LBB139_2
## %bb.3:
	leaq	L_.str.33(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB139_48
## %bb.4:
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	_fseek
	movq	%rbx, %rdi
	callq	_ftell
	movq	%rax, %r14
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_fseek
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, %r15
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rcx
	callq	_fread
	movq	%rbx, %rdi
	callq	_fclose
	leaq	-2096(%rbp), %rdi
	movq	%r15, -2224(%rbp)       ## 8-byte Spill
	movq	%r15, %rsi
	xorl	%edx, %edx
	callq	_stbtt_InitFont
	testl	%eax, %eax
	je	LBB139_49
## %bb.5:
	movb	$1, _font_line_height(%rip)
	movq	-2088(%rbp), %rax
	movslq	-2060(%rbp), %rcx
	movzbl	4(%rax,%rcx), %edx
	shll	$8, %edx
	movzbl	5(%rax,%rcx), %esi
	movswl	%dx, %edx
	orl	%esi, %edx
	movzbl	6(%rax,%rcx), %esi
	shll	$8, %esi
	movzbl	7(%rax,%rcx), %eax
	movswl	%si, %ecx
	orl	%eax, %ecx
	cvtsi2ssl	%edx, %xmm0
	subl	%ecx, %edx
	cvtsi2ssl	%edx, %xmm1
	movss	LCPI139_0(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm2
	movss	%xmm2, -2104(%rbp)      ## 4-byte Spill
	mulss	%xmm2, %xmm0
	callq	_roundf
	cvttss2si	%xmm0, %eax
	movl	%eax, -2140(%rbp)       ## 4-byte Spill
	movl	$32, %r15d
	leaq	-2096(%rbp), %rbx
	.p2align	4, 0x90
LBB139_6:                               ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt_FindGlyphIndex
	movq	-2088(%rbp), %rsi
	movslq	-2060(%rbp), %rcx
	movzbl	34(%rsi,%rcx), %edi
	shlq	$8, %rdi
	movzbl	35(%rsi,%rcx), %edx
	orq	%rdi, %rdx
	movslq	-2056(%rbp), %rcx
	addq	%rsi, %rcx
	movl	%eax, %esi
	subl	%edx, %esi
	jge	LBB139_8
## %bb.7:                               ##   in Loop: Header=BB139_6 Depth=1
	cltq
	movzwl	(%rcx,%rax,4), %r12d
	rolw	$8, %r12w
	leaq	2(%rcx,%rax,4), %rax
	jmp	LBB139_9
	.p2align	4, 0x90
LBB139_8:                               ##   in Loop: Header=BB139_6 Depth=1
	movzwl	-4(%rcx,%rdx,4), %r12d
	rolw	$8, %r12w
	leaq	(%rcx,%rdx,4), %rcx
	addl	%esi, %esi
	movslq	%esi, %rax
	addq	%rcx, %rax
LBB139_9:                               ##   in Loop: Header=BB139_6 Depth=1
	movzwl	(%rax), %eax
	rolw	$8, %ax
	movw	%ax, -2136(%rbp)        ## 2-byte Spill
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt_FindGlyphIndex
	movl	$0, -2112(%rbp)
	movl	$0, -2108(%rbp)
	movq	%rbx, %rdi
	movl	%eax, %esi
	leaq	-2112(%rbp), %rdx
	leaq	-2108(%rbp), %rcx
	leaq	-2148(%rbp), %r8
	leaq	-2144(%rbp), %r9
	callq	_stbtt_GetGlyphBox
	testl	%eax, %eax
	je	LBB139_10
## %bb.11:                              ##   in Loop: Header=BB139_6 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-2112(%rbp), %xmm0
	movss	-2104(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	xorps	%xmm2, %xmm2
	addss	%xmm2, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	xorl	%ecx, %ecx
	subl	-2144(%rbp), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$9, %xmm0, %xmm0
	cvttss2si	%xmm0, %r13d
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-2148(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %edx
	xorl	%ecx, %ecx
	subl	-2108(%rbp), %ecx
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %r14d
	jmp	LBB139_12
	.p2align	4, 0x90
LBB139_10:                              ##   in Loop: Header=BB139_6 Depth=1
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	xorl	%edx, %edx
	xorl	%r14d, %r14d
	movss	-2104(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
LBB139_12:                              ##   in Loop: Header=BB139_6 Depth=1
	subl	%eax, %edx
	movl	%edx, -2128(%rbp)       ## 4-byte Spill
	movswl	%r12w, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	subl	%r13d, %r14d
	addl	-2140(%rbp), %r13d      ## 4-byte Folded Reload
	mulss	%xmm1, %xmm0
	roundss	$10, %xmm0, %xmm0
	cvttss2si	%xmm0, %r12d
	movl	%r12d, _font_advance_x(%rip)
	movswl	-2136(%rbp), %eax       ## 2-byte Folded Reload
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	mulss	%xmm1, %xmm0
	callq	_roundf
	imull	%r12d, %r13d
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%r13d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %ebx
	cmpb	$0, _font_line_height(%rip)
	movl	$0, %eax
	movl	$21, %ecx
	cmovnel	%ecx, %eax
	imull	%r12d, %eax
	movslq	%eax, %rdi
	movl	$1, %esi
	callq	_calloc
	leaq	_font_bitmaps(%rip), %rcx
	movq	%rax, (%rcx,%r15,8)
	movslq	%ebx, %r13
	addq	%rax, %r13
	leaq	-2096(%rbp), %rbx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	_stbtt_FindGlyphIndex
	xorps	%xmm2, %xmm2
	pxor	%xmm3, %xmm3
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movl	-2128(%rbp), %edx       ## 4-byte Reload
	movl	%r14d, %ecx
	movl	%r12d, %r8d
	movss	-2104(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	movl	%eax, %r9d
	callq	_stbtt_MakeGlyphBitmapSubpixel
	incq	%r15
	cmpq	$127, %r15
	jne	LBB139_6
## %bb.13:
	movb	$1, _update_and_render_the_editor.first_frame(%rip)
	leaq	_buffers(%rip), %rax
	movq	%rax, _active_buffer(%rip)
	movq	-2224(%rbp), %rdi       ## 8-byte Reload
	callq	_free
	movq	-2216(%rbp), %r15       ## 8-byte Reload
LBB139_14:
	movq	-2120(%rbp), %rcx       ## 8-byte Reload
	movq	16(%rcx), %rdi
	movl	8(%rcx), %eax
	imull	4(%rcx), %eax
	shll	$2, %eax
	movslq	%eax, %rsi
	callq	___bzero
	cmpl	$0, 44(%r15)
	je	LBB139_27
## %bb.15:
	movq	_active_buffer(%rip), %rax
	testq	%rax, %rax
	je	LBB139_17
## %bb.16:
	cmpl	$0, 524340(%rax)
	jne	LBB139_27
LBB139_17:
	movslq	_buffer_count(%rip), %rcx
	testq	%rcx, %rcx
	jle	LBB139_42
## %bb.18:
	movl	24(%r15), %esi
	leaq	_buffers(%rip), %rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB139_19:                              ## =>This Inner Loop Header: Depth=1
	cmpl	524360(%rdx), %esi
	jl	LBB139_24
## %bb.20:                              ##   in Loop: Header=BB139_19 Depth=1
	cmpl	524364(%rdx), %esi
	jge	LBB139_24
## %bb.21:                              ##   in Loop: Header=BB139_19 Depth=1
	movl	28(%r15), %ebx
	cmpl	524368(%rdx), %ebx
	jl	LBB139_24
## %bb.22:                              ##   in Loop: Header=BB139_19 Depth=1
	cmpl	524372(%rdx), %ebx
	jl	LBB139_23
	.p2align	4, 0x90
LBB139_24:                              ##   in Loop: Header=BB139_19 Depth=1
	cmpq	%rax, %rdx
	jne	LBB139_26
## %bb.25:                              ##   in Loop: Header=BB139_19 Depth=1
	movq	$0, _active_buffer(%rip)
	xorl	%eax, %eax
LBB139_26:                              ##   in Loop: Header=BB139_19 Depth=1
	incq	%rdi
	addq	$524376, %rdx           ## imm = 0x80058
	cmpq	%rcx, %rdi
	jl	LBB139_19
LBB139_27:
	cmpl	$0, _buffer_count(%rip)
	jle	LBB139_42
LBB139_28:
	leaq	_buffers(%rip), %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB139_29:                              ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -2176(%rbp)
	movaps	%xmm0, -2192(%rbp)
	movaps	%xmm0, -2208(%rbp)
	movq	$0, -2160(%rbp)
	movl	$2048, %esi             ## imm = 0x800
	leaq	-2096(%rbp), %rdi
	callq	___bzero
	cmpq	_active_buffer(%rip), %rbx
	je	LBB139_30
## %bb.31:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	$0, 524340(%rbx)
	leaq	L_.str.35(%rip), %rax
	movq	%rax, -2208(%rbp)
	leaq	-2096(%rbp), %rax
	movq	%rax, -2192(%rbp)
	jmp	LBB139_32
	.p2align	4, 0x90
LBB139_30:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	48(%r15), %rax
	movq	%rax, -2160(%rbp)
	movq	40(%r15), %rax
	movq	%rax, -2168(%rbp)
	movq	32(%r15), %rax
	movq	%rax, -2176(%rbp)
	movq	24(%r15), %rax
	movq	%rax, -2184(%rbp)
	movq	16(%r15), %rax
	movq	%rax, -2192(%rbp)
	movq	(%r15), %rax
	movq	8(%r15), %rcx
	movq	%rcx, -2200(%rbp)
	movq	%rax, -2208(%rbp)
LBB139_32:                              ##   in Loop: Header=BB139_29 Depth=1
	movl	48(%r15), %eax
	movl	%eax, -2160(%rbp)
	movd	524360(%rbx), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	pinsrd	$1, 524368(%rbx), %xmm0
	movdqu	24(%r15), %xmm1
	pshufd	$68, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,0,1]
	psubd	%xmm0, %xmm1
	movdqu	%xmm1, -2184(%rbp)
	movq	%rbx, %rdi
	movq	-2120(%rbp), %rsi       ## 8-byte Reload
	leaq	-2208(%rbp), %rdx
	callq	_update_and_render_buffer
	cmpq	_active_buffer(%rip), %rbx
	je	LBB139_33
## %bb.34:                              ##   in Loop: Header=BB139_29 Depth=1
	cmpb	$1, _should_quit(%rip)
	je	LBB139_35
	jmp	LBB139_41
	.p2align	4, 0x90
LBB139_33:                              ##   in Loop: Header=BB139_29 Depth=1
	movl	524368(%rbx), %r12d
	movq	-2120(%rbp), %r13       ## 8-byte Reload
	movl	524360(%rbx), %r15d
	movl	524364(%rbx), %ecx
	movq	%rcx, -2136(%rbp)       ## 8-byte Spill
	movl	524372(%rbx), %r8d
	movq	%r8, -2128(%rbp)        ## 8-byte Spill
	leal	1(%r15), %ecx
	pxor	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%r13, %rdi
	movl	%r15d, %esi
	movl	%r12d, %edx
                                        ## kill: def $r8d killed $r8d killed $r8
	movss	LCPI139_1(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	movq	%r12, -2104(%rbp)       ## 8-byte Spill
	leal	1(%r12), %r8d
	pxor	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%r13, %rdi
	movl	%r15d, %esi
	movl	%r12d, %edx
	movq	-2136(%rbp), %r12       ## 8-byte Reload
	movl	%r12d, %ecx
	movss	LCPI139_1(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	movq	-2128(%rbp), %r8        ## 8-byte Reload
	leal	-1(%r8), %edx
	pxor	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%r13, %rdi
	movl	%r15d, %esi
	movq	%r13, %r15
	movl	%r12d, %ecx
	movq	%r8, %r13
	movss	LCPI139_1(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm3
	callq	_draw_rect
	leal	-1(%r12), %esi
	pxor	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movq	%r15, %rdi
	movq	-2104(%rbp), %rdx       ## 8-byte Reload
                                        ## kill: def $edx killed $edx killed $rdx
	movl	%r12d, %ecx
	movl	%r13d, %r8d
	movq	-2216(%rbp), %r15       ## 8-byte Reload
	movd	LCPI139_1(%rip), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movdqa	%xmm0, %xmm3
	callq	_draw_rect
	cmpb	$1, _should_quit(%rip)
	jne	LBB139_41
LBB139_35:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB139_41
## %bb.36:                              ##   in Loop: Header=BB139_29 Depth=1
	movl	$1025, %esi             ## imm = 0x401
	xorl	%eax, %eax
	callq	_open
	testl	%eax, %eax
	js	LBB139_39
## %bb.37:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	(%rbx), %rsi
	movslq	8(%rbx), %rdx
	decq	%rdx
	movl	%eax, %edi
	callq	_write
	testq	%rax, %rax
	jns	LBB139_41
## %bb.38:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	16(%rbx), %rsi
	leaq	L_.str.36(%rip), %rdi
	jmp	LBB139_40
LBB139_39:                              ##   in Loop: Header=BB139_29 Depth=1
	movq	16(%rbx), %rsi
	leaq	L_.str.37(%rip), %rdi
LBB139_40:                              ##   in Loop: Header=BB139_29 Depth=1
	xorl	%eax, %eax
	callq	_printf
	.p2align	4, 0x90
LBB139_41:                              ##   in Loop: Header=BB139_29 Depth=1
	incq	%r14
	movslq	_buffer_count(%rip), %rax
	addq	$524376, %rbx           ## imm = 0x80058
	cmpq	%rax, %r14
	jl	LBB139_29
LBB139_42:
	movq	_entry_completed@GOTPCREL(%rip), %rax
	movq	_entry_count@GOTPCREL(%rip), %rcx
	.p2align	4, 0x90
LBB139_43:                              ## =>This Inner Loop Header: Depth=1
	movl	(%rax), %edx
	cmpl	(%rcx), %edx
	jl	LBB139_43
## %bb.44:
	movl	$0, (%rcx)
	movq	_entry_curr@GOTPCREL(%rip), %rcx
	movl	$0, (%rcx)
	movl	$0, (%rax)
	movq	_finish@GOTPCREL(%rip), %rbx
	movl	$6, %edi
	movq	%rbx, %rsi
	callq	_clock_gettime
	movq	_start@GOTPCREL(%rip), %rax
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	subq	(%rax), %rcx
	imulq	$1000, %rcx, %rcx       ## imm = 0x3E8
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	subq	8(%rax), %rdx
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	divsd	LCPI139_2(%rip), %xmm0
	incl	_nframes(%rip)
	addsd	%xmm1, %xmm0
	movsd	_time_sum(%rip), %xmm1  ## xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, _time_sum(%rip)
	leaq	L_.str.38(%rip), %rdi
	movsd	%xmm0, -2104(%rbp)      ## 8-byte Spill
	movb	$1, %al
	callq	_printf
	cmpb	$1, _should_quit(%rip)
	jne	LBB139_46
## %bb.45:
	movsd	_time_sum(%rip), %xmm0  ## xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	cvtsi2sdl	_nframes(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	L_.str.39(%rip), %rdi
	movb	$1, %al
	callq	_printf
LBB139_46:
	movsd	-2104(%rbp), %xmm0      ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	cvtsd2ss	%xmm0, %xmm0
	callq	_roundf
	cvttss2si	%xmm0, %r8d
	leaq	L_.str.26(%rip), %rcx
	leaq	-2096(%rbp), %rdi
	movl	$32, %edx
	movl	$0, %esi
	xorl	%eax, %eax
	callq	___sprintf_chk
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB139_50
## %bb.47:
	addq	$2184, %rsp             ## imm = 0x888
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB139_23:
	movq	%rdx, _active_buffer(%rip)
	cmpl	$0, _buffer_count(%rip)
	jg	LBB139_28
	jmp	LBB139_42
LBB139_50:
	callq	___stack_chk_fail
LBB139_48:
	leaq	L___func__.update_and_render_the_editor(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.34(%rip), %rcx
	movl	$791, %edx              ## imm = 0x317
	callq	___assert_rtn
LBB139_49:
	leaq	L___func__.update_and_render_the_editor(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$800, %edx              ## imm = 0x320
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2232, %rsp             ## imm = 0x8B8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	l___const.main.back_buffer+8(%rip), %rax
	movq	%rax, -2256(%rbp)
	movq	l___const.main.back_buffer(%rip), %rax
	movq	%rax, -2264(%rbp)
	movl	$1920, -2256(%rbp)      ## imm = 0x780
	movl	$32, %edi
	callq	_SDL_Init
	leaq	L_.str.40(%rip), %rdi
	movl	$0, %esi
	xorl	%edx, %edx
	movl	$1920, %ecx             ## imm = 0x780
	movl	$1080, %r8d             ## imm = 0x438
	movl	$4, %r9d
	callq	_SDL_CreateWindow
	movq	%rax, %r14
	movq	%rax, %rdi
	movl	$-1, %esi
	movl	$6, %edx
	callq	_SDL_CreateRenderer
	movq	%rax, %rbx
	movq	%r14, %rdi
	movl	$1920, %esi             ## imm = 0x780
	movl	$1080, %edx             ## imm = 0x438
	callq	_SDL_SetWindowMinimumSize
	movq	%rbx, %rdi
	movl	$1920, %esi             ## imm = 0x780
	movl	$1080, %edx             ## imm = 0x438
	callq	_SDL_RenderSetLogicalSize
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	_SDL_RenderSetIntegerScale
	movq	%rbx, -2184(%rbp)       ## 8-byte Spill
	movq	%rbx, %rdi
	movl	$373694468, %esi        ## imm = 0x16462004
	movl	$1, %edx
	movl	$1920, %ecx             ## imm = 0x780
	movl	$1080, %r8d             ## imm = 0x438
	callq	_SDL_CreateTexture
	movq	%rax, -2176(%rbp)       ## 8-byte Spill
	movl	$8294400, %edi          ## imm = 0x7E9000
	movl	$1, %esi
	callq	_calloc
	movq	%rax, -2248(%rbp)
	testb	$15, %al
	jne	LBB140_34
## %bb.1:
	testq	%rax, %rax
	je	LBB140_35
## %bb.2:
	testq	%r14, %r14
	je	LBB140_36
## %bb.3:
	cmpq	$0, -2184(%rbp)         ## 8-byte Folded Reload
	je	LBB140_36
## %bb.4:
	cmpq	$0, -2176(%rbp)         ## 8-byte Folded Reload
	je	LBB140_36
## %bb.5:
	movq	_g_screen_buffer@GOTPCREL(%rip), %rax
	leaq	-2264(%rbp), %rcx
	movq	%rcx, (%rax)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -2208(%rbp)
	movaps	%xmm0, -2224(%rbp)
	movaps	%xmm0, -2240(%rbp)
	movq	$0, -2192(%rbp)
	cmpb	$0, _should_quit(%rip)
	jne	LBB140_32
## %bb.6:
	leaq	-2112(%rbp), %rdi
	leaq	-2168(%rbp), %r13
	.p2align	4, 0x90
LBB140_7:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB140_8 Depth 2
	movb	$0, -64(%rbp)
	movl	$2048, %esi             ## imm = 0x800
	movq	%rdi, %r14
	callq	___bzero
	leaq	-64(%rbp), %rax
	movq	%rax, -2240(%rbp)
	movl	$0, -2200(%rbp)
	jmp	LBB140_8
LBB140_30:                              ##   in Loop: Header=BB140_8 Depth=2
	xorl	%eax, %eax
	cmpl	$1025, %ebx             ## imm = 0x401
	sete	%al
	movl	%eax, -2196(%rbp)
	.p2align	4, 0x90
LBB140_8:                               ##   Parent Loop BB140_7 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%r13, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	je	LBB140_31
## %bb.9:                               ##   in Loop: Header=BB140_8 Depth=2
	movl	-2168(%rbp), %ebx
	cmpl	$770, %ebx              ## imm = 0x302
	jle	LBB140_10
## %bb.13:                              ##   in Loop: Header=BB140_8 Depth=2
	leal	-1025(%rbx), %eax
	cmpl	$2, %eax
	jb	LBB140_29
## %bb.14:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$771, %ebx              ## imm = 0x303
	je	LBB140_17
## %bb.15:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$1027, %ebx             ## imm = 0x403
	jne	LBB140_8
## %bb.16:                              ##   in Loop: Header=BB140_8 Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2ssl	-2148(%rbp), %xmm0
	movss	%xmm0, -2200(%rbp)
	jmp	LBB140_8
	.p2align	4, 0x90
LBB140_10:                              ##   in Loop: Header=BB140_8 Depth=2
	leal	-768(%rbx), %eax
	cmpl	$2, %eax
	jae	LBB140_11
## %bb.18:                              ##   in Loop: Header=BB140_8 Depth=2
	xorl	%r15d, %r15d
	cmpl	$768, %ebx              ## imm = 0x300
	sete	%r15b
	movl	-2148(%rbp), %eax
	cmpl	$27, %eax
	jne	LBB140_20
## %bb.19:                              ##   in Loop: Header=BB140_8 Depth=2
	movb	$1, _should_quit(%rip)
	jmp	LBB140_25
	.p2align	4, 0x90
LBB140_29:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpb	$1, -2152(%rbp)
	jne	LBB140_8
	jmp	LBB140_30
LBB140_11:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$256, %ebx              ## imm = 0x100
	jne	LBB140_8
## %bb.12:                              ##   in Loop: Header=BB140_8 Depth=2
	movb	$1, _should_quit(%rip)
	jmp	LBB140_8
LBB140_20:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$768, %ebx              ## imm = 0x300
	jne	LBB140_23
## %bb.21:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$9, %eax
	jne	LBB140_23
## %bb.22:                              ##   in Loop: Header=BB140_8 Depth=2
	movq	-2240(%rbp), %r12
	movq	%r12, %rdi
	callq	_strlen
	movw	$9, (%r12,%rax)
	jmp	LBB140_25
LBB140_17:                              ##   in Loop: Header=BB140_8 Depth=2
	movq	-2240(%rbp), %r12
	movq	%r12, %rdi
	callq	_strlen
	addq	%rax, %r12
	leaq	-2156(%rbp), %rbx
	movq	%rbx, %rdi
	callq	_strlen
	leaq	1(%rax), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_memcpy
	jmp	LBB140_8
LBB140_23:                              ##   in Loop: Header=BB140_8 Depth=2
	cmpl	$1073742048, %eax       ## imm = 0x400000E0
	jne	LBB140_25
## %bb.24:                              ##   in Loop: Header=BB140_8 Depth=2
	movl	%r15d, -2232(%rbp)
	.p2align	4, 0x90
LBB140_25:                              ##   in Loop: Header=BB140_8 Depth=2
	movslq	-2152(%rbp), %rax
	cmpl	$768, %ebx              ## imm = 0x300
	jne	LBB140_26
## %bb.27:                              ##   in Loop: Header=BB140_8 Depth=2
	movq	-2224(%rbp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	jne	LBB140_8
## %bb.28:                              ##   in Loop: Header=BB140_8 Depth=2
	movl	$1, -2112(%rbp,%rax,4)
	jmp	LBB140_8
LBB140_26:                              ##   in Loop: Header=BB140_8 Depth=2
	movl	%r15d, -2112(%rbp,%rax,4)
	jmp	LBB140_8
	.p2align	4, 0x90
LBB140_31:                              ##   in Loop: Header=BB140_7 Depth=1
	movq	%r14, -2224(%rbp)
	leaq	-2216(%rbp), %rdi
	leaq	-2212(%rbp), %rsi
	callq	_SDL_GetMouseState
	leaq	-2264(%rbp), %rdi
	leaq	-2240(%rbp), %rsi
	callq	_update_and_render_the_editor
	movq	-2184(%rbp), %rbx       ## 8-byte Reload
	movq	%rbx, %rdi
	callq	_SDL_RenderClear
	movq	-2248(%rbp), %rdx
	movq	-2176(%rbp), %r15       ## 8-byte Reload
	movq	%r15, %rdi
	xorl	%esi, %esi
	movl	$7680, %ecx             ## imm = 0x1E00
	callq	_SDL_UpdateTexture
	movq	%rbx, %rdi
	movq	%r15, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	callq	_SDL_RenderCopy
	movq	%rbx, %rdi
	callq	_SDL_RenderPresent
	movq	%r14, %rdi
	movq	-2216(%rbp), %rax
	movq	%rax, -2208(%rbp)
	cmpb	$1, _should_quit(%rip)
	jne	LBB140_7
LBB140_32:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB140_37
## %bb.33:
	xorl	%eax, %eax
	addq	$2232, %rsp             ## imm = 0x8B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB140_37:
	callq	___stack_chk_fail
LBB140_36:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.43(%rip), %rcx
	movl	$140, %edx
	callq	___assert_rtn
LBB140_34:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.41(%rip), %rcx
	movl	$138, %edx
	callq	___assert_rtn
LBB140_35:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	leaq	L_.str.42(%rip), %rcx
	movl	$139, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__stdio_read
_stbi__stdio_read:                      ## @stbi__stdio_read
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, %rax
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movl	$1, %esi
	movq	%rax, %rdi
	popq	%rbp
	jmp	_fread                  ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__stdio_skip
_stbi__stdio_skip:                      ## @stbi__stdio_skip
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movslq	%esi, %rsi
	movl	$1, %edx
	callq	_fseek
	movq	%rbx, %rdi
	callq	_fgetc
	cmpl	$-1, %eax
	je	LBB142_1
## %bb.2:
	movl	%eax, %edi
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ungetc                 ## TAILCALL
LBB142_1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__stdio_eof
_stbi__stdio_eof:                       ## @stbi__stdio_eof
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	_feof
	movl	%eax, %ecx
	movl	$1, %eax
	testl	%ecx, %ecx
	jne	LBB143_2
## %bb.1:
	movq	%rbx, %rdi
	callq	_ferror
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	setne	%al
LBB143_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbi__load_main
LCPI144_0:
	.long	77                      ## 0x4d
	.long	77                      ## 0x4d
	.long	77                      ## 0x4d
	.long	77                      ## 0x4d
LCPI144_1:
	.long	150                     ## 0x96
	.long	150                     ## 0x96
	.long	150                     ## 0x96
	.long	150                     ## 0x96
LCPI144_2:
	.long	29                      ## 0x1d
	.long	29                      ## 0x1d
	.long	29                      ## 0x1d
	.long	29                      ## 0x1d
LCPI144_3:
	.byte	1                       ## 0x1
	.byte	2                       ## 0x2
	.byte	5                       ## 0x5
	.byte	6                       ## 0x6
	.byte	9                       ## 0x9
	.byte	10                      ## 0xa
	.byte	13                      ## 0xd
	.byte	14                      ## 0xe
	.byte	9                       ## 0x9
	.byte	10                      ## 0xa
	.byte	13                      ## 0xd
	.byte	14                      ## 0xe
	.byte	13                      ## 0xd
	.byte	14                      ## 0xe
	.byte	15                      ## 0xf
	.byte	255                     ## 0xff
LCPI144_4:
	.byte	0                       ## 0x0
	.byte	1                       ## 0x1
	.byte	4                       ## 0x4
	.byte	5                       ## 0x5
	.byte	8                       ## 0x8
	.byte	9                       ## 0x9
	.byte	12                      ## 0xc
	.byte	13                      ## 0xd
	.byte	8                       ## 0x8
	.byte	9                       ## 0x9
	.byte	12                      ## 0xc
	.byte	13                      ## 0xd
	.byte	12                      ## 0xc
	.byte	13                      ## 0xd
	.byte	14                      ## 0xe
	.byte	15                      ## 0xf
LCPI144_5:
	.space	1
	.space	1
	.space	1
	.space	1
	.byte	0                       ## 0x0
	.byte	4                       ## 0x4
	.byte	8                       ## 0x8
	.byte	12                      ## 0xc
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_6:
	.byte	0                       ## 0x0
	.byte	4                       ## 0x4
	.byte	8                       ## 0x8
	.byte	12                      ## 0xc
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_7:
	.space	1
	.space	1
	.space	1
	.space	1
	.byte	1                       ## 0x1
	.byte	5                       ## 0x5
	.byte	9                       ## 0x9
	.byte	13                      ## 0xd
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_8:
	.byte	1                       ## 0x1
	.byte	5                       ## 0x5
	.byte	9                       ## 0x9
	.byte	13                      ## 0xd
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_9:
	.space	1
	.space	1
	.space	1
	.space	1
	.byte	2                       ## 0x2
	.byte	6                       ## 0x6
	.byte	10                      ## 0xa
	.byte	14                      ## 0xe
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_10:
	.byte	2                       ## 0x2
	.byte	6                       ## 0x6
	.byte	10                      ## 0xa
	.byte	14                      ## 0xe
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI144_11:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI144_12:
	.byte	0                       ## 0x0
	.byte	2                       ## 0x2
	.byte	4                       ## 0x4
	.byte	6                       ## 0x6
	.byte	8                       ## 0x8
	.byte	10                      ## 0xa
	.byte	12                      ## 0xc
	.byte	14                      ## 0xe
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbi__load_main:                       ## @stbi__load_main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        ## kill: def $r8d killed $r8d def $r8
	movq	%r8, -104(%rbp)         ## 8-byte Spill
	movq	%rcx, -184(%rbp)        ## 8-byte Spill
	movq	%rdx, -320(%rbp)        ## 8-byte Spill
	movq	%rsi, -312(%rbp)        ## 8-byte Spill
	movq	%rdi, %rbx
	movl	$0, 8(%r9)
	movq	%r9, -120(%rbp)         ## 8-byte Spill
	movq	$8, (%r9)
	leaq	56(%rdi), %r15
	leaq	57(%rdi), %r14
	movq	192(%rdi), %rcx
	movq	200(%rdi), %rax
	xorl	%r13d, %r13d
	leaq	_stbi__check_png_header.png_sig(%rip), %r12
	.p2align	4, 0x90
LBB144_1:                               ## =>This Inner Loop Header: Depth=1
	cmpq	%rax, %rcx
	jae	LBB144_3
## %bb.2:                               ##   in Loop: Header=BB144_1 Depth=1
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rcx), %edx
	movq	%rsi, %rcx
	cmpb	(%r13,%r12), %dl
	je	LBB144_9
	jmp	LBB144_12
	.p2align	4, 0x90
LBB144_3:                               ##   in Loop: Header=BB144_1 Depth=1
	cmpl	$0, 48(%rbx)
	je	LBB144_6
## %bb.4:                               ##   in Loop: Header=BB144_1 Depth=1
	movq	40(%rbx), %rdi
	movl	52(%rbx), %edx
	movq	%r15, %rsi
	callq	*16(%rbx)
	movl	192(%rbx), %ecx
	subl	208(%rbx), %ecx
	addl	%ecx, 184(%rbx)
	testl	%eax, %eax
	je	LBB144_7
## %bb.5:                               ##   in Loop: Header=BB144_1 Depth=1
	movq	%r15, 192(%rbx)
	cltq
	leaq	56(%rbx,%rax), %rax
	movzbl	56(%rbx), %edx
	jmp	LBB144_8
LBB144_6:                               ##   in Loop: Header=BB144_1 Depth=1
	xorl	%edx, %edx
	cmpb	(%r13,%r12), %dl
	je	LBB144_9
	jmp	LBB144_12
LBB144_7:                               ##   in Loop: Header=BB144_1 Depth=1
	movl	$0, 48(%rbx)
	movq	%r15, 192(%rbx)
	movb	$0, 56(%rbx)
	xorl	%edx, %edx
	movq	%r14, %rax
LBB144_8:                               ##   in Loop: Header=BB144_1 Depth=1
	movq	%rax, 200(%rbx)
	movq	%r14, 192(%rbx)
	movq	%r14, %rcx
	cmpb	(%r13,%r12), %dl
	jne	LBB144_12
LBB144_9:                               ##   in Loop: Header=BB144_1 Depth=1
	incq	%r13
	cmpq	$7, %r13
	jbe	LBB144_1
## %bb.10:
	movdqu	208(%rbx), %xmm0
	movdqu	%xmm0, 192(%rbx)
	movq	%rbx, -288(%rbp)
	movq	-104(%rbp), %r13        ## 8-byte Reload
	cmpl	$5, %r13d
	jb	LBB144_16
## %bb.11:
	leaq	L_.str.49(%rip), %rcx
	jmp	LBB144_13
LBB144_12:
	movups	208(%rbx), %xmm0
	movups	%xmm0, 192(%rbx)
	leaq	L_.str.47(%rip), %rcx
LBB144_13:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB144_14:
	xorl	%ebx, %ebx
LBB144_15:
	movq	%rbx, %rax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB144_16:
	leaq	-288(%rbp), %rdi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	%r13d, %edx
	callq	_stbi__parse_png_file
	testl	%eax, %eax
	je	LBB144_129
## %bb.17:
	movl	-256(%rbp), %ecx
	movl	$8, %eax
	cmpl	$9, %ecx
	jl	LBB144_19
## %bb.18:
	movl	$16, %eax
	cmpl	$16, %ecx
	jne	LBB144_130
LBB144_19:
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx)
	movq	-288(%rbp), %r15
	movq	-264(%rbp), %rbx
	movq	$0, -264(%rbp)
	testl	%r13d, %r13d
	je	LBB144_126
## %bb.20:
	movl	12(%r15), %ecx
	movq	%rcx, -176(%rbp)        ## 8-byte Spill
	cmpl	%r13d, %ecx
	movq	-184(%rbp), %r14        ## 8-byte Reload
	je	LBB144_127
## %bb.21:
	cmpl	$8, %eax
	movq	%rbx, -72(%rbp)         ## 8-byte Spill
	jne	LBB144_131
## %bb.22:
	movl	(%r15), %r12d
	movl	%r12d, %eax
	orl	%r13d, %eax
	js	LBB144_229
## %bb.23:
	movslq	4(%r15), %rsi
	testl	%r12d, %r12d
	je	LBB144_25
## %bb.24:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r12d
	cmpl	%r13d, %eax
	jl	LBB144_229
LBB144_25:
	movl	%r12d, %ecx
	imull	%r13d, %ecx
	movl	%ecx, %eax
	orl	%esi, %eax
	js	LBB144_229
## %bb.26:
	testl	%esi, %esi
	je	LBB144_28
## %bb.27:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%esi
	cmpl	%ecx, %eax
	jl	LBB144_229
LBB144_28:
	imull	%esi, %ecx
	movslq	%ecx, %rdi
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	callq	_malloc
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	testq	%rax, %rax
	je	LBB144_229
## %bb.29:
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	testl	%ecx, %ecx
	jle	LBB144_125
## %bb.30:
	movq	-176(%rbp), %rax        ## 8-byte Reload
	leal	(%r13,%rax,8), %r15d
	movq	-56(%rbp), %r14         ## 8-byte Reload
	leal	-1(%r14), %edx
	leaq	1(%rdx), %r8
	movl	%r14d, %ecx
	imull	%r13d, %ecx
	movl	%ecx, -120(%rbp)        ## 4-byte Spill
	movq	-96(%rbp), %r9          ## 8-byte Reload
	leaq	2(%r9,%rdx,2), %rdi
	movq	%rdi, -240(%rbp)        ## 8-byte Spill
	movl	%r14d, %edi
	imull	%eax, %edi
	movl	%edi, -76(%rbp)         ## 4-byte Spill
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	leaq	1(%rcx,%rdx), %rax
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	movl	%r14d, %edi
	andl	$15, %edi
	movl	$16, %eax
	cmovnel	%edi, %eax
	movq	%r8, %rsi
	subq	%rax, %rsi
	movl	%edx, %eax
	subl	%esi, %eax
	movl	%eax, -168(%rbp)        ## 4-byte Spill
	movq	%r8, -144(%rbp)         ## 8-byte Spill
	movq	%rdi, -232(%rbp)        ## 8-byte Spill
	subq	%rdi, %r8
	movl	%edx, %eax
	subl	%r8d, %eax
	movl	%eax, -216(%rbp)        ## 4-byte Spill
	movl	%r14d, %r13d
	andl	$3, %r13d
	addl	$-10, %r15d
	pcmpeqd	%xmm2, %xmm2
	movdqa	LCPI144_12(%rip), %xmm4 ## xmm4 = <0,2,4,6,8,10,12,14,u,u,u,u,u,u,u,u>
	movdqa	LCPI144_5(%rip), %xmm14 ## xmm14 = <u,u,u,u,0,4,8,12,u,u,u,u,u,u,u,u>
	movdqa	LCPI144_10(%rip), %xmm15 ## xmm15 = <2,6,10,14,u,u,u,u,u,u,u,u,u,u,u,u>
	movdqa	LCPI144_0(%rip), %xmm3  ## xmm3 = [77,77,77,77]
	movdqa	LCPI144_1(%rip), %xmm11 ## xmm11 = [150,150,150,150]
	movdqa	LCPI144_2(%rip), %xmm13 ## xmm13 = [29,29,29,29]
	movdqa	LCPI144_11(%rip), %xmm12 ## xmm12 = [1,255,255,255,5,255,255,255,9,255,255,255,13,255,255,255]
	leaq	1(%r9,%rdx), %rax
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	leaq	1(%rcx,%rdx,2), %rax
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	leaq	3(%rcx,%rdx,4), %rax
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	leal	-2(%r14), %eax
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	leaq	(,%rsi,4), %rax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	movq	%rsi, -136(%rbp)        ## 8-byte Spill
	leaq	(%rsi,%rsi), %rax
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	movq	%r8, -224(%rbp)         ## 8-byte Spill
	leaq	(%r8,%r8), %rax
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%r15, -112(%rbp)        ## 8-byte Spill
LBB144_31:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB144_82 Depth 2
                                        ##     Child Loop BB144_100 Depth 2
                                        ##     Child Loop BB144_113 Depth 2
                                        ##     Child Loop BB144_116 Depth 2
                                        ##     Child Loop BB144_97 Depth 2
                                        ##     Child Loop BB144_84 Depth 2
                                        ##     Child Loop BB144_95 Depth 2
                                        ##     Child Loop BB144_93 Depth 2
                                        ##     Child Loop BB144_64 Depth 2
                                        ##     Child Loop BB144_106 Depth 2
                                        ##     Child Loop BB144_118 Depth 2
                                        ##     Child Loop BB144_122 Depth 2
                                        ##     Child Loop BB144_53 Depth 2
                                        ##     Child Loop BB144_57 Depth 2
                                        ##     Child Loop BB144_48 Depth 2
                                        ##     Child Loop BB144_103 Depth 2
                                        ##     Child Loop BB144_108 Depth 2
                                        ##     Child Loop BB144_111 Depth 2
	cmpl	$25, %r15d
	ja	LBB144_233
## %bb.32:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%r9d, %r11d
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	addq	%rbx, %r11
	movl	%r12d, %eax
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	addq	%rcx, %rax
	movl	-120(%rbp), %edx        ## 4-byte Reload
	movl	%edx, %esi
	imull	%r8d, %esi
	movl	-76(%rbp), %edx         ## 4-byte Reload
	movl	%edx, %edi
	imull	%r8d, %edi
	movl	%r14d, %edx
	imull	%r8d, %edx
	movl	%edx, %r10d
	imull	-176(%rbp), %r10d       ## 4-byte Folded Reload
	addq	%rbx, %r10
	imull	-104(%rbp), %edx        ## 4-byte Folded Reload
	addq	%rcx, %rdx
	leaq	LJTI144_1(%rip), %rcx
	movq	%rcx, %rbx
	movslq	(%rcx,%r15,4), %rcx
	addq	%rbx, %rcx
	jmpq	*%rcx
LBB144_33:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.34:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpq	$16, -144(%rbp)         ## 8-byte Folded Reload
	jae	LBB144_78
## %bb.35:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	jmp	LBB144_110
LBB144_36:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.37:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_81
## %bb.38:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_82
	jmp	LBB144_123
LBB144_39:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.40:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_83
## %bb.41:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_84
	jmp	LBB144_123
LBB144_42:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.43:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpq	$16, -144(%rbp)         ## 8-byte Folded Reload
	ja	LBB144_85
## %bb.44:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	jmp	LBB144_115
LBB144_45:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.46:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$3, %r14b
	je	LBB144_101
## %bb.47:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
LBB144_48:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r11,%rsi), %eax
	movb	%al, 2(%rdx)
	movb	%al, 1(%rdx)
	movb	%al, (%rdx)
	addq	$3, %rdx
	incq	%rsi
	cmpl	%esi, %r13d
	jne	LBB144_48
## %bb.49:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ecx, %eax
	subl	%esi, %eax
	addq	%rsi, %r11
	movq	%r11, %r10
	cmpl	$3, %ecx
	jae	LBB144_102
	jmp	LBB144_123
LBB144_50:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.51:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movl	%ebx, %esi
	testb	$3, %r14b
	je	LBB144_55
## %bb.52:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%edi, %edi
	xorl	%edx, %edx
LBB144_53:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r11,%rdx), %ecx
	movb	%cl, 2(%rax,%rdx,4)
	movb	%cl, 1(%rax,%rdx,4)
	movb	%cl, (%rax,%rdx,4)
	movb	$-1, 3(%rax,%rdx,4)
	incq	%rdx
	addq	$-4, %rdi
	cmpl	%edx, %r13d
	jne	LBB144_53
## %bb.54:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ebx, %esi
	subl	%edx, %esi
	subq	%rdi, %rax
	addq	%rdx, %r11
	movq	%rax, %rdx
	movq	%r11, %r10
LBB144_55:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$3, %ebx
	jb	LBB144_123
## %bb.56:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%eax, %eax
LBB144_57:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rax), %ecx
	movb	%cl, 2(%rdx,%rax,4)
	movb	%cl, 1(%rdx,%rax,4)
	movb	%cl, (%rdx,%rax,4)
	movb	$-1, 3(%rdx,%rax,4)
	movzbl	1(%r10,%rax), %ecx
	movb	%cl, 6(%rdx,%rax,4)
	movb	%cl, 5(%rdx,%rax,4)
	movb	%cl, 4(%rdx,%rax,4)
	movb	$-1, 7(%rdx,%rax,4)
	movzbl	2(%r10,%rax), %ecx
	movb	%cl, 10(%rdx,%rax,4)
	movb	%cl, 9(%rdx,%rax,4)
	movb	%cl, 8(%rdx,%rax,4)
	movb	$-1, 11(%rdx,%rax,4)
	movzbl	3(%r10,%rax), %ecx
	movb	%cl, 14(%rdx,%rax,4)
	movb	%cl, 13(%rdx,%rax,4)
	movb	%cl, 12(%rdx,%rax,4)
	movb	$-1, 15(%rdx,%rax,4)
	addq	$4, %rax
	addl	$-4, %esi
	jns	LBB144_57
	jmp	LBB144_123
LBB144_58:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.59:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpq	$16, -144(%rbp)         ## 8-byte Folded Reload
	ja	LBB144_88
## %bb.60:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	jmp	LBB144_121
LBB144_61:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.62:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$3, %r14b
	je	LBB144_104
## %bb.63:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
LBB144_64:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r11,%rdi,2), %eax
	movb	%al, 2(%rdx)
	movb	%al, 1(%rdx)
	movb	%al, (%rdx)
	addq	$3, %rdx
	incq	%rdi
	addq	$-2, %rsi
	cmpl	%edi, %r13d
	jne	LBB144_64
## %bb.65:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ecx, %eax
	subl	%edi, %eax
	subq	%rsi, %r11
	movq	%r11, %r10
	cmpl	$3, %ecx
	jae	LBB144_105
	jmp	LBB144_123
LBB144_66:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.67:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_91
## %bb.68:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_92
	jmp	LBB144_123
LBB144_69:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.70:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_94
## %bb.71:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_95
	jmp	LBB144_123
LBB144_72:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.73:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_96
## %bb.74:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_97
	jmp	LBB144_123
LBB144_75:                              ##   in Loop: Header=BB144_31 Depth=1
	cmpl	$0, -48(%rbp)           ## 4-byte Folded Reload
	js	LBB144_123
## %bb.76:                              ##   in Loop: Header=BB144_31 Depth=1
	testb	$1, %r14b
	jne	LBB144_98
## %bb.77:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jne	LBB144_99
	jmp	LBB144_123
LBB144_78:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rsi), %r14
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rdi), %rcx
	cmpq	%rcx, %r14
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	jae	LBB144_107
## %bb.79:                              ##   in Loop: Header=BB144_31 Depth=1
	addq	-240(%rbp), %rsi        ## 8-byte Folded Reload
	addq	-72(%rbp), %rdi         ## 8-byte Folded Reload
	cmpq	%rsi, %rdi
	jae	LBB144_107
## %bb.80:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ecx, %eax
	movq	-56(%rbp), %r14         ## 8-byte Reload
	jmp	LBB144_110
LBB144_81:                              ##   in Loop: Header=BB144_31 Depth=1
	movb	(%r10), %al
	movb	%al, (%rdx)
	movb	1(%r10), %al
	movb	%al, 1(%rdx)
	movb	2(%r10), %al
	movb	%al, 2(%rdx)
	addq	$4, %r10
	addq	$3, %rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_82:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movb	%cl, (%rdx)
	movzbl	1(%r10), %ecx
	movb	%cl, 1(%rdx)
	movzbl	2(%r10), %ecx
	movb	%cl, 2(%rdx)
	movzbl	4(%r10), %ecx
	movb	%cl, 3(%rdx)
	movzbl	5(%r10), %ecx
	movb	%cl, 4(%rdx)
	movzbl	6(%r10), %ecx
	movb	%cl, 5(%rdx)
	addq	$8, %r10
	addq	$6, %rdx
	addl	$-2, %eax
	jns	LBB144_82
	jmp	LBB144_123
LBB144_83:                              ##   in Loop: Header=BB144_31 Depth=1
	movzbl	(%r10), %eax
	movzbl	1(%r10), %ecx
	movzbl	2(%r10), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	movb	%ah, (%rdx)
	movb	$-1, 1(%rdx)
	addq	$3, %r10
	addq	$2, %rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_84:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movzbl	1(%r10), %esi
	movzbl	2(%r10), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	movb	%ch, (%rdx)
	movb	$-1, 1(%rdx)
	movzbl	3(%r10), %ecx
	movzbl	4(%r10), %esi
	movzbl	5(%r10), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	movb	%ch, 2(%rdx)
	movb	$-1, 3(%rdx)
	addq	$6, %r10
	addq	$4, %rdx
	addl	$-2, %eax
	jns	LBB144_84
	jmp	LBB144_123
LBB144_85:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rsi), %rcx
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rdi), %r14
	cmpq	%r14, %rcx
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	jae	LBB144_112
## %bb.86:                              ##   in Loop: Header=BB144_31 Depth=1
	addq	-128(%rbp), %rsi        ## 8-byte Folded Reload
	addq	-72(%rbp), %rdi         ## 8-byte Folded Reload
	cmpq	%rsi, %rdi
	jae	LBB144_112
## %bb.87:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ecx, %eax
	movq	-56(%rbp), %r14         ## 8-byte Reload
	jmp	LBB144_115
LBB144_88:                              ##   in Loop: Header=BB144_31 Depth=1
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rsi), %r14
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rdi), %rcx
	cmpq	%rcx, %r14
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	jae	LBB144_117
## %bb.89:                              ##   in Loop: Header=BB144_31 Depth=1
	addq	-128(%rbp), %rsi        ## 8-byte Folded Reload
	addq	-72(%rbp), %rdi         ## 8-byte Folded Reload
	cmpq	%rsi, %rdi
	jae	LBB144_117
## %bb.90:                              ##   in Loop: Header=BB144_31 Depth=1
	movl	%ecx, %eax
	jmp	LBB144_120
LBB144_91:                              ##   in Loop: Header=BB144_31 Depth=1
	movb	(%r10), %al
	movb	%al, 2(%rdx)
	movb	%al, 1(%rdx)
	movb	%al, (%rdx)
	movb	1(%r10), %al
	movb	%al, 3(%rdx)
	addq	$2, %r10
	addq	$4, %rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_92:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
LBB144_93:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rsi), %ecx
	movb	%cl, 2(%rdx,%rsi,2)
	movb	%cl, 1(%rdx,%rsi,2)
	movb	%cl, (%rdx,%rsi,2)
	movzbl	1(%r10,%rsi), %ecx
	movb	%cl, 3(%rdx,%rsi,2)
	movzbl	2(%r10,%rsi), %ecx
	movb	%cl, 6(%rdx,%rsi,2)
	movb	%cl, 5(%rdx,%rsi,2)
	movb	%cl, 4(%rdx,%rsi,2)
	movzbl	3(%r10,%rsi), %ecx
	movb	%cl, 7(%rdx,%rsi,2)
	addq	$4, %rsi
	addl	$-2, %eax
	jns	LBB144_93
	jmp	LBB144_123
LBB144_94:                              ##   in Loop: Header=BB144_31 Depth=1
	movzbl	(%r10), %eax
	movzbl	1(%r10), %ecx
	movzbl	2(%r10), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	movb	%ah, (%rdx)
	addq	$3, %r10
	incq	%rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_95:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movzbl	1(%r10), %esi
	movzbl	2(%r10), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	movb	%ch, (%rdx)
	movzbl	3(%r10), %ecx
	movzbl	4(%r10), %esi
	movzbl	5(%r10), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	movb	%ch, 1(%rdx)
	addq	$6, %r10
	addq	$2, %rdx
	addl	$-2, %eax
	jns	LBB144_95
	jmp	LBB144_123
LBB144_96:                              ##   in Loop: Header=BB144_31 Depth=1
	movb	(%r10), %al
	movb	%al, (%rdx)
	movb	1(%r10), %al
	movb	%al, 1(%rdx)
	movb	2(%r10), %al
	movb	%al, 2(%rdx)
	movb	$-1, 3(%rdx)
	addq	$3, %r10
	addq	$4, %rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_97:                              ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movb	%cl, (%rdx)
	movzbl	1(%r10), %ecx
	movb	%cl, 1(%rdx)
	movzbl	2(%r10), %ecx
	movb	%cl, 2(%rdx)
	movb	$-1, 3(%rdx)
	movzbl	3(%r10), %ecx
	movb	%cl, 4(%rdx)
	movzbl	4(%r10), %ecx
	movb	%cl, 5(%rdx)
	movzbl	5(%r10), %ecx
	movb	%cl, 6(%rdx)
	movb	$-1, 7(%rdx)
	addq	$6, %r10
	addq	$8, %rdx
	addl	$-2, %eax
	jns	LBB144_97
	jmp	LBB144_123
LBB144_98:                              ##   in Loop: Header=BB144_31 Depth=1
	movzbl	(%r10), %eax
	movzbl	1(%r10), %ecx
	movzbl	2(%r10), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	movb	%ah, (%rdx)
	movb	3(%r10), %al
	movb	%al, 1(%rdx)
	addq	$4, %r10
	addq	$2, %rdx
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	testl	%ecx, %ecx
	je	LBB144_123
LBB144_99:                              ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
LBB144_100:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rsi,2), %ecx
	movzbl	1(%r10,%rsi,2), %edi
	movzbl	2(%r10,%rsi,2), %ebx
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%ecx, %edi
	leal	(%rbx,%rbx,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ebx, %ecx
	addl	%ebx, %ecx
	addl	%edi, %ecx
	movb	%ch, (%rdx,%rsi)
	movzbl	3(%r10,%rsi,2), %ecx
	movb	%cl, 1(%rdx,%rsi)
	movzbl	4(%r10,%rsi,2), %ecx
	movzbl	5(%r10,%rsi,2), %edi
	movzbl	6(%r10,%rsi,2), %ebx
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%ecx, %edi
	leal	(%rbx,%rbx,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ebx, %ecx
	addl	%ebx, %ecx
	addl	%edi, %ecx
	movb	%ch, 2(%rdx,%rsi)
	movzbl	7(%r10,%rsi,2), %ecx
	movb	%cl, 3(%rdx,%rsi)
	addq	$4, %rsi
	addl	$-2, %eax
	jns	LBB144_100
	jmp	LBB144_123
LBB144_101:                             ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	cmpl	$3, %ecx
	jb	LBB144_123
LBB144_102:                             ##   in Loop: Header=BB144_31 Depth=1
	addq	$11, %rdx
LBB144_103:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movb	%cl, -9(%rdx)
	movb	%cl, -10(%rdx)
	movb	%cl, -11(%rdx)
	movzbl	1(%r10), %ecx
	movb	%cl, -6(%rdx)
	movb	%cl, -7(%rdx)
	movb	%cl, -8(%rdx)
	movzbl	2(%r10), %ecx
	movb	%cl, -3(%rdx)
	movb	%cl, -4(%rdx)
	movb	%cl, -5(%rdx)
	movzbl	3(%r10), %ecx
	movb	%cl, (%rdx)
	movb	%cl, -1(%rdx)
	movb	%cl, -2(%rdx)
	addq	$12, %rdx
	addq	$4, %r10
	addl	$-4, %eax
	jns	LBB144_103
	jmp	LBB144_123
LBB144_104:                             ##   in Loop: Header=BB144_31 Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	cmpl	$3, %ecx
	jb	LBB144_123
LBB144_105:                             ##   in Loop: Header=BB144_31 Depth=1
	addq	$11, %rdx
LBB144_106:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10), %ecx
	movb	%cl, -9(%rdx)
	movb	%cl, -10(%rdx)
	movb	%cl, -11(%rdx)
	movzbl	2(%r10), %ecx
	movb	%cl, -6(%rdx)
	movb	%cl, -7(%rdx)
	movb	%cl, -8(%rdx)
	movzbl	4(%r10), %ecx
	movb	%cl, -3(%rdx)
	movb	%cl, -4(%rdx)
	movb	%cl, -5(%rdx)
	movzbl	6(%r10), %ecx
	movb	%cl, (%rdx)
	movb	%cl, -1(%rdx)
	movb	%cl, -2(%rdx)
	addq	$12, %rdx
	addq	$8, %r10
	addl	$-4, %eax
	jns	LBB144_106
	jmp	LBB144_123
LBB144_107:                             ##   in Loop: Header=BB144_31 Depth=1
	addq	-192(%rbp), %rdx        ## 8-byte Folded Reload
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	addq	%rcx, %r10
	xorl	%esi, %esi
	movq	-56(%rbp), %r14         ## 8-byte Reload
LBB144_108:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rsi), %xmm0
	movdqa	%xmm0, %xmm1
	punpcklbw	%xmm2, %xmm1    ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1],xmm1[2],xmm2[2],xmm1[3],xmm2[3],xmm1[4],xmm2[4],xmm1[5],xmm2[5],xmm1[6],xmm2[6],xmm1[7],xmm2[7]
	punpckhbw	%xmm2, %xmm0    ## xmm0 = xmm0[8],xmm2[8],xmm0[9],xmm2[9],xmm0[10],xmm2[10],xmm0[11],xmm2[11],xmm0[12],xmm2[12],xmm0[13],xmm2[13],xmm0[14],xmm2[14],xmm0[15],xmm2[15]
	movdqu	%xmm0, 16(%rax,%rsi,2)
	movdqu	%xmm1, (%rax,%rsi,2)
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	jne	LBB144_108
## %bb.109:                             ##   in Loop: Header=BB144_31 Depth=1
	movl	-216(%rbp), %eax        ## 4-byte Reload
	cmpl	$0, -232(%rbp)          ## 4-byte Folded Reload
	je	LBB144_123
LBB144_110:                             ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
LBB144_111:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rsi), %ecx
	movb	%cl, (%rdx,%rsi,2)
	movb	$-1, 1(%rdx,%rsi,2)
	incq	%rsi
	decl	%eax
	jns	LBB144_111
	jmp	LBB144_123
LBB144_112:                             ##   in Loop: Header=BB144_31 Depth=1
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	addq	%rcx, %rdx
	addq	-208(%rbp), %r10        ## 8-byte Folded Reload
	xorl	%esi, %esi
LBB144_113:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rsi,4), %xmm9
	movdqu	16(%r11,%rsi,4), %xmm10
	movdqu	32(%r11,%rsi,4), %xmm6
	movdqu	48(%r11,%rsi,4), %xmm1
	movdqa	%xmm1, %xmm4
	pshufb	%xmm14, %xmm4
	movdqa	%xmm6, %xmm8
	pshufb	%xmm14, %xmm8
	punpckldq	%xmm4, %xmm8    ## xmm8 = xmm8[0],xmm4[0],xmm8[1],xmm4[1]
	movdqa	%xmm10, %xmm4
	movdqa	LCPI144_6(%rip), %xmm0  ## xmm0 = <0,4,8,12,u,u,u,u,u,u,u,u,u,u,u,u>
	pshufb	%xmm0, %xmm4
	movdqa	%xmm9, %xmm5
	pshufb	%xmm0, %xmm5
	punpckldq	%xmm4, %xmm5    ## xmm5 = xmm5[0],xmm4[0],xmm5[1],xmm4[1]
	pblendw	$240, %xmm8, %xmm5      ## xmm5 = xmm5[0,1,2,3],xmm8[4,5,6,7]
	movdqa	%xmm1, %xmm7
	movdqa	LCPI144_7(%rip), %xmm0  ## xmm0 = <u,u,u,u,1,5,9,13,u,u,u,u,u,u,u,u>
	pshufb	%xmm0, %xmm7
	movdqa	%xmm6, %xmm4
	pshufb	%xmm0, %xmm4
	punpckldq	%xmm7, %xmm4    ## xmm4 = xmm4[0],xmm7[0],xmm4[1],xmm7[1]
	movdqa	%xmm10, %xmm0
	movdqa	LCPI144_8(%rip), %xmm7  ## xmm7 = <1,5,9,13,u,u,u,u,u,u,u,u,u,u,u,u>
	movdqa	%xmm7, %xmm2
	pshufb	%xmm7, %xmm0
	movdqa	%xmm9, %xmm7
	pshufb	%xmm2, %xmm7
	punpckldq	%xmm0, %xmm7    ## xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
	pblendw	$240, %xmm4, %xmm7      ## xmm7 = xmm7[0,1,2,3],xmm4[4,5,6,7]
	movdqa	LCPI144_9(%rip), %xmm0  ## xmm0 = <u,u,u,u,2,6,10,14,u,u,u,u,u,u,u,u>
	pshufb	%xmm0, %xmm1
	pshufb	%xmm0, %xmm6
	punpckldq	%xmm1, %xmm6    ## xmm6 = xmm6[0],xmm1[0],xmm6[1],xmm1[1]
	pshufb	%xmm15, %xmm10
	pshufb	%xmm15, %xmm9
	punpckldq	%xmm10, %xmm9   ## xmm9 = xmm9[0],xmm10[0],xmm9[1],xmm10[1]
	pshufd	$229, %xmm5, %xmm0      ## xmm0 = xmm5[1,1,2,3]
	pmovzxbd	%xmm0, %xmm0    ## xmm0 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pshufd	$231, %xmm5, %xmm1      ## xmm1 = xmm5[3,1,2,3]
	pmovzxbd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,zero,zero,xmm1[1],zero,zero,zero,xmm1[2],zero,zero,zero,xmm1[3],zero,zero,zero
	pshufd	$231, %xmm7, %xmm2      ## xmm2 = xmm7[3,1,2,3]
	pmovzxbd	%xmm2, %xmm10   ## xmm10 = xmm2[0],zero,zero,zero,xmm2[1],zero,zero,zero,xmm2[2],zero,zero,zero,xmm2[3],zero,zero,zero
	pmaddwd	%xmm3, %xmm1
	pmaddwd	%xmm11, %xmm10
	paddd	%xmm1, %xmm10
	pshufd	$229, %xmm7, %xmm1      ## xmm1 = xmm7[1,1,2,3]
	pmovzxbd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,zero,zero,xmm1[1],zero,zero,zero,xmm1[2],zero,zero,zero,xmm1[3],zero,zero,zero
	pmaddwd	%xmm3, %xmm0
	pmaddwd	%xmm11, %xmm1
	paddd	%xmm0, %xmm1
	pmovzxbd	%xmm5, %xmm0    ## xmm0 = xmm5[0],zero,zero,zero,xmm5[1],zero,zero,zero,xmm5[2],zero,zero,zero,xmm5[3],zero,zero,zero
	pmovzxbd	%xmm7, %xmm2    ## xmm2 = xmm7[0],zero,zero,zero,xmm7[1],zero,zero,zero,xmm7[2],zero,zero,zero,xmm7[3],zero,zero,zero
	pmaddwd	%xmm3, %xmm0
	pmaddwd	%xmm11, %xmm2
	paddd	%xmm0, %xmm2
	pblendw	$240, %xmm6, %xmm9      ## xmm9 = xmm9[0,1,2,3],xmm6[4,5,6,7]
	pshufd	$238, %xmm8, %xmm0      ## xmm0 = xmm8[2,3,2,3]
	pmovzxbd	%xmm0, %xmm0    ## xmm0 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pshufd	$238, %xmm4, %xmm4      ## xmm4 = xmm4[2,3,2,3]
	pmovzxbd	%xmm4, %xmm4    ## xmm4 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero,xmm4[2],zero,zero,zero,xmm4[3],zero,zero,zero
	pmaddwd	%xmm3, %xmm0
	pmaddwd	%xmm11, %xmm4
	paddd	%xmm0, %xmm4
	pmovzxbd	%xmm9, %xmm0    ## xmm0 = xmm9[0],zero,zero,zero,xmm9[1],zero,zero,zero,xmm9[2],zero,zero,zero,xmm9[3],zero,zero,zero
	pmaddwd	%xmm13, %xmm0
	paddd	%xmm2, %xmm0
	pshufd	$229, %xmm9, %xmm2      ## xmm2 = xmm9[1,1,2,3]
	pmovzxbd	%xmm2, %xmm2    ## xmm2 = xmm2[0],zero,zero,zero,xmm2[1],zero,zero,zero,xmm2[2],zero,zero,zero,xmm2[3],zero,zero,zero
	pmaddwd	%xmm13, %xmm2
	paddd	%xmm1, %xmm2
	pshufd	$231, %xmm9, %xmm1      ## xmm1 = xmm9[3,1,2,3]
	pmovzxbd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,zero,zero,xmm1[1],zero,zero,zero,xmm1[2],zero,zero,zero,xmm1[3],zero,zero,zero
	pmaddwd	%xmm13, %xmm1
	paddd	%xmm10, %xmm1
	pshufd	$238, %xmm6, %xmm5      ## xmm5 = xmm6[2,3,2,3]
	pmovzxbd	%xmm5, %xmm5    ## xmm5 = xmm5[0],zero,zero,zero,xmm5[1],zero,zero,zero,xmm5[2],zero,zero,zero,xmm5[3],zero,zero,zero
	pmaddwd	%xmm13, %xmm5
	paddd	%xmm4, %xmm5
	pshufb	%xmm12, %xmm0
	pshufb	%xmm12, %xmm2
	packusdw	%xmm2, %xmm0
	pshufb	%xmm12, %xmm1
	pshufb	%xmm12, %xmm5
	packusdw	%xmm1, %xmm5
	packuswb	%xmm5, %xmm0
	movdqu	%xmm0, (%rax,%rsi)
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	jne	LBB144_113
## %bb.114:                             ##   in Loop: Header=BB144_31 Depth=1
	movl	-168(%rbp), %eax        ## 4-byte Reload
	movq	-56(%rbp), %r14         ## 8-byte Reload
	pcmpeqd	%xmm2, %xmm2
	movdqa	LCPI144_12(%rip), %xmm4 ## xmm4 = <0,2,4,6,8,10,12,14,u,u,u,u,u,u,u,u>
LBB144_115:                             ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
LBB144_116:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rsi,4), %ecx
	movzbl	1(%r10,%rsi,4), %edi
	movzbl	2(%r10,%rsi,4), %ebx
	imull	$77, %ecx, %ecx
	imull	$150, %edi, %edi
	addl	%ecx, %edi
	leal	(%rbx,%rbx,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ebx, %ecx
	addl	%ebx, %ecx
	addl	%edi, %ecx
	movb	%ch, (%rdx,%rsi)
	incq	%rsi
	decl	%eax
	jns	LBB144_116
	jmp	LBB144_123
LBB144_117:                             ##   in Loop: Header=BB144_31 Depth=1
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	addq	%rcx, %rdx
	addq	-200(%rbp), %r10        ## 8-byte Folded Reload
	xorl	%esi, %esi
LBB144_118:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rsi,2), %xmm0
	movdqu	16(%r11,%rsi,2), %xmm1
	pshufb	%xmm4, %xmm1
	pshufb	%xmm4, %xmm0
	punpcklqdq	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0]
	movdqu	%xmm0, (%rax,%rsi)
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	jne	LBB144_118
## %bb.119:                             ##   in Loop: Header=BB144_31 Depth=1
	movl	-168(%rbp), %eax        ## 4-byte Reload
LBB144_120:                             ##   in Loop: Header=BB144_31 Depth=1
	movq	-56(%rbp), %r14         ## 8-byte Reload
LBB144_121:                             ##   in Loop: Header=BB144_31 Depth=1
	xorl	%esi, %esi
LBB144_122:                             ##   Parent Loop BB144_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r10,%rsi,2), %ecx
	movb	%cl, (%rdx,%rsi)
	incq	%rsi
	decl	%eax
	jns	LBB144_122
LBB144_123:                             ##   in Loop: Header=BB144_31 Depth=1
	incq	%r8
	addl	-76(%rbp), %r9d         ## 4-byte Folded Reload
	addl	-120(%rbp), %r12d       ## 4-byte Folded Reload
	cmpq	-64(%rbp), %r8          ## 8-byte Folded Reload
	movq	-112(%rbp), %r15        ## 8-byte Reload
	jl	LBB144_31
## %bb.124:
	movq	-288(%rbp), %r15
	movq	-184(%rbp), %r14        ## 8-byte Reload
	movq	-104(%rbp), %r13        ## 8-byte Reload
LBB144_125:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	_free
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	jmp	LBB144_228
LBB144_126:
	movq	-184(%rbp), %r14        ## 8-byte Reload
LBB144_127:
	movl	(%r15), %eax
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx)
	movl	4(%r15), %eax
	movq	-320(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx)
	testq	%r14, %r14
	je	LBB144_129
## %bb.128:
	movl	8(%r15), %eax
	movl	%eax, (%r14)
LBB144_129:
	movq	-264(%rbp), %rdi
	callq	_free
	movq	$0, -264(%rbp)
	movq	-272(%rbp), %rdi
	callq	_free
	movq	$0, -272(%rbp)
	movq	-280(%rbp), %rdi
	callq	_free
	movq	$0, -280(%rbp)
	jmp	LBB144_15
LBB144_130:
	leaq	L_.str.50(%rip), %rcx
	jmp	LBB144_13
LBB144_131:
	movl	(%r15), %eax
	movslq	4(%r15), %r14
	movl	%r13d, %edi
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	imull	%eax, %edi
	imull	%r14d, %edi
	addl	%edi, %edi
	callq	_malloc
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB144_230
## %bb.132:
	movq	%r15, -248(%rbp)        ## 8-byte Spill
	testl	%r14d, %r14d
	jle	LBB144_227
## %bb.133:
	movq	-176(%rbp), %rax        ## 8-byte Reload
	leal	(%r13,%rax,8), %esi
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rbx
	leal	-1(%rcx), %r8d
	leaq	1(%r8), %r9
	movl	%ebx, %edx
	imull	%r13d, %edx
	movl	%edx, -48(%rbp)         ## 4-byte Spill
	movq	-112(%rbp), %r10        ## 8-byte Reload
	leaq	4(%r10,%r8,4), %rdi
	movq	%rdi, -224(%rbp)        ## 8-byte Spill
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edi, -96(%rbp)         ## 4-byte Spill
	andl	$7, %ecx
	movl	$8, %eax
	cmovnel	%ecx, %eax
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	leaq	2(%rdi,%r8,2), %rdx
	movq	%rdx, -168(%rbp)        ## 8-byte Spill
	movq	%r9, %rdx
	subq	%rax, %rdx
	movl	%r8d, %eax
	subl	%edx, %eax
	movl	%eax, -152(%rbp)        ## 4-byte Spill
	movq	%r9, -88(%rbp)          ## 8-byte Spill
	movq	%rcx, -216(%rbp)        ## 8-byte Spill
	subq	%rcx, %r9
	movl	%r8d, %eax
	subl	%r9d, %eax
	movl	%eax, -200(%rbp)        ## 4-byte Spill
	movl	%ebx, %eax
	andl	$3, %eax
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	addl	$-10, %esi
	pcmpeqd	%xmm2, %xmm2
	movdqa	LCPI144_4(%rip), %xmm9  ## xmm9 = [0,1,4,5,8,9,12,13,8,9,12,13,12,13,14,15]
	movdqa	LCPI144_0(%rip), %xmm10 ## xmm10 = [77,77,77,77]
	movdqa	LCPI144_1(%rip), %xmm11 ## xmm11 = [150,150,150,150]
	movdqa	LCPI144_2(%rip), %xmm12 ## xmm12 = [29,29,29,29]
	movdqa	LCPI144_3(%rip), %xmm13 ## xmm13 = [1,2,5,6,9,10,13,14,9,10,13,14,13,14,15,255]
	leaq	2(%r10,%r8,2), %rax
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	leaq	2(%rdi,%r8,4), %rax
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	leaq	6(%rdi,%r8,8), %rax
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	leal	-2(%rbx), %eax
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	leaq	(,%rdx,4), %rax
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	leaq	(%rdx,%rdx), %rax
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	movq	%r9, -208(%rbp)         ## 8-byte Spill
	leaq	(%r9,%r9), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movl	$0, -76(%rbp)           ## 4-byte Folded Spill
	xorl	%r10d, %r10d
	movq	%rsi, -144(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB144_134:                             ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB144_182 Depth 2
                                        ##     Child Loop BB144_203 Depth 2
                                        ##     Child Loop BB144_211 Depth 2
                                        ##     Child Loop BB144_214 Depth 2
                                        ##     Child Loop BB144_200 Depth 2
                                        ##     Child Loop BB144_190 Depth 2
                                        ##     Child Loop BB144_195 Depth 2
                                        ##     Child Loop BB144_193 Depth 2
                                        ##     Child Loop BB144_173 Depth 2
                                        ##     Child Loop BB144_209 Depth 2
                                        ##     Child Loop BB144_221 Depth 2
                                        ##     Child Loop BB144_225 Depth 2
                                        ##     Child Loop BB144_162 Depth 2
                                        ##     Child Loop BB144_166 Depth 2
                                        ##     Child Loop BB144_151 Depth 2
                                        ##     Child Loop BB144_206 Depth 2
                                        ##     Child Loop BB144_216 Depth 2
                                        ##     Child Loop BB144_219 Depth 2
	cmpl	$25, %esi
	ja	LBB144_232
## %bb.135:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r8, %r9
	movl	-76(%rbp), %eax         ## 4-byte Reload
	movq	-72(%rbp), %r12         ## 8-byte Reload
	leaq	(%r12,%rax,2), %r11
	movl	-120(%rbp), %ecx        ## 4-byte Reload
	movq	-112(%rbp), %r8         ## 8-byte Reload
	leaq	(%r8,%rcx,2), %r15
	movl	-48(%rbp), %ecx         ## 4-byte Reload
                                        ## kill: def $ecx killed $ecx def $rcx
	imull	%r10d, %ecx
	movl	-96(%rbp), %edx         ## 4-byte Reload
	movl	%edx, %edi
	imull	%r10d, %edi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: def $edx killed $edx killed $rdx def $rdx
	imull	%r10d, %edx
	movl	%edx, %ebx
	imull	-176(%rbp), %ebx        ## 4-byte Folded Reload
	leaq	(%r12,%rbx,2), %r12
	imull	%r13d, %edx
	leaq	(%r8,%rdx,2), %rdx
	leaq	LJTI144_0(%rip), %rbx
	movq	%rbx, %rax
	movslq	(%rbx,%rsi,4), %rbx
	addq	%rax, %rbx
	jmpq	*%rbx
LBB144_136:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.137:                             ##   in Loop: Header=BB144_134 Depth=1
	cmpq	$8, -88(%rbp)           ## 8-byte Folded Reload
	jae	LBB144_186
## %bb.138:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	jmp	LBB144_218
LBB144_139:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.140:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_181
## %bb.141:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_182
	jmp	LBB144_226
LBB144_142:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.143:                             ##   in Loop: Header=BB144_134 Depth=1
	cmpq	$8, -88(%rbp)           ## 8-byte Folded Reload
	ja	LBB144_183
## %bb.144:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	jmp	LBB144_213
LBB144_145:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.146:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_189
## %bb.147:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_190
	jmp	LBB144_226
LBB144_148:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.149:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$3, -64(%rbp)           ## 1-byte Folded Reload
	je	LBB144_204
## %bb.150:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	.p2align	4, 0x90
LBB144_151:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r11,%rdi,2), %ecx
	movw	%cx, 4(%rdx)
	movw	%cx, 2(%rdx)
	movw	%cx, (%rdx)
	addq	$6, %rdx
	incq	%rdi
	addq	$-2, %rsi
	cmpl	%edi, %ebx
	jne	LBB144_151
## %bb.152:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	subl	%edi, %ecx
	subq	%rsi, %r11
	movq	%r11, %r12
	cmpl	$3, %r8d
	jae	LBB144_205
	jmp	LBB144_226
LBB144_153:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.154:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_191
## %bb.155:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_192
	jmp	LBB144_226
LBB144_156:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.157:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_194
## %bb.158:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_195
	jmp	LBB144_226
LBB144_159:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.160:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	testb	$3, -64(%rbp)           ## 1-byte Folded Reload
	je	LBB144_164
## %bb.161:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%edx, %edx
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	movq	-128(%rbp), %rsi        ## 8-byte Reload
	.p2align	4, 0x90
LBB144_162:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r11,%rbx,2), %ecx
	movw	%cx, 4(%r15,%rbx,8)
	movw	%cx, 2(%r15,%rbx,8)
	movw	%cx, (%r15,%rbx,8)
	movw	$-1, 6(%r15,%rbx,8)
	incq	%rbx
	addq	$-8, %rdi
	addq	$-2, %rdx
	cmpl	%ebx, %esi
	jne	LBB144_162
## %bb.163:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	subl	%ebx, %ecx
	subq	%rdi, %r15
	subq	%rdx, %r11
	movq	%r15, %rdx
	movq	%r11, %r12
LBB144_164:                             ##   in Loop: Header=BB144_134 Depth=1
	cmpl	$3, %r8d
	jb	LBB144_226
## %bb.165:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%eax, %eax
LBB144_166:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rax), %esi
	movw	%si, 4(%rdx,%rax,4)
	movw	%si, 2(%rdx,%rax,4)
	movw	%si, (%rdx,%rax,4)
	movw	$-1, 6(%rdx,%rax,4)
	movzwl	2(%r12,%rax), %esi
	movw	%si, 12(%rdx,%rax,4)
	movw	%si, 10(%rdx,%rax,4)
	movw	%si, 8(%rdx,%rax,4)
	movw	$-1, 14(%rdx,%rax,4)
	movzwl	4(%r12,%rax), %esi
	movw	%si, 20(%rdx,%rax,4)
	movw	%si, 18(%rdx,%rax,4)
	movw	%si, 16(%rdx,%rax,4)
	movw	$-1, 22(%rdx,%rax,4)
	movzwl	6(%r12,%rax), %esi
	movw	%si, 28(%rdx,%rax,4)
	movw	%si, 26(%rdx,%rax,4)
	movw	%si, 24(%rdx,%rax,4)
	movw	$-1, 30(%rdx,%rax,4)
	addq	$8, %rax
	addl	$-4, %ecx
	jns	LBB144_166
	jmp	LBB144_226
LBB144_167:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.168:                             ##   in Loop: Header=BB144_134 Depth=1
	cmpq	$8, -88(%rbp)           ## 8-byte Folded Reload
	ja	LBB144_196
## %bb.169:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	jmp	LBB144_224
LBB144_170:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.171:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$3, -64(%rbp)           ## 1-byte Folded Reload
	je	LBB144_207
## %bb.172:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	.p2align	4, 0x90
LBB144_173:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r11,%rdi,4), %ecx
	movw	%cx, 4(%rdx)
	movw	%cx, 2(%rdx)
	movw	%cx, (%rdx)
	addq	$6, %rdx
	incq	%rdi
	addq	$-4, %rsi
	cmpl	%edi, %ebx
	jne	LBB144_173
## %bb.174:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	subl	%edi, %ecx
	subq	%rsi, %r11
	movq	%r11, %r12
	cmpl	$3, %r8d
	jae	LBB144_208
	jmp	LBB144_226
LBB144_175:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.176:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_199
## %bb.177:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_200
	jmp	LBB144_226
LBB144_178:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	%r9, %r8
	testl	%r8d, %r8d
	js	LBB144_226
## %bb.179:                             ##   in Loop: Header=BB144_134 Depth=1
	testb	$1, -64(%rbp)           ## 1-byte Folded Reload
	jne	LBB144_201
## %bb.180:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	testl	%r8d, %r8d
	jne	LBB144_202
	jmp	LBB144_226
LBB144_181:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movw	%ax, (%rdx)
	movzwl	2(%r12), %eax
	movw	%ax, 2(%rdx)
	movzwl	4(%r12), %eax
	movw	%ax, 4(%rdx)
	addq	$8, %r12
	addq	$6, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
	.p2align	4, 0x90
LBB144_182:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %ecx
	movw	%cx, (%rdx)
	movzwl	2(%r12), %ecx
	movw	%cx, 2(%rdx)
	movzwl	4(%r12), %ecx
	movw	%cx, 4(%rdx)
	movzwl	8(%r12), %ecx
	movw	%cx, 6(%rdx)
	movzwl	10(%r12), %ecx
	movw	%cx, 8(%rdx)
	movzwl	12(%r12), %ecx
	movw	%cx, 10(%rdx)
	addq	$16, %r12
	addq	$12, %rdx
	addl	$-2, %eax
	jns	LBB144_182
	jmp	LBB144_226
LBB144_183:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rcx,2), %rbx
	movq	-232(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %r13
	cmpq	%r13, %rbx
	jae	LBB144_210
## %bb.184:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rcx,2), %rcx
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %rdi
	cmpq	%rcx, %rdi
	jae	LBB144_210
## %bb.185:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	movq	-104(%rbp), %r13        ## 8-byte Reload
	jmp	LBB144_213
LBB144_186:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rcx,2), %r13
	movq	-168(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %rbx
	cmpq	%rbx, %r13
	jae	LBB144_215
## %bb.187:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-224(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rcx,2), %rcx
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %rdi
	cmpq	%rcx, %rdi
	jae	LBB144_215
## %bb.188:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	movq	-104(%rbp), %r13        ## 8-byte Reload
	jmp	LBB144_218
LBB144_189:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movzwl	2(%r12), %ecx
	movzwl	4(%r12), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	shrl	$8, %eax
	movw	%ax, (%rdx)
	movw	$-1, 2(%rdx)
	addq	$6, %r12
	addq	$4, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
	.p2align	4, 0x90
LBB144_190:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %ecx
	movzwl	2(%r12), %esi
	movzwl	4(%r12), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	shrl	$8, %ecx
	movw	%cx, (%rdx)
	movw	$-1, 2(%rdx)
	movzwl	6(%r12), %ecx
	movzwl	8(%r12), %esi
	movzwl	10(%r12), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	shrl	$8, %ecx
	movw	%cx, 4(%rdx)
	movw	$-1, 6(%rdx)
	addq	$12, %r12
	addq	$8, %rdx
	addl	$-2, %eax
	jns	LBB144_190
	jmp	LBB144_226
LBB144_191:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movw	%ax, 4(%rdx)
	movw	%ax, 2(%rdx)
	movw	%ax, (%rdx)
	movzwl	2(%r12), %eax
	movw	%ax, 6(%rdx)
	addq	$4, %r12
	addq	$8, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
LBB144_192:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB144_193:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rcx), %esi
	movw	%si, 4(%rdx,%rcx,2)
	movw	%si, 2(%rdx,%rcx,2)
	movw	%si, (%rdx,%rcx,2)
	movzwl	2(%r12,%rcx), %esi
	movw	%si, 6(%rdx,%rcx,2)
	movzwl	4(%r12,%rcx), %esi
	movw	%si, 12(%rdx,%rcx,2)
	movw	%si, 10(%rdx,%rcx,2)
	movw	%si, 8(%rdx,%rcx,2)
	movzwl	6(%r12,%rcx), %esi
	movw	%si, 14(%rdx,%rcx,2)
	addq	$8, %rcx
	addl	$-2, %eax
	jns	LBB144_193
	jmp	LBB144_226
LBB144_194:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movzwl	2(%r12), %ecx
	movzwl	4(%r12), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	shrl	$8, %eax
	movw	%ax, (%rdx)
	addq	$6, %r12
	addq	$2, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
	.p2align	4, 0x90
LBB144_195:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %ecx
	movzwl	2(%r12), %esi
	movzwl	4(%r12), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	shrl	$8, %ecx
	movw	%cx, (%rdx)
	movzwl	6(%r12), %ecx
	movzwl	8(%r12), %esi
	movzwl	10(%r12), %edi
	imull	$77, %ecx, %ecx
	imull	$150, %esi, %esi
	addl	%ecx, %esi
	leal	(%rdi,%rdi,8), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%edi, %ecx
	addl	%edi, %ecx
	addl	%esi, %ecx
	shrl	$8, %ecx
	movw	%cx, 2(%rdx)
	addq	$12, %r12
	addq	$4, %rdx
	addl	$-2, %eax
	jns	LBB144_195
	jmp	LBB144_226
LBB144_196:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rcx,2), %r13
	movq	-240(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %rbx
	cmpq	%rbx, %r13
	jae	LBB144_220
## %bb.197:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rcx,2), %rcx
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	leaq	(%rsi,%rdi,2), %rdi
	cmpq	%rcx, %rdi
	jae	LBB144_220
## %bb.198:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %eax
	jmp	LBB144_223
LBB144_199:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movw	%ax, (%rdx)
	movzwl	2(%r12), %eax
	movw	%ax, 2(%rdx)
	movzwl	4(%r12), %eax
	movw	%ax, 4(%rdx)
	movw	$-1, 6(%rdx)
	addq	$6, %r12
	addq	$8, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
	.p2align	4, 0x90
LBB144_200:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %ecx
	movw	%cx, (%rdx)
	movzwl	2(%r12), %ecx
	movw	%cx, 2(%rdx)
	movzwl	4(%r12), %ecx
	movw	%cx, 4(%rdx)
	movw	$-1, 6(%rdx)
	movzwl	6(%r12), %ecx
	movw	%cx, 8(%rdx)
	movzwl	8(%r12), %ecx
	movw	%cx, 10(%rdx)
	movzwl	10(%r12), %ecx
	movw	%cx, 12(%rdx)
	movw	$-1, 14(%rdx)
	addq	$12, %r12
	addq	$16, %rdx
	addl	$-2, %eax
	jns	LBB144_200
	jmp	LBB144_226
LBB144_201:                             ##   in Loop: Header=BB144_134 Depth=1
	movzwl	(%r12), %eax
	movzwl	2(%r12), %ecx
	movzwl	4(%r12), %esi
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%eax, %ecx
	leal	(%rsi,%rsi,8), %eax
	leal	(%rax,%rax,2), %eax
	addl	%esi, %eax
	addl	%esi, %eax
	addl	%ecx, %eax
	shrl	$8, %eax
	movw	%ax, (%rdx)
	movzwl	6(%r12), %eax
	movw	%ax, 2(%rdx)
	addq	$8, %r12
	addq	$4, %rdx
	movl	-56(%rbp), %eax         ## 4-byte Reload
	testl	%r8d, %r8d
	je	LBB144_226
LBB144_202:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB144_203:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rcx,2), %esi
	movzwl	2(%r12,%rcx,2), %edi
	movzwl	4(%r12,%rcx,2), %ebx
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%esi, %edi
	leal	(%rbx,%rbx,8), %esi
	leal	(%rsi,%rsi,2), %esi
	addl	%ebx, %esi
	addl	%ebx, %esi
	addl	%edi, %esi
	shrl	$8, %esi
	movw	%si, (%rdx,%rcx)
	movzwl	6(%r12,%rcx,2), %esi
	movw	%si, 2(%rdx,%rcx)
	movzwl	8(%r12,%rcx,2), %esi
	movzwl	10(%r12,%rcx,2), %edi
	movzwl	12(%r12,%rcx,2), %ebx
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%esi, %edi
	leal	(%rbx,%rbx,8), %esi
	leal	(%rsi,%rsi,2), %esi
	addl	%ebx, %esi
	addl	%ebx, %esi
	addl	%edi, %esi
	shrl	$8, %esi
	movw	%si, 4(%rdx,%rcx)
	movzwl	14(%r12,%rcx,2), %esi
	movw	%si, 6(%rdx,%rcx)
	addq	$8, %rcx
	addl	$-2, %eax
	jns	LBB144_203
	jmp	LBB144_226
LBB144_204:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	cmpl	$3, %r8d
	jb	LBB144_226
LBB144_205:                             ##   in Loop: Header=BB144_134 Depth=1
	addq	$22, %rdx
LBB144_206:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %eax
	movw	%ax, -18(%rdx)
	movw	%ax, -20(%rdx)
	movw	%ax, -22(%rdx)
	movzwl	2(%r12), %eax
	movw	%ax, -12(%rdx)
	movw	%ax, -14(%rdx)
	movw	%ax, -16(%rdx)
	movzwl	4(%r12), %eax
	movw	%ax, -6(%rdx)
	movw	%ax, -8(%rdx)
	movw	%ax, -10(%rdx)
	movzwl	6(%r12), %eax
	movw	%ax, (%rdx)
	movw	%ax, -2(%rdx)
	movw	%ax, -4(%rdx)
	addq	$24, %rdx
	addq	$8, %r12
	addl	$-4, %ecx
	jns	LBB144_206
	jmp	LBB144_226
LBB144_207:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	%r8d, %ecx
	cmpl	$3, %r8d
	jb	LBB144_226
LBB144_208:                             ##   in Loop: Header=BB144_134 Depth=1
	addq	$22, %rdx
LBB144_209:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12), %eax
	movw	%ax, -18(%rdx)
	movw	%ax, -20(%rdx)
	movw	%ax, -22(%rdx)
	movzwl	4(%r12), %eax
	movw	%ax, -12(%rdx)
	movw	%ax, -14(%rdx)
	movw	%ax, -16(%rdx)
	movzwl	8(%r12), %eax
	movw	%ax, -6(%rdx)
	movw	%ax, -8(%rdx)
	movw	%ax, -10(%rdx)
	movzwl	12(%r12), %eax
	movw	%ax, (%rdx)
	movw	%ax, -2(%rdx)
	movw	%ax, -4(%rdx)
	addq	$24, %rdx
	addq	$16, %r12
	addl	$-4, %ecx
	jns	LBB144_209
	jmp	LBB144_226
LBB144_210:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rdx,%rcx,2), %rdx
	movq	-192(%rbp), %rsi        ## 8-byte Reload
	leaq	(%r12,%rsi,2), %r12
	xorl	%edi, %edi
LBB144_211:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rdi,8), %xmm6
	movdqu	16(%r11,%rdi,8), %xmm7
	movdqu	32(%r11,%rdi,8), %xmm14
	movdqu	48(%r11,%rdi,8), %xmm15
	pshufd	$232, %xmm15, %xmm2     ## xmm2 = xmm15[0,2,2,3]
	pshuflw	$132, %xmm2, %xmm3      ## xmm3 = xmm2[0,1,0,2,4,5,6,7]
	pshufd	$232, %xmm14, %xmm4     ## xmm4 = xmm14[0,2,2,3]
	pshuflw	$132, %xmm4, %xmm5      ## xmm5 = xmm4[0,1,0,2,4,5,6,7]
	punpckldq	%xmm3, %xmm5    ## xmm5 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
	pshufd	$232, %xmm7, %xmm3      ## xmm3 = xmm7[0,2,2,3]
	pshuflw	$232, %xmm3, %xmm0      ## xmm0 = xmm3[0,2,2,3,4,5,6,7]
	pshufd	$232, %xmm6, %xmm1      ## xmm1 = xmm6[0,2,2,3]
	pshuflw	$232, %xmm1, %xmm8      ## xmm8 = xmm1[0,2,2,3,4,5,6,7]
	punpckldq	%xmm0, %xmm8    ## xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
	pshuflw	$212, %xmm2, %xmm0      ## xmm0 = xmm2[0,1,1,3,4,5,6,7]
	pshuflw	$212, %xmm4, %xmm2      ## xmm2 = xmm4[0,1,1,3,4,5,6,7]
	punpckldq	%xmm0, %xmm2    ## xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	pshuflw	$237, %xmm3, %xmm0      ## xmm0 = xmm3[1,3,2,3,4,5,6,7]
	pshuflw	$237, %xmm1, %xmm1      ## xmm1 = xmm1[1,3,2,3,4,5,6,7]
	punpckldq	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	pshufd	$231, %xmm7, %xmm0      ## xmm0 = xmm7[3,1,2,3]
	pshuflw	$226, %xmm0, %xmm0      ## xmm0 = xmm0[2,0,2,3,4,5,6,7]
	pshufd	$231, %xmm6, %xmm3      ## xmm3 = xmm6[3,1,2,3]
	pshuflw	$226, %xmm3, %xmm3      ## xmm3 = xmm3[2,0,2,3,4,5,6,7]
	punpckldq	%xmm0, %xmm3    ## xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	pshufd	$231, %xmm15, %xmm0     ## xmm0 = xmm15[3,1,2,3]
	pshuflw	$36, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,2,0,4,5,6,7]
	pshufd	$231, %xmm14, %xmm4     ## xmm4 = xmm14[3,1,2,3]
	pshuflw	$36, %xmm4, %xmm4       ## xmm4 = xmm4[0,1,2,0,4,5,6,7]
	punpckldq	%xmm0, %xmm4    ## xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
	pmovzxwd	%xmm8, %xmm0    ## xmm0 = xmm8[0],zero,xmm8[1],zero,xmm8[2],zero,xmm8[3],zero
	pshufd	$238, %xmm5, %xmm5      ## xmm5 = xmm5[2,3,2,3]
	pmovzxwd	%xmm5, %xmm5    ## xmm5 = xmm5[0],zero,xmm5[1],zero,xmm5[2],zero,xmm5[3],zero
	pmovzxwd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,xmm1[1],zero,xmm1[2],zero,xmm1[3],zero
	pshufd	$238, %xmm2, %xmm2      ## xmm2 = xmm2[2,3,2,3]
	pmovzxwd	%xmm2, %xmm2    ## xmm2 = xmm2[0],zero,xmm2[1],zero,xmm2[2],zero,xmm2[3],zero
	pshufd	$238, %xmm4, %xmm4      ## xmm4 = xmm4[2,3,2,3]
	pmovzxwd	%xmm4, %xmm4    ## xmm4 = xmm4[0],zero,xmm4[1],zero,xmm4[2],zero,xmm4[3],zero
	pmovzxwd	%xmm3, %xmm3    ## xmm3 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero
	pmulld	%xmm10, %xmm5
	pmulld	%xmm10, %xmm0
	pmulld	%xmm11, %xmm2
	paddd	%xmm5, %xmm2
	pmulld	%xmm11, %xmm1
	paddd	%xmm0, %xmm1
	pmulld	%xmm12, %xmm3
	paddd	%xmm1, %xmm3
	pmulld	%xmm12, %xmm4
	paddd	%xmm2, %xmm4
	pshufb	%xmm13, %xmm3
	pshufb	%xmm13, %xmm4
	punpcklqdq	%xmm4, %xmm3    ## xmm3 = xmm3[0],xmm4[0]
	movdqu	%xmm3, (%r15,%rdi,2)
	addq	$8, %rdi
	cmpq	%rdi, %rcx
	jne	LBB144_211
## %bb.212:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	-152(%rbp), %eax        ## 4-byte Reload
	movq	-104(%rbp), %r13        ## 8-byte Reload
	pcmpeqd	%xmm2, %xmm2
LBB144_213:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB144_214:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rcx,4), %esi
	movzwl	2(%r12,%rcx,4), %edi
	movzwl	4(%r12,%rcx,4), %ebx
	imull	$77, %esi, %esi
	imull	$150, %edi, %edi
	addl	%esi, %edi
	leal	(%rbx,%rbx,8), %esi
	leal	(%rsi,%rsi,2), %esi
	addl	%ebx, %esi
	addl	%ebx, %esi
	addl	%edi, %esi
	shrl	$8, %esi
	movw	%si, (%rdx,%rcx)
	addq	$2, %rcx
	decl	%eax
	jns	LBB144_214
	jmp	LBB144_226
LBB144_215:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-296(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rdx,%rcx,2), %rdx
	movq	-208(%rbp), %rsi        ## 8-byte Reload
	leaq	(%r12,%rsi,2), %r12
	xorl	%ecx, %ecx
	movq	-104(%rbp), %r13        ## 8-byte Reload
LBB144_216:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rcx,2), %xmm0
	movdqa	%xmm0, %xmm1
	punpcklwd	%xmm2, %xmm1    ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1],xmm1[2],xmm2[2],xmm1[3],xmm2[3]
	punpckhwd	%xmm2, %xmm0    ## xmm0 = xmm0[4],xmm2[4],xmm0[5],xmm2[5],xmm0[6],xmm2[6],xmm0[7],xmm2[7]
	movdqu	%xmm0, 16(%r15,%rcx,4)
	movdqu	%xmm1, (%r15,%rcx,4)
	addq	$8, %rcx
	cmpq	%rcx, %rsi
	jne	LBB144_216
## %bb.217:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	-200(%rbp), %eax        ## 4-byte Reload
	cmpl	$0, -216(%rbp)          ## 4-byte Folded Reload
	je	LBB144_226
LBB144_218:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB144_219:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rcx), %esi
	movw	%si, (%rdx,%rcx,2)
	movw	$-1, 2(%rdx,%rcx,2)
	addq	$2, %rcx
	decl	%eax
	jns	LBB144_219
	jmp	LBB144_226
LBB144_220:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-160(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rdx,%rsi,2), %rdx
	movq	-304(%rbp), %rcx        ## 8-byte Reload
	leaq	(%r12,%rcx,2), %r12
	xorl	%ecx, %ecx
LBB144_221:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%r11,%rcx,4), %xmm0
	movdqu	16(%r11,%rcx,4), %xmm1
	pshufb	%xmm9, %xmm1
	pshufb	%xmm9, %xmm0
	punpcklqdq	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0]
	movdqu	%xmm0, (%r15,%rcx,2)
	addq	$8, %rcx
	cmpq	%rcx, %rsi
	jne	LBB144_221
## %bb.222:                             ##   in Loop: Header=BB144_134 Depth=1
	movl	-152(%rbp), %eax        ## 4-byte Reload
LBB144_223:                             ##   in Loop: Header=BB144_134 Depth=1
	movq	-104(%rbp), %r13        ## 8-byte Reload
LBB144_224:                             ##   in Loop: Header=BB144_134 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB144_225:                             ##   Parent Loop BB144_134 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzwl	(%r12,%rcx,2), %esi
	movw	%si, (%rdx,%rcx)
	addq	$2, %rcx
	decl	%eax
	jns	LBB144_225
	.p2align	4, 0x90
LBB144_226:                             ##   in Loop: Header=BB144_134 Depth=1
	incq	%r10
	movl	-76(%rbp), %eax         ## 4-byte Reload
	addl	-96(%rbp), %eax         ## 4-byte Folded Reload
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	movq	-120(%rbp), %rax        ## 8-byte Reload
	addl	-48(%rbp), %eax         ## 4-byte Folded Reload
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	cmpq	%r14, %r10
	movq	-144(%rbp), %rsi        ## 8-byte Reload
	jl	LBB144_134
LBB144_227:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	_free
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	movq	-184(%rbp), %r14        ## 8-byte Reload
	movq	-248(%rbp), %r15        ## 8-byte Reload
LBB144_228:
	movl	%r13d, 12(%r15)
	testq	%rbx, %rbx
	jne	LBB144_127
	jmp	LBB144_14
LBB144_229:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	jmp	LBB144_231
LBB144_230:
	movq	%rbx, %rdi
LBB144_231:
	callq	_free
	leaq	L_.str.67(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	movl	%r13d, 12(%r15)
	jmp	LBB144_14
LBB144_232:
	leaq	L___func__.stbi__convert_format16(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1827, %edx             ## imm = 0x723
	callq	___assert_rtn
LBB144_233:
	leaq	L___func__.stbi__convert_format(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1770, %edx             ## imm = 0x6EA
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L144_0_set_136, LBB144_136-LJTI144_0
.set L144_0_set_148, LBB144_148-LJTI144_0
.set L144_0_set_159, LBB144_159-LJTI144_0
.set L144_0_set_232, LBB144_232-LJTI144_0
.set L144_0_set_167, LBB144_167-LJTI144_0
.set L144_0_set_170, LBB144_170-LJTI144_0
.set L144_0_set_153, LBB144_153-LJTI144_0
.set L144_0_set_156, LBB144_156-LJTI144_0
.set L144_0_set_145, LBB144_145-LJTI144_0
.set L144_0_set_175, LBB144_175-LJTI144_0
.set L144_0_set_142, LBB144_142-LJTI144_0
.set L144_0_set_178, LBB144_178-LJTI144_0
.set L144_0_set_139, LBB144_139-LJTI144_0
LJTI144_0:
	.long	L144_0_set_136
	.long	L144_0_set_148
	.long	L144_0_set_159
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_167
	.long	L144_0_set_232
	.long	L144_0_set_170
	.long	L144_0_set_153
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_156
	.long	L144_0_set_145
	.long	L144_0_set_232
	.long	L144_0_set_175
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_232
	.long	L144_0_set_142
	.long	L144_0_set_178
	.long	L144_0_set_139
.set L144_1_set_33, LBB144_33-LJTI144_1
.set L144_1_set_45, LBB144_45-LJTI144_1
.set L144_1_set_50, LBB144_50-LJTI144_1
.set L144_1_set_233, LBB144_233-LJTI144_1
.set L144_1_set_58, LBB144_58-LJTI144_1
.set L144_1_set_61, LBB144_61-LJTI144_1
.set L144_1_set_66, LBB144_66-LJTI144_1
.set L144_1_set_69, LBB144_69-LJTI144_1
.set L144_1_set_39, LBB144_39-LJTI144_1
.set L144_1_set_72, LBB144_72-LJTI144_1
.set L144_1_set_42, LBB144_42-LJTI144_1
.set L144_1_set_75, LBB144_75-LJTI144_1
.set L144_1_set_36, LBB144_36-LJTI144_1
LJTI144_1:
	.long	L144_1_set_33
	.long	L144_1_set_45
	.long	L144_1_set_50
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_58
	.long	L144_1_set_233
	.long	L144_1_set_61
	.long	L144_1_set_66
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_69
	.long	L144_1_set_39
	.long	L144_1_set_233
	.long	L144_1_set_72
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_233
	.long	L144_1_set_42
	.long	L144_1_set_75
	.long	L144_1_set_36
	.end_data_region
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__parse_png_file
_stbi__parse_png_file:                  ## @stbi__parse_png_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$5320, %rsp             ## imm = 0x14C8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, -5320(%rbp)       ## 4-byte Spill
	movl	%esi, -5232(%rbp)       ## 4-byte Spill
	movq	%rdi, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movb	$0, -5210(%rbp)
	movw	$0, -5212(%rbp)
	movq	(%rdi), %r13
	leaq	8(%rdi), %rax
	movq	%rax, -5256(%rbp)       ## 8-byte Spill
	leaq	192(%r13), %r15
	leaq	200(%r13), %rax
	movq	%rax, -5200(%rbp)       ## 8-byte Spill
	leaq	48(%r13), %rax
	movq	%rax, -5192(%rbp)       ## 8-byte Spill
	leaq	56(%r13), %rsi
	leaq	57(%r13), %rax
	movq	%rax, -5184(%rbp)       ## 8-byte Spill
	movq	$0, 24(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 8(%rdi)
	movq	192(%r13), %rcx
	movq	200(%r13), %r8
	xorl	%ebx, %ebx
	leaq	_stbi__check_png_header.png_sig(%rip), %r14
	movq	%r15, -5224(%rbp)       ## 8-byte Spill
	.p2align	4, 0x90
LBB145_1:                               ## =>This Inner Loop Header: Depth=1
	cmpq	%r8, %rcx
	jae	LBB145_3
## %bb.2:                               ##   in Loop: Header=BB145_1 Depth=1
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	movq	%rdi, %rcx
	cmpb	(%rbx,%r14), %dl
	je	LBB145_9
	jmp	LBB145_204
	.p2align	4, 0x90
LBB145_3:                               ##   in Loop: Header=BB145_1 Depth=1
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_6
## %bb.4:                               ##   in Loop: Header=BB145_1 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %r15
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_7
## %bb.5:                               ##   in Loop: Header=BB145_1 Depth=1
	movq	%r15, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %r8
	movzbl	56(%r13), %edx
	movq	%r15, %rsi
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	jmp	LBB145_8
LBB145_6:                               ##   in Loop: Header=BB145_1 Depth=1
	xorl	%edx, %edx
	cmpb	(%rbx,%r14), %dl
	je	LBB145_9
	jmp	LBB145_204
LBB145_7:                               ##   in Loop: Header=BB145_1 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	%r15, (%rdi)
	movb	$0, (%r15)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %r8
	movq	%r15, %rsi
LBB145_8:                               ##   in Loop: Header=BB145_1 Depth=1
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%r8, (%rcx)
	movq	%rax, (%rdi)
	movq	%rax, %rcx
	movq	%rdi, %r15
	cmpb	(%rbx,%r14), %dl
	jne	LBB145_204
LBB145_9:                               ##   in Loop: Header=BB145_1 Depth=1
	incq	%rbx
	cmpq	$7, %rbx
	jbe	LBB145_1
## %bb.10:
	movl	$1, %ebx
	cmpl	$1, -5232(%rbp)         ## 4-byte Folded Reload
	je	LBB145_207
## %bb.11:
	movq	%rsi, -5312(%rbp)       ## 8-byte Spill
	movq	%r12, -5208(%rbp)       ## 8-byte Spill
	movl	$1, %r14d
	xorl	%eax, %eax
	movq	%rax, -5304(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -5272(%rbp)       ## 8-byte Spill
	movl	$0, -5260(%rbp)         ## 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -5248(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -5280(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -5240(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -5296(%rbp)       ## 8-byte Spill
	movl	$0, -5172(%rbp)         ## 4-byte Folded Spill
	jmp	LBB145_13
	.p2align	4, 0x90
LBB145_12:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	%r13, %rdi
	callq	_stbi__get32be
LBB145_13:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB145_25 Depth 2
                                        ##     Child Loop BB145_135 Depth 2
                                        ##     Child Loop BB145_110 Depth 2
                                        ##     Child Loop BB145_63 Depth 2
                                        ##     Child Loop BB145_44 Depth 2
	movq	%r13, %rdi
	callq	_stbi__get32be
	movl	%eax, %r12d
	movq	%r13, %rdi
	callq	_stbi__get32be
	cmpl	$1229472849, %eax       ## imm = 0x49484451
	jle	LBB145_35
## %bb.14:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1229472850, %eax       ## imm = 0x49484452
	je	LBB145_47
## %bb.15:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1347179589, %eax       ## imm = 0x504C5445
	movq	-5312(%rbp), %rsi       ## 8-byte Reload
	je	LBB145_58
## %bb.16:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1951551059, %eax       ## imm = 0x74524E53
	jne	LBB145_93
## %bb.17:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	%r14d, %r14d
	jne	LBB145_210
## %bb.18:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5256(%rbp), %rax       ## 8-byte Reload
	cmpq	$0, (%rax)
	jne	LBB145_233
## %bb.19:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpb	$0, -5172(%rbp)         ## 1-byte Folded Reload
	je	LBB145_105
## %bb.20:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$2, -5232(%rbp)         ## 4-byte Folded Reload
	je	LBB145_242
## %bb.21:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5248(%rbp), %rax       ## 8-byte Reload
	testl	%eax, %eax
	je	LBB145_243
## %bb.22:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	%r12d, %eax
	jb	LBB145_236
## %bb.23:                              ##   in Loop: Header=BB145_13 Depth=1
	movb	$4, %al
	movl	%eax, -5172(%rbp)       ## 4-byte Spill
	xorl	%r14d, %r14d
	testl	%r12d, %r12d
	je	LBB145_12
## %bb.24:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rcx
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %r8
	movl	%r12d, %r14d
	shlq	$2, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB145_25:                              ##   Parent Loop BB145_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	%r8, %rcx
	jae	LBB145_27
## %bb.26:                              ##   in Loop: Header=BB145_25 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	movq	%rdi, %rcx
	jmp	LBB145_33
	.p2align	4, 0x90
LBB145_27:                              ##   in Loop: Header=BB145_25 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_30
## %bb.28:                              ##   in Loop: Header=BB145_25 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %r15
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_31
## %bb.29:                              ##   in Loop: Header=BB145_25 Depth=2
	movq	%r15, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %r8
	movzbl	56(%r13), %edx
	movq	%r15, %rsi
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	jmp	LBB145_32
LBB145_30:                              ##   in Loop: Header=BB145_25 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_33
LBB145_31:                              ##   in Loop: Header=BB145_25 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	%r15, (%rdi)
	movb	$0, (%r15)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %r8
	movq	%r15, %rsi
LBB145_32:                              ##   in Loop: Header=BB145_25 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%r8, (%rcx)
	movq	%rax, (%rdi)
	movq	%rax, %rcx
	movq	%rdi, %r15
LBB145_33:                              ##   in Loop: Header=BB145_25 Depth=2
	movl	%ebx, %edi
	orl	$3, %edi
	movb	%dl, -5168(%rbp,%rdi)
	addq	$4, %rbx
	cmpq	%rbx, %r14
	jne	LBB145_25
	jmp	LBB145_91
	.p2align	4, 0x90
LBB145_35:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1130840649, %eax       ## imm = 0x43674249
	je	LBB145_53
## %bb.36:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1229209940, %eax       ## imm = 0x49444154
	movq	-5280(%rbp), %rcx       ## 8-byte Reload
	jne	LBB145_92
## %bb.37:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	%r14d, %r14d
	jne	LBB145_210
## %bb.38:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$0, -5248(%rbp)         ## 4-byte Folded Reload
	jne	LBB145_40
## %bb.39:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpb	$0, -5172(%rbp)         ## 1-byte Folded Reload
	jne	LBB145_231
LBB145_40:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$2, -5232(%rbp)         ## 4-byte Folded Reload
	je	LBB145_234
## %bb.41:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5240(%rbp), %rax       ## 8-byte Reload
	leal	(%r12,%rax), %ebx
	cmpl	%eax, %ebx
	jl	LBB145_206
## %bb.42:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	%ecx, %ebx
	jbe	LBB145_101
## %bb.43:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$4096, %r12d            ## imm = 0x1000
	movl	$4096, %eax             ## imm = 0x1000
	cmoval	%r12d, %eax
	testl	%ecx, %ecx
	cmovnel	%ecx, %eax
	.p2align	4, 0x90
LBB145_44:                              ##   Parent Loop BB145_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%eax, %ecx
	leal	(%rcx,%rcx), %eax
	cmpl	%ecx, %ebx
	ja	LBB145_44
## %bb.45:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5256(%rbp), %r14       ## 8-byte Reload
	movq	(%r14), %rdi
	movq	%rcx, -5280(%rbp)       ## 8-byte Spill
	movl	%ecx, %esi
	callq	_realloc
	testq	%rax, %rax
	je	LBB145_359
## %bb.46:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	%rax, (%r14)
	movq	-5280(%rbp), %rcx       ## 8-byte Reload
	jmp	LBB145_102
LBB145_47:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	%r14d, %r14d
	je	LBB145_229
## %bb.48:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$13, %r12d
	jne	LBB145_232
## %bb.49:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	%r13, %rdi
	callq	_stbi__get32be
	movl	%eax, (%r13)
	movq	%r13, %rdi
	callq	_stbi__get32be
	movl	%eax, 4(%r13)
	cmpl	$16777217, %eax         ## imm = 0x1000001
	jae	LBB145_211
## %bb.50:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$16777217, (%r13)       ## imm = 0x1000001
	jae	LBB145_211
## %bb.51:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rdx
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jae	LBB145_98
## %bb.52:                              ##   in Loop: Header=BB145_13 Depth=1
	leaq	1(%rdx), %rcx
	movq	%rcx, (%r15)
	movb	(%rdx), %dl
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movq	-5312(%rbp), %rsi       ## 8-byte Reload
	jmp	LBB145_155
LBB145_53:                              ##   in Loop: Header=BB145_13 Depth=1
	movl	$1, -5260(%rbp)         ## 4-byte Folded Spill
	testl	%r12d, %r12d
	je	LBB145_12
## %bb.54:                              ##   in Loop: Header=BB145_13 Depth=1
	js	LBB145_97
LBB145_55:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpq	$0, 16(%r13)
	je	LBB145_131
## %bb.56:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rcx
	movq	(%r15), %rax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%r12d, %esi
	subl	%edx, %esi
	jle	LBB145_132
## %bb.57:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	%rcx, 192(%r13)
	movq	40(%r13), %rdi
	callq	*24(%r13)
	jmp	LBB145_12
LBB145_58:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	%r14d, %r14d
	jne	LBB145_210
## %bb.59:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$769, %r12d             ## imm = 0x301
	jae	LBB145_226
## %bb.60:                              ##   in Loop: Header=BB145_13 Depth=1
	movzwl	%r12w, %eax
	imull	$43691, %eax, %eax      ## imm = 0xAAAB
	shrl	$17, %eax
	movq	%rax, -5248(%rbp)       ## 8-byte Spill
	leal	(%rax,%rax,2), %eax
	cmpl	%r12d, %eax
	jne	LBB145_226
## %bb.61:                              ##   in Loop: Header=BB145_13 Depth=1
	xorl	%r14d, %r14d
	cmpw	$3, %r12w
	jb	LBB145_12
## %bb.62:                              ##   in Loop: Header=BB145_13 Depth=1
	movl	-5248(%rbp), %r12d      ## 4-byte Reload
	movq	(%r15), %rcx
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB145_63:                              ##   Parent Loop BB145_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	LBB145_65
## %bb.64:                              ##   in Loop: Header=BB145_63 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	jmp	LBB145_71
	.p2align	4, 0x90
LBB145_65:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_68
## %bb.66:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_69
## %bb.67:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movzbl	56(%r13), %edx
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_70
LBB145_68:                              ##   in Loop: Header=BB145_63 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_72
LBB145_69:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_70:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_71:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rdi, %rcx
LBB145_72:                              ##   in Loop: Header=BB145_63 Depth=2
	movb	%dl, -5168(%rbp,%r14,4)
	cmpq	%rax, %rcx
	jae	LBB145_74
## %bb.73:                              ##   in Loop: Header=BB145_63 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	jmp	LBB145_80
	.p2align	4, 0x90
LBB145_74:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_77
## %bb.75:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_78
## %bb.76:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movzbl	56(%r13), %edx
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_79
LBB145_77:                              ##   in Loop: Header=BB145_63 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_81
LBB145_78:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_79:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_80:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rdi, %rcx
LBB145_81:                              ##   in Loop: Header=BB145_63 Depth=2
	movb	%dl, -5167(%rbp,%r14,4)
	cmpq	%rax, %rcx
	jae	LBB145_83
## %bb.82:                              ##   in Loop: Header=BB145_63 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	jmp	LBB145_89
	.p2align	4, 0x90
LBB145_83:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_86
## %bb.84:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_87
## %bb.85:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movzbl	56(%r13), %edx
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_88
LBB145_86:                              ##   in Loop: Header=BB145_63 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_90
LBB145_87:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_88:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_89:                              ##   in Loop: Header=BB145_63 Depth=2
	movq	%rdi, %rcx
LBB145_90:                              ##   in Loop: Header=BB145_63 Depth=2
	movb	%dl, -5166(%rbp,%r14,4)
	movb	$-1, -5165(%rbp,%r14,4)
	incq	%r14
	cmpq	%r12, %r14
	jb	LBB145_63
LBB145_91:                              ##   in Loop: Header=BB145_13 Depth=1
	xorl	%r14d, %r14d
	jmp	LBB145_12
LBB145_92:                              ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$1229278788, %eax       ## imm = 0x49454E44
	je	LBB145_209
LBB145_93:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	%r14d, %r14d
	jne	LBB145_210
## %bb.94:                              ##   in Loop: Header=BB145_13 Depth=1
	testl	$536870912, %eax        ## imm = 0x20000000
	je	LBB145_230
## %bb.95:                              ##   in Loop: Header=BB145_13 Depth=1
	xorl	%r14d, %r14d
	testl	%r12d, %r12d
	je	LBB145_12
## %bb.96:                              ##   in Loop: Header=BB145_13 Depth=1
	jns	LBB145_55
LBB145_97:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
	movq	%rax, (%r15)
	jmp	LBB145_12
LBB145_98:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	cmpl	$0, (%rax)
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movq	-5312(%rbp), %rsi       ## 8-byte Reload
	je	LBB145_244
## %bb.99:                              ##   in Loop: Header=BB145_13 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_153
## %bb.100:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movb	56(%r13), %dl
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_154
LBB145_101:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5256(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
LBB145_102:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rcx, -5280(%rbp)       ## 8-byte Spill
	movl	-5240(%rbp), %edi       ## 4-byte Reload
	addq	%rax, %rdi
	cmpq	$0, 16(%r13)
	je	LBB145_128
## %bb.103:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
	movq	(%r15), %rsi
	movq	%rax, %rcx
	subq	%rsi, %rcx
	movl	%r12d, %edx
	subl	%ecx, %edx
	jle	LBB145_129
## %bb.104:                             ##   in Loop: Header=BB145_13 Depth=1
	movslq	%ecx, %r12
	movq	%rdi, %r14
	movl	%edx, -5336(%rbp)       ## 4-byte Spill
	movq	%r12, %rdx
	callq	_memcpy
	movq	40(%r13), %rdi
	addq	%r12, %r14
	movq	%r14, %rsi
	movl	-5336(%rbp), %r12d      ## 4-byte Reload
	movl	%r12d, %edx
	callq	*16(%r13)
	xorl	%r14d, %r14d
	movq	200(%r13), %rcx
	movq	%rcx, 192(%r13)
	movl	%ebx, %ecx
	movq	%rcx, -5240(%rbp)       ## 8-byte Spill
	cmpl	%r12d, %eax
	je	LBB145_12
	jmp	LBB145_237
LBB145_105:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	8(%r13), %eax
	testb	$1, %al
	je	LBB145_245
## %bb.106:                             ##   in Loop: Header=BB145_13 Depth=1
	leal	(%rax,%rax), %ecx
	cmpl	%r12d, %ecx
	jne	LBB145_236
## %bb.107:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	cmpl	$16, 32(%r14)
	jne	LBB145_133
## %bb.108:                             ##   in Loop: Header=BB145_13 Depth=1
	movb	$1, %cl
	movq	%rcx, -5296(%rbp)       ## 8-byte Spill
	testl	%eax, %eax
	jle	LBB145_163
## %bb.109:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rcx
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %r8
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB145_110:                             ##   Parent Loop BB145_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	%r8, %rcx
	jae	LBB145_112
## %bb.111:                             ##   in Loop: Header=BB145_110 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	jmp	LBB145_118
	.p2align	4, 0x90
LBB145_112:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_115
## %bb.113:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_116
## %bb.114:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %r8
	movzbl	56(%r13), %edx
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_117
LBB145_115:                             ##   in Loop: Header=BB145_110 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_119
LBB145_116:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %r8
	movq	%rbx, %rsi
LBB145_117:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%r8, (%rcx)
	movq	%rdi, (%r15)
LBB145_118:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	%rdi, %rcx
LBB145_119:                             ##   in Loop: Header=BB145_110 Depth=2
	movzbl	%dl, %ebx
	shll	$8, %ebx
	cmpq	%r8, %rcx
	jae	LBB145_121
## %bb.120:                             ##   in Loop: Header=BB145_110 Depth=2
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movzbl	(%rcx), %edx
	movq	%rdi, %rcx
	jmp	LBB145_127
	.p2align	4, 0x90
LBB145_121:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_124
## %bb.122:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %r15
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_125
## %bb.123:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	%r15, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %r8
	movzbl	56(%r13), %edx
	movq	%r15, %rsi
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	jmp	LBB145_126
LBB145_124:                             ##   in Loop: Header=BB145_110 Depth=2
	xorl	%edx, %edx
	jmp	LBB145_127
LBB145_125:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movq	%r15, (%rdi)
	movb	$0, (%r15)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %r8
	movq	%r15, %rsi
LBB145_126:                             ##   in Loop: Header=BB145_110 Depth=2
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%r8, (%rcx)
	movq	%rax, (%rdi)
	movq	%rax, %rcx
	movq	%rdi, %r15
LBB145_127:                             ##   in Loop: Header=BB145_110 Depth=2
	movzbl	%dl, %edx
	orl	%edx, %ebx
	movw	%bx, -5286(%rbp,%r14,2)
	incq	%r14
	movslq	8(%r13), %rdx
	cmpq	%rdx, %r14
	jl	LBB145_110
	jmp	LBB145_152
LBB145_128:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rsi
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rax
LBB145_129:                             ##   in Loop: Header=BB145_13 Depth=1
	movslq	%r12d, %r14
	leaq	(%rsi,%r14), %rcx
	cmpq	%rax, %rcx
	ja	LBB145_237
## %bb.130:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%r14, %rdx
	callq	_memcpy
	addq	%r14, (%r15)
	xorl	%r14d, %r14d
	movl	%ebx, %eax
	movq	%rax, -5240(%rbp)       ## 8-byte Spill
	jmp	LBB145_12
LBB145_131:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rax
LBB145_132:                             ##   in Loop: Header=BB145_13 Depth=1
	movslq	%r12d, %rcx
	addq	%rax, %rcx
	movq	%rcx, (%r15)
	jmp	LBB145_12
LBB145_133:                             ##   in Loop: Header=BB145_13 Depth=1
	movb	$1, %cl
	movq	%rcx, -5296(%rbp)       ## 8-byte Spill
	testl	%eax, %eax
	leaq	_stbi__depth_scale_table(%rip), %r12
	jle	LBB145_163
## %bb.134:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	(%r15), %rdx
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB145_135:                             ##   Parent Loop BB145_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	%rcx, %rdx
	jae	LBB145_137
## %bb.136:                             ##   in Loop: Header=BB145_135 Depth=2
	incq	%rdx
	jmp	LBB145_142
	.p2align	4, 0x90
LBB145_137:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	cmpl	$0, (%rax)
	je	LBB145_143
## %bb.138:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %r15
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_140
## %bb.139:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	%r15, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rcx
	movq	%r15, %rsi
	movq	-5184(%rbp), %rdx       ## 8-byte Reload
	jmp	LBB145_141
LBB145_140:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	-5224(%rbp), %rax       ## 8-byte Reload
	movq	%r15, (%rax)
	movb	$0, (%r15)
	movq	-5184(%rbp), %rdx       ## 8-byte Reload
	movq	%rdx, %rcx
	movq	%r15, %rsi
LBB145_141:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	-5224(%rbp), %r15       ## 8-byte Reload
LBB145_142:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	%rdx, (%r15)
LBB145_143:                             ##   in Loop: Header=BB145_135 Depth=2
	cmpq	%rcx, %rdx
	jae	LBB145_145
## %bb.144:                             ##   in Loop: Header=BB145_135 Depth=2
	leaq	1(%rdx), %rax
	movq	%rax, (%r15)
	movzbl	(%rdx), %edi
	movq	%rax, %rdx
	jmp	LBB145_151
	.p2align	4, 0x90
LBB145_145:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	cmpl	$0, (%rax)
	je	LBB145_148
## %bb.146:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %r15
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_149
## %bb.147:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	%r15, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rcx
	movzbl	56(%r13), %edi
	movq	%r15, %rsi
	movq	-5224(%rbp), %r8        ## 8-byte Reload
	movq	-5184(%rbp), %rdx       ## 8-byte Reload
	jmp	LBB145_150
LBB145_148:                             ##   in Loop: Header=BB145_135 Depth=2
	xorl	%edi, %edi
	jmp	LBB145_151
LBB145_149:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	-5224(%rbp), %r8        ## 8-byte Reload
	movq	%r15, (%r8)
	movb	$0, (%r15)
	xorl	%edi, %edi
	movq	-5184(%rbp), %rdx       ## 8-byte Reload
	movq	%rdx, %rcx
	movq	%r15, %rsi
LBB145_150:                             ##   in Loop: Header=BB145_135 Depth=2
	movq	-5200(%rbp), %rax       ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	%rdx, (%r8)
	movq	%r8, %r15
LBB145_151:                             ##   in Loop: Header=BB145_135 Depth=2
	movslq	32(%r14), %rax
	movzbl	(%rax,%r12), %eax
	mulb	%dil
	movb	%al, -5212(%rbp,%rbx)
	incq	%rbx
	movslq	8(%r13), %rax
	cmpq	%rax, %rbx
	jl	LBB145_135
LBB145_152:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	$0, -5172(%rbp)         ## 4-byte Folded Spill
	xorl	%r14d, %r14d
	jmp	LBB145_12
LBB145_153:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_154:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
	movq	%rdi, %rcx
LBB145_155:                             ##   in Loop: Header=BB145_13 Depth=1
	movzbl	%dl, %edx
	movl	%edx, 32(%r14)
	cmpb	$16, %dl
	ja	LBB145_238
## %bb.156:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	$65814, %edi            ## imm = 0x10116
	btq	%rdx, %rdi
	jae	LBB145_238
## %bb.157:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpq	%rax, %rcx
	jae	LBB145_159
## %bb.158:                             ##   in Loop: Header=BB145_13 Depth=1
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movb	(%rcx), %dl
	jmp	LBB145_166
LBB145_159:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_162
## %bb.160:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_164
## %bb.161:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movb	56(%r13), %dl
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_165
LBB145_162:                             ##   in Loop: Header=BB145_13 Depth=1
	xorl	%edx, %edx
	jmp	LBB145_172
LBB145_163:                             ##   in Loop: Header=BB145_13 Depth=1
	xorl	%r14d, %r14d
	movl	$0, -5172(%rbp)         ## 4-byte Folded Spill
	jmp	LBB145_12
LBB145_164:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_165:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_166:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rdi, %rcx
	cmpb	$7, %dl
	jae	LBB145_228
## %bb.167:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpb	$3, %dl
	jne	LBB145_170
## %bb.168:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpl	$16, 32(%r14)
	je	LBB145_228
## %bb.169:                             ##   in Loop: Header=BB145_13 Depth=1
	movb	$3, %dl
	movl	%edx, -5172(%rbp)       ## 4-byte Spill
	movl	$3, %edx
	jmp	LBB145_172
LBB145_170:                             ##   in Loop: Header=BB145_13 Depth=1
	testb	$1, %dl
	jne	LBB145_228
## %bb.171:                             ##   in Loop: Header=BB145_13 Depth=1
	movzbl	%dl, %edx
LBB145_172:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rdx, -5272(%rbp)       ## 8-byte Spill
	cmpq	%rax, %rcx
	jae	LBB145_174
## %bb.173:                             ##   in Loop: Header=BB145_13 Depth=1
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movb	(%rcx), %dl
	jmp	LBB145_179
LBB145_174:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_180
## %bb.175:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_177
## %bb.176:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movb	56(%r13), %dl
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_178
LBB145_177:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_178:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_179:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rdi, %rcx
	testb	%dl, %dl
	jne	LBB145_239
LBB145_180:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpq	%rax, %rcx
	jae	LBB145_182
## %bb.181:                             ##   in Loop: Header=BB145_13 Depth=1
	leaq	1(%rcx), %rdi
	movq	%rdi, (%r15)
	movb	(%rcx), %dl
	jmp	LBB145_187
LBB145_182:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	cmpl	$0, (%rdx)
	je	LBB145_188
## %bb.183:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_185
## %bb.184:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rax
	movb	56(%r13), %dl
	movq	%rbx, %rsi
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	jmp	LBB145_186
LBB145_185:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%edx, %edx
	movq	-5184(%rbp), %rdi       ## 8-byte Reload
	movq	%rdi, %rax
	movq	%rbx, %rsi
LBB145_186:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%rdi, (%r15)
LBB145_187:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rdi, %rcx
	testb	%dl, %dl
	jne	LBB145_240
LBB145_188:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpq	%rax, %rcx
	jae	LBB145_190
## %bb.189:                             ##   in Loop: Header=BB145_13 Depth=1
	leaq	1(%rcx), %rax
	movq	%rax, (%r15)
	movb	(%rcx), %al
	cmpb	$2, %al
	jb	LBB145_196
	jmp	LBB145_241
LBB145_190:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	cmpl	$0, (%rax)
	je	LBB145_193
## %bb.191:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	40(%r13), %rdi
	movl	52(%r13), %edx
	movq	%rsi, %rbx
	callq	*16(%r13)
	movl	192(%r13), %ecx
	subl	208(%r13), %ecx
	addl	%ecx, 184(%r13)
	testl	%eax, %eax
	je	LBB145_194
## %bb.192:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	%rbx, 192(%r13)
	cltq
	leaq	56(%r13,%rax), %rcx
	movb	56(%r13), %al
	movq	-5184(%rbp), %rsi       ## 8-byte Reload
	jmp	LBB145_195
LBB145_193:                             ##   in Loop: Header=BB145_13 Depth=1
	xorl	%ebx, %ebx
	jmp	LBB145_197
LBB145_194:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5192(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movq	%rbx, (%r15)
	movb	$0, (%rbx)
	xorl	%eax, %eax
	movq	-5184(%rbp), %rsi       ## 8-byte Reload
	movq	%rsi, %rcx
LBB145_195:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5200(%rbp), %rdx       ## 8-byte Reload
	movq	%rcx, (%rdx)
	movq	%rsi, (%r15)
	cmpb	$2, %al
	jae	LBB145_241
LBB145_196:                             ##   in Loop: Header=BB145_13 Depth=1
	movzbl	%al, %ebx
LBB145_197:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	(%r13), %esi
	testl	%esi, %esi
	je	LBB145_227
## %bb.198:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	4(%r13), %ecx
	testl	%ecx, %ecx
	je	LBB145_227
## %bb.199:                             ##   in Loop: Header=BB145_13 Depth=1
	cmpb	$0, -5172(%rbp)         ## 1-byte Folded Reload
	movq	%rbx, -5304(%rbp)       ## 8-byte Spill
	je	LBB145_201
## %bb.200:                             ##   in Loop: Header=BB145_13 Depth=1
	movl	$1, 8(%r13)
	movl	$1073741824, %eax       ## imm = 0x40000000
	xorl	%edx, %edx
	divl	%esi
	shrl	$2, %eax
	xorl	%r14d, %r14d
	cmpl	%ecx, %eax
	jae	LBB145_12
	jmp	LBB145_211
LBB145_201:                             ##   in Loop: Header=BB145_13 Depth=1
	movq	-5272(%rbp), %rdx       ## 8-byte Reload
	movl	%edx, %eax
	andl	$2, %eax
                                        ## kill: def $edx killed $edx killed $rdx def $rdx
	shrl	$2, %edx
	andl	$1, %edx
	leal	1(%rax,%rdx), %edi
	movl	%edi, 8(%r13)
	movl	$1073741824, %eax       ## imm = 0x40000000
	xorl	%edx, %edx
	divl	%esi
	xorl	%edx, %edx
	divl	%edi
	cmpl	%ecx, %eax
	jb	LBB145_211
## %bb.202:                             ##   in Loop: Header=BB145_13 Depth=1
	xorl	%r14d, %r14d
	movl	$0, -5172(%rbp)         ## 4-byte Folded Spill
	cmpl	$2, -5232(%rbp)         ## 4-byte Folded Reload
	jne	LBB145_12
## %bb.203:
	movl	$1, %ebx
	jmp	LBB145_207
LBB145_204:
	leaq	L_.str.48(%rip), %rcx
LBB145_205:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
LBB145_206:
	xorl	%ebx, %ebx
LBB145_207:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB145_371
## %bb.208:
	movl	%ebx, %eax
	addq	$5320, %rsp             ## imm = 0x14C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB145_209:
	testl	%r14d, %r14d
	je	LBB145_212
LBB145_210:
	leaq	L_.str.60(%rip), %rcx
	jmp	LBB145_205
LBB145_211:
	leaq	L_.str.53(%rip), %rcx
	jmp	LBB145_205
LBB145_212:
	movl	$1, %ebx
	cmpl	$0, -5232(%rbp)         ## 4-byte Folded Reload
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	jne	LBB145_207
## %bb.213:
	movq	-5256(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	LBB145_246
## %bb.214:
	movl	32(%r14), %eax
	imull	(%r13), %eax
	addl	$7, %eax
	shrl	$3, %eax
	movl	4(%r13), %ecx
	movl	8(%r13), %r15d
	imull	%ecx, %r15d
	imull	%eax, %r15d
	addl	%ecx, %r15d
	movslq	%r15d, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB145_262
## %bb.215:
	xorl	%r8d, %r8d
	cmpl	$0, -5260(%rbp)         ## 4-byte Folded Reload
	sete	%r8b
	movq	%rbx, -4144(%rbp)
	movslq	-5240(%rbp), %rcx       ## 4-byte Folded Reload
	addq	%rbx, %rcx
	movq	%rcx, -4136(%rbp)
	leaq	-4144(%rbp), %rdi
	movq	%rax, %rsi
	movl	%r15d, %edx
	movl	$1, %ecx
	callq	_stbi__do_zlib
	testl	%eax, %eax
	je	LBB145_261
## %bb.216:
	movl	-4120(%rbp), %r12d
	movq	-4112(%rbp), %rax
	movq	%rax, 16(%r14)
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	LBB145_207
## %bb.217:
	subl	%eax, %r12d
	movq	8(%r14), %rdi
	callq	_free
	movq	$0, 8(%r14)
	movl	8(%r13), %eax
	leal	1(%rax), %esi
	movl	-5320(%rbp), %edx       ## 4-byte Reload
	cmpl	%edx, %esi
	movl	%esi, %ecx
	cmovnel	%eax, %ecx
	cmpl	$3, %edx
	cmovel	%eax, %ecx
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	testb	%r15b, %r15b
	cmovnel	%eax, %ecx
	cmpb	$0, -5296(%rbp)         ## 1-byte Folded Reload
	cmovnel	%esi, %ecx
	movl	%ecx, 12(%r13)
	movq	(%r14), %rax
	movq	16(%r14), %rsi
	movl	32(%r14), %r10d
	xorl	%r11d, %r11d
	cmpl	$16, %r10d
	sete	%dil
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	cmpl	$0, -5304(%rbp)         ## 4-byte Folded Reload
	je	LBB145_264
## %bb.218:
	movl	%r12d, -5240(%rbp)      ## 4-byte Spill
	movq	%rax, -5200(%rbp)       ## 8-byte Spill
	movl	%r9d, %eax
	orl	%r8d, %eax
	js	LBB145_263
## %bb.219:
	testl	%r9d, %r9d
	je	LBB145_221
## %bb.220:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r9d
	cmpl	%r8d, %eax
	jl	LBB145_263
LBB145_221:
	movb	%dil, %r11b
	incl	%r11d
	imull	%ecx, %r11d
	imull	%r8d, %r9d
	movl	%r9d, %eax
	orl	%r11d, %eax
	js	LBB145_263
## %bb.222:
	testl	%r11d, %r11d
	je	LBB145_224
## %bb.223:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r11d
	cmpl	%r9d, %eax
	jl	LBB145_263
LBB145_224:
	imull	%r11d, %r9d
	movslq	%r9d, %rdi
	movl	%ecx, -5340(%rbp)       ## 4-byte Spill
	movq	%r10, -5352(%rbp)       ## 8-byte Spill
	movq	%rsi, -5304(%rbp)       ## 8-byte Spill
	movl	%r11d, -5316(%rbp)      ## 4-byte Spill
	callq	_malloc
	movl	-5316(%rbp), %edx       ## 4-byte Reload
	movq	%rax, -5328(%rbp)       ## 8-byte Spill
	testq	%rax, %rax
	je	LBB145_263
## %bb.225:
	movslq	%edx, %rax
	movq	%rax, -5192(%rbp)       ## 8-byte Spill
	xorl	%r8d, %r8d
	leaq	l___const.stbi__create_png_image.xorig(%rip), %r9
	leaq	l___const.stbi__create_png_image.xspc(%rip), %rcx
	leaq	l___const.stbi__create_png_image.yorig(%rip), %rsi
	movq	-5200(%rbp), %rdx       ## 8-byte Reload
	jmp	LBB145_248
LBB145_226:
	leaq	L_.str.61(%rip), %rcx
	jmp	LBB145_205
LBB145_227:
	leaq	L_.str.59(%rip), %rcx
	jmp	LBB145_205
LBB145_228:
	leaq	L_.str.55(%rip), %rcx
	jmp	LBB145_205
LBB145_229:
	leaq	L_.str.51(%rip), %rcx
	jmp	LBB145_205
LBB145_230:
	movl	%eax, %ecx
	shrl	$24, %ecx
	movb	%cl, _stbi__parse_png_file.invalid_chunk(%rip)
	leaq	_stbi__parse_png_file.invalid_chunk(%rip), %rcx
	movl	%eax, %edx
	shrl	$16, %edx
	movb	%dl, _stbi__parse_png_file.invalid_chunk+1(%rip)
	movb	%ah, _stbi__parse_png_file.invalid_chunk+2(%rip)
	movb	%al, _stbi__parse_png_file.invalid_chunk+3(%rip)
	jmp	LBB145_205
LBB145_231:
	leaq	L_.str.66(%rip), %rcx
	jmp	LBB145_205
LBB145_232:
	leaq	L_.str.52(%rip), %rcx
	jmp	LBB145_205
LBB145_233:
	leaq	L_.str.62(%rip), %rcx
	jmp	LBB145_205
LBB145_234:
	movzbl	-5172(%rbp), %eax       ## 1-byte Folded Reload
	movl	%eax, 8(%r13)
	movl	$1, %ebx
	jmp	LBB145_207
LBB145_236:
	leaq	L_.str.64(%rip), %rcx
	jmp	LBB145_205
LBB145_237:
	leaq	L_.str.68(%rip), %rcx
	jmp	LBB145_205
LBB145_238:
	leaq	L_.str.54(%rip), %rcx
	jmp	LBB145_205
LBB145_239:
	leaq	L_.str.56(%rip), %rcx
	jmp	LBB145_205
LBB145_240:
	leaq	L_.str.57(%rip), %rcx
	jmp	LBB145_205
LBB145_241:
	leaq	L_.str.58(%rip), %rcx
	jmp	LBB145_205
LBB145_242:
	movl	$4, 8(%r13)
	movl	$1, %ebx
	jmp	LBB145_207
LBB145_243:
	leaq	L_.str.63(%rip), %rcx
	jmp	LBB145_205
LBB145_244:
	movl	$0, 32(%r14)
	leaq	L_.str.54(%rip), %rcx
	jmp	LBB145_205
LBB145_245:
	leaq	L_.str.65(%rip), %rcx
	jmp	LBB145_205
LBB145_246:
	leaq	L_.str.69(%rip), %rcx
	jmp	LBB145_205
LBB145_247:                             ##   in Loop: Header=BB145_248 Depth=1
	movq	(%r14), %rdx
LBB145_248:                             ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB145_253 Depth 2
                                        ##       Child Loop BB145_255 Depth 3
	movslq	(%r9,%r8,4), %rax
	movq	%rcx, %r10
	movslq	(%rcx,%r8,4), %r15
	movq	%rax, -5248(%rbp)       ## 8-byte Spill
	movl	%eax, %ebx
	notl	%ebx
	addl	(%rdx), %ebx
	addl	%r15d, %ebx
	movl	%ebx, %eax
	movq	%rdx, %r9
	xorl	%edx, %edx
	divl	%r15d
	movl	%eax, -5256(%rbp)       ## 4-byte Spill
	movq	%rsi, %r11
	movl	(%rsi,%r8,4), %edi
	leaq	l___const.stbi__create_png_image.yspc(%rip), %rax
	movl	(%rax,%r8,4), %r12d
	movl	%edi, -5200(%rbp)       ## 4-byte Spill
	notl	%edi
	addl	4(%r9), %edi
	addl	%r12d, %edi
	movl	%edi, %eax
	xorl	%edx, %edx
	divl	%r12d
	movq	%r15, -5184(%rbp)       ## 8-byte Spill
	cmpl	%ebx, %r15d
	ja	LBB145_258
## %bb.249:                             ##   in Loop: Header=BB145_248 Depth=1
	cmpl	%edi, %r12d
	ja	LBB145_258
## %bb.250:                             ##   in Loop: Header=BB145_248 Depth=1
	movq	%r8, -5336(%rbp)        ## 8-byte Spill
	movl	-5256(%rbp), %r8d       ## 4-byte Reload
	movl	%r8d, %r15d
	movq	-5352(%rbp), %r10       ## 8-byte Reload
	imull	%r10d, %r15d
	imull	8(%r9), %r15d
	movq	%r14, %rdi
	movq	-5304(%rbp), %rsi       ## 8-byte Reload
	movl	-5240(%rbp), %edx       ## 4-byte Reload
	movl	-5340(%rbp), %ecx       ## 4-byte Reload
	movl	%eax, %ebx
	movl	%eax, %r9d
	pushq	-5272(%rbp)             ## 8-byte Folded Reload
	pushq	%r10
	callq	_stbi__create_png_image_raw
	addq	$16, %rsp
	testl	%eax, %eax
	je	LBB145_341
## %bb.251:                             ##   in Loop: Header=BB145_248 Depth=1
	addl	$7, %r15d
	sarl	$3, %r15d
	incl	%r15d
	imull	%ebx, %r15d
	movl	%r15d, -5344(%rbp)      ## 4-byte Spill
	testl	%ebx, %ebx
	movq	-5192(%rbp), %r8        ## 8-byte Reload
	movq	-5184(%rbp), %r14       ## 8-byte Reload
	movl	-5200(%rbp), %esi       ## 4-byte Reload
	jle	LBB145_257
## %bb.252:                             ##   in Loop: Header=BB145_248 Depth=1
	movslq	-5256(%rbp), %rdi       ## 4-byte Folded Reload
	movslq	%ebx, %rax
	movq	%rax, -5312(%rbp)       ## 8-byte Spill
	movl	-5316(%rbp), %eax       ## 4-byte Reload
	imull	%eax, %esi
	imull	%eax, %r12d
	movq	-5248(%rbp), %rax       ## 8-byte Reload
	imulq	%r8, %rax
	addq	-5328(%rbp), %rax       ## 8-byte Folded Reload
	movq	%rax, -5248(%rbp)       ## 8-byte Spill
	imulq	%r8, %r14
	xorl	%eax, %eax
	movq	%rax, -5232(%rbp)       ## 8-byte Spill
	movl	%r12d, -5280(%rbp)      ## 4-byte Spill
	movq	%rdi, -5224(%rbp)       ## 8-byte Spill
LBB145_253:                             ##   Parent Loop BB145_248 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB145_255 Depth 3
	cmpl	$0, -5256(%rbp)         ## 4-byte Folded Reload
	movq	-5208(%rbp), %rbx       ## 8-byte Reload
	jle	LBB145_256
## %bb.254:                             ##   in Loop: Header=BB145_253 Depth=2
	movq	-5232(%rbp), %rax       ## 8-byte Reload
	imulq	%rdi, %rax
	movq	%rax, -5184(%rbp)       ## 8-byte Spill
	movq	-5248(%rbp), %r15       ## 8-byte Reload
	xorl	%r12d, %r12d
	movl	%esi, -5200(%rbp)       ## 4-byte Spill
	.p2align	4, 0x90
LBB145_255:                             ##   Parent Loop BB145_248 Depth=1
                                        ##     Parent Loop BB145_253 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	(%rbx), %rax
	movl	(%rax), %edi
	imull	%esi, %edi
	addq	%r15, %rdi
	movq	-5184(%rbp), %rax       ## 8-byte Reload
	leaq	(%r12,%rax), %rsi
	imulq	%r8, %rsi
	addq	24(%rbx), %rsi
	movq	-5192(%rbp), %rdx       ## 8-byte Reload
	callq	_memcpy
	movq	-5224(%rbp), %rdi       ## 8-byte Reload
	movl	-5200(%rbp), %esi       ## 4-byte Reload
	movq	-5192(%rbp), %r8        ## 8-byte Reload
	incq	%r12
	addq	%r14, %r15
	cmpq	%rdi, %r12
	jl	LBB145_255
LBB145_256:                             ##   in Loop: Header=BB145_253 Depth=2
	movq	-5232(%rbp), %rax       ## 8-byte Reload
	movq	%rax, %rbx
	incq	%rbx
	movl	-5280(%rbp), %r12d      ## 4-byte Reload
	addl	%r12d, %esi
	movq	%rbx, %rax
	movq	%rbx, -5232(%rbp)       ## 8-byte Spill
	cmpq	-5312(%rbp), %rbx       ## 8-byte Folded Reload
	jl	LBB145_253
LBB145_257:                             ##   in Loop: Header=BB145_248 Depth=1
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movq	24(%r14), %rdi
	callq	_free
	movl	-5344(%rbp), %ecx       ## 4-byte Reload
	movl	%ecx, %eax
	addq	%rax, -5304(%rbp)       ## 8-byte Folded Spill
	subl	%ecx, -5240(%rbp)       ## 4-byte Folded Spill
	movq	-5336(%rbp), %r8        ## 8-byte Reload
	leaq	l___const.stbi__create_png_image.xorig(%rip), %r9
	leaq	l___const.stbi__create_png_image.xspc(%rip), %r11
	movq	%r11, %rcx
	leaq	l___const.stbi__create_png_image.yorig(%rip), %r15
	movq	%r15, %rsi
	jmp	LBB145_259
LBB145_258:                             ##   in Loop: Header=BB145_248 Depth=1
	leaq	l___const.stbi__create_png_image.xorig(%rip), %r9
	movq	%r10, %rcx
	movq	%r11, %rsi
LBB145_259:                             ##   in Loop: Header=BB145_248 Depth=1
	incq	%r8
	cmpq	$6, %r8
	jbe	LBB145_247
## %bb.260:
	movq	-5328(%rbp), %rax       ## 8-byte Reload
	movq	%rax, 24(%r14)
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	cmpb	$0, -5296(%rbp)         ## 1-byte Folded Reload
	jne	LBB145_266
	jmp	LBB145_319
LBB145_261:
	movq	-4112(%rbp), %rdi
	callq	_free
LBB145_262:
	movq	$0, 16(%r14)
	jmp	LBB145_206
LBB145_263:
	leaq	L_.str.67(%rip), %rcx
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	jmp	LBB145_207
LBB145_264:
	movq	%r14, %rdi
	movl	%r12d, %edx
	pushq	-5272(%rbp)             ## 8-byte Folded Reload
	pushq	%r10
	callq	_stbi__create_png_image_raw
	addq	$16, %rsp
	testl	%eax, %eax
	je	LBB145_207
## %bb.265:
	cmpb	$0, -5296(%rbp)         ## 1-byte Folded Reload
	je	LBB145_319
LBB145_266:
	cmpl	$16, 32(%r14)
	jne	LBB145_286
## %bb.267:
	movl	12(%r13), %edx
	movq	(%r14), %rsi
	movq	24(%r14), %rax
	movl	4(%rsi), %ecx
	imull	(%rsi), %ecx
	cmpl	$2, %edx
	je	LBB145_305
## %bb.268:
	cmpl	$4, %edx
	jne	LBB145_372
## %bb.269:
	testl	%ecx, %ecx
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.270:
	movzwl	-5286(%rbp), %edi
	movzwl	-5284(%rbp), %esi
	movzwl	-5282(%rbp), %edx
	movl	%ecx, %r8d
	andl	$1, %r8d
	cmpl	$1, %ecx
	je	LBB145_281
## %bb.271:
	movl	%r8d, %ebx
	subl	%ecx, %ebx
LBB145_272:                             ## =>This Inner Loop Header: Depth=1
	cmpw	%di, (%rax)
	jne	LBB145_276
## %bb.273:                             ##   in Loop: Header=BB145_272 Depth=1
	cmpw	%si, 2(%rax)
	jne	LBB145_276
## %bb.274:                             ##   in Loop: Header=BB145_272 Depth=1
	cmpw	%dx, 4(%rax)
	jne	LBB145_276
## %bb.275:                             ##   in Loop: Header=BB145_272 Depth=1
	movw	$0, 6(%rax)
LBB145_276:                             ##   in Loop: Header=BB145_272 Depth=1
	cmpw	%di, 8(%rax)
	jne	LBB145_280
## %bb.277:                             ##   in Loop: Header=BB145_272 Depth=1
	cmpw	%si, 10(%rax)
	jne	LBB145_280
## %bb.278:                             ##   in Loop: Header=BB145_272 Depth=1
	cmpw	%dx, 12(%rax)
	jne	LBB145_280
## %bb.279:                             ##   in Loop: Header=BB145_272 Depth=1
	movw	$0, 14(%rax)
LBB145_280:                             ##   in Loop: Header=BB145_272 Depth=1
	addq	$16, %rax
	addl	$2, %ebx
	jne	LBB145_272
LBB145_281:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.282:
	cmpw	%di, (%rax)
	jne	LBB145_319
## %bb.283:
	cmpw	%si, 2(%rax)
	jne	LBB145_319
## %bb.284:
	cmpw	%dx, 4(%rax)
	jne	LBB145_319
## %bb.285:
	movw	$0, 6(%rax)
	cmpl	$0, -5260(%rbp)         ## 4-byte Folded Reload
	jne	LBB145_320
	jmp	LBB145_350
LBB145_286:
	movl	12(%r13), %edx
	movq	(%r14), %rsi
	movq	24(%r14), %rax
	movl	4(%rsi), %r9d
	imull	(%rsi), %r9d
	cmpl	$2, %edx
	je	LBB145_312
## %bb.287:
	cmpl	$4, %edx
	jne	LBB145_373
## %bb.288:
	testl	%r9d, %r9d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.289:
	movb	-5212(%rbp), %dl
	movb	-5211(%rbp), %bl
	movb	-5210(%rbp), %sil
	movl	%r9d, %r8d
	andl	$1, %r8d
	cmpl	$1, %r9d
	je	LBB145_300
## %bb.290:
	movl	%r8d, %edi
	subl	%r9d, %edi
LBB145_291:                             ## =>This Inner Loop Header: Depth=1
	cmpb	%dl, (%rax)
	jne	LBB145_295
## %bb.292:                             ##   in Loop: Header=BB145_291 Depth=1
	cmpb	%bl, 1(%rax)
	jne	LBB145_295
## %bb.293:                             ##   in Loop: Header=BB145_291 Depth=1
	cmpb	%sil, 2(%rax)
	jne	LBB145_295
## %bb.294:                             ##   in Loop: Header=BB145_291 Depth=1
	movb	$0, 3(%rax)
LBB145_295:                             ##   in Loop: Header=BB145_291 Depth=1
	cmpb	%dl, 4(%rax)
	jne	LBB145_299
## %bb.296:                             ##   in Loop: Header=BB145_291 Depth=1
	cmpb	%bl, 5(%rax)
	jne	LBB145_299
## %bb.297:                             ##   in Loop: Header=BB145_291 Depth=1
	cmpb	%sil, 6(%rax)
	jne	LBB145_299
## %bb.298:                             ##   in Loop: Header=BB145_291 Depth=1
	movb	$0, 7(%rax)
LBB145_299:                             ##   in Loop: Header=BB145_291 Depth=1
	addq	$8, %rax
	addl	$2, %edi
	jne	LBB145_291
LBB145_300:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.301:
	cmpb	%dl, (%rax)
	jne	LBB145_319
## %bb.302:
	cmpb	%bl, 1(%rax)
	jne	LBB145_319
## %bb.303:
	cmpb	%sil, 2(%rax)
	jne	LBB145_319
## %bb.304:
	movb	$0, 3(%rax)
	cmpl	$0, -5260(%rbp)         ## 4-byte Folded Reload
	jne	LBB145_320
	jmp	LBB145_350
LBB145_305:
	testl	%ecx, %ecx
	je	LBB145_319
## %bb.306:
	movzwl	-5286(%rbp), %edx
	leal	-1(%rcx), %edi
	movl	%ecx, %r8d
	andl	$3, %r8d
	cmpl	$3, %edi
	jb	LBB145_309
## %bb.307:
	movl	%r8d, %edi
	subl	%ecx, %edi
LBB145_308:                             ## =>This Inner Loop Header: Depth=1
	xorl	%ebx, %ebx
	cmpw	%dx, (%rax)
	movzwl	4(%rax), %esi
	setne	%bl
	negl	%ebx
	movw	%bx, 2(%rax)
	xorl	%ebx, %ebx
	cmpw	%dx, %si
	setne	%bl
	negl	%ebx
	movw	%bx, 6(%rax)
	xorl	%esi, %esi
	cmpw	%dx, 8(%rax)
	setne	%sil
	negl	%esi
	movw	%si, 10(%rax)
	xorl	%esi, %esi
	cmpw	%dx, 12(%rax)
	setne	%sil
	negl	%esi
	movw	%si, 14(%rax)
	addq	$16, %rax
	addl	$4, %edi
	jne	LBB145_308
LBB145_309:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.310:
	andl	$3, %ecx
	xorl	%esi, %esi
LBB145_311:                             ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	cmpw	%dx, (%rax,%rsi,4)
	setne	%dil
	negl	%edi
	movw	%di, 2(%rax,%rsi,4)
	incq	%rsi
	cmpl	%esi, %ecx
	jne	LBB145_311
	jmp	LBB145_319
LBB145_312:
	testl	%r9d, %r9d
	je	LBB145_319
## %bb.313:
	movb	-5212(%rbp), %dl
	leal	-1(%r9), %edi
	movl	%r9d, %esi
	andl	$3, %esi
	cmpl	$3, %edi
	jb	LBB145_316
## %bb.314:
	movl	%esi, %edi
	subl	%r9d, %edi
LBB145_315:                             ## =>This Inner Loop Header: Depth=1
	cmpb	%dl, (%rax)
	movzbl	2(%rax), %ebx
	setne	%cl
	negb	%cl
	movb	%cl, 1(%rax)
	cmpb	%dl, %bl
	setne	%cl
	negb	%cl
	movb	%cl, 3(%rax)
	cmpb	%dl, 4(%rax)
	setne	%cl
	negb	%cl
	movb	%cl, 5(%rax)
	cmpb	%dl, 6(%rax)
	setne	%cl
	negb	%cl
	movb	%cl, 7(%rax)
	addq	$8, %rax
	addl	$4, %edi
	jne	LBB145_315
LBB145_316:
	testl	%esi, %esi
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_319
## %bb.317:
	andl	$3, %r9d
	xorl	%esi, %esi
LBB145_318:                             ## =>This Inner Loop Header: Depth=1
	cmpb	%dl, (%rax,%rsi,2)
	setne	%cl
	negb	%cl
	movb	%cl, 1(%rax,%rsi,2)
	incq	%rsi
	cmpl	%esi, %r9d
	jne	LBB145_318
LBB145_319:
	cmpl	$0, -5260(%rbp)         ## 4-byte Folded Reload
	je	LBB145_350
LBB145_320:
	movq	_stbi__de_iphone_flag_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpb	$1, (%rax)
	jne	LBB145_322
## %bb.321:
	movq	_stbi__de_iphone_flag_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpl	$0, (%rax)
	jne	LBB145_323
	jmp	LBB145_350
LBB145_322:
	cmpl	$0, _stbi__de_iphone_flag_global(%rip)
	je	LBB145_350
LBB145_323:
	cmpl	$3, 12(%r13)
	jl	LBB145_350
## %bb.324:
	movq	(%r14), %rsi
	movq	24(%r14), %rcx
	movl	4(%rsi), %r8d
	movl	12(%rsi), %eax
	imull	(%rsi), %r8d
	cmpl	$3, %eax
	jne	LBB145_332
## %bb.325:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_350
## %bb.326:
	leal	-1(%r8), %esi
	movl	%r8d, %eax
	andl	$3, %eax
	cmpl	$3, %esi
	jb	LBB145_329
## %bb.327:
	movl	%eax, %esi
	subl	%r8d, %esi
LBB145_328:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %edx
	movzbl	2(%rcx), %ebx
	movb	%bl, (%rcx)
	movb	%dl, 2(%rcx)
	movzbl	3(%rcx), %edx
	movzbl	5(%rcx), %ebx
	movb	%bl, 3(%rcx)
	movb	%dl, 5(%rcx)
	movzbl	6(%rcx), %edx
	movzbl	8(%rcx), %ebx
	movb	%bl, 6(%rcx)
	movb	%dl, 8(%rcx)
	movzbl	9(%rcx), %edx
	movzbl	11(%rcx), %ebx
	movb	%bl, 9(%rcx)
	movb	%dl, 11(%rcx)
	addq	$12, %rcx
	addl	$4, %esi
	jne	LBB145_328
LBB145_329:
	testl	%eax, %eax
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_350
## %bb.330:
	negl	%eax
LBB145_331:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %edx
	movzbl	2(%rcx), %ebx
	movb	%bl, (%rcx)
	movb	%dl, 2(%rcx)
	addq	$3, %rcx
	incl	%eax
	jne	LBB145_331
	jmp	LBB145_350
LBB145_332:
	cmpl	$4, %eax
	jne	LBB145_374
## %bb.333:
	movq	_stbi__unpremultiply_on_load_set@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpb	$1, (%rax)
	jne	LBB145_342
## %bb.334:
	movq	_stbi__unpremultiply_on_load_local@TLVP(%rip), %rdi
	callq	*(%rdi)
	cmpl	$0, (%rax)
	je	LBB145_343
LBB145_335:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_350
## %bb.336:
	movl	%r8d, %r8d
	xorl	%edi, %edi
LBB145_337:                             ## =>This Inner Loop Header: Depth=1
	movzbl	3(%rcx,%rdi,4), %ebx
	movzbl	(%rcx,%rdi,4), %eax
	testl	%ebx, %ebx
	je	LBB145_339
## %bb.338:                             ##   in Loop: Header=BB145_337 Depth=1
	movzbl	%al, %r9d
	movl	%ebx, %esi
	shrl	%esi
	movzbl	2(%rcx,%rdi,4), %edx
	movl	%edx, %eax
	shll	$8, %eax
	subl	%edx, %eax
	addl	%esi, %eax
                                        ## kill: def $ax killed $ax killed $eax
	xorl	%edx, %edx
	divw	%bx
	movb	%al, (%rcx,%rdi,4)
	movzbl	1(%rcx,%rdi,4), %edx
	movl	%edx, %eax
	shll	$8, %eax
	subl	%edx, %eax
	addl	%esi, %eax
                                        ## kill: def $ax killed $ax killed $eax
	xorl	%edx, %edx
	divw	%bx
	movb	%al, 1(%rcx,%rdi,4)
	movl	%r9d, %eax
	shll	$8, %eax
	subl	%r9d, %eax
	addl	%esi, %eax
                                        ## kill: def $ax killed $ax killed $eax
	xorl	%edx, %edx
	divw	%bx
	movb	%al, 2(%rcx,%rdi,4)
	jmp	LBB145_340
LBB145_339:                             ##   in Loop: Header=BB145_337 Depth=1
	movzbl	2(%rcx,%rdi,4), %edx
	movb	%dl, (%rcx,%rdi,4)
	movb	%al, 2(%rcx,%rdi,4)
LBB145_340:                             ##   in Loop: Header=BB145_337 Depth=1
	incq	%rdi
	cmpl	%edi, %r8d
	jne	LBB145_337
	jmp	LBB145_350
LBB145_341:
	movq	-5328(%rbp), %rdi       ## 8-byte Reload
	callq	_free
	jmp	LBB145_206
LBB145_342:
	cmpl	$0, _stbi__unpremultiply_on_load_global(%rip)
	jne	LBB145_335
LBB145_343:
	testl	%r8d, %r8d
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_350
## %bb.344:
	leal	-1(%r8), %esi
	movl	%r8d, %edi
	andl	$3, %edi
	cmpl	$3, %esi
	jb	LBB145_347
## %bb.345:
	movl	%edi, %esi
	subl	%r8d, %esi
LBB145_346:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %ebx
	movzbl	2(%rcx), %eax
	movb	%al, (%rcx)
	movb	%bl, 2(%rcx)
	movzbl	4(%rcx), %eax
	movzbl	6(%rcx), %ebx
	movb	%bl, 4(%rcx)
	movb	%al, 6(%rcx)
	movzbl	8(%rcx), %eax
	movzbl	10(%rcx), %ebx
	movb	%bl, 8(%rcx)
	movb	%al, 10(%rcx)
	movzbl	12(%rcx), %eax
	movzbl	14(%rcx), %ebx
	movb	%bl, 12(%rcx)
	movb	%al, 14(%rcx)
	addq	$16, %rcx
	addl	$4, %esi
	jne	LBB145_346
LBB145_347:
	testl	%edi, %edi
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movl	-5172(%rbp), %r15d      ## 4-byte Reload
	je	LBB145_350
## %bb.348:
	andl	$3, %r8d
	xorl	%eax, %eax
LBB145_349:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rax,4), %ebx
	movzbl	2(%rcx,%rax,4), %edx
	movb	%dl, (%rcx,%rax,4)
	movb	%bl, 2(%rcx,%rax,4)
	incq	%rax
	cmpl	%eax, %r8d
	jne	LBB145_349
LBB145_350:
	testb	%r15b, %r15b
	je	LBB145_360
## %bb.351:
	movzbl	%r15b, %ebx
	movl	%ebx, 8(%r13)
	movl	-5320(%rbp), %eax       ## 4-byte Reload
	cmpl	$2, %eax
	cmovgl	%eax, %ebx
	movl	%ebx, 12(%r13)
	movq	(%r14), %rax
	movl	4(%rax), %r15d
	imull	(%rax), %r15d
	movl	%r15d, %eax
	orl	%ebx, %eax
	js	LBB145_359
## %bb.352:
	movq	-5208(%rbp), %rax       ## 8-byte Reload
	movq	24(%rax), %r14
	testl	%ebx, %ebx
	je	LBB145_354
## %bb.353:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%ebx
	cmpl	%r15d, %eax
	jl	LBB145_359
LBB145_354:
	movl	%r15d, %eax
	imull	%ebx, %eax
	movslq	%eax, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB145_359
## %bb.355:
	movq	%rax, %r12
	cmpl	$3, %ebx
	jne	LBB145_362
## %bb.356:
	testl	%r15d, %r15d
	je	LBB145_369
## %bb.357:
	movl	%r15d, %esi
	movl	%esi, %eax
	andl	$1, %eax
	cmpl	$1, %r15d
	jne	LBB145_365
## %bb.358:
	xorl	%edx, %edx
	movq	%r12, %rcx
	testq	%rax, %rax
	jne	LBB145_368
	jmp	LBB145_369
LBB145_359:
	leaq	L_.str.67(%rip), %rcx
	jmp	LBB145_205
LBB145_360:
	cmpb	$0, -5296(%rbp)         ## 1-byte Folded Reload
	je	LBB145_370
## %bb.361:
	incl	8(%r13)
	jmp	LBB145_370
LBB145_362:
	testl	%r15d, %r15d
	je	LBB145_369
## %bb.363:
	movl	%r15d, %eax
	xorl	%ecx, %ecx
LBB145_364:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%r14,%rcx), %edx
	movzbl	-5168(%rbp,%rdx,4), %ebx
	movb	%bl, (%r12,%rcx,4)
	movzbl	-5167(%rbp,%rdx,4), %ebx
	movb	%bl, 1(%r12,%rcx,4)
	movzbl	-5166(%rbp,%rdx,4), %ebx
	movb	%bl, 2(%r12,%rcx,4)
	movzbl	-5165(%rbp,%rdx,4), %edx
	movb	%dl, 3(%r12,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %rax
	jne	LBB145_364
	jmp	LBB145_369
LBB145_365:
	subq	%rax, %rsi
	xorl	%edx, %edx
	movq	%r12, %rcx
LBB145_366:                             ## =>This Inner Loop Header: Depth=1
	movzbl	(%r14,%rdx), %edi
	movzbl	-5168(%rbp,%rdi,4), %ebx
	movb	%bl, (%rcx)
	movzbl	-5167(%rbp,%rdi,4), %ebx
	movb	%bl, 1(%rcx)
	movzbl	-5166(%rbp,%rdi,4), %ebx
	movb	%bl, 2(%rcx)
	movzbl	1(%r14,%rdx), %edi
	movzbl	-5168(%rbp,%rdi,4), %ebx
	movb	%bl, 3(%rcx)
	movzbl	-5167(%rbp,%rdi,4), %ebx
	movb	%bl, 4(%rcx)
	movzbl	-5166(%rbp,%rdi,4), %ebx
	movb	%bl, 5(%rcx)
	addq	$6, %rcx
	addq	$2, %rdx
	cmpq	%rdx, %rsi
	jne	LBB145_366
## %bb.367:
	testq	%rax, %rax
	je	LBB145_369
LBB145_368:
	movzbl	(%r14,%rdx), %eax
	movb	-5168(%rbp,%rax,4), %dl
	movb	%dl, (%rcx)
	movb	-5167(%rbp,%rax,4), %dl
	movb	%dl, 1(%rcx)
	movb	-5166(%rbp,%rax,4), %al
	movb	%al, 2(%rcx)
LBB145_369:
	movq	-5208(%rbp), %r14       ## 8-byte Reload
	movq	24(%r14), %rdi
	callq	_free
	movq	%r12, 24(%r14)
LBB145_370:
	movq	16(%r14), %rdi
	callq	_free
	movq	$0, 16(%r14)
	movq	%r13, %rdi
	callq	_stbi__get32be
	movl	$1, %ebx
	jmp	LBB145_207
LBB145_371:
	callq	___stack_chk_fail
LBB145_372:
	leaq	L___func__.stbi__compute_transparency16(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.76(%rip), %rcx
	movl	$4884, %edx             ## imm = 0x1314
	callq	___assert_rtn
LBB145_373:
	leaq	L___func__.stbi__compute_transparency(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.76(%rip), %rcx
	movl	$4859, %edx             ## imm = 0x12FB
	callq	___assert_rtn
LBB145_374:
	leaq	L___func__.stbi__de_iphone(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.77(%rip), %rcx
	movl	$4992, %edx             ## imm = 0x1380
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__get32be
_stbi__get32be:                         ## @stbi__get32be
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	192(%rdi), %rcx
	movq	200(%rdi), %rax
	cmpq	%rax, %rcx
	jae	LBB146_2
## %bb.1:
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%r14)
	movb	(%rcx), %dl
	movq	%rsi, %rcx
	jmp	LBB146_8
LBB146_2:
	cmpl	$0, 48(%r14)
	je	LBB146_3
## %bb.4:
	movq	40(%r14), %rdi
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	%rbx, %rsi
	callq	*16(%r14)
	movl	192(%r14), %ecx
	subl	208(%r14), %ecx
	addl	%ecx, 184(%r14)
	testl	%eax, %eax
	je	LBB146_5
## %bb.6:
	movq	%rbx, 192(%r14)
	cltq
	leaq	56(%r14,%rax), %rax
	movb	56(%r14), %dl
	jmp	LBB146_7
LBB146_3:
	xorl	%edx, %edx
	jmp	LBB146_8
LBB146_5:
	movl	$0, 48(%r14)
	movq	%rbx, 192(%r14)
	leaq	57(%r14), %rax
	movb	$0, 56(%r14)
	xorl	%edx, %edx
LBB146_7:
	movq	%rax, 200(%r14)
	leaq	57(%r14), %rcx
	movq	%rcx, 192(%r14)
LBB146_8:
	movzbl	%dl, %r12d
	shll	$8, %r12d
	cmpq	%rax, %rcx
	jae	LBB146_10
## %bb.9:
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%r14)
	movb	(%rcx), %dl
	movq	%rsi, %rcx
	jmp	LBB146_16
LBB146_10:
	cmpl	$0, 48(%r14)
	je	LBB146_11
## %bb.12:
	movq	40(%r14), %rdi
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	%rbx, %rsi
	callq	*16(%r14)
	movl	192(%r14), %ecx
	subl	208(%r14), %ecx
	addl	%ecx, 184(%r14)
	testl	%eax, %eax
	je	LBB146_13
## %bb.14:
	movq	%rbx, 192(%r14)
	cltq
	leaq	56(%r14,%rax), %rax
	movb	56(%r14), %dl
	jmp	LBB146_15
LBB146_11:
	xorl	%edx, %edx
	jmp	LBB146_16
LBB146_13:
	movl	$0, 48(%r14)
	movq	%rbx, 192(%r14)
	leaq	57(%r14), %rax
	movb	$0, 56(%r14)
	xorl	%edx, %edx
LBB146_15:
	movq	%rax, 200(%r14)
	leaq	57(%r14), %rcx
	movq	%rcx, 192(%r14)
LBB146_16:
	movzbl	%dl, %edx
	orl	%edx, %r12d
	cmpq	%rax, %rcx
	jae	LBB146_18
## %bb.17:
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%r14)
	movb	(%rcx), %dl
	movq	%rsi, %rcx
	jmp	LBB146_24
LBB146_18:
	cmpl	$0, 48(%r14)
	je	LBB146_19
## %bb.20:
	movq	40(%r14), %rdi
	leaq	56(%r14), %rbx
	movl	52(%r14), %edx
	movq	%rbx, %rsi
	callq	*16(%r14)
	movl	192(%r14), %ecx
	subl	208(%r14), %ecx
	addl	%ecx, 184(%r14)
	testl	%eax, %eax
	je	LBB146_21
## %bb.22:
	movq	%rbx, 192(%r14)
	cltq
	leaq	56(%r14,%rax), %rax
	movb	56(%r14), %dl
	jmp	LBB146_23
LBB146_19:
	xorl	%edx, %edx
	jmp	LBB146_24
LBB146_21:
	movl	$0, 48(%r14)
	movq	%rbx, 192(%r14)
	leaq	57(%r14), %rax
	movb	$0, 56(%r14)
	xorl	%edx, %edx
LBB146_23:
	movq	%rax, 200(%r14)
	leaq	57(%r14), %rcx
	movq	%rcx, 192(%r14)
LBB146_24:
	shll	$16, %r12d
	movzbl	%dl, %ebx
	shll	$8, %ebx
	cmpq	%rax, %rcx
	jae	LBB146_26
## %bb.25:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r14)
	movb	(%rcx), %al
	jmp	LBB146_32
LBB146_26:
	cmpl	$0, 48(%r14)
	je	LBB146_27
## %bb.28:
	movq	40(%r14), %rdi
	leaq	56(%r14), %r15
	movl	52(%r14), %edx
	movq	%r15, %rsi
	callq	*16(%r14)
	movl	192(%r14), %ecx
	subl	208(%r14), %ecx
	addl	%ecx, 184(%r14)
	testl	%eax, %eax
	je	LBB146_29
## %bb.30:
	movq	%r15, 192(%r14)
	cltq
	leaq	56(%r14,%rax), %rcx
	movb	56(%r14), %al
	jmp	LBB146_31
LBB146_27:
	xorl	%eax, %eax
	jmp	LBB146_32
LBB146_29:
	movl	$0, 48(%r14)
	movq	%r15, 192(%r14)
	leaq	57(%r14), %rcx
	movb	$0, 56(%r14)
	xorl	%eax, %eax
LBB146_31:
	movq	%rcx, 200(%r14)
	leaq	57(%r14), %rcx
	movq	%rcx, 192(%r14)
LBB146_32:
	movzbl	%al, %eax
	orl	%r12d, %ebx
	orl	%eax, %ebx
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbi__create_png_image_raw
LCPI147_0:
	.space	16,127
LCPI147_1:
	.space	1
	.space	1
	.space	1
	.space	1
	.byte	0                       ## 0x0
	.byte	4                       ## 0x4
	.byte	8                       ## 0x8
	.byte	12                      ## 0xc
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
LCPI147_2:
	.byte	0                       ## 0x0
	.byte	4                       ## 0x4
	.byte	8                       ## 0x8
	.byte	12                      ## 0xc
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.space	1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbi__create_png_image_raw:            ## @stbi__create_png_image_raw
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$584, %rsp              ## imm = 0x248
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r12d
	movl	%ecx, %r14d
	movl	%edx, %r15d
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, %r13
	xorl	%ebx, %ebx
	cmpl	$16, 16(%rbp)
	sete	%cl
	movq	(%rdi), %rax
	movl	8(%rax), %edi
	leal	1(%rdi), %r8d
	cmpl	%r14d, %r8d
	je	LBB147_2
## %bb.1:
	cmpl	%r14d, %edi
	jne	LBB147_408
LBB147_2:
	movl	%r9d, %eax
	orl	%r12d, %eax
	js	LBB147_8
## %bb.3:
	testl	%r9d, %r9d
	je	LBB147_5
## %bb.4:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r9d
	cmpl	%r12d, %eax
	jl	LBB147_8
LBB147_5:
	movb	%cl, %bl
	incl	%ebx
	movl	%ebx, %esi
	imull	%r14d, %esi
	movl	%r9d, %ecx
	imull	%r12d, %ecx
	movl	%esi, %eax
	orl	%ecx, %eax
	js	LBB147_8
## %bb.6:
	testl	%esi, %esi
	je	LBB147_12
## %bb.7:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%esi
	cmpl	%ecx, %eax
	jge	LBB147_12
LBB147_8:
	movq	$0, 24(%r13)
LBB147_9:
	leaq	L_.str.67(%rip), %rcx
LBB147_10:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%r14d, %r14d
LBB147_11:
	movl	%r14d, %eax
	addq	$584, %rsp              ## imm = 0x248
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB147_12:
	movl	%r8d, -184(%rbp)        ## 4-byte Spill
	movl	%r9d, -312(%rbp)        ## 4-byte Spill
	movq	%rdi, -328(%rbp)        ## 8-byte Spill
	movl	%ebx, -188(%rbp)        ## 4-byte Spill
	movl	%esi, -176(%rbp)        ## 4-byte Spill
	imull	%esi, %ecx
	movslq	%ecx, %rdi
	callq	_malloc
	movq	%rax, 24(%r13)
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	testq	%rax, %rax
	je	LBB147_9
## %bb.13:
	movq	-328(%rbp), %r8         ## 8-byte Reload
	movl	%r8d, %eax
	orl	%r12d, %eax
	movl	16(%rbp), %r11d
	js	LBB147_20
## %bb.14:
	testl	%r12d, %r12d
	je	LBB147_16
## %bb.15:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r12d
	cmpl	%r8d, %eax
	jl	LBB147_20
LBB147_16:
	movl	%r8d, %ecx
	imull	%r12d, %ecx
	movl	%ecx, %eax
	orl	%r11d, %eax
	js	LBB147_20
## %bb.17:
	testl	%r11d, %r11d
	je	LBB147_19
## %bb.18:
	movl	$2147483647, %eax       ## imm = 0x7FFFFFFF
	xorl	%edx, %edx
	idivl	%r11d
	cmpl	%ecx, %eax
	jl	LBB147_20
LBB147_19:
	movl	%ecx, %ebx
	imull	%r11d, %ebx
	cmpl	$2147483641, %ebx       ## imm = 0x7FFFFFF9
	jl	LBB147_21
LBB147_20:
	leaq	L_.str.53(%rip), %rcx
	jmp	LBB147_10
LBB147_21:
	addl	$7, %ebx
	shrl	$3, %ebx
	leal	1(%rbx), %eax
	movl	-312(%rbp), %esi        ## 4-byte Reload
	imull	%esi, %eax
	cmpl	%r15d, %eax
	jbe	LBB147_23
## %bb.22:
	leaq	L_.str.71(%rip), %rcx
	jmp	LBB147_10
LBB147_23:
	movq	%rcx, -464(%rbp)        ## 8-byte Spill
	movl	%r12d, %ecx
	imull	%r14d, %ecx
	movl	-188(%rbp), %eax        ## 4-byte Reload
	movq	%rcx, -384(%rbp)        ## 8-byte Spill
	imull	%ecx, %eax
	movl	%eax, -320(%rbp)        ## 4-byte Spill
	testl	%esi, %esi
	movq	%r13, -376(%rbp)        ## 8-byte Spill
	movq	%r12, -360(%rbp)        ## 8-byte Spill
	movl	%r14d, -180(%rbp)       ## 4-byte Spill
	je	LBB147_349
## %bb.24:
	cmpl	%r14d, %r8d
	sete	%r10b
	cmpl	$8, %r11d
	setl	-81(%rbp)               ## 1-byte Folded Spill
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movb	(%rax), %dl
	cmpb	$4, %dl
	ja	LBB147_398
## %bb.25:
	movl	%r8d, %eax
	imull	-188(%rbp), %eax        ## 4-byte Folded Reload
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movq	-384(%rbp), %rax        ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax def $rax
	subl	%ebx, %eax
	movq	%rax, -592(%rbp)        ## 8-byte Spill
	movl	-320(%rbp), %edi        ## 4-byte Reload
	movq	%rdi, %rcx
	negq	%rcx
	movq	%rcx, -400(%rbp)        ## 8-byte Spill
	movl	-176(%rbp), %r9d        ## 4-byte Reload
	movslq	%r9d, %r15
	orb	%r10b, -81(%rbp)        ## 1-byte Folded Spill
	testl	%r12d, %r12d
	sete	%r10b
	cmpl	$16, %r11d
	setne	%cl
	orb	%r10b, %cl
	movb	%cl, -129(%rbp)         ## 1-byte Spill
	movl	%r12d, %ecx
	andl	$7, %ecx
	movq	%r15, %rax
	negq	%rax
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	subq	%rdi, %rax
	movq	%rax, -520(%rbp)        ## 8-byte Spill
	movl	$1, %eax
	subq	%rdi, %rax
	movq	%rax, -432(%rbp)        ## 8-byte Spill
	movl	$3, %eax
	subq	%rdi, %rax
	movq	%rax, -512(%rbp)        ## 8-byte Spill
	movl	$16, %eax
	subq	%rdi, %rax
	movq	%rax, -504(%rbp)        ## 8-byte Spill
	movl	$48, %eax
	subq	%rdi, %rax
	movq	%rax, -496(%rbp)        ## 8-byte Spill
	movl	$32, %eax
	subl	%r9d, %eax
	movl	%eax, -316(%rbp)        ## 4-byte Spill
	movl	%r9d, %eax
	negl	%eax
	movq	%rax, -440(%rbp)        ## 8-byte Spill
	leaq	(,%r15,8), %rax
	subq	%r15, %rax
	movq	%rax, -568(%rbp)        ## 8-byte Spill
	movl	%ecx, %eax
	subl	%r12d, %eax
	movl	%eax, -412(%rbp)        ## 4-byte Spill
	movl	%ecx, -420(%rbp)        ## 4-byte Spill
	negl	%ecx
	movl	%ecx, -416(%rbp)        ## 4-byte Spill
	movdqa	LCPI147_0(%rip), %xmm8  ## xmm8 = [127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127]
	movslq	%r8d, %rax
	movq	%rax, -448(%rbp)        ## 8-byte Spill
	movslq	%r14d, %rax
	movq	%rax, -600(%rbp)        ## 8-byte Spill
	leal	-1(%r12), %eax
	movl	%eax, -340(%rbp)        ## 4-byte Spill
	movl	%esi, %eax
	movq	%rax, -608(%rbp)        ## 8-byte Spill
	leaq	(%r15,%r15), %rax
	movq	%rax, -560(%rbp)        ## 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, -552(%rbp)        ## 8-byte Spill
	leaq	(%r15,%r15,4), %rax
	movq	%rax, -544(%rbp)        ## 8-byte Spill
	leaq	(,%r15,4), %rax
	movq	%rax, -536(%rbp)        ## 8-byte Spill
	leaq	(%r15,%r15,2), %rax
	movq	%rax, -528(%rbp)        ## 8-byte Spill
	xorl	%ecx, %ecx
	leaq	LJTI147_0(%rip), %rdi
	movl	%r12d, %eax
	movq	%rax, -456(%rbp)        ## 8-byte Spill
	xorl	%r9d, %r9d
	movq	%rbx, -352(%rbp)        ## 8-byte Spill
	movq	%r15, -80(%rbp)         ## 8-byte Spill
LBB147_26:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB147_33 Depth 2
                                        ##     Child Loop BB147_239 Depth 2
                                        ##       Child Loop BB147_251 Depth 3
                                        ##       Child Loop BB147_246 Depth 3
                                        ##     Child Loop BB147_218 Depth 2
                                        ##       Child Loop BB147_230 Depth 3
                                        ##       Child Loop BB147_225 Depth 3
                                        ##     Child Loop BB147_104 Depth 2
                                        ##       Child Loop BB147_99 Depth 3
                                        ##       Child Loop BB147_109 Depth 3
                                        ##     Child Loop BB147_159 Depth 2
                                        ##       Child Loop BB147_172 Depth 3
                                        ##       Child Loop BB147_166 Depth 3
                                        ##     Child Loop BB147_127 Depth 2
                                        ##       Child Loop BB147_141 Depth 3
                                        ##       Child Loop BB147_132 Depth 3
                                        ##       Child Loop BB147_136 Depth 3
                                        ##     Child Loop BB147_197 Depth 2
                                        ##       Child Loop BB147_209 Depth 3
                                        ##       Child Loop BB147_204 Depth 3
                                        ##     Child Loop BB147_59 Depth 2
                                        ##       Child Loop BB147_68 Depth 3
                                        ##       Child Loop BB147_71 Depth 3
                                        ##       Child Loop BB147_75 Depth 3
                                        ##       Child Loop BB147_77 Depth 3
                                        ##     Child Loop BB147_270 Depth 2
                                        ##     Child Loop BB147_273 Depth 2
                                        ##     Child Loop BB147_307 Depth 2
                                        ##     Child Loop BB147_194 Depth 2
                                        ##     Child Loop BB147_302 Depth 2
                                        ##     Child Loop BB147_186 Depth 2
                                        ##     Child Loop BB147_280 Depth 2
                                        ##     Child Loop BB147_335 Depth 2
                                        ##     Child Loop BB147_292 Depth 2
                                        ##     Child Loop BB147_124 Depth 2
                                        ##     Child Loop BB147_286 Depth 2
                                        ##     Child Loop BB147_87 Depth 2
                                        ##     Child Loop BB147_91 Depth 2
                                        ##     Child Loop BB147_297 Depth 2
                                        ##     Child Loop BB147_155 Depth 2
	cmpl	$7, %r11d
	jg	LBB147_29
## %bb.27:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	%r12d, %ebx
	ja	LBB147_407
## %bb.28:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	addq	-592(%rbp), %rax        ## 8-byte Folded Reload
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movl	$1, -44(%rbp)           ## 4-byte Folded Spill
                                        ## kill: def $ebx killed $ebx killed $rbx def $rbx
	movq	%rbx, -456(%rbp)        ## 8-byte Spill
LBB147_29:                              ##   in Loop: Header=BB147_26 Depth=1
	testq	%r9, %r9
	movq	%rcx, -616(%rbp)        ## 8-byte Spill
	jne	LBB147_31
## %bb.30:                              ##   in Loop: Header=BB147_26 Depth=1
	movzbl	%dl, %eax
	leaq	_first_row_filter(%rip), %rcx
	movb	(%rax,%rcx), %dl
LBB147_31:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	leaq	1(%rax), %r10
	movq	-400(%rbp), %rax        ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rax), %r12
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_41
## %bb.32:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB147_33:                              ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpb	$6, %dl
	ja	LBB147_40
## %bb.34:                              ##   in Loop: Header=BB147_33 Depth=2
	movzbl	%dl, %esi
	movslq	(%rdi,%rsi,4), %rsi
	addq	%rdi, %rsi
	jmpq	*%rsi
LBB147_35:                              ##   in Loop: Header=BB147_33 Depth=2
	movzbl	(%r10,%rcx), %ebx
	jmp	LBB147_39
LBB147_36:                              ##   in Loop: Header=BB147_33 Depth=2
	movzbl	(%r12,%rcx), %ebx
	jmp	LBB147_38
LBB147_37:                              ##   in Loop: Header=BB147_33 Depth=2
	movzbl	(%r12,%rcx), %ebx
	shrb	%bl
LBB147_38:                              ##   in Loop: Header=BB147_33 Depth=2
	addb	(%r10,%rcx), %bl
LBB147_39:                              ##   in Loop: Header=BB147_33 Depth=2
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	movb	%bl, (%rsi,%rcx)
LBB147_40:                              ##   in Loop: Header=BB147_33 Depth=2
	incq	%rcx
	cmpq	%rcx, %rax
	jne	LBB147_33
LBB147_41:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$8, %r11d
	jne	LBB147_45
## %bb.42:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	%r14d, %r8d
	je	LBB147_44
## %bb.43:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-448(%rbp), %rax        ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movb	$-1, (%rcx,%rax)
LBB147_44:                              ##   in Loop: Header=BB147_26 Depth=1
	addq	-448(%rbp), %r10        ## 8-byte Folded Reload
	movq	-600(%rbp), %rdi        ## 8-byte Reload
	jmp	LBB147_50
LBB147_45:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$16, %r11d
	jne	LBB147_49
## %bb.46:                              ##   in Loop: Header=BB147_26 Depth=1
	movslq	-44(%rbp), %rax         ## 4-byte Folded Reload
	cmpl	%r14d, %r8d
	je	LBB147_48
## %bb.47:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movb	$-1, (%rcx,%rax)
	movb	$-1, 1(%rcx,%rax)
LBB147_48:                              ##   in Loop: Header=BB147_26 Depth=1
	addq	%rax, %r10
	movq	%r15, %rdi
	jmp	LBB147_50
LBB147_49:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-56(%rbp), %r10         ## 8-byte Reload
	addq	$2, %r10
	movl	$1, %edi
LBB147_50:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-184(%rbp), %eax        ## 4-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rdi), %rcx
	movq	%rcx, -128(%rbp)        ## 8-byte Spill
	leaq	(%r12,%rdi), %rbx
	cmpb	$0, -81(%rbp)           ## 1-byte Folded Reload
	movq	%r10, -72(%rbp)         ## 8-byte Spill
	movq	%rbx, -168(%rbp)        ## 8-byte Spill
	movq	%r9, -368(%rbp)         ## 8-byte Spill
	je	LBB147_54
## %bb.51:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	-456(%rbp), %rax        ## 8-byte Reload
	leal	-1(%rax), %eax
	imull	-44(%rbp), %eax         ## 4-byte Folded Reload
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	cmpb	$6, %dl
	movq	-128(%rbp), %r15        ## 8-byte Reload
	ja	LBB147_342
## %bb.52:                              ##   in Loop: Header=BB147_26 Depth=1
	movzbl	%dl, %eax
	leaq	LJTI147_2(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB147_53:                              ##   in Loop: Header=BB147_26 Depth=1
	movslq	-56(%rbp), %rdx         ## 4-byte Folded Reload
	movq	%r15, %rdi
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	callq	_memcpy
	movdqa	LCPI147_0(%rip), %xmm8  ## xmm8 = [127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127]
	jmp	LBB147_342
LBB147_54:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	%r14d, %eax
	jne	LBB147_410
## %bb.55:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpb	$6, %dl
	movl	-340(%rbp), %ecx        ## 4-byte Reload
	ja	LBB147_156
## %bb.56:                              ##   in Loop: Header=BB147_26 Depth=1
	movzbl	%dl, %eax
	leaq	LJTI147_1(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmpq	*%rax
LBB147_57:                              ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.58:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %r13
	movl	%eax, %r14d
	movl	%r14d, %eax
	andl	$-32, %eax
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	leaq	-32(%rax), %rax
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	shrq	$5, %rax
	leal	1(%rax), %r9d
	andl	$3, %r9d
	movl	%r14d, %edx
	andl	$3, %edx
	movq	%r9, %rsi
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -208(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	16(%rax,%rdi), %r12
	leaq	16(%r10), %r8
	movq	%r9, -224(%rbp)         ## 8-byte Spill
	shlq	$5, %r9
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	negq	%rdx
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	movq	%r10, %rax
	xorl	%r10d, %r10d
	movl	%ecx, %r11d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, -160(%rbp)        ## 8-byte Spill
LBB147_59:                              ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_68 Depth 3
                                        ##       Child Loop BB147_71 Depth 3
                                        ##       Child Loop BB147_75 Depth 3
                                        ##       Child Loop BB147_77 Depth 3
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-80(%rbp), %r15         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	jle	LBB147_78
## %bb.60:                              ##   in Loop: Header=BB147_59 Depth=2
	cmpl	$32, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_62
## %bb.61:                              ##   in Loop: Header=BB147_59 Depth=2
	xorl	%eax, %eax
	jmp	LBB147_73
LBB147_62:                              ##   in Loop: Header=BB147_59 Depth=2
	movq	%r10, %rax
	imulq	%r15, %rax
	movq	%r13, %rcx
	movq	-128(%rbp), %r13        ## 8-byte Reload
	leaq	(%r13,%rax), %r15
	movq	%r10, %rdx
	imulq	%rcx, %rdx
	leaq	(%rdx,%r14), %rbx
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	addq	%rcx, %rbx
	cmpq	%rbx, %r15
	jae	LBB147_65
## %bb.63:                              ##   in Loop: Header=BB147_59 Depth=2
	addq	%r14, %rax
	addq	%r13, %rax
	addq	%rcx, %rdx
	cmpq	%rax, %rdx
	jae	LBB147_65
## %bb.64:                              ##   in Loop: Header=BB147_59 Depth=2
	xorl	%eax, %eax
	movq	-80(%rbp), %r15         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-160(%rbp), %r13        ## 8-byte Reload
	jmp	LBB147_73
LBB147_65:                              ##   in Loop: Header=BB147_59 Depth=2
	cmpq	$96, -272(%rbp)         ## 8-byte Folded Reload
	jae	LBB147_67
## %bb.66:                              ##   in Loop: Header=BB147_59 Depth=2
	xorl	%eax, %eax
	movq	-80(%rbp), %r15         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-160(%rbp), %r13        ## 8-byte Reload
	cmpq	$0, -224(%rbp)          ## 8-byte Folded Reload
	jne	LBB147_70
	jmp	LBB147_72
LBB147_67:                              ##   in Loop: Header=BB147_59 Depth=2
	movq	-208(%rbp), %rbx        ## 8-byte Reload
	xorl	%eax, %eax
	movq	-80(%rbp), %r15         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-160(%rbp), %r13        ## 8-byte Reload
LBB147_68:                              ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_59 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movups	(%rsi,%rax), %xmm0
	movups	16(%rsi,%rax), %xmm1
	movups	%xmm0, (%rdi,%rax)
	movups	%xmm1, 16(%rdi,%rax)
	movups	32(%rsi,%rax), %xmm0
	movups	48(%rsi,%rax), %xmm1
	movups	%xmm0, 32(%rdi,%rax)
	movups	%xmm1, 48(%rdi,%rax)
	movups	64(%rsi,%rax), %xmm0
	movups	80(%rsi,%rax), %xmm1
	movups	%xmm0, 64(%rdi,%rax)
	movups	%xmm1, 80(%rdi,%rax)
	movdqu	96(%rsi,%rax), %xmm0
	movdqu	112(%rsi,%rax), %xmm1
	movdqu	%xmm0, 96(%rdi,%rax)
	movdqu	%xmm1, 112(%rdi,%rax)
	subq	$-128, %rax
	addq	$4, %rbx
	jne	LBB147_68
## %bb.69:                              ##   in Loop: Header=BB147_59 Depth=2
	cmpq	$0, -224(%rbp)          ## 8-byte Folded Reload
	je	LBB147_72
LBB147_70:                              ##   in Loop: Header=BB147_59 Depth=2
	leaq	(%r12,%rax), %rbx
	addq	%r8, %rax
	xorl	%edx, %edx
LBB147_71:                              ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_59 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movdqu	-16(%rax,%rdx), %xmm0
	movdqu	(%rax,%rdx), %xmm1
	movdqu	%xmm0, -16(%rbx,%rdx)
	movdqu	%xmm1, (%rbx,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %r9
	jne	LBB147_71
LBB147_72:                              ##   in Loop: Header=BB147_59 Depth=2
	movq	-240(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rax
	cmpq	%r14, %rcx
	je	LBB147_78
LBB147_73:                              ##   in Loop: Header=BB147_59 Depth=2
	movq	%rax, %rbx
	notq	%rbx
	addq	%r14, %rbx
	cmpq	$0, -64(%rbp)           ## 8-byte Folded Reload
	je	LBB147_76
## %bb.74:                              ##   in Loop: Header=BB147_59 Depth=2
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	.p2align	4, 0x90
LBB147_75:                              ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_59 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rsi,%rax), %ecx
	movb	%cl, (%rdi,%rax)
	incq	%rax
	incq	%rdx
	jne	LBB147_75
LBB147_76:                              ##   in Loop: Header=BB147_59 Depth=2
	cmpq	$3, %rbx
	jb	LBB147_78
	.p2align	4, 0x90
LBB147_77:                              ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_59 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rsi,%rax), %ecx
	movb	%cl, (%rdi,%rax)
	movzbl	1(%rsi,%rax), %ecx
	movb	%cl, 1(%rdi,%rax)
	movzbl	2(%rsi,%rax), %ecx
	movb	%cl, 2(%rdi,%rax)
	movzbl	3(%rsi,%rax), %ecx
	movb	%cl, 3(%rdi,%rax)
	addq	$4, %rax
	cmpq	%rax, %r14
	jne	LBB147_77
LBB147_78:                              ##   in Loop: Header=BB147_59 Depth=2
	movb	$-1, (%rdi,%r13)
	addq	%r13, %rsi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	addq	%r15, %rdi
	incq	%r10
	addq	%r15, %r12
	addq	%r13, %r8
	decl	%r11d
	jne	LBB147_59
	jmp	LBB147_265
LBB147_79:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.80:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %edx
	cmpl	$15, %eax
	ja	LBB147_275
## %bb.81:                              ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	jmp	LBB147_334
LBB147_82:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.83:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %ecx         ## 4-byte Reload
	movl	%ecx, %eax
	cmpl	$31, %ecx
	ja	LBB147_282
## %bb.84:                              ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r9d, %r9d
LBB147_85:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	%r9, %r8
	notq	%r8
	addq	%rax, %r8
	movq	%rax, %r10
	andq	$3, %r10
	je	LBB147_89
## %bb.86:                              ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %rcx
	movq	%r9, %rdi
	negq	%rdi
	movq	%rcx, %r11
	leaq	(%rcx,%r9), %rbx
	addq	-64(%rbp), %rbx         ## 8-byte Folded Reload
	movq	-400(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rbx,%rcx), %rsi
	addq	-72(%rbp), %r9          ## 8-byte Folded Reload
	xorl	%edx, %edx
LBB147_87:                              ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi,%rdx), %ecx
	addb	(%r9,%rdx), %cl
	movb	%cl, (%rbx,%rdx)
	decq	%rdi
	incq	%rdx
	cmpq	%rdx, %r10
	jne	LBB147_87
## %bb.88:                              ##   in Loop: Header=BB147_26 Depth=1
	negq	%rdi
	movq	%rdi, %r9
	movq	%r11, %rdi
LBB147_89:                              ##   in Loop: Header=BB147_26 Depth=1
	cmpq	$3, %r8
	jb	LBB147_342
## %bb.90:                              ##   in Loop: Header=BB147_26 Depth=1
	subq	%r9, %rax
	addq	%r9, %rdi
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	leaq	3(%rcx,%rdi), %rcx
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	leaq	3(%rdx,%r9), %rdx
LBB147_91:                              ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-400(%rbp), %rsi        ## 8-byte Reload
	movzbl	-3(%rcx,%rsi), %ebx
	addb	-3(%rdx), %bl
	movb	%bl, -3(%rcx)
	movzbl	-2(%rcx,%rsi), %ebx
	addb	-2(%rdx), %bl
	movb	%bl, -2(%rcx)
	movzbl	-1(%rcx,%rsi), %ebx
	addb	-1(%rdx), %bl
	movb	%bl, -1(%rcx)
	movzbl	(%rcx,%rsi), %ebx
	addb	(%rdx), %bl
	movb	%bl, (%rcx)
	addq	$4, %rcx
	addq	$4, %rdx
	addq	$-4, %rax
	jne	LBB147_91
	jmp	LBB147_342
LBB147_92:                              ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.93:                              ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %rdx
	movq	%rdx, -480(%rbp)        ## 8-byte Spill
	movl	%eax, %eax
	movq	%rax, %rdx
	subq	%r15, %rdx
	movq	%rdx, -584(%rbp)        ## 8-byte Spill
	movq	%rax, -392(%rbp)        ## 8-byte Spill
                                        ## kill: def $eax killed $eax killed $rax def $rax
	andl	$-16, %eax
	movq	%rax, -576(%rbp)        ## 8-byte Spill
	movq	-520(%rbp), %rax        ## 8-byte Reload
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%rax), %rax
	addq	%rdi, %rax
	movq	%rax, -488(%rbp)        ## 8-byte Spill
	addq	-336(%rbp), %rdx        ## 8-byte Folded Reload
	addq	%rdi, %rdx
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -472(%rbp)        ## 8-byte Spill
	movq	%r10, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	jmp	LBB147_104
LBB147_94:                              ##   in Loop: Header=BB147_104 Depth=2
	movq	-472(%rbp), %rdi        ## 8-byte Reload
	movq	%rdi, %rdx
	movq	-80(%rbp), %r9          ## 8-byte Reload
	imulq	%r9, %rdx
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rdx), %r11
	movq	-392(%rbp), %rax        ## 8-byte Reload
	leaq	(%rdx,%rax), %rsi
	leaq	(%rcx,%rsi), %r12
	imulq	-480(%rbp), %rdi        ## 8-byte Folded Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rdi), %r8
	addq	%rax, %rdi
	addq	%rbx, %rdi
	movq	%rdx, %rbx
	subq	%r9, %rbx
	leaq	(%rcx,%rbx), %r10
	movq	-584(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdx), %rax
	leaq	(%rcx,%rax), %r9
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	addq	%rcx, %rdx
	addq	%rcx, %rsi
	addq	%rcx, %rbx
	addq	%rcx, %rax
	cmpq	%rdi, %r11
	setb	%r14b
	cmpq	%r12, %r8
	setb	%r15b
	cmpq	%r9, %r11
	setb	%r9b
	cmpq	%r12, %r10
	setb	%dil
	cmpq	%rsi, %r11
	setb	%sil
	cmpq	%r12, %rdx
	setb	%r8b
	cmpq	%rax, %r11
	setb	%dl
	cmpq	%r12, %rbx
	setb	%cl
	xorl	%eax, %eax
	testb	%r15b, %r14b
	jne	LBB147_107
## %bb.95:                              ##   in Loop: Header=BB147_104 Depth=2
	andb	%dil, %r9b
	jne	LBB147_107
## %bb.96:                              ##   in Loop: Header=BB147_104 Depth=2
	andb	%r8b, %sil
	jne	LBB147_107
## %bb.97:                              ##   in Loop: Header=BB147_104 Depth=2
	movl	$0, %edi
	andb	%cl, %dl
	jne	LBB147_108
## %bb.98:                              ##   in Loop: Header=BB147_104 Depth=2
	xorl	%r8d, %r8d
	movq	-440(%rbp), %rcx        ## 8-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movq	-576(%rbp), %rsi        ## 8-byte Reload
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	-248(%rbp), %rbx        ## 8-byte Reload
LBB147_99:                              ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_104 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%rcx,%r8), %eax
	cltq
	movdqu	(%rbx,%rax), %xmm13
	pshufd	$78, %xmm13, %xmm0      ## xmm0 = xmm13[2,3,0,1]
	pmovzxbd	%xmm0, %xmm8    ## xmm8 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pmovzxbd	%xmm13, %xmm2   ## xmm2 = xmm13[0],zero,zero,zero,xmm13[1],zero,zero,zero,xmm13[2],zero,zero,zero,xmm13[3],zero,zero,zero
	pshufd	$229, %xmm13, %xmm0     ## xmm0 = xmm13[1,1,2,3]
	pmovzxbd	%xmm0, %xmm1    ## xmm1 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	movdqu	(%rdi,%r8), %xmm14
	pshufd	$78, %xmm14, %xmm0      ## xmm0 = xmm14[2,3,0,1]
	pmovzxbd	%xmm0, %xmm11   ## xmm11 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pmovzxbd	%xmm14, %xmm10  ## xmm10 = xmm14[0],zero,zero,zero,xmm14[1],zero,zero,zero,xmm14[2],zero,zero,zero,xmm14[3],zero,zero,zero
	pshufd	$229, %xmm14, %xmm3     ## xmm3 = xmm14[1,1,2,3]
	pmovzxbd	%xmm3, %xmm3    ## xmm3 = xmm3[0],zero,zero,zero,xmm3[1],zero,zero,zero,xmm3[2],zero,zero,zero,xmm3[3],zero,zero,zero
	movdqu	(%rdi,%rax), %xmm0
	pshufd	$229, %xmm0, %xmm4      ## xmm4 = xmm0[1,1,2,3]
	pmovzxbd	%xmm4, %xmm9    ## xmm9 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero,xmm4[2],zero,zero,zero,xmm4[3],zero,zero,zero
	pmovzxbd	%xmm0, %xmm4    ## xmm4 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	movdqa	%xmm4, -208(%rbp)       ## 16-byte Spill
	pshufd	$78, %xmm0, %xmm5       ## xmm5 = xmm0[2,3,0,1]
	movdqa	%xmm0, %xmm7
	movdqa	%xmm0, -112(%rbp)       ## 16-byte Spill
	pmovzxbd	%xmm5, %xmm15   ## xmm15 = xmm5[0],zero,zero,zero,xmm5[1],zero,zero,zero,xmm5[2],zero,zero,zero,xmm5[3],zero,zero,zero
	movdqa	%xmm3, %xmm5
	paddd	%xmm1, %xmm5
	movdqa	%xmm10, %xmm6
	paddd	%xmm2, %xmm6
	movdqa	%xmm11, %xmm12
	paddd	%xmm8, %xmm12
	psubd	%xmm15, %xmm12
	psubd	%xmm4, %xmm6
	psubd	%xmm9, %xmm5
	movdqa	%xmm5, %xmm0
	psubd	%xmm1, %xmm0
	movdqa	%xmm0, -160(%rbp)       ## 16-byte Spill
	movdqa	%xmm6, %xmm0
	psubd	%xmm2, %xmm0
	movdqa	%xmm0, -240(%rbp)       ## 16-byte Spill
	movdqa	%xmm12, %xmm2
	psubd	%xmm8, %xmm2
	pshufd	$231, %xmm13, %xmm1     ## xmm1 = xmm13[3,1,2,3]
	pmovzxbd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,zero,zero,xmm1[1],zero,zero,zero,xmm1[2],zero,zero,zero,xmm1[3],zero,zero,zero
	pshufd	$231, %xmm14, %xmm4     ## xmm4 = xmm14[3,1,2,3]
	pmovzxbd	%xmm4, %xmm0    ## xmm0 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero,xmm4[2],zero,zero,zero,xmm4[3],zero,zero,zero
	pshufd	$231, %xmm7, %xmm7      ## xmm7 = xmm7[3,1,2,3]
	pmovzxbd	%xmm7, %xmm8    ## xmm8 = xmm7[0],zero,zero,zero,xmm7[1],zero,zero,zero,xmm7[2],zero,zero,zero,xmm7[3],zero,zero,zero
	movdqa	%xmm0, %xmm4
	paddd	%xmm1, %xmm4
	psubd	%xmm8, %xmm4
	movdqa	%xmm4, %xmm7
	psubd	%xmm1, %xmm7
	movdqa	%xmm5, %xmm1
	psubd	%xmm3, %xmm1
	movdqa	%xmm1, -272(%rbp)       ## 16-byte Spill
	movdqa	%xmm6, %xmm1
	psubd	%xmm10, %xmm1
	movdqa	%xmm1, -224(%rbp)       ## 16-byte Spill
	movdqa	%xmm12, %xmm1
	psubd	%xmm11, %xmm1
	movdqa	%xmm4, %xmm3
	psubd	%xmm0, %xmm3
	psubd	%xmm9, %xmm5
	psubd	-208(%rbp), %xmm6       ## 16-byte Folded Reload
	psubd	%xmm15, %xmm12
	pabsd	%xmm7, %xmm10
	pabsd	%xmm2, %xmm7
	pabsd	%xmm3, %xmm0
	pabsd	%xmm1, %xmm3
	psubd	%xmm8, %xmm4
	pabsd	%xmm4, %xmm1
	movdqa	%xmm1, -288(%rbp)       ## 16-byte Spill
	pabsd	%xmm12, %xmm2
	movdqa	%xmm2, -304(%rbp)       ## 16-byte Spill
	movdqa	%xmm7, %xmm4
	pcmpgtd	%xmm3, %xmm4
	movdqa	%xmm4, -208(%rbp)       ## 16-byte Spill
	movdqa	%xmm10, %xmm15
	pcmpgtd	%xmm0, %xmm15
	pcmpgtd	%xmm1, %xmm0
	movdqa	LCPI147_1(%rip), %xmm8  ## xmm8 = <u,u,u,u,0,4,8,12,u,u,u,u,u,u,u,u>
	pshufb	%xmm8, %xmm0
	pcmpgtd	%xmm2, %xmm3
	pshufb	%xmm8, %xmm3
	punpckldq	%xmm0, %xmm3    ## xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	pabsd	-240(%rbp), %xmm1       ## 16-byte Folded Reload
	pabsd	-160(%rbp), %xmm2       ## 16-byte Folded Reload
	pabsd	-224(%rbp), %xmm0       ## 16-byte Folded Reload
	pabsd	-272(%rbp), %xmm4       ## 16-byte Folded Reload
	pabsd	%xmm6, %xmm9
	pabsd	%xmm5, %xmm11
	movdqa	%xmm2, %xmm6
	pcmpgtd	%xmm4, %xmm6
	movdqa	%xmm1, %xmm5
	pcmpgtd	%xmm0, %xmm5
	pcmpgtd	%xmm9, %xmm0
	movdqa	LCPI147_2(%rip), %xmm12 ## xmm12 = <0,4,8,12,u,u,u,u,u,u,u,u,u,u,u,u>
	pshufb	%xmm12, %xmm0
	pcmpgtd	%xmm11, %xmm4
	pshufb	%xmm12, %xmm4
	punpckldq	%xmm4, %xmm0    ## xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
	pblendw	$240, %xmm3, %xmm0      ## xmm0 = xmm0[0,1,2,3],xmm3[4,5,6,7]
	pblendvb	%xmm0, -112(%rbp), %xmm14 ## 16-byte Folded Reload
	pcmpgtd	%xmm11, %xmm2
	por	%xmm6, %xmm2
	pcmpgtd	%xmm9, %xmm1
	por	%xmm5, %xmm1
	pcmpgtd	-304(%rbp), %xmm7       ## 16-byte Folded Reload
	por	-208(%rbp), %xmm7       ## 16-byte Folded Reload
	pcmpgtd	-288(%rbp), %xmm10      ## 16-byte Folded Reload
	por	%xmm15, %xmm10
	pshufb	%xmm8, %xmm10
	pshufb	%xmm8, %xmm7
	punpckldq	%xmm10, %xmm7   ## xmm7 = xmm7[0],xmm10[0],xmm7[1],xmm10[1]
	pshufb	%xmm12, %xmm1
	pshufb	%xmm12, %xmm2
	punpckldq	%xmm2, %xmm1    ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	pblendw	$240, %xmm7, %xmm1      ## xmm1 = xmm1[0,1,2,3],xmm7[4,5,6,7]
	movdqa	%xmm1, %xmm0
	pblendvb	%xmm0, %xmm14, %xmm13
	movdqu	(%rdx,%r8), %xmm0
	paddb	%xmm0, %xmm13
	movdqu	%xmm13, (%rbx,%r8)
	addq	$16, %r8
	cmpq	%r8, %rsi
	jne	LBB147_99
## %bb.100:                             ##   in Loop: Header=BB147_104 Depth=2
	movq	%rsi, %rax
	movl	%esi, %edi
	cmpq	-392(%rbp), %rsi        ## 8-byte Folded Reload
	movdqa	LCPI147_0(%rip), %xmm8  ## xmm8 = [127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127]
	jne	LBB147_108
	jmp	LBB147_116
LBB147_104:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_99 Depth 3
                                        ##       Child Loop BB147_109 Depth 3
	movq	%rdx, -248(%rbp)        ## 8-byte Spill
	movq	%rbx, -120(%rbp)        ## 8-byte Spill
	movl	%ecx, -408(%rbp)        ## 4-byte Spill
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_116
## %bb.105:                             ##   in Loop: Header=BB147_104 Depth=2
	cmpl	$16, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_94
## %bb.106:                             ##   in Loop: Header=BB147_104 Depth=2
	xorl	%eax, %eax
LBB147_107:                             ##   in Loop: Header=BB147_104 Depth=2
	xorl	%edi, %edi
LBB147_108:                             ##   in Loop: Header=BB147_104 Depth=2
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %r13
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%rax), %r8
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	subq	%rax, %rcx
	movslq	%edi, %rbx
	movq	-488(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rbx), %rdi
	addq	-64(%rbp), %rbx         ## 8-byte Folded Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB147_109:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_104 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rbx,%rax), %r15d
	movzbl	(%r13,%rax), %r12d
	movzbl	(%rdi,%rax), %r10d
	leal	(%r12,%r15), %edx
	subl	%r10d, %edx
	movl	%edx, %esi
	subl	%r15d, %esi
	movl	%esi, %r14d
	negl	%r14d
	cmovll	%esi, %r14d
	movl	%edx, %esi
	subl	%r12d, %esi
	movl	%esi, %r11d
	negl	%r11d
	cmovll	%esi, %r11d
	subl	%r10d, %edx
	movl	%edx, %r9d
	negl	%r9d
	cmovll	%edx, %r9d
	cmpl	%r9d, %r11d
	jg	LBB147_111
## %bb.110:                             ##   in Loop: Header=BB147_109 Depth=3
	movl	%r12d, %r10d
LBB147_111:                             ##   in Loop: Header=BB147_109 Depth=3
	movl	%r10d, %edx
	cmpl	%r9d, %r14d
	jg	LBB147_113
## %bb.112:                             ##   in Loop: Header=BB147_109 Depth=3
	movl	%r15d, %edx
LBB147_113:                             ##   in Loop: Header=BB147_109 Depth=3
	cmpl	%r11d, %r14d
	jg	LBB147_115
## %bb.114:                             ##   in Loop: Header=BB147_109 Depth=3
	movl	%edx, %r10d
LBB147_115:                             ##   in Loop: Header=BB147_109 Depth=3
	addb	(%r8,%rax), %r10b
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	movb	%r10b, (%rdx,%rax)
	incq	%rax
	cmpq	%rax, %rcx
	jne	LBB147_109
LBB147_116:                             ##   in Loop: Header=BB147_104 Depth=2
	movq	-480(%rbp), %rax        ## 8-byte Reload
	movq	-248(%rbp), %rdx        ## 8-byte Reload
	movb	$-1, (%rdx,%rax)
	addq	%rax, -56(%rbp)         ## 8-byte Folded Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %rdx
	movq	-120(%rbp), %rbx        ## 8-byte Reload
	addq	%rax, %rbx
	incq	-472(%rbp)              ## 8-byte Folded Spill
	addq	%rax, -488(%rbp)        ## 8-byte Folded Spill
	addq	%rax, -64(%rbp)         ## 8-byte Folded Spill
	movl	-408(%rbp), %ecx        ## 4-byte Reload
	decl	%ecx
	jne	LBB147_104
	jmp	LBB147_265
LBB147_117:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.118:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r10d
	cmpl	$15, %eax
	ja	LBB147_287
## %bb.119:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r9d, %r9d
	xorl	%eax, %eax
LBB147_120:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r9, %rcx
	notq	%rcx
	testb	$1, %r10b
	je	LBB147_122
## %bb.121:                             ##   in Loop: Header=BB147_26 Depth=1
	movzbl	(%rbx,%r9), %edx
	movl	%eax, %esi
	subl	-44(%rbp), %esi         ## 4-byte Folded Reload
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	addl	%edx, %esi
	shrl	%esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	addb	(%rdx,%r9), %sil
	movb	%sil, (%r15,%r9)
	orq	$1, %r9
	incl	%eax
LBB147_122:                             ##   in Loop: Header=BB147_26 Depth=1
	addq	%r10, %rcx
	je	LBB147_342
## %bb.123:                             ##   in Loop: Header=BB147_26 Depth=1
	subq	%r9, %r10
	leaq	(%rdi,%r9), %rsi
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	leaq	1(%rbx,%rsi), %r8
	movq	-432(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rbx,%rcx), %rdx
	addq	%rsi, %rdx
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	leaq	1(%rcx,%r9), %rsi
	cltq
	addq	%rdi, %rax
	movslq	-44(%rbp), %rdi         ## 4-byte Folded Reload
	subq	%rdi, %rax
	leaq	1(%rbx,%rax), %rax
	xorl	%edi, %edi
LBB147_124:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rdx,%rdi), %ebx
	movzbl	-1(%rax,%rdi), %ecx
	addl	%ebx, %ecx
	shrl	%ecx
	addb	-1(%rsi,%rdi), %cl
	movb	%cl, -1(%r8,%rdi)
	movzbl	(%rdx,%rdi), %ecx
	movzbl	(%rax,%rdi), %ebx
	addl	%ecx, %ebx
	shrl	%ebx
	addb	(%rsi,%rdi), %bl
	movb	%bl, (%r8,%rdi)
	addq	$2, %rdi
	cmpq	%rdi, %r10
	jne	LBB147_124
	jmp	LBB147_342
LBB147_125:                             ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.126:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %rdx
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	movl	%eax, %r14d
	movl	%r14d, %eax
	andl	$-32, %eax
	movq	%rax, -224(%rbp)        ## 8-byte Spill
	leaq	-32(%rax), %rax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	shrq	$5, %rax
	leal	1(%rax), %edx
	andl	$1, %edx
	movq	%r14, -160(%rbp)        ## 8-byte Spill
                                        ## kill: def $r14d killed $r14d killed $r14 def $r14
	andl	$3, %r14d
	movq	%rdx, -288(%rbp)        ## 8-byte Spill
	subq	%rax, %rdx
	decq	%rdx
	movq	%rdx, -304(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %r8          ## 8-byte Reload
	leaq	3(%r8,%rdi), %r12
	addq	-512(%rbp), %r8         ## 8-byte Folded Reload
	addq	%rdi, %r8
	leaq	3(%r10), %r11
	xorl	%r9d, %r9d
	movq	%r10, %rax
	movl	%ecx, %r10d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rbx, %r15
	movq	-128(%rbp), %r13        ## 8-byte Reload
LBB147_127:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_141 Depth 3
                                        ##       Child Loop BB147_132 Depth 3
                                        ##       Child Loop BB147_136 Depth 3
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_147
## %bb.128:                             ##   in Loop: Header=BB147_127 Depth=2
	cmpl	$32, -44(%rbp)          ## 4-byte Folded Reload
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	jae	LBB147_137
LBB147_129:                             ##   in Loop: Header=BB147_127 Depth=2
	xorl	%eax, %eax
LBB147_130:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	%rax, %r12
	notq	%r12
	addq	-160(%rbp), %r12        ## 8-byte Folded Reload
	testq	%r14, %r14
	je	LBB147_134
## %bb.131:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	%rax, %rsi
	negq	%rsi
	leaq	(%r13,%rax), %rdi
	leaq	(%r15,%rax), %rbx
	addq	-56(%rbp), %rax         ## 8-byte Folded Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB147_132:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_127 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rbx,%rcx), %edx
	addb	(%rax,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	decq	%rsi
	incq	%rcx
	cmpq	%rcx, %r14
	jne	LBB147_132
## %bb.133:                             ##   in Loop: Header=BB147_127 Depth=2
	negq	%rsi
	movq	%rsi, %rax
LBB147_134:                             ##   in Loop: Header=BB147_127 Depth=2
	cmpq	$3, %r12
	movq	-64(%rbp), %r12         ## 8-byte Reload
	jb	LBB147_147
## %bb.135:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	subq	%rax, %rcx
	leaq	(%r12,%rax), %rbx
	leaq	(%r8,%rax), %rsi
	addq	%r11, %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB147_136:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_127 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	-3(%rsi,%rdi), %edx
	addb	-3(%rax,%rdi), %dl
	movb	%dl, -3(%rbx,%rdi)
	movzbl	-2(%rsi,%rdi), %edx
	addb	-2(%rax,%rdi), %dl
	movb	%dl, -2(%rbx,%rdi)
	movzbl	-1(%rsi,%rdi), %edx
	addb	-1(%rax,%rdi), %dl
	movb	%dl, -1(%rbx,%rdi)
	movzbl	(%rsi,%rdi), %edx
	addb	(%rax,%rdi), %dl
	movb	%dl, (%rbx,%rdi)
	addq	$4, %rdi
	cmpq	%rdi, %rcx
	jne	LBB147_136
	jmp	LBB147_147
LBB147_137:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	%r9, %rax
	imulq	-80(%rbp), %rax         ## 8-byte Folded Reload
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	leaq	(%rdx,%rax), %r12
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rax,%rcx), %rsi
	leaq	(%rdx,%rsi), %rdx
	movq	%rdx, -272(%rbp)        ## 8-byte Spill
	movq	%r9, %rbx
	imulq	-112(%rbp), %rbx        ## 8-byte Folded Reload
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%rbx), %rdi
	movq	%rdi, -240(%rbp)        ## 8-byte Spill
	addq	%rcx, %rbx
	addq	%rdx, %rbx
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	addq	%rdx, %rax
	addq	%rdx, %rsi
	cmpq	%rbx, %r12
	setb	%dl
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rdi, -240(%rbp)        ## 8-byte Folded Reload
	setb	%bl
	cmpq	%rsi, %r12
	setb	%cl
	cmpq	%rdi, %rax
	setb	%sil
	testb	%bl, %dl
	jne	LBB147_129
## %bb.138:                             ##   in Loop: Header=BB147_127 Depth=2
	movl	$0, %eax
	andb	%sil, %cl
	movq	-64(%rbp), %r12         ## 8-byte Reload
	jne	LBB147_130
## %bb.139:                             ##   in Loop: Header=BB147_127 Depth=2
	cmpq	$0, -208(%rbp)          ## 8-byte Folded Reload
	je	LBB147_143
## %bb.140:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	-304(%rbp), %rcx        ## 8-byte Reload
	xorl	%eax, %eax
	movq	-56(%rbp), %rdx         ## 8-byte Reload
LBB147_141:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_127 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movdqu	(%rdx,%rax), %xmm0
	movdqu	16(%rdx,%rax), %xmm1
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r13,%rax)
	movdqu	%xmm0, 16(%r13,%rax)
	movdqu	32(%rdx,%rax), %xmm0
	movdqu	48(%rdx,%rax), %xmm1
	movdqu	32(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	48(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, 32(%r13,%rax)
	movdqu	%xmm0, 48(%r13,%rax)
	addq	$64, %rax
	addq	$2, %rcx
	jne	LBB147_141
	jmp	LBB147_144
LBB147_143:                             ##   in Loop: Header=BB147_127 Depth=2
	xorl	%eax, %eax
LBB147_144:                             ##   in Loop: Header=BB147_127 Depth=2
	cmpq	$0, -288(%rbp)          ## 8-byte Folded Reload
	je	LBB147_146
## %bb.145:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movdqu	(%rcx,%rax), %xmm0
	movdqu	16(%rcx,%rax), %xmm1
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r13,%rax)
	movdqu	%xmm0, 16(%r13,%rax)
LBB147_146:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rax
	cmpq	-160(%rbp), %rcx        ## 8-byte Folded Reload
	jne	LBB147_130
LBB147_147:                             ##   in Loop: Header=BB147_127 Depth=2
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	movb	$-1, (%r13,%rcx)
	addq	%rcx, -56(%rbp)         ## 8-byte Folded Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %r13
	addq	%rax, %r15
	incq	%r9
	addq	%rax, %r12
	addq	%rax, %r8
	addq	%rcx, %r11
	decl	%r10d
	jne	LBB147_127
	jmp	LBB147_265
LBB147_148:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.149:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r9d
	cmpl	$31, %eax
	ja	LBB147_293
## %bb.150:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r11d, %r11d
	xorl	%ecx, %ecx
LBB147_151:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r11, %rsi
	notq	%rsi
	testb	$1, %r9b
	je	LBB147_153
## %bb.152:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %rax
	movl	%ecx, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movslq	%edi, %rdi
	movb	(%r15,%rdi), %bl
	movq	%rax, %rdi
	movq	-72(%rbp), %rax         ## 8-byte Reload
	addb	(%rax,%r11), %bl
	movb	%bl, (%r15,%r11)
	orq	$1, %r11
	incl	%ecx
LBB147_153:                             ##   in Loop: Header=BB147_26 Depth=1
	addq	%r9, %rsi
	je	LBB147_342
## %bb.154:                             ##   in Loop: Header=BB147_26 Depth=1
	subq	%r11, %r9
	leaq	(%rdi,%r11), %rsi
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	leaq	1(%rbx,%rsi), %rsi
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	1(%rax,%r11), %rdx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	movslq	-44(%rbp), %rdi         ## 4-byte Folded Reload
	subq	%rdi, %rcx
	leaq	1(%rbx,%rcx), %rcx
	xorl	%edi, %edi
LBB147_155:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rcx,%rdi), %eax
	addb	-1(%rdx,%rdi), %al
	movb	%al, -1(%rsi,%rdi)
	movzbl	(%rcx,%rdi), %eax
	addb	(%rdx,%rdi), %al
	movb	%al, (%rsi,%rdi)
	addq	$2, %rdi
	cmpq	%rdi, %r9
	jne	LBB147_155
	jmp	LBB147_342
LBB147_157:                             ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.158:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %r9
	movl	%eax, %edx
	movq	%rdx, %rax
	subq	%r15, %rax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	movl	%edx, %eax
	andl	$-16, %eax
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	leaq	-16(%rax), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	shrq	$4, %rax
	leal	1(%rax), %esi
	andl	$1, %esi
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	negq	%rdx
	movq	%rdx, -224(%rbp)        ## 8-byte Spill
	movq	%rsi, -248(%rbp)        ## 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -408(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	leaq	1(%rdx,%rdi), %rax
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	movq	-432(%rbp), %rax        ## 8-byte Reload
	leaq	(%rdx,%rax), %rax
	addq	%rdi, %rax
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	movq	%r10, %rax
	leaq	1(%r10), %rsi
	movq	%rsi, -272(%rbp)        ## 8-byte Spill
	addq	-336(%rbp), %rdx        ## 8-byte Folded Reload
	addq	%rdi, %rdx
	movq	%rdx, %r10
	xorl	%r11d, %r11d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rbx, %r8
	movq	-128(%rbp), %r14        ## 8-byte Reload
	movq	%r9, -288(%rbp)         ## 8-byte Spill
LBB147_159:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_172 Depth 3
                                        ##       Child Loop BB147_166 Depth 3
	movl	%ecx, -64(%rbp)         ## 4-byte Spill
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_178
## %bb.160:                             ##   in Loop: Header=BB147_159 Depth=2
	cmpl	$16, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_167
## %bb.161:                             ##   in Loop: Header=BB147_159 Depth=2
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
LBB147_162:                             ##   in Loop: Header=BB147_159 Depth=2
	movq	%r13, %rax
	notq	%rax
	testb	$1, -112(%rbp)          ## 1-byte Folded Reload
	je	LBB147_164
## %bb.163:                             ##   in Loop: Header=BB147_159 Depth=2
	movzbl	(%r8,%r13), %ecx
	movl	%r15d, %edx
	subl	-176(%rbp), %edx        ## 4-byte Folded Reload
	movslq	%edx, %rdx
	movzbl	(%r14,%rdx), %edx
	addl	%ecx, %edx
	shrl	%edx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	addb	(%rcx,%r13), %dl
	movb	%dl, (%r14,%r13)
	orq	$1, %r13
	incl	%r15d
LBB147_164:                             ##   in Loop: Header=BB147_159 Depth=2
	cmpq	-224(%rbp), %rax        ## 8-byte Folded Reload
	je	LBB147_178
## %bb.165:                             ##   in Loop: Header=BB147_159 Depth=2
	movq	-112(%rbp), %r12        ## 8-byte Reload
	subq	%r13, %r12
	movq	-160(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%r13), %rbx
	movq	-240(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%r13), %rax
	addq	-272(%rbp), %r13        ## 8-byte Folded Reload
	movslq	%r15d, %rsi
	addq	%r10, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB147_166:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_159 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	-1(%rax,%rdx), %ecx
	movzbl	(%rsi,%rdx), %edi
	addl	%ecx, %edi
	shrl	%edi
	addb	-1(%r13,%rdx), %dil
	movb	%dil, -1(%rbx,%rdx)
	movzbl	(%rax,%rdx), %ecx
	movzbl	1(%rsi,%rdx), %edi
	addl	%ecx, %edi
	shrl	%edi
	addb	(%r13,%rdx), %dil
	movb	%dil, (%rbx,%rdx)
	addq	$2, %rdx
	cmpq	%rdx, %r12
	jne	LBB147_166
	jmp	LBB147_178
LBB147_167:                             ##   in Loop: Header=BB147_159 Depth=2
	movq	%r11, %rax
	movq	-80(%rbp), %r13         ## 8-byte Reload
	imulq	%r13, %rax
	movq	%r9, %rbx
	movq	-128(%rbp), %r9         ## 8-byte Reload
	leaq	(%r9,%rax), %rcx
	movq	-112(%rbp), %r12        ## 8-byte Reload
	leaq	(%rax,%r12), %rdx
	leaq	(%r9,%rdx), %rsi
	movq	%r11, %rdi
	imulq	%rbx, %rdi
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rdi), %r15
	addq	%r12, %rdi
	addq	%rbx, %rdi
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rax), %r12
	addq	%rbx, %rdx
	movq	-208(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rax), %rbx
	subq	%r13, %rax
	addq	%r9, %rax
	addq	%r9, %rbx
	cmpq	%rdi, %rcx
	setb	%dil
	cmpq	%rsi, %r15
	setb	%r15b
	cmpq	%rdx, %rcx
	setb	%dl
	cmpq	%rsi, %r12
	setb	%r12b
	cmpq	%rbx, %rcx
	setb	%cl
	cmpq	%rsi, %rax
	setb	%al
	xorl	%r13d, %r13d
	testb	%r15b, %dil
	jne	LBB147_173
## %bb.168:                             ##   in Loop: Header=BB147_159 Depth=2
	andb	%r12b, %dl
	jne	LBB147_173
## %bb.169:                             ##   in Loop: Header=BB147_159 Depth=2
	movl	$0, %r15d
	andb	%al, %cl
	movq	-288(%rbp), %r9         ## 8-byte Reload
	jne	LBB147_162
## %bb.170:                             ##   in Loop: Header=BB147_159 Depth=2
	cmpq	$0, -120(%rbp)          ## 8-byte Folded Reload
	je	LBB147_174
## %bb.171:                             ##   in Loop: Header=BB147_159 Depth=2
	movq	-408(%rbp), %rdi        ## 8-byte Reload
	xorl	%r15d, %r15d
	movq	-440(%rbp), %rcx        ## 8-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
LBB147_172:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_159 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	pmovzxbd	4(%r8,%r15), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%r8,%r15), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	12(%r8,%r15), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	8(%r8,%r15), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	leaq	(%rcx,%r15), %rax
	cltq
	pmovzxbd	4(%r14,%rax), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%r14,%rax), %xmm5 ## xmm5 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	pmovzxbd	12(%r14,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movdqu	(%rdx,%r15), %xmm1
	paddd	%xmm2, %xmm0
	pmovzxbd	8(%r14,%rax), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm5
	packusdw	%xmm4, %xmm5
	psrld	$1, %xmm0
	psrld	$1, %xmm2
	packusdw	%xmm0, %xmm2
	packuswb	%xmm2, %xmm5
	paddb	%xmm1, %xmm5
	movdqu	%xmm5, (%r14,%r15)
	pmovzxbd	20(%r8,%r15), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	16(%r8,%r15), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	28(%r8,%r15), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	24(%r8,%r15), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	addl	$16, %eax
	cltq
	pmovzxbd	4(%r14,%rax), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%r14,%rax), %xmm5 ## xmm5 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	pmovzxbd	12(%r14,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movdqu	16(%rdx,%r15), %xmm1
	paddd	%xmm2, %xmm0
	pmovzxbd	8(%r14,%rax), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm5
	packusdw	%xmm4, %xmm5
	psrld	$1, %xmm0
	psrld	$1, %xmm2
	packusdw	%xmm0, %xmm2
	packuswb	%xmm2, %xmm5
	paddb	%xmm1, %xmm5
	movdqu	%xmm5, 16(%r14,%r15)
	addq	$32, %r15
	addq	$2, %rdi
	jne	LBB147_172
	jmp	LBB147_175
LBB147_173:                             ##   in Loop: Header=BB147_159 Depth=2
	xorl	%r15d, %r15d
	movq	-288(%rbp), %r9         ## 8-byte Reload
	jmp	LBB147_162
LBB147_174:                             ##   in Loop: Header=BB147_159 Depth=2
	xorl	%r15d, %r15d
	movq	-56(%rbp), %rdx         ## 8-byte Reload
LBB147_175:                             ##   in Loop: Header=BB147_159 Depth=2
	cmpq	$0, -248(%rbp)          ## 8-byte Folded Reload
	je	LBB147_177
## %bb.176:                             ##   in Loop: Header=BB147_159 Depth=2
	pmovzxbd	4(%r8,%r15), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%r8,%r15), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	12(%r8,%r15), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	8(%r8,%r15), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movl	%r15d, %eax
	subl	-176(%rbp), %eax        ## 4-byte Folded Reload
	cltq
	pmovzxbd	4(%r14,%rax), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movdqu	(%rdx,%r15), %xmm5
	paddd	%xmm0, %xmm4
	pmovzxbd	(%r14,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm1, %xmm0
	pmovzxbd	12(%r14,%rax), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm2, %xmm1
	pmovzxbd	8(%r14,%rax), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm0
	packusdw	%xmm4, %xmm0
	psrld	$1, %xmm1
	psrld	$1, %xmm2
	packusdw	%xmm1, %xmm2
	packuswb	%xmm2, %xmm0
	paddb	%xmm5, %xmm0
	movdqu	%xmm0, (%r14,%r15)
LBB147_177:                             ##   in Loop: Header=BB147_159 Depth=2
	movq	-304(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %r13
	movl	%eax, %r15d
	cmpq	-112(%rbp), %rax        ## 8-byte Folded Reload
	jne	LBB147_162
LBB147_178:                             ##   in Loop: Header=BB147_159 Depth=2
	movb	$-1, (%r14,%r9)
	addq	%r9, -56(%rbp)          ## 8-byte Folded Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %r14
	addq	%rax, %r8
	incq	%r11
	addq	%rax, -160(%rbp)        ## 8-byte Folded Spill
	addq	%rax, -240(%rbp)        ## 8-byte Folded Spill
	addq	%r9, -272(%rbp)         ## 8-byte Folded Spill
	addq	%rax, %r10
	movl	-64(%rbp), %ecx         ## 4-byte Reload
	decl	%ecx
	jne	LBB147_159
	jmp	LBB147_265
LBB147_179:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.180:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r9d
	cmpl	$31, %eax
	ja	LBB147_298
## %bb.181:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r11d, %r11d
	xorl	%ecx, %ecx
LBB147_182:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r11, %rsi
	notq	%rsi
	testb	$1, %r9b
	je	LBB147_184
## %bb.183:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %rax
	movl	%ecx, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movslq	%edi, %rdi
	movb	(%r15,%rdi), %bl
	movq	%rax, %rdi
	shrb	%bl
	movq	-72(%rbp), %rax         ## 8-byte Reload
	addb	(%rax,%r11), %bl
	movb	%bl, (%r15,%r11)
	orq	$1, %r11
	incl	%ecx
LBB147_184:                             ##   in Loop: Header=BB147_26 Depth=1
	addq	%r9, %rsi
	je	LBB147_342
## %bb.185:                             ##   in Loop: Header=BB147_26 Depth=1
	subq	%r11, %r9
	leaq	(%rdi,%r11), %rsi
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	leaq	1(%rbx,%rsi), %rsi
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	1(%rax,%r11), %rdx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	movslq	-44(%rbp), %rdi         ## 4-byte Folded Reload
	subq	%rdi, %rcx
	leaq	1(%rbx,%rcx), %rcx
	xorl	%edi, %edi
LBB147_186:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rcx,%rdi), %eax
	shrb	%al
	addb	-1(%rdx,%rdi), %al
	movb	%al, -1(%rsi,%rdi)
	movzbl	(%rcx,%rdi), %eax
	shrb	%al
	addb	(%rdx,%rdi), %al
	movb	%al, (%rsi,%rdi)
	addq	$2, %rdi
	cmpq	%rdi, %r9
	jne	LBB147_186
	jmp	LBB147_342
LBB147_187:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB147_342
## %bb.188:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-56(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r9d
	cmpl	$31, %eax
	ja	LBB147_303
## %bb.189:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r11d, %r11d
	xorl	%ecx, %ecx
LBB147_190:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r11, %rsi
	notq	%rsi
	testb	$1, %r9b
	je	LBB147_192
## %bb.191:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %rax
	movl	%ecx, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movslq	%edi, %rdi
	movb	(%r15,%rdi), %bl
	movq	%rax, %rdi
	movq	-72(%rbp), %rax         ## 8-byte Reload
	addb	(%rax,%r11), %bl
	movb	%bl, (%r15,%r11)
	orq	$1, %r11
	incl	%ecx
LBB147_192:                             ##   in Loop: Header=BB147_26 Depth=1
	addq	%r9, %rsi
	je	LBB147_342
## %bb.193:                             ##   in Loop: Header=BB147_26 Depth=1
	subq	%r11, %r9
	leaq	(%rdi,%r11), %rsi
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	leaq	1(%rbx,%rsi), %rsi
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	1(%rax,%r11), %rdx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	movslq	-44(%rbp), %rdi         ## 4-byte Folded Reload
	subq	%rdi, %rcx
	leaq	1(%rbx,%rcx), %rcx
	xorl	%edi, %edi
LBB147_194:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rcx,%rdi), %eax
	addb	-1(%rdx,%rdi), %al
	movb	%al, -1(%rsi,%rdi)
	movzbl	(%rcx,%rdi), %eax
	addb	(%rdx,%rdi), %al
	movb	%al, (%rsi,%rdi)
	addq	$2, %rdi
	cmpq	%rdi, %r9
	jne	LBB147_194
	jmp	LBB147_342
LBB147_195:                             ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.196:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %r13
	movl	%eax, %edx
	movq	%rdx, %rax
	subq	-80(%rbp), %rax         ## 8-byte Folded Reload
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	movl	%edx, %eax
	andl	$-32, %eax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	leaq	-32(%rax), %rax
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	shrq	$5, %rax
	leal	1(%rax), %esi
	andl	$1, %esi
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	negq	%rdx
	movq	%rdx, -240(%rbp)        ## 8-byte Spill
	movq	%rsi, -304(%rbp)        ## 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %r15         ## 8-byte Reload
	leaq	1(%r15,%rdi), %r9
	movq	%r10, %rax
	incq	%r10
	addq	-336(%rbp), %r15        ## 8-byte Folded Reload
	addq	%rdi, %r15
	xorl	%r8d, %r8d
	movl	%ecx, %r11d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %r14        ## 8-byte Reload
	movq	%r13, -224(%rbp)        ## 8-byte Spill
LBB147_197:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_209 Depth 3
                                        ##       Child Loop BB147_204 Depth 3
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	jle	LBB147_215
## %bb.198:                             ##   in Loop: Header=BB147_197 Depth=2
	cmpl	$32, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_205
## %bb.199:                             ##   in Loop: Header=BB147_197 Depth=2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
LBB147_200:                             ##   in Loop: Header=BB147_197 Depth=2
	movq	%rax, %rbx
	notq	%rbx
	testb	$1, -112(%rbp)          ## 1-byte Folded Reload
	je	LBB147_202
## %bb.201:                             ##   in Loop: Header=BB147_197 Depth=2
	movl	%ecx, %edx
	subl	-176(%rbp), %edx        ## 4-byte Folded Reload
	movslq	%edx, %rdx
	movb	(%r14,%rdx), %dl
	addb	(%r12,%rax), %dl
	movb	%dl, (%r14,%rax)
	orq	$1, %rax
	incl	%ecx
LBB147_202:                             ##   in Loop: Header=BB147_197 Depth=2
	cmpq	-240(%rbp), %rbx        ## 8-byte Folded Reload
	je	LBB147_215
## %bb.203:                             ##   in Loop: Header=BB147_197 Depth=2
	movq	-112(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	leaq	(%r9,%rax), %rsi
	addq	%r10, %rax
	movslq	%ecx, %rcx
	addq	%r15, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB147_204:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_197 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rcx,%rdx), %ebx
	addb	-1(%rax,%rdx), %bl
	movb	%bl, -1(%rsi,%rdx)
	movzbl	1(%rcx,%rdx), %ebx
	addb	(%rax,%rdx), %bl
	movb	%bl, (%rsi,%rdx)
	addq	$2, %rdx
	cmpq	%rdx, %rdi
	jne	LBB147_204
	jmp	LBB147_215
LBB147_205:                             ##   in Loop: Header=BB147_197 Depth=2
	movq	%r8, %rax
	movq	%r13, %rbx
	movq	-80(%rbp), %r13         ## 8-byte Reload
	imulq	%r13, %rax
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	leaq	(%rdi,%rax), %rcx
	movq	%rcx, -160(%rbp)        ## 8-byte Spill
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rax,%rcx), %rsi
	addq	%rdi, %rsi
	movq	%r8, %rdx
	imulq	%rbx, %rdx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rdx), %r12
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	addq	%rcx, %rdx
	addq	%rbx, %rdx
	movq	-272(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rbx
	subq	%r13, %rax
	addq	%rdi, %rax
	addq	%rdi, %rbx
	movq	-160(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rdx, %rdi
	setb	%r13b
	cmpq	%rsi, -64(%rbp)         ## 8-byte Folded Reload
	setb	%cl
	cmpq	%rbx, %rdi
	setb	%dl
	cmpq	%rsi, %rax
	setb	%bl
	xorl	%eax, %eax
	testb	%cl, %r13b
	jne	LBB147_210
## %bb.206:                             ##   in Loop: Header=BB147_197 Depth=2
	movl	$0, %ecx
	andb	%bl, %dl
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jne	LBB147_200
## %bb.207:                             ##   in Loop: Header=BB147_197 Depth=2
	cmpq	$0, -288(%rbp)          ## 8-byte Folded Reload
	je	LBB147_211
## %bb.208:                             ##   in Loop: Header=BB147_197 Depth=2
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	-316(%rbp), %eax        ## 4-byte Reload
	movl	%eax, %ebx
	xorl	%eax, %eax
LBB147_209:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_197 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movdqu	(%r12,%rax), %xmm0
	movdqu	16(%r12,%rax), %xmm1
	leal	-32(%rbx), %edx
	movslq	%edx, %rdx
	movdqu	(%r14,%rdx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rdx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r14,%rax)
	movdqu	%xmm0, 16(%r14,%rax)
	movdqu	32(%r12,%rax), %xmm0
	movdqu	48(%r12,%rax), %xmm1
	movslq	%ebx, %rbx
	movdqu	(%r14,%rbx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rbx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, 32(%r14,%rax)
	movdqu	%xmm0, 48(%r14,%rax)
	addq	$64, %rax
	addl	$64, %ebx
	addq	$2, %rcx
	jne	LBB147_209
	jmp	LBB147_212
LBB147_210:                             ##   in Loop: Header=BB147_197 Depth=2
	xorl	%ecx, %ecx
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jmp	LBB147_200
LBB147_211:                             ##   in Loop: Header=BB147_197 Depth=2
	xorl	%eax, %eax
LBB147_212:                             ##   in Loop: Header=BB147_197 Depth=2
	cmpq	$0, -304(%rbp)          ## 8-byte Folded Reload
	je	LBB147_214
## %bb.213:                             ##   in Loop: Header=BB147_197 Depth=2
	movdqu	(%r12,%rax), %xmm0
	movdqu	16(%r12,%rax), %xmm1
	movl	%eax, %ecx
	subl	-176(%rbp), %ecx        ## 4-byte Folded Reload
	movslq	%ecx, %rcx
	movdqu	(%r14,%rcx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rcx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r14,%rax)
	movdqu	%xmm0, 16(%r14,%rax)
LBB147_214:                             ##   in Loop: Header=BB147_197 Depth=2
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, %rax
	movl	%edx, %ecx
	cmpq	-112(%rbp), %rdx        ## 8-byte Folded Reload
	jne	LBB147_200
LBB147_215:                             ##   in Loop: Header=BB147_197 Depth=2
	movb	$-1, (%r14,%r13)
	addq	%r13, %r12
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %r14
	incq	%r8
	addq	%rax, %r9
	addq	%r13, %r10
	addq	%rax, %r15
	decl	%r11d
	jne	LBB147_197
	jmp	LBB147_265
LBB147_216:                             ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_156
## %bb.217:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %r13
	movl	%eax, %edx
	movq	%rdx, %rax
	subq	%r15, %rax
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	movl	%edx, %eax
	andl	$-32, %eax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	leaq	-32(%rax), %rax
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	shrq	$5, %rax
	leal	1(%rax), %esi
	andl	$1, %esi
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	negq	%rdx
	movq	%rdx, -240(%rbp)        ## 8-byte Spill
	movq	%rsi, -304(%rbp)        ## 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %r14         ## 8-byte Reload
	leaq	1(%r14,%rdi), %r9
	movq	%r10, %rax
	incq	%r10
	addq	-336(%rbp), %r14        ## 8-byte Folded Reload
	addq	%rdi, %r14
	xorl	%r8d, %r8d
	movl	%ecx, %r11d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %r15        ## 8-byte Reload
	movq	%r13, -224(%rbp)        ## 8-byte Spill
LBB147_218:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_230 Depth 3
                                        ##       Child Loop BB147_225 Depth 3
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	jle	LBB147_236
## %bb.219:                             ##   in Loop: Header=BB147_218 Depth=2
	cmpl	$32, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_226
## %bb.220:                             ##   in Loop: Header=BB147_218 Depth=2
	xorl	%esi, %esi
	xorl	%eax, %eax
LBB147_221:                             ##   in Loop: Header=BB147_218 Depth=2
	movq	%rsi, %rcx
	notq	%rcx
	testb	$1, -112(%rbp)          ## 1-byte Folded Reload
	je	LBB147_223
## %bb.222:                             ##   in Loop: Header=BB147_218 Depth=2
	movl	%eax, %edx
	subl	-176(%rbp), %edx        ## 4-byte Folded Reload
	movslq	%edx, %rdx
	movb	(%r15,%rdx), %dl
	shrb	%dl
	addb	(%r12,%rsi), %dl
	movb	%dl, (%r15,%rsi)
	orq	$1, %rsi
	incl	%eax
LBB147_223:                             ##   in Loop: Header=BB147_218 Depth=2
	cmpq	-240(%rbp), %rcx        ## 8-byte Folded Reload
	je	LBB147_236
## %bb.224:                             ##   in Loop: Header=BB147_218 Depth=2
	movq	-112(%rbp), %rdi        ## 8-byte Reload
	subq	%rsi, %rdi
	leaq	(%r9,%rsi), %rbx
	addq	%r10, %rsi
	cltq
	addq	%r14, %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB147_225:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_218 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rax,%rdx), %ecx
	shrb	%cl
	addb	-1(%rsi,%rdx), %cl
	movb	%cl, -1(%rbx,%rdx)
	movzbl	1(%rax,%rdx), %ecx
	shrb	%cl
	addb	(%rsi,%rdx), %cl
	movb	%cl, (%rbx,%rdx)
	addq	$2, %rdx
	cmpq	%rdx, %rdi
	jne	LBB147_225
	jmp	LBB147_236
LBB147_226:                             ##   in Loop: Header=BB147_218 Depth=2
	movq	%r8, %rax
	movq	%r13, %rbx
	movq	-80(%rbp), %r13         ## 8-byte Reload
	imulq	%r13, %rax
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	leaq	(%rdi,%rax), %rcx
	movq	%rcx, -160(%rbp)        ## 8-byte Spill
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rax,%rcx), %rdx
	addq	%rdi, %rdx
	movq	%r8, %rsi
	imulq	%rbx, %rsi
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rsi), %r12
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	addq	%rcx, %rsi
	addq	%rbx, %rsi
	movq	-272(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rbx
	subq	%r13, %rax
	addq	%rdi, %rax
	addq	%rdi, %rbx
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rsi, %rcx
	setb	%r13b
	cmpq	%rdx, -64(%rbp)         ## 8-byte Folded Reload
	setb	%dil
	cmpq	%rbx, %rcx
	setb	%cl
	cmpq	%rdx, %rax
	setb	%dl
	xorl	%esi, %esi
	testb	%dil, %r13b
	jne	LBB147_231
## %bb.227:                             ##   in Loop: Header=BB147_218 Depth=2
	movl	$0, %eax
	andb	%dl, %cl
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jne	LBB147_221
## %bb.228:                             ##   in Loop: Header=BB147_218 Depth=2
	cmpq	$0, -288(%rbp)          ## 8-byte Folded Reload
	je	LBB147_232
## %bb.229:                             ##   in Loop: Header=BB147_218 Depth=2
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movl	-316(%rbp), %ecx        ## 4-byte Reload
                                        ## kill: def $ecx killed $ecx def $rcx
	xorl	%esi, %esi
LBB147_230:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_218 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movdqu	(%r12,%rsi), %xmm0
	movdqu	16(%r12,%rsi), %xmm1
	leal	-32(%rcx), %edx
	movslq	%edx, %rdx
	movdqu	(%r15,%rdx), %xmm2
	movdqu	16(%r15,%rdx), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm3, 16(%r15,%rsi)
	movdqu	32(%r12,%rsi), %xmm0
	movdqu	48(%r12,%rsi), %xmm1
	movslq	%ecx, %rcx
	movdqu	(%r15,%rcx), %xmm2
	movdqu	16(%r15,%rcx), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, 32(%r15,%rsi)
	movdqu	%xmm3, 48(%r15,%rsi)
	addq	$64, %rsi
	addl	$64, %ecx
	addq	$2, %rax
	jne	LBB147_230
	jmp	LBB147_233
LBB147_231:                             ##   in Loop: Header=BB147_218 Depth=2
	xorl	%eax, %eax
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jmp	LBB147_221
LBB147_232:                             ##   in Loop: Header=BB147_218 Depth=2
	xorl	%esi, %esi
LBB147_233:                             ##   in Loop: Header=BB147_218 Depth=2
	cmpq	$0, -304(%rbp)          ## 8-byte Folded Reload
	je	LBB147_235
## %bb.234:                             ##   in Loop: Header=BB147_218 Depth=2
	movdqu	(%r12,%rsi), %xmm0
	movdqu	16(%r12,%rsi), %xmm1
	movl	%esi, %eax
	subl	-176(%rbp), %eax        ## 4-byte Folded Reload
	cltq
	movdqu	(%r15,%rax), %xmm2
	movdqu	16(%r15,%rax), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm3, 16(%r15,%rsi)
LBB147_235:                             ##   in Loop: Header=BB147_218 Depth=2
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rsi
	movl	%ecx, %eax
	cmpq	-112(%rbp), %rcx        ## 8-byte Folded Reload
	jne	LBB147_221
LBB147_236:                             ##   in Loop: Header=BB147_218 Depth=2
	movb	$-1, (%r15,%r13)
	addq	%r13, %r12
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %r15
	incq	%r8
	addq	%rax, %r9
	addq	%r13, %r10
	addq	%rax, %r14
	decl	%r11d
	jne	LBB147_218
	jmp	LBB147_265
LBB147_156:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r10, -56(%rbp)         ## 8-byte Spill
	cmpb	$0, -129(%rbp)          ## 1-byte Folded Reload
	jne	LBB147_266
LBB147_267:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-376(%rbp), %r13        ## 8-byte Reload
	movq	-616(%rbp), %r8         ## 8-byte Reload
	addq	24(%r13), %r8
	movslq	-44(%rbp), %rax         ## 4-byte Folded Reload
	incq	%rax
	cmpl	$7, -340(%rbp)          ## 4-byte Folded Reload
	movq	-360(%rbp), %r12        ## 8-byte Reload
	movl	-180(%rbp), %r14d       ## 4-byte Reload
	movq	-80(%rbp), %r15         ## 8-byte Reload
	jae	LBB147_269
## %bb.268:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r8, %rcx
	cmpl	$0, -420(%rbp)          ## 4-byte Folded Reload
	jne	LBB147_272
LBB147_274:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	16(%rbp), %r11d
	movq	-328(%rbp), %r8         ## 8-byte Reload
	movl	-312(%rbp), %esi        ## 4-byte Reload
	movq	-352(%rbp), %rbx        ## 8-byte Reload
	jmp	LBB147_344
LBB147_269:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-568(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	movq	-552(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	movq	-544(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, -160(%rbp)        ## 8-byte Spill
	movq	-536(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %r11
	movq	-528(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %r10
	movq	-560(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rsi
	leaq	(%r15,%rax), %rdi
	movl	-412(%rbp), %ebx        ## 4-byte Reload
LBB147_270:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movb	$-1, (%r8,%rax)
	leaq	(%r8,%r15), %rcx
	movb	$-1, (%r8,%rdi)
	addq	%r15, %rcx
	movb	$-1, (%r8,%rsi)
	addq	%r15, %rcx
	movb	$-1, (%r8,%r10)
	addq	%r15, %rcx
	movb	$-1, (%r8,%r11)
	addq	%r15, %rcx
	movq	-160(%rbp), %rdx        ## 8-byte Reload
	movb	$-1, (%r8,%rdx)
	addq	%r15, %rcx
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	movb	$-1, (%r8,%rdx)
	addq	%r15, %rcx
	movq	-64(%rbp), %r9          ## 8-byte Reload
	movb	$-1, (%r8,%r9)
	addq	%r15, %rcx
	movq	%rcx, %r8
	addl	$8, %ebx
	jne	LBB147_270
## %bb.271:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpl	$0, -420(%rbp)          ## 4-byte Folded Reload
	je	LBB147_274
LBB147_272:                             ##   in Loop: Header=BB147_26 Depth=1
	addq	%rax, %rcx
	movl	-416(%rbp), %eax        ## 4-byte Reload
	movl	16(%rbp), %r11d
	movq	-328(%rbp), %r8         ## 8-byte Reload
	movl	-312(%rbp), %esi        ## 4-byte Reload
	movq	-352(%rbp), %rbx        ## 8-byte Reload
	leaq	LJTI147_0(%rip), %rdi
	movq	-368(%rbp), %r9         ## 8-byte Reload
LBB147_273:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movb	$-1, (%rcx)
	addq	%r15, %rcx
	incl	%eax
	jne	LBB147_273
	jmp	LBB147_345
LBB147_237:                             ##   in Loop: Header=BB147_26 Depth=1
	testl	%ecx, %ecx
	je	LBB147_264
## %bb.238:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %r13
	movl	%eax, %edx
	movq	%rdx, %rax
	subq	-80(%rbp), %rax         ## 8-byte Folded Reload
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	movl	%edx, %eax
	andl	$-32, %eax
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	leaq	-32(%rax), %rax
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	shrq	$5, %rax
	leal	1(%rax), %esi
	andl	$1, %esi
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	negq	%rdx
	movq	%rdx, -240(%rbp)        ## 8-byte Spill
	movq	%rsi, -304(%rbp)        ## 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %r15         ## 8-byte Reload
	leaq	1(%r15,%rdi), %r9
	movq	%r10, %rax
	incq	%r10
	addq	-336(%rbp), %r15        ## 8-byte Folded Reload
	addq	%rdi, %r15
	xorl	%r8d, %r8d
	movl	%ecx, %r11d
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %r14        ## 8-byte Reload
	movq	%r13, -224(%rbp)        ## 8-byte Spill
LBB147_239:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB147_251 Depth 3
                                        ##       Child Loop BB147_246 Depth 3
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	jle	LBB147_257
## %bb.240:                             ##   in Loop: Header=BB147_239 Depth=2
	cmpl	$32, -44(%rbp)          ## 4-byte Folded Reload
	jae	LBB147_247
## %bb.241:                             ##   in Loop: Header=BB147_239 Depth=2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
LBB147_242:                             ##   in Loop: Header=BB147_239 Depth=2
	movq	%rax, %rbx
	notq	%rbx
	testb	$1, -112(%rbp)          ## 1-byte Folded Reload
	je	LBB147_244
## %bb.243:                             ##   in Loop: Header=BB147_239 Depth=2
	movl	%ecx, %edx
	subl	-176(%rbp), %edx        ## 4-byte Folded Reload
	movslq	%edx, %rdx
	movb	(%r14,%rdx), %dl
	addb	(%r12,%rax), %dl
	movb	%dl, (%r14,%rax)
	orq	$1, %rax
	incl	%ecx
LBB147_244:                             ##   in Loop: Header=BB147_239 Depth=2
	cmpq	-240(%rbp), %rbx        ## 8-byte Folded Reload
	je	LBB147_257
## %bb.245:                             ##   in Loop: Header=BB147_239 Depth=2
	movq	-112(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	leaq	(%r9,%rax), %rsi
	addq	%r10, %rax
	movslq	%ecx, %rcx
	addq	%r15, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB147_246:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_239 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movzbl	(%rcx,%rdx), %ebx
	addb	-1(%rax,%rdx), %bl
	movb	%bl, -1(%rsi,%rdx)
	movzbl	1(%rcx,%rdx), %ebx
	addb	(%rax,%rdx), %bl
	movb	%bl, (%rsi,%rdx)
	addq	$2, %rdx
	cmpq	%rdx, %rdi
	jne	LBB147_246
	jmp	LBB147_257
LBB147_247:                             ##   in Loop: Header=BB147_239 Depth=2
	movq	%r8, %rax
	movq	%r13, %rbx
	movq	-80(%rbp), %r13         ## 8-byte Reload
	imulq	%r13, %rax
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	leaq	(%rdi,%rax), %rcx
	movq	%rcx, -160(%rbp)        ## 8-byte Spill
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rax,%rcx), %rsi
	addq	%rdi, %rsi
	movq	%r8, %rdx
	imulq	%rbx, %rdx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rdx), %r12
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	addq	%rcx, %rdx
	addq	%rbx, %rdx
	movq	-272(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rax), %rbx
	subq	%r13, %rax
	addq	%rdi, %rax
	addq	%rdi, %rbx
	movq	-160(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rdx, %rdi
	setb	%r13b
	cmpq	%rsi, -64(%rbp)         ## 8-byte Folded Reload
	setb	%cl
	cmpq	%rbx, %rdi
	setb	%dl
	cmpq	%rsi, %rax
	setb	%bl
	xorl	%eax, %eax
	testb	%cl, %r13b
	jne	LBB147_252
## %bb.248:                             ##   in Loop: Header=BB147_239 Depth=2
	movl	$0, %ecx
	andb	%bl, %dl
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jne	LBB147_242
## %bb.249:                             ##   in Loop: Header=BB147_239 Depth=2
	cmpq	$0, -288(%rbp)          ## 8-byte Folded Reload
	je	LBB147_253
## %bb.250:                             ##   in Loop: Header=BB147_239 Depth=2
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	-316(%rbp), %eax        ## 4-byte Reload
	movl	%eax, %ebx
	xorl	%eax, %eax
LBB147_251:                             ##   Parent Loop BB147_26 Depth=1
                                        ##     Parent Loop BB147_239 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movdqu	(%r12,%rax), %xmm0
	movdqu	16(%r12,%rax), %xmm1
	leal	-32(%rbx), %edx
	movslq	%edx, %rdx
	movdqu	(%r14,%rdx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rdx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r14,%rax)
	movdqu	%xmm0, 16(%r14,%rax)
	movdqu	32(%r12,%rax), %xmm0
	movdqu	48(%r12,%rax), %xmm1
	movslq	%ebx, %rbx
	movdqu	(%r14,%rbx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rbx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, 32(%r14,%rax)
	movdqu	%xmm0, 48(%r14,%rax)
	addq	$64, %rax
	addl	$64, %ebx
	addq	$2, %rcx
	jne	LBB147_251
	jmp	LBB147_254
LBB147_252:                             ##   in Loop: Header=BB147_239 Depth=2
	xorl	%ecx, %ecx
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-224(%rbp), %r13        ## 8-byte Reload
	jmp	LBB147_242
LBB147_253:                             ##   in Loop: Header=BB147_239 Depth=2
	xorl	%eax, %eax
LBB147_254:                             ##   in Loop: Header=BB147_239 Depth=2
	cmpq	$0, -304(%rbp)          ## 8-byte Folded Reload
	je	LBB147_256
## %bb.255:                             ##   in Loop: Header=BB147_239 Depth=2
	movdqu	(%r12,%rax), %xmm0
	movdqu	16(%r12,%rax), %xmm1
	movl	%eax, %ecx
	subl	-176(%rbp), %ecx        ## 4-byte Folded Reload
	movslq	%ecx, %rcx
	movdqu	(%r14,%rcx), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r14,%rcx), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r14,%rax)
	movdqu	%xmm0, 16(%r14,%rax)
LBB147_256:                             ##   in Loop: Header=BB147_239 Depth=2
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, %rax
	movl	%edx, %ecx
	cmpq	-112(%rbp), %rdx        ## 8-byte Folded Reload
	jne	LBB147_242
LBB147_257:                             ##   in Loop: Header=BB147_239 Depth=2
	movb	$-1, (%r14,%r13)
	addq	%r13, %r12
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	%rax, %r14
	incq	%r8
	addq	%rax, %r9
	addq	%r13, %r10
	addq	%rax, %r15
	decl	%r11d
	jne	LBB147_239
	jmp	LBB147_265
LBB147_264:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%r10, -56(%rbp)         ## 8-byte Spill
LBB147_265:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpb	$0, -129(%rbp)          ## 1-byte Folded Reload
	je	LBB147_267
LBB147_266:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-376(%rbp), %r13        ## 8-byte Reload
	jmp	LBB147_343
LBB147_275:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, -120(%rbp)        ## 8-byte Spill
	leaq	(%r15,%rdx), %rsi
	movq	-72(%rbp), %r11         ## 8-byte Reload
	leaq	(%r11,%rdx), %r9
	movslq	-44(%rbp), %rcx         ## 4-byte Folded Reload
	movq	%r15, %rdi
	subq	%rcx, %rdi
	movq	%rdx, %rax
	subq	%rcx, %rax
	leaq	(%r15,%rax), %r10
	movq	%rdx, -248(%rbp)        ## 8-byte Spill
	leaq	(%rbx,%rdx), %r8
	movq	%rbx, %rdx
	subq	%rcx, %rdx
	addq	%rbx, %rax
	cmpq	%r9, %r15
	setb	%r14b
	cmpq	%rsi, %r11
	movq	%r15, %rcx
	setb	%r15b
	cmpq	%r10, %rcx
	setb	%r11b
	cmpq	%rsi, %rdi
	setb	%r9b
	cmpq	%r8, %rcx
	setb	%r8b
	cmpq	%rsi, %rbx
	setb	%dil
	cmpq	%rax, %rcx
	setb	%al
	cmpq	%rsi, %rdx
	setb	%sil
	xorl	%r10d, %r10d
	testb	%r15b, %r14b
	jne	LBB147_332
## %bb.276:                             ##   in Loop: Header=BB147_26 Depth=1
	andb	%r9b, %r11b
	jne	LBB147_332
## %bb.277:                             ##   in Loop: Header=BB147_26 Depth=1
	andb	%dil, %r8b
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	movq	-248(%rbp), %rdx        ## 8-byte Reload
	jne	LBB147_333
## %bb.278:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %r8d
	andb	%sil, %al
	movq	-168(%rbp), %rsi        ## 8-byte Reload
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	jne	LBB147_334
## %bb.279:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%edx, %r10d
	andl	$-16, %r10d
	movl	%r10d, %r8d
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r9d
	negl	%r9d
	xorl	%edi, %edi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
LBB147_280:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	(%r9,%rdi), %eax
	cltq
	movdqu	(%rbx,%rax), %xmm13
	pshufd	$78, %xmm13, %xmm0      ## xmm0 = xmm13[2,3,0,1]
	pmovzxbd	%xmm0, %xmm8    ## xmm8 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pmovzxbd	%xmm13, %xmm2   ## xmm2 = xmm13[0],zero,zero,zero,xmm13[1],zero,zero,zero,xmm13[2],zero,zero,zero,xmm13[3],zero,zero,zero
	pshufd	$229, %xmm13, %xmm0     ## xmm0 = xmm13[1,1,2,3]
	pmovzxbd	%xmm0, %xmm1    ## xmm1 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	movdqu	(%rsi,%rdi), %xmm14
	pshufd	$78, %xmm14, %xmm0      ## xmm0 = xmm14[2,3,0,1]
	pmovzxbd	%xmm0, %xmm11   ## xmm11 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	pmovzxbd	%xmm14, %xmm10  ## xmm10 = xmm14[0],zero,zero,zero,xmm14[1],zero,zero,zero,xmm14[2],zero,zero,zero,xmm14[3],zero,zero,zero
	pshufd	$229, %xmm14, %xmm3     ## xmm3 = xmm14[1,1,2,3]
	pmovzxbd	%xmm3, %xmm3    ## xmm3 = xmm3[0],zero,zero,zero,xmm3[1],zero,zero,zero,xmm3[2],zero,zero,zero,xmm3[3],zero,zero,zero
	movdqu	(%rsi,%rax), %xmm0
	pshufd	$229, %xmm0, %xmm4      ## xmm4 = xmm0[1,1,2,3]
	pmovzxbd	%xmm4, %xmm9    ## xmm9 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero,xmm4[2],zero,zero,zero,xmm4[3],zero,zero,zero
	pmovzxbd	%xmm0, %xmm4    ## xmm4 = xmm0[0],zero,zero,zero,xmm0[1],zero,zero,zero,xmm0[2],zero,zero,zero,xmm0[3],zero,zero,zero
	movdqa	%xmm4, -208(%rbp)       ## 16-byte Spill
	pshufd	$78, %xmm0, %xmm5       ## xmm5 = xmm0[2,3,0,1]
	movdqa	%xmm0, %xmm7
	movdqa	%xmm0, -112(%rbp)       ## 16-byte Spill
	pmovzxbd	%xmm5, %xmm15   ## xmm15 = xmm5[0],zero,zero,zero,xmm5[1],zero,zero,zero,xmm5[2],zero,zero,zero,xmm5[3],zero,zero,zero
	movdqa	%xmm3, %xmm5
	paddd	%xmm1, %xmm5
	movdqa	%xmm10, %xmm6
	paddd	%xmm2, %xmm6
	movdqa	%xmm11, %xmm12
	paddd	%xmm8, %xmm12
	psubd	%xmm15, %xmm12
	psubd	%xmm4, %xmm6
	psubd	%xmm9, %xmm5
	movdqa	%xmm5, %xmm0
	psubd	%xmm1, %xmm0
	movdqa	%xmm0, -160(%rbp)       ## 16-byte Spill
	movdqa	%xmm6, %xmm0
	psubd	%xmm2, %xmm0
	movdqa	%xmm0, -240(%rbp)       ## 16-byte Spill
	movdqa	%xmm12, %xmm2
	psubd	%xmm8, %xmm2
	pshufd	$231, %xmm13, %xmm1     ## xmm1 = xmm13[3,1,2,3]
	pmovzxbd	%xmm1, %xmm1    ## xmm1 = xmm1[0],zero,zero,zero,xmm1[1],zero,zero,zero,xmm1[2],zero,zero,zero,xmm1[3],zero,zero,zero
	pshufd	$231, %xmm14, %xmm4     ## xmm4 = xmm14[3,1,2,3]
	pmovzxbd	%xmm4, %xmm0    ## xmm0 = xmm4[0],zero,zero,zero,xmm4[1],zero,zero,zero,xmm4[2],zero,zero,zero,xmm4[3],zero,zero,zero
	pshufd	$231, %xmm7, %xmm7      ## xmm7 = xmm7[3,1,2,3]
	pmovzxbd	%xmm7, %xmm8    ## xmm8 = xmm7[0],zero,zero,zero,xmm7[1],zero,zero,zero,xmm7[2],zero,zero,zero,xmm7[3],zero,zero,zero
	movdqa	%xmm0, %xmm4
	paddd	%xmm1, %xmm4
	psubd	%xmm8, %xmm4
	movdqa	%xmm4, %xmm7
	psubd	%xmm1, %xmm7
	movdqa	%xmm5, %xmm1
	psubd	%xmm3, %xmm1
	movdqa	%xmm1, -272(%rbp)       ## 16-byte Spill
	movdqa	%xmm6, %xmm1
	psubd	%xmm10, %xmm1
	movdqa	%xmm1, -224(%rbp)       ## 16-byte Spill
	movdqa	%xmm12, %xmm1
	psubd	%xmm11, %xmm1
	movdqa	%xmm4, %xmm3
	psubd	%xmm0, %xmm3
	psubd	%xmm9, %xmm5
	psubd	-208(%rbp), %xmm6       ## 16-byte Folded Reload
	psubd	%xmm15, %xmm12
	pabsd	%xmm7, %xmm10
	pabsd	%xmm2, %xmm7
	pabsd	%xmm3, %xmm0
	pabsd	%xmm1, %xmm3
	psubd	%xmm8, %xmm4
	pabsd	%xmm4, %xmm1
	movdqa	%xmm1, -288(%rbp)       ## 16-byte Spill
	pabsd	%xmm12, %xmm2
	movdqa	%xmm2, -304(%rbp)       ## 16-byte Spill
	movdqa	%xmm7, %xmm4
	pcmpgtd	%xmm3, %xmm4
	movdqa	%xmm4, -208(%rbp)       ## 16-byte Spill
	movdqa	%xmm10, %xmm15
	pcmpgtd	%xmm0, %xmm15
	pcmpgtd	%xmm1, %xmm0
	movdqa	LCPI147_1(%rip), %xmm8  ## xmm8 = <u,u,u,u,0,4,8,12,u,u,u,u,u,u,u,u>
	pshufb	%xmm8, %xmm0
	pcmpgtd	%xmm2, %xmm3
	pshufb	%xmm8, %xmm3
	punpckldq	%xmm0, %xmm3    ## xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	pabsd	-240(%rbp), %xmm1       ## 16-byte Folded Reload
	pabsd	-160(%rbp), %xmm2       ## 16-byte Folded Reload
	pabsd	-224(%rbp), %xmm0       ## 16-byte Folded Reload
	pabsd	-272(%rbp), %xmm4       ## 16-byte Folded Reload
	pabsd	%xmm6, %xmm9
	pabsd	%xmm5, %xmm11
	movdqa	%xmm2, %xmm6
	pcmpgtd	%xmm4, %xmm6
	movdqa	%xmm1, %xmm5
	pcmpgtd	%xmm0, %xmm5
	pcmpgtd	%xmm9, %xmm0
	movdqa	LCPI147_2(%rip), %xmm12 ## xmm12 = <0,4,8,12,u,u,u,u,u,u,u,u,u,u,u,u>
	pshufb	%xmm12, %xmm0
	pcmpgtd	%xmm11, %xmm4
	pshufb	%xmm12, %xmm4
	punpckldq	%xmm4, %xmm0    ## xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
	pblendw	$240, %xmm3, %xmm0      ## xmm0 = xmm0[0,1,2,3],xmm3[4,5,6,7]
	pblendvb	%xmm0, -112(%rbp), %xmm14 ## 16-byte Folded Reload
	pcmpgtd	%xmm11, %xmm2
	por	%xmm6, %xmm2
	pcmpgtd	%xmm9, %xmm1
	por	%xmm5, %xmm1
	pcmpgtd	-304(%rbp), %xmm7       ## 16-byte Folded Reload
	por	-208(%rbp), %xmm7       ## 16-byte Folded Reload
	pcmpgtd	-288(%rbp), %xmm10      ## 16-byte Folded Reload
	por	%xmm15, %xmm10
	pshufb	%xmm8, %xmm10
	pshufb	%xmm8, %xmm7
	punpckldq	%xmm10, %xmm7   ## xmm7 = xmm7[0],xmm10[0],xmm7[1],xmm10[1]
	pshufb	%xmm12, %xmm1
	pshufb	%xmm12, %xmm2
	punpckldq	%xmm2, %xmm1    ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	pblendw	$240, %xmm7, %xmm1      ## xmm1 = xmm1[0,1,2,3],xmm7[4,5,6,7]
	movdqa	%xmm1, %xmm0
	pblendvb	%xmm0, %xmm14, %xmm13
	movdqu	(%rcx,%rdi), %xmm0
	paddb	%xmm0, %xmm13
	movdqu	%xmm13, (%rbx,%rdi)
	addq	$16, %rdi
	cmpq	%rdi, %r10
	jne	LBB147_280
## %bb.281:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpq	%rdx, %r10
	movdqa	LCPI147_0(%rip), %xmm8  ## xmm8 = [127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127]
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	jne	LBB147_334
	jmp	LBB147_342
LBB147_282:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %r10
	leaq	(%r15,%rax), %rdx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rax), %rcx
	movq	-168(%rbp), %rsi        ## 8-byte Reload
	leaq	(%rsi,%rax), %rsi
	cmpq	%rcx, %r15
	setb	%dil
	cmpq	%rdx, %rbx
	setb	%bl
	cmpq	%rsi, %r15
	setb	%cl
	cmpq	%rdx, -168(%rbp)        ## 8-byte Folded Reload
	setb	%dl
	testb	%bl, %dil
	jne	LBB147_308
## %bb.283:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %r9d
	andb	%dl, %cl
	movq	%r10, %rdi
	jne	LBB147_85
## %bb.284:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%eax, %r9d
	andl	$-32, %r9d
	leaq	-32(%r9), %rdx
	movq	%rdx, %rcx
	shrq	$5, %rcx
	incq	%rcx
	movl	%ecx, %r8d
	andl	$1, %r8d
	testq	%rdx, %rdx
	je	LBB147_312
## %bb.285:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-496(%rbp), %rdx        ## 8-byte Reload
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	leaq	(%rsi,%rdx), %rdi
	movq	%r10, %rdx
	addq	%r10, %rdi
	leaq	48(%rsi,%r10), %rbx
	movl	$1, %edx
	subq	%rcx, %rdx
	leaq	-1(%r8,%rdx), %rcx
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_286:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	movdqu	-48(%rdi,%rsi), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	-32(%rdi,%rsi), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -48(%rbx,%rsi)
	movdqu	%xmm0, -32(%rbx,%rsi)
	movdqu	32(%rdx,%rsi), %xmm0
	movdqu	48(%rdx,%rsi), %xmm1
	movdqu	-16(%rdi,%rsi), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	(%rdi,%rsi), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -16(%rbx,%rsi)
	movdqu	%xmm0, (%rbx,%rsi)
	addq	$64, %rsi
	addq	$2, %rcx
	jne	LBB147_286
	jmp	LBB147_313
LBB147_287:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %r12
	leaq	(%r15,%r10), %rdx
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%r10), %rax
	leaq	(%rbx,%r10), %r9
	movq	%rbx, %r14
	movslq	-44(%rbp), %rsi         ## 4-byte Folded Reload
	movq	%r15, %rdi
	subq	%rsi, %rdi
	movq	%r10, %rbx
	subq	%rsi, %rbx
	addq	%r15, %rbx
	cmpq	%rax, %r15
	setb	%r8b
	cmpq	%rdx, %rcx
	setb	%r11b
	cmpq	%r9, %r15
	setb	%al
	cmpq	%rdx, %r14
	setb	%sil
	cmpq	%rbx, %r15
	setb	%cl
	cmpq	%rdx, %rdi
	setb	%dl
	xorl	%r9d, %r9d
	testb	%r11b, %r8b
	jne	LBB147_347
## %bb.288:                             ##   in Loop: Header=BB147_26 Depth=1
	andb	%sil, %al
	movq	%r12, %rdi
	jne	LBB147_348
## %bb.289:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %eax
	andb	%dl, %cl
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	jne	LBB147_120
## %bb.290:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r10d, %r9d
	andl	$-16, %r9d
	leaq	-16(%r9), %rcx
	movq	%rcx, %rax
	shrq	$4, %rax
	incq	%rax
	movl	%eax, %r8d
	andl	$1, %r8d
	testq	%rcx, %rcx
	je	LBB147_316
## %bb.291:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$16, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movq	-504(%rbp), %rcx        ## 8-byte Reload
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	leaq	(%rsi,%rcx), %rdx
	movq	%r12, %rcx
	addq	%r12, %rdx
	leaq	16(%rsi,%r12), %r11
	movl	$1, %ecx
	subq	%rax, %rcx
	leaq	-1(%r8,%rcx), %rax
	xorl	%esi, %esi
	movq	-72(%rbp), %rbx         ## 8-byte Reload
LBB147_292:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	pmovzxbd	-12(%rdx,%rsi), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	-16(%rdx,%rsi), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	-4(%rdx,%rsi), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	-8(%rdx,%rsi), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	leal	-16(%rdi), %ecx
	movslq	%ecx, %rcx
	pmovzxbd	4(%r15,%rcx), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movdqu	(%rbx,%rsi), %xmm5
	paddd	%xmm0, %xmm4
	pmovzxbd	(%r15,%rcx), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm1, %xmm0
	pmovzxbd	12(%r15,%rcx), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm2, %xmm1
	pmovzxbd	8(%r15,%rcx), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm0
	packusdw	%xmm4, %xmm0
	psrld	$1, %xmm1
	psrld	$1, %xmm2
	packusdw	%xmm1, %xmm2
	packuswb	%xmm2, %xmm0
	paddb	%xmm5, %xmm0
	movdqu	%xmm0, -16(%r11,%rsi)
	pmovzxbd	4(%rdx,%rsi), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%rdx,%rsi), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	12(%rdx,%rsi), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	8(%rdx,%rsi), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movslq	%edi, %rdi
	pmovzxbd	4(%r15,%rdi), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm0, %xmm4
	pmovzxbd	(%r15,%rdi), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movdqu	16(%rbx,%rsi), %xmm5
	paddd	%xmm1, %xmm0
	pmovzxbd	12(%r15,%rdi), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm2, %xmm1
	pmovzxbd	8(%r15,%rdi), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm0
	packusdw	%xmm4, %xmm0
	psrld	$1, %xmm1
	psrld	$1, %xmm2
	packusdw	%xmm1, %xmm2
	packuswb	%xmm2, %xmm0
	paddb	%xmm5, %xmm0
	movdqu	%xmm0, (%r11,%rsi)
	addq	$32, %rsi
	addl	$32, %edi
	addq	$2, %rax
	jne	LBB147_292
	jmp	LBB147_317
LBB147_293:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %r14
	leaq	(%r15,%r9), %rcx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%r9), %rdx
	movslq	-44(%rbp), %rsi         ## 4-byte Folded Reload
	movq	%r15, %rdi
	subq	%rsi, %rdi
	movq	%r9, %rax
	subq	%rsi, %rax
	addq	%r15, %rax
	cmpq	%rdx, %r15
	setb	%r8b
	cmpq	%rcx, %rbx
	setb	%r10b
	cmpq	%rax, %r15
	setb	%bl
	cmpq	%rcx, %rdi
	setb	%sil
	xorl	%r11d, %r11d
	testb	%r10b, %r8b
	jne	LBB147_309
## %bb.294:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %ecx
	andb	%sil, %bl
	movq	%r14, %rdi
	jne	LBB147_151
## %bb.295:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r9d, %r11d
	andl	$-32, %r11d
	leaq	-32(%r11), %rax
	movq	%rax, %rcx
	shrq	$5, %rcx
	incq	%rcx
	movl	%ecx, %r8d
	andl	$1, %r8d
	testq	%rax, %rax
	je	LBB147_320
## %bb.296:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$32, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	48(%rax,%r14), %rbx
	movl	$1, %eax
	subq	%rcx, %rax
	leaq	-1(%r8,%rax), %rcx
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_297:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	leal	-32(%rdi), %eax
	cltq
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -48(%rbx,%rsi)
	movdqu	%xmm0, -32(%rbx,%rsi)
	movdqu	32(%rdx,%rsi), %xmm0
	movdqu	48(%rdx,%rsi), %xmm1
	movslq	%edi, %rdi
	movdqu	(%r15,%rdi), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rdi), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -16(%rbx,%rsi)
	movdqu	%xmm0, (%rbx,%rsi)
	addq	$64, %rsi
	addl	$64, %edi
	addq	$2, %rcx
	jne	LBB147_297
	jmp	LBB147_321
LBB147_298:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %r14
	leaq	(%r15,%r9), %rcx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%r9), %rdx
	movslq	-44(%rbp), %rsi         ## 4-byte Folded Reload
	movq	%r15, %rdi
	subq	%rsi, %rdi
	movq	%r9, %rax
	subq	%rsi, %rax
	addq	%r15, %rax
	cmpq	%rdx, %r15
	setb	%r8b
	cmpq	%rcx, %rbx
	setb	%r10b
	cmpq	%rax, %r15
	setb	%bl
	cmpq	%rcx, %rdi
	setb	%sil
	xorl	%r11d, %r11d
	testb	%r10b, %r8b
	jne	LBB147_310
## %bb.299:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %ecx
	andb	%sil, %bl
	movq	%r14, %rdi
	jne	LBB147_182
## %bb.300:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r9d, %r11d
	andl	$-32, %r11d
	leaq	-32(%r11), %rax
	movq	%rax, %rsi
	shrq	$5, %rsi
	incq	%rsi
	movl	%esi, %r8d
	andl	$1, %r8d
	testq	%rax, %rax
	je	LBB147_324
## %bb.301:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$32, %ecx
	subl	-44(%rbp), %ecx         ## 4-byte Folded Reload
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	48(%rax,%rdi), %rbx
	movl	$1, %eax
	subq	%rsi, %rax
	leaq	-1(%r8,%rax), %rdi
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_302:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	leal	-32(%rcx), %eax
	cltq
	movdqu	(%r15,%rax), %xmm2
	movdqu	16(%r15,%rax), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, -48(%rbx,%rsi)
	movdqu	%xmm3, -32(%rbx,%rsi)
	movdqu	32(%rdx,%rsi), %xmm0
	movdqu	48(%rdx,%rsi), %xmm1
	movslq	%ecx, %rcx
	movdqu	(%r15,%rcx), %xmm2
	movdqu	16(%r15,%rcx), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, -16(%rbx,%rsi)
	movdqu	%xmm3, (%rbx,%rsi)
	addq	$64, %rsi
	addl	$64, %ecx
	addq	$2, %rdi
	jne	LBB147_302
	jmp	LBB147_325
LBB147_303:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	%rdi, %r14
	leaq	(%r15,%r9), %rcx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%r9), %rdx
	movslq	-44(%rbp), %rsi         ## 4-byte Folded Reload
	movq	%r15, %rdi
	subq	%rsi, %rdi
	movq	%r9, %rax
	subq	%rsi, %rax
	addq	%r15, %rax
	cmpq	%rdx, %r15
	setb	%r8b
	cmpq	%rcx, %rbx
	setb	%r10b
	cmpq	%rax, %r15
	setb	%bl
	cmpq	%rcx, %rdi
	setb	%sil
	xorl	%r11d, %r11d
	testb	%r10b, %r8b
	jne	LBB147_311
## %bb.304:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$0, %ecx
	andb	%sil, %bl
	movq	%r14, %rdi
	jne	LBB147_190
## %bb.305:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r9d, %r11d
	andl	$-32, %r11d
	leaq	-32(%r11), %rax
	movq	%rax, %rcx
	shrq	$5, %rcx
	incq	%rcx
	movl	%ecx, %r8d
	andl	$1, %r8d
	testq	%rax, %rax
	je	LBB147_328
## %bb.306:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	$32, %edi
	subl	-44(%rbp), %edi         ## 4-byte Folded Reload
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leaq	48(%rax,%r14), %rbx
	movl	$1, %eax
	subq	%rcx, %rax
	leaq	-1(%r8,%rax), %rcx
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_307:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	leal	-32(%rdi), %eax
	cltq
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -48(%rbx,%rsi)
	movdqu	%xmm0, -32(%rbx,%rsi)
	movdqu	32(%rdx,%rsi), %xmm0
	movdqu	48(%rdx,%rsi), %xmm1
	movslq	%edi, %rdi
	movdqu	(%r15,%rdi), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rdi), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, -16(%rbx,%rsi)
	movdqu	%xmm0, (%rbx,%rsi)
	addq	$64, %rsi
	addl	$64, %edi
	addq	$2, %rcx
	jne	LBB147_307
	jmp	LBB147_329
LBB147_308:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r9d, %r9d
	movq	%r10, %rdi
	jmp	LBB147_85
LBB147_309:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	jmp	LBB147_151
LBB147_310:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	jmp	LBB147_182
LBB147_311:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	jmp	LBB147_190
LBB147_312:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_313:                             ##   in Loop: Header=BB147_26 Depth=1
	testq	%r8, %r8
	je	LBB147_315
## %bb.314:                             ##   in Loop: Header=BB147_26 Depth=1
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movdqu	(%rcx,%rsi), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%rcx,%rsi), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm0, 16(%r15,%rsi)
LBB147_315:                             ##   in Loop: Header=BB147_26 Depth=1
	cmpq	%rax, %r9
	movq	%r10, %rdi
	jne	LBB147_85
	jmp	LBB147_342
LBB147_316:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%esi, %esi
LBB147_317:                             ##   in Loop: Header=BB147_26 Depth=1
	testq	%r8, %r8
	je	LBB147_319
## %bb.318:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-168(%rbp), %rax        ## 8-byte Reload
	pmovzxbd	4(%rax,%rsi), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	(%rax,%rsi), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	12(%rax,%rsi), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	pmovzxbd	8(%rax,%rsi), %xmm3 ## xmm3 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movl	%esi, %eax
	subl	-44(%rbp), %eax         ## 4-byte Folded Reload
	cltq
	pmovzxbd	4(%r15,%rax), %xmm4 ## xmm4 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movdqu	(%rcx,%rsi), %xmm5
	paddd	%xmm0, %xmm4
	pmovzxbd	(%r15,%rax), %xmm0 ## xmm0 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm1, %xmm0
	pmovzxbd	12(%r15,%rax), %xmm1 ## xmm1 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm2, %xmm1
	pmovzxbd	8(%r15,%rax), %xmm2 ## xmm2 = mem[0],zero,zero,zero,mem[1],zero,zero,zero,mem[2],zero,zero,zero,mem[3],zero,zero,zero
	paddd	%xmm3, %xmm2
	psrld	$1, %xmm4
	psrld	$1, %xmm0
	packusdw	%xmm4, %xmm0
	psrld	$1, %xmm1
	psrld	$1, %xmm2
	packusdw	%xmm1, %xmm2
	packuswb	%xmm2, %xmm0
	paddb	%xmm5, %xmm0
	movdqu	%xmm0, (%r15,%rsi)
LBB147_319:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r9d, %eax
	cmpq	%r10, %r9
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	movq	%r12, %rdi
	jne	LBB147_120
	jmp	LBB147_342
LBB147_320:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_321:                             ##   in Loop: Header=BB147_26 Depth=1
	testq	%r8, %r8
	je	LBB147_323
## %bb.322:                             ##   in Loop: Header=BB147_26 Depth=1
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	movl	%esi, %eax
	subl	-44(%rbp), %eax         ## 4-byte Folded Reload
	cltq
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm0, 16(%r15,%rsi)
LBB147_323:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r11d, %ecx
	cmpq	%r9, %r11
	movq	%r14, %rdi
	jne	LBB147_151
	jmp	LBB147_342
LBB147_324:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_325:                             ##   in Loop: Header=BB147_26 Depth=1
	testq	%r8, %r8
	je	LBB147_327
## %bb.326:                             ##   in Loop: Header=BB147_26 Depth=1
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	movl	%esi, %eax
	subl	-44(%rbp), %eax         ## 4-byte Folded Reload
	cltq
	movdqu	(%r15,%rax), %xmm2
	movdqu	16(%r15,%rax), %xmm3
	psrlw	$1, %xmm2
	pand	%xmm8, %xmm2
	paddb	%xmm0, %xmm2
	psrlw	$1, %xmm3
	pand	%xmm8, %xmm3
	paddb	%xmm1, %xmm3
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm3, 16(%r15,%rsi)
LBB147_327:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r11d, %ecx
	cmpq	%r9, %r11
	movq	%r14, %rdi
	jne	LBB147_182
	jmp	LBB147_342
LBB147_328:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%esi, %esi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
LBB147_329:                             ##   in Loop: Header=BB147_26 Depth=1
	testq	%r8, %r8
	je	LBB147_331
## %bb.330:                             ##   in Loop: Header=BB147_26 Depth=1
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	16(%rdx,%rsi), %xmm1
	movl	%esi, %eax
	subl	-44(%rbp), %eax         ## 4-byte Folded Reload
	cltq
	movdqu	(%r15,%rax), %xmm2
	paddb	%xmm0, %xmm2
	movdqu	16(%r15,%rax), %xmm0
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%r15,%rsi)
	movdqu	%xmm0, 16(%r15,%rsi)
LBB147_331:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	%r11d, %ecx
	cmpq	%r9, %r11
	movq	%r14, %rdi
	jne	LBB147_190
	jmp	LBB147_342
LBB147_332:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r8d, %r8d
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	-248(%rbp), %rdx        ## 8-byte Reload
	jmp	LBB147_334
LBB147_333:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%r8d, %r8d
	movq	-120(%rbp), %rdi        ## 8-byte Reload
LBB147_334:                             ##   in Loop: Header=BB147_26 Depth=1
	leaq	(%rdi,%r10), %r14
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%r14), %rax
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	addq	%r12, %r14
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r10), %r15
	subq	%r10, %rdx
	movslq	%r8d, %r8
	addq	%rdi, %r8
	movslq	-44(%rbp), %rax         ## 4-byte Folded Reload
	subq	%rax, %r8
	addq	%r8, %r12
	addq	%rcx, %r8
	xorl	%ecx, %ecx
LBB147_335:                             ##   Parent Loop BB147_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%rdx, %r9
	movzbl	(%r8,%rcx), %r10d
	movzbl	(%r14,%rcx), %edx
	movzbl	(%r12,%rcx), %ebx
	leal	(%rdx,%r10), %eax
	subl	%ebx, %eax
	movl	%eax, %esi
	subl	%r10d, %esi
	movl	%esi, %edi
	negl	%edi
	cmovll	%esi, %edi
	movl	%eax, %esi
	subl	%edx, %esi
	movl	%esi, %r11d
	negl	%r11d
	cmovll	%esi, %r11d
	subl	%ebx, %eax
	movl	%eax, %r13d
	negl	%r13d
	cmovll	%eax, %r13d
	cmpl	%r13d, %r11d
	jg	LBB147_337
## %bb.336:                             ##   in Loop: Header=BB147_335 Depth=2
	movl	%edx, %ebx
LBB147_337:                             ##   in Loop: Header=BB147_335 Depth=2
	movl	%ebx, %edx
	cmpl	%r13d, %edi
	jg	LBB147_339
## %bb.338:                             ##   in Loop: Header=BB147_335 Depth=2
	movl	%r10d, %edx
LBB147_339:                             ##   in Loop: Header=BB147_335 Depth=2
	cmpl	%r11d, %edi
	movq	-376(%rbp), %r13        ## 8-byte Reload
	jg	LBB147_341
## %bb.340:                             ##   in Loop: Header=BB147_335 Depth=2
	movl	%edx, %ebx
LBB147_341:                             ##   in Loop: Header=BB147_335 Depth=2
	addb	(%r15,%rcx), %bl
	movq	-112(%rbp), %rax        ## 8-byte Reload
	movb	%bl, (%rax,%rcx)
	incq	%rcx
	movq	%r9, %rdx
	cmpq	%rcx, %r9
	jne	LBB147_335
LBB147_342:                             ##   in Loop: Header=BB147_26 Depth=1
	movslq	-56(%rbp), %rax         ## 4-byte Folded Reload
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
LBB147_343:                             ##   in Loop: Header=BB147_26 Depth=1
	movq	-360(%rbp), %r12        ## 8-byte Reload
	movl	-180(%rbp), %r14d       ## 4-byte Reload
	movl	16(%rbp), %r11d
	movq	-328(%rbp), %r8         ## 8-byte Reload
	movl	-312(%rbp), %esi        ## 4-byte Reload
	movq	-352(%rbp), %rbx        ## 8-byte Reload
	movq	-80(%rbp), %r15         ## 8-byte Reload
LBB147_344:                             ##   in Loop: Header=BB147_26 Depth=1
	leaq	LJTI147_0(%rip), %rdi
	movq	-368(%rbp), %r9         ## 8-byte Reload
LBB147_345:                             ##   in Loop: Header=BB147_26 Depth=1
	incq	%r9
	cmpq	-608(%rbp), %r9         ## 8-byte Folded Reload
	jae	LBB147_349
## %bb.346:                             ##   in Loop: Header=BB147_26 Depth=1
	movl	-320(%rbp), %eax        ## 4-byte Reload
	movl	%eax, %ecx
	imull	%r9d, %ecx
	movq	24(%r13), %rax
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movb	(%rax), %dl
	cmpb	$4, %dl
	jbe	LBB147_26
	jmp	LBB147_398
LBB147_347:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%eax, %eax
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	movq	%r12, %rdi
	jmp	LBB147_120
LBB147_348:                             ##   in Loop: Header=BB147_26 Depth=1
	xorl	%eax, %eax
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	jmp	LBB147_120
LBB147_349:
	movl	$1, %r14d
	cmpl	$7, %r11d
	jg	LBB147_399
## %bb.350:
	testl	%esi, %esi
	je	LBB147_11
## %bb.351:
	movl	-384(%rbp), %eax        ## 4-byte Reload
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ebx, %ecx
	negq	%rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	movslq	%r11d, %rcx
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	leal	-1(%r12), %edx
	movq	-464(%rbp), %rcx        ## 8-byte Reload
	movl	%ecx, %edi
	andl	$7, %edi
	movl	%edi, -208(%rbp)        ## 4-byte Spill
	movl	%ecx, %edi
	andl	$3, %edi
	movl	%edi, -288(%rbp)        ## 4-byte Spill
	movl	%ecx, %edi
	andl	$1, %edi
	movl	%edi, -240(%rbp)        ## 4-byte Spill
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	movslq	%edx, %rdi
	movl	%esi, %edx
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	leal	-2(%rcx), %edx
	movl	%edx, -304(%rbp)        ## 4-byte Spill
	leaq	(%rdi,%rdi), %rsi
	movq	%rsi, %rdx
	movq	%rsi, -176(%rbp)        ## 8-byte Spill
	movslq	%esi, %rdx
	orq	$1, %rdx
	movq	%rdx, -312(%rbp)        ## 8-byte Spill
	movl	-188(%rbp), %edx        ## 4-byte Reload
	imull	%r12d, %edx
	imull	-180(%rbp), %edx        ## 4-byte Folded Reload
	movl	%edx, -188(%rbp)        ## 4-byte Spill
	leal	-2(%r12), %edx
	movl	%edx, -184(%rbp)        ## 4-byte Spill
	leaq	-1(%rdi), %rdx
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	movq	%rdi, -160(%rbp)        ## 8-byte Spill
	leaq	2(%rdi,%rdi,2), %rdx
	movq	%rdx, -272(%rbp)        ## 8-byte Spill
	leal	-4(,%r12,4), %eax
	movl	%eax, -224(%rbp)        ## 4-byte Spill
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
LBB147_352:                             ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB147_358 Depth 2
                                        ##     Child Loop BB147_369 Depth 2
                                        ##     Child Loop BB147_381 Depth 2
                                        ##     Child Loop BB147_396 Depth 2
                                        ##     Child Loop BB147_392 Depth 2
	movl	-320(%rbp), %eax        ## 4-byte Reload
	movl	%eax, %r10d
	imull	%r12d, %r10d
	movq	24(%r13), %r13
	addq	%r10, %r13
	movq	-56(%rbp), %rax         ## 8-byte Reload
	leaq	(%r13,%rax), %r9
	movb	$1, %r8b
	cmpl	$0, 24(%rbp)
	jne	LBB147_354
## %bb.353:                             ##   in Loop: Header=BB147_352 Depth=1
	movq	-80(%rbp), %rax         ## 8-byte Reload
	leaq	_stbi__depth_scale_table(%rip), %rdx
	movb	(%rax,%rdx), %r8b
LBB147_354:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	%r15d, %r15d
	addq	-64(%rbp), %r9          ## 8-byte Folded Reload
	cmpl	$4, %r11d
	je	LBB147_375
## %bb.355:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$2, %r11d
	je	LBB147_368
## %bb.356:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$1, %r11d
	jne	LBB147_385
## %bb.357:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	%ecx, %esi
	movl	%ecx, %edx
	cmpl	$8, %ecx
	jl	LBB147_360
LBB147_358:                             ##   Parent Loop BB147_352 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r9), %eax
	sarb	$7, %al
	andb	%r8b, %al
	movb	%al, (%r13)
	movzbl	(%r9), %eax
	shrb	$6, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	movzbl	(%r9), %eax
	shrb	$5, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 2(%r13)
	movzbl	(%r9), %eax
	shrb	$4, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 3(%r13)
	movzbl	(%r9), %eax
	shrb	$3, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 4(%r13)
	movzbl	(%r9), %eax
	shrb	$2, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 5(%r13)
	movzbl	(%r9), %eax
	shrb	%al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 6(%r13)
	movzbl	(%r9), %eax
	andb	$1, %al
	mulb	%r8b
	movb	%al, 7(%r13)
	addq	$8, %r13
	addl	$-8, %esi
	incq	%r9
	cmpl	$7, %esi
	jg	LBB147_358
## %bb.359:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	-208(%rbp), %edx        ## 4-byte Reload
LBB147_360:                             ##   in Loop: Header=BB147_352 Depth=1
	testl	%edx, %edx
	jle	LBB147_385
## %bb.361:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	sarb	$7, %al
	andb	%r8b, %al
	movb	%al, (%r13)
	cmpl	$1, %edx
	je	LBB147_385
## %bb.362:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$6, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	cmpl	$3, %edx
	jl	LBB147_385
## %bb.363:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$5, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 2(%r13)
	cmpl	$3, %edx
	je	LBB147_385
## %bb.364:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$4, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 3(%r13)
	cmpl	$5, %edx
	jl	LBB147_385
## %bb.365:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$3, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 4(%r13)
	cmpl	$5, %edx
	je	LBB147_385
## %bb.366:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$2, %al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 5(%r13)
	cmpl	$7, %edx
	jl	LBB147_385
## %bb.367:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	%al
	andb	$1, %al
	mulb	%r8b
	movb	%al, 6(%r13)
	jmp	LBB147_385
LBB147_368:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	%ecx, %edx
	movl	%ecx, %esi
	cmpl	$4, %ecx
	jl	LBB147_371
LBB147_369:                             ##   Parent Loop BB147_352 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r9), %eax
	shrb	$6, %al
	mulb	%r8b
	movb	%al, (%r13)
	movzbl	(%r9), %eax
	shrb	$4, %al
	andb	$3, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	movzbl	(%r9), %eax
	shrb	$2, %al
	andb	$3, %al
	mulb	%r8b
	movb	%al, 2(%r13)
	movzbl	(%r9), %eax
	andb	$3, %al
	mulb	%r8b
	movb	%al, 3(%r13)
	addq	$4, %r13
	addl	$-4, %edx
	incq	%r9
	cmpl	$3, %edx
	jg	LBB147_369
## %bb.370:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	-288(%rbp), %esi        ## 4-byte Reload
LBB147_371:                             ##   in Loop: Header=BB147_352 Depth=1
	testl	%esi, %esi
	jle	LBB147_385
## %bb.372:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$6, %al
	mulb	%r8b
	movb	%al, (%r13)
	cmpl	$1, %esi
	je	LBB147_385
## %bb.373:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$4, %al
	andb	$3, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	cmpl	$3, %esi
	jl	LBB147_385
## %bb.374:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$2, %al
	andb	$3, %al
	mulb	%r8b
	movb	%al, 2(%r13)
	jmp	LBB147_385
LBB147_375:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$2, %ecx
	jl	LBB147_378
## %bb.376:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	-304(%rbp), %esi        ## 4-byte Reload
	testb	$2, %sil
	jne	LBB147_379
## %bb.377:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$4, %al
	mulb	%r8b
	movb	%al, (%r13)
	movb	(%r9), %al
	andb	$15, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	addq	$2, %r13
	incq	%r9
	movl	%esi, %edx
	jmp	LBB147_380
LBB147_378:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	%ecx, %eax
	cmpl	$1, %eax
	je	LBB147_384
	jmp	LBB147_385
LBB147_379:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	%ecx, %edx
LBB147_380:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	-240(%rbp), %eax        ## 4-byte Reload
	cmpl	$2, %esi
	jb	LBB147_383
LBB147_381:                             ##   Parent Loop BB147_352 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movzbl	(%r9), %eax
	shrb	$4, %al
	mulb	%r8b
	movb	%al, (%r13)
	movzbl	(%r9), %eax
	andb	$15, %al
	mulb	%r8b
	movb	%al, 1(%r13)
	movzbl	1(%r9), %eax
	shrb	$4, %al
	mulb	%r8b
	movb	%al, 2(%r13)
	movzbl	1(%r9), %eax
	andb	$15, %al
	mulb	%r8b
	movb	%al, 3(%r13)
	addq	$4, %r13
	addl	$-4, %edx
	addq	$2, %r9
	cmpl	$1, %edx
	jg	LBB147_381
## %bb.382:                             ##   in Loop: Header=BB147_352 Depth=1
	movl	-240(%rbp), %eax        ## 4-byte Reload
LBB147_383:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$1, %eax
	jne	LBB147_385
LBB147_384:                             ##   in Loop: Header=BB147_352 Depth=1
	movb	(%r9), %al
	shrb	$4, %al
	mulb	%r8b
	movb	%al, (%r13)
LBB147_385:                             ##   in Loop: Header=BB147_352 Depth=1
	movq	-328(%rbp), %rcx        ## 8-byte Reload
	cmpl	-180(%rbp), %ecx        ## 4-byte Folded Reload
	movq	-376(%rbp), %r13        ## 8-byte Reload
	je	LBB147_397
## %bb.386:                             ##   in Loop: Header=BB147_352 Depth=1
	movq	24(%r13), %rax
	addq	%rax, %r10
	cmpl	$1, %ecx
	jne	LBB147_393
## %bb.387:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	js	LBB147_397
## %bb.388:                             ##   in Loop: Header=BB147_352 Depth=1
	movq	-160(%rbp), %rsi        ## 8-byte Reload
	movl	-44(%rbp), %edx         ## 4-byte Reload
	testb	$1, -360(%rbp)          ## 1-byte Folded Reload
	je	LBB147_390
## %bb.389:                             ##   in Loop: Header=BB147_352 Depth=1
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movb	$-1, (%r10,%rcx)
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	movb	(%r10,%rcx), %dl
	movq	-176(%rbp), %rcx        ## 8-byte Reload
	movb	%dl, (%r10,%rcx)
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movl	-184(%rbp), %edx        ## 4-byte Reload
LBB147_390:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	je	LBB147_397
## %bb.391:                             ##   in Loop: Header=BB147_352 Depth=1
	leaq	(%rsi,%r15), %rbx
	addq	%rbx, %rax
	leal	1(%rsi,%rsi), %esi
LBB147_392:                             ##   Parent Loop BB147_352 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rbx
	decl	%esi
	movb	$-1, (%r10,%rbx)
	movzbl	(%rax), %ecx
	movslq	%esi, %rsi
	movb	%cl, (%r10,%rsi)
	leal	-3(%rbx), %edi
	leal	-2(%rbx), %esi
	movslq	%esi, %rsi
	movb	$-1, (%r10,%rsi)
	movzbl	-1(%rax), %ecx
	movslq	%edi, %rsi
	movb	%cl, (%r10,%rsi)
	addq	$-2, %rax
	addl	$-4, %ebx
	addl	$-2, %edx
	movl	%ebx, %esi
	jns	LBB147_392
	jmp	LBB147_397
LBB147_393:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$3, %ecx
	jne	LBB147_409
## %bb.394:                             ##   in Loop: Header=BB147_352 Depth=1
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	js	LBB147_397
## %bb.395:                             ##   in Loop: Header=BB147_352 Depth=1
	addq	-272(%rbp), %rax        ## 8-byte Folded Reload
	addq	%r15, %rax
	movl	-224(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, %edx
	movl	-44(%rbp), %esi         ## 4-byte Reload
LBB147_396:                             ##   Parent Loop BB147_352 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	3(%rdx), %ecx
	movslq	%ecx, %rcx
	movb	$-1, (%r10,%rcx)
	movzbl	(%rax), %ecx
	leal	2(%rdx), %edi
	movslq	%edi, %rdi
	movb	%cl, (%r10,%rdi)
	movzbl	-1(%rax), %ecx
	leal	1(%rdx), %edi
	movslq	%edi, %rdi
	movb	%cl, (%r10,%rdi)
	movzbl	-2(%rax), %ecx
	movslq	%edx, %rdx
	movb	%cl, (%r10,%rdx)
	addq	$-3, %rax
	addl	$-4, %edx
	decl	%esi
	jns	LBB147_396
LBB147_397:                             ##   in Loop: Header=BB147_352 Depth=1
	incq	%r12
	addl	-188(%rbp), %r15d       ## 4-byte Folded Reload
	cmpq	-112(%rbp), %r12        ## 8-byte Folded Reload
	movl	16(%rbp), %r11d
	movq	-464(%rbp), %rcx        ## 8-byte Reload
	jb	LBB147_352
	jmp	LBB147_11
LBB147_398:
	leaq	L_.str.72(%rip), %rcx
	jmp	LBB147_10
LBB147_399:
	cmpl	$16, %r11d
	jne	LBB147_11
## %bb.400:
	movq	-384(%rbp), %rdi        ## 8-byte Reload
	imull	%esi, %edi
	testl	%edi, %edi
	je	LBB147_11
## %bb.401:
	movq	24(%r13), %rax
	leal	-1(%rdi), %ecx
	movl	%edi, %edx
	andl	$3, %edx
	cmpl	$3, %ecx
	jb	LBB147_404
## %bb.402:
	movl	%edx, %esi
	subl	%edi, %esi
LBB147_403:                             ## =>This Inner Loop Header: Depth=1
	rolw	$8, (%rax)
	rolw	$8, 2(%rax)
	rolw	$8, 4(%rax)
	rolw	$8, 6(%rax)
	addq	$8, %rax
	addl	$4, %esi
	jne	LBB147_403
LBB147_404:
	testl	%edx, %edx
	je	LBB147_11
## %bb.405:
	andl	$3, %edi
	xorl	%edx, %edx
LBB147_406:                             ## =>This Inner Loop Header: Depth=1
	rolw	$8, (%rax,%rdx,2)
	incq	%rdx
	cmpl	%edx, %edi
	jne	LBB147_406
	jmp	LBB147_11
LBB147_407:
	leaq	L_.str.73(%rip), %rcx
	jmp	LBB147_10
LBB147_408:
	leaq	L___func__.stbi__create_png_image_raw(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.70(%rip), %rcx
	movl	$4607, %edx             ## imm = 0x11FF
	callq	___assert_rtn
LBB147_409:
	leaq	L___func__.stbi__create_png_image_raw(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.75(%rip), %rcx
	movl	$4780, %edx             ## imm = 0x12AC
	callq	___assert_rtn
LBB147_410:
	leaq	L___func__.stbi__create_png_image_raw(%rip), %rdi
	leaq	L_.str.45(%rip), %rsi
	leaq	L_.str.74(%rip), %rcx
	movl	$4691, %edx             ## imm = 0x1253
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L147_0_set_35, LBB147_35-LJTI147_0
.set L147_0_set_36, LBB147_36-LJTI147_0
.set L147_0_set_37, LBB147_37-LJTI147_0
LJTI147_0:
	.long	L147_0_set_35
	.long	L147_0_set_35
	.long	L147_0_set_36
	.long	L147_0_set_37
	.long	L147_0_set_36
	.long	L147_0_set_35
	.long	L147_0_set_35
.set L147_1_set_57, LBB147_57-LJTI147_1
.set L147_1_set_195, LBB147_195-LJTI147_1
.set L147_1_set_125, LBB147_125-LJTI147_1
.set L147_1_set_157, LBB147_157-LJTI147_1
.set L147_1_set_92, LBB147_92-LJTI147_1
.set L147_1_set_216, LBB147_216-LJTI147_1
.set L147_1_set_237, LBB147_237-LJTI147_1
LJTI147_1:
	.long	L147_1_set_57
	.long	L147_1_set_195
	.long	L147_1_set_125
	.long	L147_1_set_157
	.long	L147_1_set_92
	.long	L147_1_set_216
	.long	L147_1_set_237
.set L147_2_set_53, LBB147_53-LJTI147_2
.set L147_2_set_148, LBB147_148-LJTI147_2
.set L147_2_set_82, LBB147_82-LJTI147_2
.set L147_2_set_117, LBB147_117-LJTI147_2
.set L147_2_set_79, LBB147_79-LJTI147_2
.set L147_2_set_179, LBB147_179-LJTI147_2
.set L147_2_set_187, LBB147_187-LJTI147_2
LJTI147_2:
	.long	L147_2_set_53
	.long	L147_2_set_148
	.long	L147_2_set_82
	.long	L147_2_set_117
	.long	L147_2_set_79
	.long	L147_2_set_179
	.long	L147_2_set_187
	.end_data_region
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__zbuild_huffman
_stbi__zbuild_huffman:                  ## @stbi__zbuild_huffman
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm0, -176(%rbp)
	movl	$0, -112(%rbp)
	movl	$1024, %esi             ## imm = 0x400
	callq	___bzero
	testl	%r15d, %r15d
	jle	LBB148_1
## %bb.2:
	movl	%r15d, %edx
	leaq	-1(%rdx), %rcx
	movl	%edx, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB148_4
## %bb.3:
	xorl	%ecx, %ecx
	testq	%rax, %rax
	jne	LBB148_7
	jmp	LBB148_9
LBB148_1:
	movl	$0, -176(%rbp)
	xorl	%edx, %edx
	cmpl	$5, -168(%rbp)
	jl	LBB148_29
	jmp	LBB148_11
LBB148_4:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB148_5:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rbx,%rcx), %esi
	incl	-176(%rbp,%rsi,4)
	movzbl	1(%rbx,%rcx), %esi
	incl	-176(%rbp,%rsi,4)
	movzbl	2(%rbx,%rcx), %esi
	incl	-176(%rbp,%rsi,4)
	movzbl	3(%rbx,%rcx), %esi
	incl	-176(%rbp,%rsi,4)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB148_5
## %bb.6:
	testq	%rax, %rax
	je	LBB148_9
LBB148_7:
	addq	%rbx, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB148_8:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rdx), %esi
	incl	-176(%rbp,%rsi,4)
	incq	%rdx
	cmpq	%rdx, %rax
	jne	LBB148_8
LBB148_9:
	movl	-172(%rbp), %edx
	movl	$0, -176(%rbp)
	cmpl	$2, %edx
	jg	LBB148_11
## %bb.10:
	cmpl	$5, -168(%rbp)
	jge	LBB148_11
LBB148_29:
	cmpl	$8, -164(%rbp)
	jg	LBB148_11
## %bb.30:
	cmpl	$16, -160(%rbp)
	jg	LBB148_11
## %bb.31:
	cmpl	$32, -156(%rbp)
	jg	LBB148_11
## %bb.32:
	cmpl	$64, -152(%rbp)
	jg	LBB148_11
## %bb.33:
	cmpl	$128, -148(%rbp)
	jg	LBB148_11
## %bb.34:
	cmpl	$256, -144(%rbp)        ## imm = 0x100
	jg	LBB148_11
## %bb.35:
	cmpl	$512, -140(%rbp)        ## imm = 0x200
	jg	LBB148_11
## %bb.36:
	cmpl	$1024, -136(%rbp)       ## imm = 0x400
	jg	LBB148_11
## %bb.37:
	cmpl	$2048, -132(%rbp)       ## imm = 0x800
	jg	LBB148_11
## %bb.38:
	cmpl	$4096, -128(%rbp)       ## imm = 0x1000
	jg	LBB148_11
## %bb.39:
	cmpl	$8192, -124(%rbp)       ## imm = 0x2000
	jg	LBB148_11
## %bb.40:
	cmpl	$16384, -120(%rbp)      ## imm = 0x4000
	jg	LBB148_11
## %bb.41:
	cmpl	$32768, -116(%rbp)      ## imm = 0x8000
	jle	LBB148_42
LBB148_11:
	leaq	L_.str.85(%rip), %rcx
LBB148_12:
	movq	_stbi__g_failure_reason@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	%rcx, (%rax)
	xorl	%eax, %eax
LBB148_27:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-32(%rbp), %rcx
	jne	LBB148_44
## %bb.28:
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB148_42:
	movl	$0, -92(%rbp)
	movw	$0, 1026(%r14)
	movw	$0, 1126(%r14)
	cmpl	$2, %edx
	jg	LBB148_16
## %bb.43:
	xorl	%esi, %esi
	movl	$15, %r8d
	xorl	%r9d, %r9d
	movl	%edx, %eax
LBB148_13:                              ## =>This Inner Loop Header: Depth=1
	movl	%edx, %edi
	movl	%r8d, %ecx
	shll	%cl, %edi
	movl	%edi, 1060(%r14,%rsi,4)
	leaq	2(%rsi), %rcx
	cmpq	$15, %rcx
	ja	LBB148_17
## %bb.14:                              ##   in Loop: Header=BB148_13 Depth=1
	addl	%eax, %r9d
	leal	(%rdx,%rdx), %ecx
	movl	-168(%rbp,%rsi,4), %eax
	movl	%ecx, -88(%rbp,%rsi,4)
	movw	%cx, 1028(%r14,%rsi,2)
	movw	%r9w, 1128(%r14,%rsi,2)
	leal	2(%rsi), %ecx
	movl	$1, %edi
                                        ## kill: def $cl killed $cl killed $ecx
	shll	%cl, %edi
	leal	(%rax,%rdx,2), %edx
	incq	%rsi
	decl	%r8d
	testl	%eax, %eax
	je	LBB148_13
## %bb.15:                              ##   in Loop: Header=BB148_13 Depth=1
	cmpl	%edi, %edx
	jle	LBB148_13
LBB148_16:
	leaq	L_.str.86(%rip), %rcx
	jmp	LBB148_12
LBB148_17:
	movl	$65536, 1120(%r14)      ## imm = 0x10000
	testl	%r15d, %r15d
	jle	LBB148_18
## %bb.19:
	movl	%r15d, %r8d
	xorl	%esi, %esi
LBB148_20:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB148_24 Depth 2
	movzbl	(%rbx,%rsi), %eax
	testl	%eax, %eax
	je	LBB148_26
## %bb.21:                              ##   in Loop: Header=BB148_20 Depth=1
	movl	-96(%rbp,%rax,4), %r9d
	movzwl	1024(%r14,%rax,2), %ecx
	movl	%r9d, %edx
	subl	%ecx, %edx
	movzwl	1124(%r14,%rax,2), %ecx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movb	%al, 1156(%r14,%rdx)
	movw	%si, 1444(%r14,%rdx,2)
	cmpb	$9, %al
	ja	LBB148_25
## %bb.22:                              ##   in Loop: Header=BB148_20 Depth=1
	movl	%r9d, %ecx
	shrl	%ecx
	andl	$21845, %ecx            ## imm = 0x5555
	movl	%r9d, %edx
	andl	$21845, %edx            ## imm = 0x5555
	leal	(%rcx,%rdx,2), %ecx
	movl	%ecx, %edx
	shrl	$2, %edx
	andl	$13107, %edx            ## imm = 0x3333
	andl	$13107, %ecx            ## imm = 0x3333
	leal	(%rdx,%rcx,4), %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
	andl	$3855, %ecx             ## imm = 0xF0F
	shll	$4, %edx
	andl	$61680, %edx            ## imm = 0xF0F0
	orl	%ecx, %edx
	bswapl	%edx
	shrl	$16, %edx
	movb	$16, %cl
	subb	%al, %cl
	shrl	%cl, %edx
	cmpl	$511, %edx              ## imm = 0x1FF
	jg	LBB148_25
## %bb.23:                              ##   in Loop: Header=BB148_20 Depth=1
	movl	%eax, %r10d
	movl	$1, %edi
	movl	%eax, %ecx
	shll	%cl, %edi
	shll	$9, %r10d
	movl	%esi, %ecx
	orl	%r10d, %ecx
	movslq	%edx, %rdx
	movslq	%edi, %rdi
LBB148_24:                              ##   Parent Loop BB148_20 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movw	%cx, (%r14,%rdx,2)
	addq	%rdi, %rdx
	cmpq	$512, %rdx              ## imm = 0x200
	jl	LBB148_24
LBB148_25:                              ##   in Loop: Header=BB148_20 Depth=1
	incl	%r9d
	movl	%r9d, -96(%rbp,%rax,4)
LBB148_26:                              ##   in Loop: Header=BB148_20 Depth=1
	incq	%rsi
	movl	$1, %eax
	cmpq	%r8, %rsi
	jne	LBB148_20
	jmp	LBB148_27
LBB148_18:
	movl	$1, %eax
	jmp	LBB148_27
LBB148_44:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbi__zhuffman_decode
_stbi__zhuffman_decode:                 ## @stbi__zhuffman_decode
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	16(%rdi), %r11d
	cmpl	$16, %r11d
	jge	LBB149_1
## %bb.2:
	movq	(%rdi), %r10
	movq	8(%rdi), %r8
	movl	$-1, %eax
	cmpq	%r8, %r10
	jae	LBB149_18
## %bb.3:
	movl	20(%rdi), %r9d
	.p2align	4, 0x90
LBB149_4:                               ## =>This Inner Loop Header: Depth=1
	movl	%r9d, %eax
	movl	%r11d, %ecx
	shrl	%cl, %eax
	testl	%eax, %eax
	jne	LBB149_5
## %bb.6:                               ##   in Loop: Header=BB149_4 Depth=1
	cmpq	%r8, %r10
	jae	LBB149_7
## %bb.8:                               ##   in Loop: Header=BB149_4 Depth=1
	leaq	1(%r10), %rcx
	movq	%rcx, (%rdi)
	movzbl	(%r10), %eax
	movq	%rcx, %r10
	jmp	LBB149_9
	.p2align	4, 0x90
LBB149_7:                               ##   in Loop: Header=BB149_4 Depth=1
	xorl	%eax, %eax
LBB149_9:                               ##   in Loop: Header=BB149_4 Depth=1
	movzbl	%al, %eax
	movl	%r11d, %ecx
	shll	%cl, %eax
	orl	%eax, %r9d
	movl	%r9d, 20(%rdi)
	addl	$8, %r11d
	movl	%r11d, 16(%rdi)
	cmpl	$25, %r11d
	jl	LBB149_4
	jmp	LBB149_10
LBB149_1:
	movl	20(%rdi), %r9d
	jmp	LBB149_10
LBB149_5:
	movq	%r8, (%rdi)
LBB149_10:
	movl	%r9d, %eax
	andl	$511, %eax              ## imm = 0x1FF
	movzwl	(%rsi,%rax,2), %eax
	testl	%eax, %eax
	je	LBB149_12
## %bb.11:
	movl	%eax, %ecx
	shrl	$9, %ecx
	shrl	%cl, %r9d
	movl	%r9d, 20(%rdi)
	subl	%ecx, %r11d
	movl	%r11d, 16(%rdi)
	andl	$511, %eax              ## imm = 0x1FF
	jmp	LBB149_18
LBB149_12:
	movl	%r9d, %eax
	shrl	%eax
	andl	$21845, %eax            ## imm = 0x5555
	movl	%r9d, %ecx
	andl	$21845, %ecx            ## imm = 0x5555
	leal	(%rax,%rcx,2), %eax
	movl	%eax, %ecx
	shrl	$2, %ecx
	andl	$13107, %ecx            ## imm = 0x3333
	andl	$13107, %eax            ## imm = 0x3333
	leal	(%rcx,%rax,4), %r10d
	movl	%r10d, %eax
	shrl	$4, %eax
	andl	$3855, %eax             ## imm = 0xF0F
	shll	$4, %r10d
	andl	$61680, %r10d           ## imm = 0xF0F0
	orl	%eax, %r10d
	bswapl	%r10d
	shrl	$16, %r10d
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB149_13:                              ## =>This Inner Loop Header: Depth=1
	cmpl	1096(%rsi,%rdx,4), %r10d
	leaq	1(%rdx), %rdx
	jge	LBB149_13
## %bb.14:
	leaq	9(%rdx), %r8
	movl	$-1, %eax
	cmpl	$15, %r8d
	ja	LBB149_18
## %bb.15:
	movb	$7, %cl
	subb	%dl, %cl
	shrl	%cl, %r10d
	movl	%r8d, %ecx
	movzwl	1024(%rsi,%rcx,2), %r14d
	movslq	%r10d, %rbx
	subq	%r14, %rbx
	movzwl	1124(%rsi,%rcx,2), %r10d
	addq	%rbx, %r10
	cmpl	$287, %r10d             ## imm = 0x11F
	jg	LBB149_18
## %bb.16:
	movzbl	1156(%rsi,%r10), %ecx
	movl	%edx, %ebx
	subl	%ecx, %ebx
	cmpl	$-9, %ebx
	jne	LBB149_18
## %bb.17:
	movl	%r8d, %ecx
	shrl	%cl, %r9d
	movl	%r9d, 20(%rdi)
	addl	$-9, %r11d
	subl	%edx, %r11d
	movl	%r11d, 16(%rdi)
	movzwl	1444(%rsi,%r10,2), %eax
LBB149_18:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt__run_charstring
LCPI150_0:
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
LCPI150_1:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI150_2:
	.long	931135488               ## float 1.52587891E-5
LCPI150_3:
	.long	0                       ## float 0
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbtt__run_charstring:                 ## @stbtt__run_charstring
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$536, %rsp              ## imm = 0x218
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movl	%esi, %edx
	movq	%rdi, %rcx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	112(%rdi), %rax
	movq	%rax, -552(%rbp)        ## 8-byte Spill
	movq	120(%rdi), %rax
	movq	%rax, -544(%rbp)        ## 8-byte Spill
	movq	80(%rdi), %rdi
	movq	%rcx, -464(%rbp)        ## 8-byte Spill
	movq	88(%rcx), %rsi
	movl	%edx, -428(%rbp)        ## 4-byte Spill
	callq	_stbtt__cff_index_get
	movq	%rax, -424(%rbp)
	movq	%rdx, -416(%rbp)
	movq	%rdx, %rcx
	shrq	$32, %rcx
	xorl	%r13d, %r13d
	cmpl	%ecx, %edx
	jge	LBB150_254
## %bb.1:
	movslq	-428(%rbp), %rsi        ## 4-byte Folded Reload
	incq	%rsi
	movq	%rsi, -536(%rbp)        ## 8-byte Spill
	leaq	4(%r12), %rsi
	movq	%rsi, -440(%rbp)        ## 8-byte Spill
	xorl	%esi, %esi
	movq	%rsi, -448(%rbp)        ## 8-byte Spill
	movl	$1, -404(%rbp)          ## 4-byte Folded Spill
	leaq	LJTI150_0(%rip), %r13
	movl	$0, -408(%rbp)          ## 4-byte Folded Spill
	xorl	%r14d, %r14d
	movl	$0, -452(%rbp)          ## 4-byte Folded Spill
	jmp	LBB150_3
	.p2align	4, 0x90
LBB150_2:                               ##   in Loop: Header=BB150_3 Depth=1
	movq	-424(%rbp), %rax
LBB150_3:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB150_121 Depth 2
                                        ##     Child Loop BB150_18 Depth 2
                                        ##     Child Loop BB150_38 Depth 2
                                        ##     Child Loop BB150_164 Depth 2
                                        ##     Child Loop BB150_59 Depth 2
                                        ##     Child Loop BB150_74 Depth 2
	movslq	%edx, %rdi
	leaq	1(%rdi), %rsi
	movl	%esi, -416(%rbp)
	movb	(%rax,%rdi), %r15b
	movl	%r15d, %ebx
	decb	%bl
	cmpb	$30, %bl
	ja	LBB150_106
## %bb.4:                               ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%bl, %edi
	movslq	(%r13,%rdi,4), %rdi
	addq	%r13, %rdi
	jmpq	*%rdi
LBB150_5:                               ##   in Loop: Header=BB150_3 Depth=1
	movl	%r14d, %eax
	shrl	$31, %eax
	addl	%r14d, %eax
	sarl	%eax
	movq	-448(%rbp), %rcx        ## 8-byte Reload
	addl	%eax, %ecx
	movq	%rcx, -448(%rbp)        ## 8-byte Spill
	xorl	%r14d, %r14d
	jmp	LBB150_233
LBB150_6:                               ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, -404(%rbp)          ## 4-byte Folded Reload
	je	LBB150_113
## %bb.7:                               ##   in Loop: Header=BB150_3 Depth=1
	movl	%r14d, %eax
	shrl	$31, %eax
	addl	%r14d, %eax
	sarl	%eax
	movq	-448(%rbp), %rdx        ## 8-byte Reload
	addl	%eax, %edx
	jmp	LBB150_114
LBB150_8:                               ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$4, %r14d
	jl	LBB150_258
## %bb.9:                               ##   in Loop: Header=BB150_3 Depth=1
	movl	%r14d, %ebx
	andl	$1, %ebx
	leal	3(%rbx), %eax
	cmpl	%r14d, %eax
	jge	LBB150_90
## %bb.10:                              ##   in Loop: Header=BB150_3 Depth=1
	xorps	%xmm1, %xmm1
	testl	%ebx, %ebx
	je	LBB150_12
## %bb.11:                              ##   in Loop: Header=BB150_3 Depth=1
	movss	-240(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
LBB150_12:                              ##   in Loop: Header=BB150_3 Depth=1
	movss	-240(%rbp,%rbx,4), %xmm6 ## xmm6 = mem[0],zero,zero,zero
	movss	-236(%rbp,%rbx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-232(%rbp,%rbx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	movl	%eax, %eax
	movss	-240(%rbp,%rax,4), %xmm7 ## xmm7 = mem[0],zero,zero,zero
	cmpb	$27, %r15b
	jne	LBB150_118
## %bb.13:                              ##   in Loop: Header=BB150_3 Depth=1
	xorps	%xmm5, %xmm5
	movq	%r12, %rdi
	movaps	%xmm6, %xmm0
	movaps	%xmm7, %xmm4
	jmp	LBB150_119
LBB150_14:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$2, %r14d
	jl	LBB150_258
## %bb.15:                              ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r14d, %rax
	movss	-248(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	-244(%rbp,%rax,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	jmp	LBB150_105
LBB150_16:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	cmpl	$8, %r14d
	jl	LBB150_254
## %bb.17:                              ##   in Loop: Header=BB150_3 Depth=1
	leal	-6(%r14), %r8d
	xorl	%eax, %eax
	movq	-440(%rbp), %r9         ## 8-byte Reload
	.p2align	4, 0x90
LBB150_18:                              ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	-240(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	addss	16(%r12), %xmm0
	movss	-236(%rbp,%rax,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm0, 16(%r12)
	addss	20(%r12), %xmm1
	movss	%xmm1, 20(%r12)
	cvttss2si	%xmm0, %esi
	cvttss2si	%xmm1, %edx
	cmpl	$0, (%r12)
	je	LBB150_32
## %bb.19:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	%esi, 28(%r12)
	jl	LBB150_27
## %bb.20:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	$0, (%r9)
	je	LBB150_27
## %bb.21:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	%edx, 36(%r12)
	jl	LBB150_28
LBB150_22:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	$0, (%r9)
	je	LBB150_28
## %bb.23:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	%esi, 24(%r12)
	jg	LBB150_29
LBB150_24:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	$0, (%r9)
	je	LBB150_29
## %bb.25:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	%edx, 32(%r12)
	jg	LBB150_30
	jmp	LBB150_26
	.p2align	4, 0x90
LBB150_27:                              ##   in Loop: Header=BB150_18 Depth=2
	movl	%esi, 28(%r12)
	cmpl	%edx, 36(%r12)
	jge	LBB150_22
LBB150_28:                              ##   in Loop: Header=BB150_18 Depth=2
	movl	%edx, 36(%r12)
	cmpl	%esi, 24(%r12)
	jle	LBB150_24
LBB150_29:                              ##   in Loop: Header=BB150_18 Depth=2
	movl	%esi, 24(%r12)
	cmpl	%edx, 32(%r12)
	jg	LBB150_30
LBB150_26:                              ##   in Loop: Header=BB150_18 Depth=2
	cmpl	$0, (%r9)
	jne	LBB150_31
LBB150_30:                              ##   in Loop: Header=BB150_18 Depth=2
	movl	%edx, 32(%r12)
LBB150_31:                              ##   in Loop: Header=BB150_18 Depth=2
	movl	$1, 4(%r12)
	movl	48(%r12), %ecx
	jmp	LBB150_33
	.p2align	4, 0x90
LBB150_32:                              ##   in Loop: Header=BB150_18 Depth=2
	movq	40(%r12), %rbx
	movslq	48(%r12), %rcx
	movq	%rcx, %rdi
	shlq	$4, %rdi
	subq	%rcx, %rdi
	subq	%rcx, %rdi
	movb	$2, 12(%rbx,%rdi)
	movw	%si, (%rbx,%rdi)
	movw	%dx, 2(%rbx,%rdi)
	movq	$0, 4(%rbx,%rdi)
LBB150_33:                              ##   in Loop: Header=BB150_18 Depth=2
	incl	%ecx
	movl	%ecx, 48(%r12)
	addq	$2, %rax
	leal	1(%rax), %ecx
	cmpl	%ecx, %r8d
	jg	LBB150_18
## %bb.34:                              ##   in Loop: Header=BB150_3 Depth=1
	leaq	5(%rax), %rcx
	cmpl	%r14d, %ecx
	jge	LBB150_254
## %bb.35:                              ##   in Loop: Header=BB150_3 Depth=1
	leaq	1(%rax), %rdx
	movl	%eax, %esi
	andl	$-2, %esi
	movss	-240(%rbp,%rsi,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movl	%edx, %edx
	movss	-240(%rbp,%rdx,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	leal	2(%rax), %edx
	andl	$-2, %edx
	movss	-240(%rbp,%rdx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	leal	3(%rax), %edx
	movss	-240(%rbp,%rdx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	leal	4(%rax), %eax
	andl	$-2, %eax
	movss	-240(%rbp,%rax,4), %xmm4 ## xmm4 = mem[0],zero,zero,zero
	movl	%ecx, %eax
	movss	-240(%rbp,%rax,4), %xmm5 ## xmm5 = mem[0],zero,zero,zero
	movq	%r12, %rdi
	jmp	LBB150_136
LBB150_36:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	cmpl	$8, %r14d
	jl	LBB150_254
## %bb.37:                              ##   in Loop: Header=BB150_3 Depth=1
	leal	-2(%r14), %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB150_38:                              ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	-240(%rbp,%rbx,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	-236(%rbp,%rbx,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	-232(%rbp,%rbx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-228(%rbp,%rbx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	movss	-224(%rbp,%rbx,4), %xmm4 ## xmm4 = mem[0],zero,zero,zero
	movss	-220(%rbp,%rbx,4), %xmm5 ## xmm5 = mem[0],zero,zero,zero
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	addq	$6, %rbx
	leal	5(%rbx), %eax
	cmpl	%r15d, %eax
	jl	LBB150_38
## %bb.39:                              ##   in Loop: Header=BB150_3 Depth=1
	leaq	1(%rbx), %rax
	cmpl	%r14d, %eax
	jge	LBB150_254
## %bb.40:                              ##   in Loop: Header=BB150_3 Depth=1
	andl	$-2, %ebx
	movss	-240(%rbp,%rbx,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movl	%eax, %eax
	addss	16(%r12), %xmm0
	movss	-240(%rbp,%rax,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm0, 16(%r12)
	addss	20(%r12), %xmm1
	movss	%xmm1, 20(%r12)
	cvttss2si	%xmm0, %ecx
	cvttss2si	%xmm1, %eax
	cmpl	$0, (%r12)
	je	LBB150_129
## %bb.41:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 28(%r12)
	movq	-440(%rbp), %rdx        ## 8-byte Reload
	leaq	LJTI150_0(%rip), %r13
	jl	LBB150_43
## %bb.42:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_44
LBB150_43:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 28(%r12)
LBB150_44:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 36(%r12)
	jl	LBB150_46
## %bb.45:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_47
LBB150_46:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 36(%r12)
LBB150_47:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 24(%r12)
	jg	LBB150_49
## %bb.48:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_50
LBB150_49:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 24(%r12)
LBB150_50:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 32(%r12)
	jg	LBB150_52
## %bb.51:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_53
LBB150_52:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 32(%r12)
LBB150_53:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	$1, 4(%r12)
	movl	48(%r12), %edx
	jmp	LBB150_130
LBB150_54:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%ebx, %ebx
	movl	$0, %r13d
	cmpl	$4, %r14d
	jge	LBB150_223
	jmp	LBB150_254
LBB150_55:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	testl	%r14d, %r14d
	jle	LBB150_254
## %bb.56:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%r14d, %r13d
	jl	LBB150_207
	jmp	LBB150_231
LBB150_57:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$6, %r14d
	jl	LBB150_258
## %bb.58:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	$5, %ebx
	.p2align	4, 0x90
LBB150_59:                              ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	-260(%rbp,%rbx,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	-256(%rbp,%rbx,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	-252(%rbp,%rbx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-248(%rbp,%rbx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	movss	-244(%rbp,%rbx,4), %xmm4 ## xmm4 = mem[0],zero,zero,zero
	movss	-240(%rbp,%rbx,4), %xmm5 ## xmm5 = mem[0],zero,zero,zero
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	addq	$6, %rbx
	cmpl	%r14d, %ebx
	jl	LBB150_59
	jmp	LBB150_90
LBB150_61:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, -452(%rbp)          ## 4-byte Folded Reload
	jne	LBB150_178
## %bb.62:                              ##   in Loop: Header=BB150_3 Depth=1
	movq	-464(%rbp), %rax        ## 8-byte Reload
	movl	156(%rax), %r10d
	movl	$1, -452(%rbp)          ## 4-byte Folded Spill
	testl	%r10d, %r10d
	je	LBB150_178
## %bb.63:                              ##   in Loop: Header=BB150_3 Depth=1
	js	LBB150_267
## %bb.64:                              ##   in Loop: Header=BB150_3 Depth=1
	movq	-464(%rbp), %rax        ## 8-byte Reload
	movq	144(%rax), %r9
	movb	(%r9), %al
	testb	%al, %al
	je	LBB150_154
## %bb.65:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpb	$3, %al
	jne	LBB150_176
## %bb.66:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r8d, %r8d
	movl	$1, %edi
	movl	$0, %ecx
	cmpl	$1, %r10d
	jle	LBB150_68
## %bb.67:                              ##   in Loop: Header=BB150_3 Depth=1
	movzbl	1(%r9), %ecx
	shll	$8, %ecx
	movl	$2, %edi
LBB150_68:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%r10d, %edi
	jge	LBB150_70
## %bb.69:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%edi, %eax
	incl	%edi
	movzbl	(%r9,%rax), %r8d
LBB150_70:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%ebx, %ebx
	cmpl	%r10d, %edi
	jge	LBB150_159
## %bb.71:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	%edi, %eax
	incl	%edi
	movzbl	(%r9,%rax), %edx
	shll	$8, %edx
	jmp	LBB150_160
LBB150_72:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$2, %r14d
	jl	LBB150_258
## %bb.73:                              ##   in Loop: Header=BB150_3 Depth=1
	movl	$1, %eax
	movq	-440(%rbp), %r8         ## 8-byte Reload
	.p2align	4, 0x90
LBB150_74:                              ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	-244(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	addss	16(%r12), %xmm0
	movss	-240(%rbp,%rax,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm0, 16(%r12)
	addss	20(%r12), %xmm1
	movss	%xmm1, 20(%r12)
	cvttss2si	%xmm0, %edx
	cvttss2si	%xmm1, %ecx
	cmpl	$0, (%r12)
	je	LBB150_88
## %bb.75:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	%edx, 28(%r12)
	jl	LBB150_83
## %bb.76:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	$0, (%r8)
	je	LBB150_83
## %bb.77:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	%ecx, 36(%r12)
	jl	LBB150_84
LBB150_78:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	$0, (%r8)
	je	LBB150_84
## %bb.79:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	%edx, 24(%r12)
	jg	LBB150_85
LBB150_80:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	$0, (%r8)
	je	LBB150_85
## %bb.81:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	%ecx, 32(%r12)
	jg	LBB150_86
	jmp	LBB150_82
	.p2align	4, 0x90
LBB150_83:                              ##   in Loop: Header=BB150_74 Depth=2
	movl	%edx, 28(%r12)
	cmpl	%ecx, 36(%r12)
	jge	LBB150_78
LBB150_84:                              ##   in Loop: Header=BB150_74 Depth=2
	movl	%ecx, 36(%r12)
	cmpl	%edx, 24(%r12)
	jle	LBB150_80
LBB150_85:                              ##   in Loop: Header=BB150_74 Depth=2
	movl	%edx, 24(%r12)
	cmpl	%ecx, 32(%r12)
	jg	LBB150_86
LBB150_82:                              ##   in Loop: Header=BB150_74 Depth=2
	cmpl	$0, (%r8)
	jne	LBB150_87
LBB150_86:                              ##   in Loop: Header=BB150_74 Depth=2
	movl	%ecx, 32(%r12)
LBB150_87:                              ##   in Loop: Header=BB150_74 Depth=2
	movl	$1, 4(%r12)
	movl	48(%r12), %ebx
	jmp	LBB150_89
	.p2align	4, 0x90
LBB150_88:                              ##   in Loop: Header=BB150_74 Depth=2
	movq	40(%r12), %rdi
	movslq	48(%r12), %rbx
	movq	%rbx, %rsi
	shlq	$4, %rsi
	subq	%rbx, %rsi
	subq	%rbx, %rsi
	movb	$2, 12(%rdi,%rsi)
	movw	%dx, (%rdi,%rsi)
	movw	%cx, 2(%rdi,%rsi)
	movq	$0, 4(%rdi,%rsi)
LBB150_89:                              ##   in Loop: Header=BB150_74 Depth=2
	incl	%ebx
	movl	%ebx, 48(%r12)
	addq	$2, %rax
	cmpl	%r14d, %eax
	jl	LBB150_74
	jmp	LBB150_90
LBB150_91:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	testl	%r14d, %r14d
	jle	LBB150_254
## %bb.92:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%r14d, %r13d
	jge	LBB150_231
	jmp	LBB150_191
LBB150_93:                              ##   in Loop: Header=BB150_3 Depth=1
	testl	%r14d, %r14d
	jle	LBB150_258
## %bb.94:                              ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r14d, %rax
	movss	-244(%rbp,%rax,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	xorps	%xmm0, %xmm0
	jmp	LBB150_105
LBB150_95:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	cmpl	%ecx, %esi
	jge	LBB150_254
## %bb.96:                              ##   in Loop: Header=BB150_3 Depth=1
	addl	$2, %edx
	movl	%edx, -416(%rbp)
	movb	(%rax,%rsi), %al
	addb	$-34, %al
	cmpb	$3, %al
	ja	LBB150_254
## %bb.97:                              ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%al, %eax
	leaq	LJTI150_1(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB150_98:                              ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$7, %r14d
	jl	LBB150_254
## %bb.99:                              ##   in Loop: Header=BB150_3 Depth=1
	movss	-240(%rbp), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	-236(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	movss	-232(%rbp), %xmm3       ## xmm3 = mem[0],zero,zero,zero
	movaps	%xmm3, -480(%rbp)       ## 16-byte Spill
	movss	-228(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	movss	-224(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -528(%rbp)       ## 4-byte Spill
	movss	-220(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -512(%rbp)       ## 4-byte Spill
	movss	-216(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -496(%rbp)       ## 4-byte Spill
	xorps	%xmm1, %xmm1
	xorps	%xmm5, %xmm5
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	movaps	-480(%rbp), %xmm3       ## 16-byte Reload
	xorps	LCPI150_1(%rip), %xmm3
	xorps	%xmm1, %xmm1
	xorps	%xmm5, %xmm5
	jmp	LBB150_133
LBB150_100:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%ebx, %ebx
	movl	$0, %r13d
	cmpl	$4, %r14d
	jge	LBB150_227
	jmp	LBB150_254
LBB150_101:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	-408(%rbp), %ecx        ## 4-byte Reload
	testl	%ecx, %ecx
	jle	LBB150_258
## %bb.102:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%ecx, %rax
	decl	%ecx
	movl	%ecx, -408(%rbp)        ## 4-byte Spill
	shlq	$4, %rax
	movq	-416(%rbp,%rax), %rcx
	movq	-408(%rbp,%rax), %rax
	movq	%rax, -416(%rbp)
	movq	%rcx, -424(%rbp)
	jmp	LBB150_233
LBB150_103:                             ##   in Loop: Header=BB150_3 Depth=1
	testl	%r14d, %r14d
	jle	LBB150_258
## %bb.104:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r14d, %rax
	movss	-244(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
LBB150_105:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	%r12, %rdi
	callq	_stbtt__csctx_rmove_to
	jmp	LBB150_117
LBB150_106:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	cmpb	$31, %r15b
	ja	LBB150_108
## %bb.107:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpb	$28, %r15b
	jne	LBB150_254
LBB150_108:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpb	$-1, %r15b
	je	LBB150_127
## %bb.109:                             ##   in Loop: Header=BB150_3 Depth=1
	testl	%edx, %edx
	js	LBB150_267
## %bb.110:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%edx, %ecx
	jl	LBB150_267
## %bb.111:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%edx, -416(%rbp)
	leaq	-424(%rbp), %rdi
	callq	_stbtt__cff_int
	cwtl
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	cmpl	$47, %r14d
	jle	LBB150_151
	jmp	LBB150_254
LBB150_113:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	-448(%rbp), %rdx        ## 8-byte Reload
LBB150_114:                             ##   in Loop: Header=BB150_3 Depth=1
	leal	7(%rdx), %eax
	sarl	$31, %eax
	shrl	$29, %eax
	movq	%rdx, -448(%rbp)        ## 8-byte Spill
	leal	7(%rdx,%rax), %eax
	sarl	$3, %eax
	addl	%esi, %eax
	js	LBB150_267
## %bb.115:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, %ecx
	jl	LBB150_267
## %bb.116:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, -416(%rbp)
LBB150_117:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	$0, -404(%rbp)          ## 4-byte Folded Spill
	xorl	%r14d, %r14d
	jmp	LBB150_233
LBB150_118:                             ##   in Loop: Header=BB150_3 Depth=1
	xorps	%xmm4, %xmm4
	movq	%r12, %rdi
	movaps	%xmm1, %xmm0
	movaps	%xmm6, %xmm1
	movaps	%xmm7, %xmm5
LBB150_119:                             ##   in Loop: Header=BB150_3 Depth=1
	callq	_stbtt__csctx_rccurve_to
	leal	7(%rbx), %eax
	cmpl	%r14d, %eax
	jge	LBB150_90
## %bb.120:                             ##   in Loop: Header=BB150_3 Depth=1
	orq	$4, %rbx
	.p2align	4, 0x90
LBB150_121:                             ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	-240(%rbp,%rbx,4), %xmm6 ## xmm6 = mem[0],zero,zero,zero
	movss	-236(%rbp,%rbx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-232(%rbp,%rbx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	movl	%eax, %eax
	movss	-240(%rbp,%rax,4), %xmm7 ## xmm7 = mem[0],zero,zero,zero
	cmpb	$27, %r15b
	jne	LBB150_123
## %bb.122:                             ##   in Loop: Header=BB150_121 Depth=2
	xorps	%xmm1, %xmm1
	xorps	%xmm5, %xmm5
	movq	%r12, %rdi
	movaps	%xmm6, %xmm0
	movaps	%xmm7, %xmm4
	jmp	LBB150_124
	.p2align	4, 0x90
LBB150_123:                             ##   in Loop: Header=BB150_121 Depth=2
	xorps	%xmm0, %xmm0
	xorps	%xmm4, %xmm4
	movq	%r12, %rdi
	movaps	%xmm6, %xmm1
	movaps	%xmm7, %xmm5
LBB150_124:                             ##   in Loop: Header=BB150_121 Depth=2
	callq	_stbtt__csctx_rccurve_to
	leal	7(%rbx), %eax
	leaq	4(%rbx), %rbx
	leal	3(%rbx), %ecx
	cmpl	%r14d, %ecx
	jl	LBB150_121
LBB150_90:                              ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r14d, %r14d
	jmp	LBB150_233
LBB150_127:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, %esi
	jge	LBB150_140
## %bb.128:                             ##   in Loop: Header=BB150_3 Depth=1
	addl	$2, %edx
	movb	(%rax,%rsi), %dil
	movl	%edx, %esi
	jmp	LBB150_141
LBB150_129:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	40(%r12), %rsi
	movslq	48(%r12), %rdx
	movq	%rdx, %rdi
	shlq	$4, %rdi
	subq	%rdx, %rdi
	subq	%rdx, %rdi
	movb	$2, 12(%rsi,%rdi)
	movw	%cx, (%rsi,%rdi)
	movw	%ax, 2(%rsi,%rdi)
	movq	$0, 4(%rsi,%rdi)
	leaq	LJTI150_0(%rip), %r13
LBB150_130:                             ##   in Loop: Header=BB150_3 Depth=1
	incl	%edx
	movl	%edx, 48(%r12)
	xorl	%r14d, %r14d
	jmp	LBB150_233
LBB150_131:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$9, %r14d
	jl	LBB150_254
## %bb.132:                             ##   in Loop: Header=BB150_3 Depth=1
	movss	-240(%rbp), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	-236(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movaps	%xmm6, -576(%rbp)       ## 16-byte Spill
	movss	-232(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	movss	-228(%rbp), %xmm3       ## xmm3 = mem[0],zero,zero,zero
	movss	%xmm3, -432(%rbp)       ## 4-byte Spill
	movss	-224(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	movss	-220(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -528(%rbp)       ## 4-byte Spill
	movss	-216(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -512(%rbp)       ## 4-byte Spill
	movss	-212(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -480(%rbp)       ## 4-byte Spill
	movss	-208(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -496(%rbp)       ## 4-byte Spill
	xorps	%xmm5, %xmm5
	movq	%r12, %rdi
	movaps	%xmm6, %xmm1
	callq	_stbtt__csctx_rccurve_to
	movaps	-576(%rbp), %xmm5       ## 16-byte Reload
	addss	-432(%rbp), %xmm5       ## 4-byte Folded Reload
	movss	-480(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	addss	%xmm3, %xmm5
	xorps	LCPI150_1(%rip), %xmm5
	xorps	%xmm1, %xmm1
LBB150_133:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	%r12, %rdi
	movss	-528(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-512(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-496(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	jmp	LBB150_136
LBB150_134:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$13, %r14d
	jl	LBB150_254
## %bb.135:                             ##   in Loop: Header=BB150_3 Depth=1
	movss	-240(%rbp), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	-236(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	movss	-232(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	movss	-228(%rbp), %xmm3       ## xmm3 = mem[0],zero,zero,zero
	movss	-224(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	movss	-220(%rbp), %xmm5       ## xmm5 = mem[0],zero,zero,zero
	movss	-216(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -528(%rbp)       ## 4-byte Spill
	movss	-212(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -512(%rbp)       ## 4-byte Spill
	movss	-208(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -496(%rbp)       ## 4-byte Spill
	movss	-204(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -480(%rbp)       ## 4-byte Spill
	movss	-200(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -576(%rbp)       ## 4-byte Spill
	movss	-196(%rbp), %xmm6       ## xmm6 = mem[0],zero,zero,zero
	movss	%xmm6, -432(%rbp)       ## 4-byte Spill
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	movq	%r12, %rdi
	movss	-528(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-512(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	movss	-496(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	movss	-480(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	movss	-576(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	movss	-432(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
LBB150_136:                             ##   in Loop: Header=BB150_3 Depth=1
	callq	_stbtt__csctx_rccurve_to
	jmp	LBB150_231
LBB150_137:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$11, %r14d
	jl	LBB150_254
## %bb.138:                             ##   in Loop: Header=BB150_3 Depth=1
	movsd	-240(%rbp), %xmm0       ## xmm0 = mem[0],zero
	movsd	-232(%rbp), %xmm2       ## xmm2 = mem[0],zero
	movsd	-224(%rbp), %xmm4       ## xmm4 = mem[0],zero
	movsd	-216(%rbp), %xmm8       ## xmm8 = mem[0],zero
	movsd	-208(%rbp), %xmm10      ## xmm10 = mem[0],zero
	movss	-200(%rbp), %xmm9       ## xmm9 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm1
	addps	%xmm2, %xmm1
	addps	%xmm4, %xmm1
	addps	%xmm8, %xmm1
	addps	%xmm10, %xmm1
	movaps	%xmm1, %xmm7
	andps	LCPI150_0(%rip), %xmm7
	pshufd	$245, %xmm7, %xmm3      ## xmm3 = xmm7[1,1,3,3]
	ucomiss	%xmm3, %xmm7
	movaps	%xmm1, %xmm5
	movaps	LCPI150_1(%rip), %xmm6  ## xmm6 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorps	%xmm6, %xmm5
	cmpltss	%xmm7, %xmm3
	movaps	%xmm3, %xmm7
	andps	%xmm9, %xmm7
	andnps	%xmm5, %xmm3
	orps	%xmm7, %xmm3
	movaps	%xmm8, -528(%rbp)       ## 16-byte Spill
	movaps	%xmm10, -512(%rbp)      ## 16-byte Spill
	movaps	%xmm3, -496(%rbp)       ## 16-byte Spill
	ja	LBB150_152
## %bb.139:                             ##   in Loop: Header=BB150_3 Depth=1
	leaq	LJTI150_0(%rip), %r13
	movaps	%xmm9, -480(%rbp)       ## 16-byte Spill
	jmp	LBB150_153
LBB150_140:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%edi, %edi
LBB150_141:                             ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%dil, %edx
	shll	$8, %edx
	cmpl	%ecx, %esi
	jge	LBB150_143
## %bb.142:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%esi, %rdi
	incl	%esi
	movb	(%rax,%rdi), %dil
	jmp	LBB150_144
LBB150_143:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%edi, %edi
LBB150_144:                             ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%dil, %edi
	orl	%edi, %edx
	shll	$8, %edx
	cmpl	%ecx, %esi
	jge	LBB150_146
## %bb.145:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%esi, %rdi
	incl	%esi
	movb	(%rax,%rdi), %dil
	jmp	LBB150_147
LBB150_146:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%edi, %edi
LBB150_147:                             ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%dil, %edi
	orl	%edi, %edx
	shll	$8, %edx
	cmpl	%ecx, %esi
	jge	LBB150_149
## %bb.148:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%esi, %rcx
	incl	%esi
	movb	(%rax,%rcx), %al
	jmp	LBB150_150
LBB150_149:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%eax, %eax
LBB150_150:                             ##   in Loop: Header=BB150_3 Depth=1
	movzbl	%al, %eax
	orl	%eax, %edx
	movl	%esi, -416(%rbp)
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	mulss	LCPI150_2(%rip), %xmm0
	cmpl	$47, %r14d
	jg	LBB150_254
LBB150_151:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r14d, %rax
	incl	%r14d
	movss	%xmm0, -240(%rbp,%rax,4)
	jmp	LBB150_232
LBB150_152:                             ##   in Loop: Header=BB150_3 Depth=1
	movshdup	%xmm1, %xmm1    ## xmm1 = xmm1[1,1,3,3]
	xorps	%xmm6, %xmm1
	movaps	%xmm1, -480(%rbp)       ## 16-byte Spill
	leaq	LJTI150_0(%rip), %r13
LBB150_153:                             ##   in Loop: Header=BB150_3 Depth=1
	movshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	movshdup	%xmm2, %xmm3    ## xmm3 = xmm2[1,1,3,3]
	movshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	movaps	-528(%rbp), %xmm0       ## 16-byte Reload
	movshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	movaps	-512(%rbp), %xmm2       ## 16-byte Reload
	movshdup	%xmm2, %xmm3    ## xmm3 = xmm2[1,1,3,3]
	movq	%r12, %rdi
	movaps	-496(%rbp), %xmm4       ## 16-byte Reload
	movaps	-480(%rbp), %xmm5       ## 16-byte Reload
	callq	_stbtt__csctx_rccurve_to
	xorl	%r14d, %r14d
	jmp	LBB150_233
LBB150_154:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, -536(%rbp)          ## 4-byte Folded Reload
	js	LBB150_267
## %bb.155:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	-428(%rbp), %r10d       ## 4-byte Folded Reload
	jle	LBB150_267
## %bb.156:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%edx, %edx
	cmpl	%r10d, -536(%rbp)       ## 4-byte Folded Reload
	jge	LBB150_177
## %bb.157:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	-536(%rbp), %rax        ## 8-byte Reload
	movzbl	(%r9,%rax), %edx
	jmp	LBB150_177
LBB150_159:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%edx, %edx
LBB150_160:                             ##   in Loop: Header=BB150_3 Depth=1
	orl	%ecx, %r8d
	cmpl	%r10d, %edi
	jge	LBB150_162
## %bb.161:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%edi, %eax
	incl	%edi
	movzbl	(%r9,%rax), %ebx
LBB150_162:                             ##   in Loop: Header=BB150_3 Depth=1
	testl	%r8d, %r8d
	jle	LBB150_176
## %bb.163:                             ##   in Loop: Header=BB150_3 Depth=1
	orl	%edx, %ebx
	xorl	%esi, %esi
LBB150_164:                             ##   Parent Loop BB150_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%ebx, %ecx
	cmpl	%r10d, %edi
	jge	LBB150_167
## %bb.165:                             ##   in Loop: Header=BB150_164 Depth=2
	movslq	%edi, %rax
	incl	%edi
	movzbl	(%r9,%rax), %edx
	cmpl	%r10d, %edi
	jl	LBB150_168
LBB150_166:                             ##   in Loop: Header=BB150_164 Depth=2
	xorl	%ebx, %ebx
	jmp	LBB150_169
LBB150_167:                             ##   in Loop: Header=BB150_164 Depth=2
	xorl	%edx, %edx
	cmpl	%r10d, %edi
	jge	LBB150_166
LBB150_168:                             ##   in Loop: Header=BB150_164 Depth=2
	movslq	%edi, %rax
	incl	%edi
	movzbl	(%r9,%rax), %ebx
LBB150_169:                             ##   in Loop: Header=BB150_164 Depth=2
	movzbl	%bl, %ebx
	shll	$8, %ebx
	cmpl	%r10d, %edi
	jge	LBB150_171
## %bb.170:                             ##   in Loop: Header=BB150_164 Depth=2
	movslq	%edi, %rax
	incl	%edi
	movzbl	(%r9,%rax), %eax
	jmp	LBB150_172
LBB150_171:                             ##   in Loop: Header=BB150_164 Depth=2
	xorl	%eax, %eax
LBB150_172:                             ##   in Loop: Header=BB150_164 Depth=2
	movzbl	%al, %eax
	orl	%eax, %ebx
	cmpl	-428(%rbp), %ecx        ## 4-byte Folded Reload
	jg	LBB150_174
## %bb.173:                             ##   in Loop: Header=BB150_164 Depth=2
	cmpl	-428(%rbp), %ebx        ## 4-byte Folded Reload
	jg	LBB150_177
LBB150_174:                             ##   in Loop: Header=BB150_164 Depth=2
	incl	%esi
	cmpl	%r8d, %esi
	jl	LBB150_164
LBB150_176:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	$-1, %edx
LBB150_177:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	-464(%rbp), %rbx        ## 8-byte Reload
	movq	128(%rbx), %rdi
	movq	136(%rbx), %rsi
	callq	_stbtt__cff_index_get
	movq	%rdx, %rcx
	movq	64(%rbx), %rdi
	movq	72(%rbx), %rsi
	movq	%rax, %rdx
	callq	_stbtt__get_subrs
	movq	%rax, -552(%rbp)        ## 8-byte Spill
	movq	%rdx, -544(%rbp)        ## 8-byte Spill
LBB150_178:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r13d, %r13d
	testl	%r14d, %r14d
	jle	LBB150_254
## %bb.179:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$9, -408(%rbp)          ## 4-byte Folded Reload
	jg	LBB150_254
## %bb.180:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r14d, %rax
	cvttss2si	-244(%rbp,%rax,4), %r8d
	movslq	-408(%rbp), %rax        ## 4-byte Folded Reload
	shlq	$4, %rax
	movq	-424(%rbp), %rcx
	movq	-416(%rbp), %rdx
	movq	%rdx, -392(%rbp,%rax)
	movq	%rcx, -400(%rbp,%rax)
	movq	-544(%rbp), %rcx        ## 8-byte Reload
	movq	-552(%rbp), %rdi        ## 8-byte Reload
	cmpb	$10, %r15b
	je	LBB150_182
## %bb.181:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	-464(%rbp), %rax        ## 8-byte Reload
	movq	96(%rax), %rdi
	movq	104(%rax), %rcx
LBB150_182:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	%rcx, %rax
	shrq	$32, %rax
	testl	%eax, %eax
	leaq	LJTI150_0(%rip), %r13
	js	LBB150_267
## %bb.183:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%ebx, %ebx
	movl	$0, %esi
	movl	$0, %edx
	testl	%eax, %eax
	je	LBB150_185
## %bb.184:                             ##   in Loop: Header=BB150_3 Depth=1
	movzbl	(%rdi), %edx
	shll	$8, %edx
	movl	$1, %esi
LBB150_185:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, %esi
	jge	LBB150_187
## %bb.186:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%esi, %eax
	incl	%esi
	movzbl	(%rdi,%rax), %ebx
LBB150_187:                             ##   in Loop: Header=BB150_3 Depth=1
	orl	%edx, %ebx
	xorl	%edx, %edx
	cmpl	$1239, %ebx             ## imm = 0x4D7
	setg	%dl
	shll	$10, %edx
	orl	$107, %edx
	cmpl	$33899, %ebx            ## imm = 0x846B
	movl	$32768, %eax            ## imm = 0x8000
	cmovgl	%eax, %edx
	addl	%r8d, %edx
	js	LBB150_261
## %bb.188:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ebx, %edx
	jge	LBB150_261
## %bb.189:                             ##   in Loop: Header=BB150_3 Depth=1
	movabsq	$-4294967296, %rax      ## imm = 0xFFFFFFFF00000000
	andq	%rax, %rcx
	movl	%esi, %esi
	orq	%rcx, %rsi
	callq	_stbtt__cff_index_get
	movq	%rax, -424(%rbp)
	movq	%rdx, -416(%rbp)
	shrq	$32, %rdx
	je	LBB150_258
## %bb.190:                             ##   in Loop: Header=BB150_3 Depth=1
	decl	%r14d
	incl	-408(%rbp)              ## 4-byte Folded Spill
	movl	$0, -416(%rbp)
	jmp	LBB150_233
	.p2align	4, 0x90
LBB150_231:                             ##   in Loop: Header=BB150_3 Depth=1
	xorl	%r14d, %r14d
LBB150_232:                             ##   in Loop: Header=BB150_3 Depth=1
	leaq	LJTI150_0(%rip), %r13
LBB150_233:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	-416(%rbp), %edx
	movl	-412(%rbp), %ecx
	cmpl	%ecx, %edx
	jl	LBB150_2
	jmp	LBB150_258
LBB150_191:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r13d, %rax
	movss	-240(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	addss	16(%r12), %xmm0
	movss	%xmm0, 16(%r12)
	movss	20(%r12), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	addss	LCPI150_3(%rip), %xmm1
	movss	%xmm1, 20(%r12)
	cvttss2si	%xmm0, %ecx
	cvttss2si	%xmm1, %eax
	cmpl	$0, (%r12)
	movq	-440(%rbp), %rdx        ## 8-byte Reload
	je	LBB150_205
## %bb.192:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 28(%r12)
	jl	LBB150_194
## %bb.193:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_195
LBB150_194:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 28(%r12)
LBB150_195:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 36(%r12)
	jl	LBB150_197
## %bb.196:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_198
LBB150_197:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 36(%r12)
LBB150_198:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 24(%r12)
	jg	LBB150_200
## %bb.199:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_201
LBB150_200:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 24(%r12)
LBB150_201:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 32(%r12)
	jg	LBB150_203
## %bb.202:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_204
LBB150_203:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 32(%r12)
LBB150_204:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	$1, 4(%r12)
	movl	48(%r12), %edx
	jmp	LBB150_206
LBB150_205:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	40(%r12), %rsi
	movslq	48(%r12), %rdx
	movq	%rdx, %rdi
	shlq	$4, %rdi
	subq	%rdx, %rdi
	subq	%rdx, %rdi
	movb	$2, 12(%rsi,%rdi)
	movw	%cx, (%rsi,%rdi)
	movw	%ax, 2(%rsi,%rdi)
	movq	$0, 4(%rsi,%rdi)
LBB150_206:                             ##   in Loop: Header=BB150_3 Depth=1
	incl	%edx
	movl	%edx, 48(%r12)
	incl	%r13d
	cmpl	%r14d, %r13d
	jge	LBB150_231
LBB150_207:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%r13d, %rax
	movss	-240(%rbp,%rax,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	16(%r12), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	addss	LCPI150_3(%rip), %xmm1
	movss	%xmm1, 16(%r12)
	addss	20(%r12), %xmm0
	movss	%xmm0, 20(%r12)
	cvttss2si	%xmm1, %ecx
	cvttss2si	%xmm0, %eax
	cmpl	$0, (%r12)
	movq	-440(%rbp), %rdx        ## 8-byte Reload
	je	LBB150_221
## %bb.208:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 28(%r12)
	jl	LBB150_210
## %bb.209:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_211
LBB150_210:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 28(%r12)
LBB150_211:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 36(%r12)
	jl	LBB150_213
## %bb.212:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_214
LBB150_213:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 36(%r12)
LBB150_214:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%ecx, 24(%r12)
	jg	LBB150_216
## %bb.215:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_217
LBB150_216:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, 24(%r12)
LBB150_217:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	%eax, 32(%r12)
	jg	LBB150_219
## %bb.218:                             ##   in Loop: Header=BB150_3 Depth=1
	cmpl	$0, (%rdx)
	jne	LBB150_220
LBB150_219:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	%eax, 32(%r12)
LBB150_220:                             ##   in Loop: Header=BB150_3 Depth=1
	movl	$1, 4(%r12)
	movl	48(%r12), %edx
	jmp	LBB150_222
LBB150_221:                             ##   in Loop: Header=BB150_3 Depth=1
	movq	40(%r12), %rsi
	movslq	48(%r12), %rdx
	movq	%rdx, %rdi
	shlq	$4, %rdi
	subq	%rdx, %rdi
	subq	%rdx, %rdi
	movb	$2, 12(%rsi,%rdi)
	movw	%cx, (%rsi,%rdi)
	movw	%ax, 2(%rsi,%rdi)
	movq	$0, 4(%rsi,%rdi)
LBB150_222:                             ##   in Loop: Header=BB150_3 Depth=1
	incl	%edx
	movl	%edx, 48(%r12)
	incl	%r13d
	cmpl	%r14d, %r13d
	jge	LBB150_231
	jmp	LBB150_191
LBB150_223:                             ##   in Loop: Header=BB150_3 Depth=1
	leal	3(%rbx), %eax
	cmpl	%r14d, %eax
	jge	LBB150_231
## %bb.224:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%ebx, %rcx
	movss	-240(%rbp,%rcx,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movss	-236(%rbp,%rcx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-232(%rbp,%rcx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	cltq
	movss	-240(%rbp,%rax,4), %xmm4 ## xmm4 = mem[0],zero,zero,zero
	movl	%r14d, %eax
	subl	%ebx, %eax
	addl	$4, %ebx
	xorps	%xmm5, %xmm5
	cmpl	$5, %eax
	jne	LBB150_226
## %bb.225:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%ebx, %rax
	movss	-240(%rbp,%rax,4), %xmm5 ## xmm5 = mem[0],zero,zero,zero
LBB150_226:                             ##   in Loop: Header=BB150_3 Depth=1
	xorps	%xmm0, %xmm0
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
LBB150_227:                             ##   in Loop: Header=BB150_3 Depth=1
	leal	3(%rbx), %eax
	cmpl	%r14d, %eax
	jge	LBB150_231
## %bb.228:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%ebx, %rcx
	movss	-240(%rbp,%rcx,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movss	-236(%rbp,%rcx,4), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	movss	-232(%rbp,%rcx,4), %xmm3 ## xmm3 = mem[0],zero,zero,zero
	movl	%r14d, %ecx
	subl	%ebx, %ecx
	addl	$4, %ebx
	xorps	%xmm4, %xmm4
	cmpl	$5, %ecx
	jne	LBB150_230
## %bb.229:                             ##   in Loop: Header=BB150_3 Depth=1
	movslq	%ebx, %rcx
	movss	-240(%rbp,%rcx,4), %xmm4 ## xmm4 = mem[0],zero,zero,zero
LBB150_230:                             ##   in Loop: Header=BB150_3 Depth=1
	cltq
	movss	-240(%rbp,%rax,4), %xmm5 ## xmm5 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	movq	%r12, %rdi
	callq	_stbtt__csctx_rccurve_to
	jmp	LBB150_223
LBB150_258:
	xorl	%r13d, %r13d
	jmp	LBB150_254
LBB150_235:
	movss	8(%r12), %xmm0          ## xmm0 = mem[0],zero,zero,zero
	movss	12(%r12), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	ucomiss	16(%r12), %xmm0
	jne	LBB150_237
	jp	LBB150_237
## %bb.236:
	ucomiss	20(%r12), %xmm1
	jne	LBB150_237
	jnp	LBB150_253
LBB150_237:
	cvttss2si	%xmm0, %ecx
	cvttss2si	%xmm1, %eax
	cmpl	$0, (%r12)
	je	LBB150_251
## %bb.238:
	cmpl	%ecx, 28(%r12)
	movq	-440(%rbp), %rdx        ## 8-byte Reload
	jl	LBB150_240
## %bb.239:
	cmpl	$0, (%rdx)
	jne	LBB150_241
LBB150_240:
	movl	%ecx, 28(%r12)
LBB150_241:
	cmpl	%eax, 36(%r12)
	jl	LBB150_243
## %bb.242:
	cmpl	$0, (%rdx)
	jne	LBB150_244
LBB150_243:
	movl	%eax, 36(%r12)
LBB150_244:
	cmpl	%ecx, 24(%r12)
	jg	LBB150_246
## %bb.245:
	cmpl	$0, (%rdx)
	jne	LBB150_247
LBB150_246:
	movl	%ecx, 24(%r12)
LBB150_247:
	cmpl	%eax, 32(%r12)
	jg	LBB150_249
## %bb.248:
	cmpl	$0, (%rdx)
	jne	LBB150_250
LBB150_249:
	movl	%eax, 32(%r12)
LBB150_250:
	movl	$1, 4(%r12)
	movl	48(%r12), %edx
	jmp	LBB150_252
LBB150_251:
	movq	40(%r12), %rsi
	movslq	48(%r12), %rdx
	movq	%rdx, %rdi
	shlq	$4, %rdi
	subq	%rdx, %rdi
	subq	%rdx, %rdi
	movb	$2, 12(%rsi,%rdi)
	movw	%cx, (%rsi,%rdi)
	movw	%ax, 2(%rsi,%rdi)
	movq	$0, 4(%rsi,%rdi)
LBB150_252:
	incl	%edx
	movl	%edx, 48(%r12)
LBB150_253:
	movl	$1, %r13d
LBB150_254:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB150_266
## %bb.255:
	movl	%r13d, %eax
	addq	$536, %rsp              ## imm = 0x218
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB150_261:
	movq	$0, -424(%rbp)
	movq	$0, -416(%rbp)
	xorl	%r13d, %r13d
	jmp	LBB150_254
LBB150_266:
	callq	___stack_chk_fail
LBB150_267:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L150_0_set_5, LBB150_5-LJTI150_0
.set L150_0_set_106, LBB150_106-LJTI150_0
.set L150_0_set_93, LBB150_93-LJTI150_0
.set L150_0_set_72, LBB150_72-LJTI150_0
.set L150_0_set_91, LBB150_91-LJTI150_0
.set L150_0_set_55, LBB150_55-LJTI150_0
.set L150_0_set_57, LBB150_57-LJTI150_0
.set L150_0_set_61, LBB150_61-LJTI150_0
.set L150_0_set_101, LBB150_101-LJTI150_0
.set L150_0_set_95, LBB150_95-LJTI150_0
.set L150_0_set_235, LBB150_235-LJTI150_0
.set L150_0_set_6, LBB150_6-LJTI150_0
.set L150_0_set_14, LBB150_14-LJTI150_0
.set L150_0_set_103, LBB150_103-LJTI150_0
.set L150_0_set_36, LBB150_36-LJTI150_0
.set L150_0_set_16, LBB150_16-LJTI150_0
.set L150_0_set_8, LBB150_8-LJTI150_0
.set L150_0_set_178, LBB150_178-LJTI150_0
.set L150_0_set_54, LBB150_54-LJTI150_0
.set L150_0_set_100, LBB150_100-LJTI150_0
LJTI150_0:
	.long	L150_0_set_5
	.long	L150_0_set_106
	.long	L150_0_set_5
	.long	L150_0_set_93
	.long	L150_0_set_72
	.long	L150_0_set_91
	.long	L150_0_set_55
	.long	L150_0_set_57
	.long	L150_0_set_106
	.long	L150_0_set_61
	.long	L150_0_set_101
	.long	L150_0_set_95
	.long	L150_0_set_106
	.long	L150_0_set_235
	.long	L150_0_set_106
	.long	L150_0_set_106
	.long	L150_0_set_106
	.long	L150_0_set_5
	.long	L150_0_set_6
	.long	L150_0_set_6
	.long	L150_0_set_14
	.long	L150_0_set_103
	.long	L150_0_set_5
	.long	L150_0_set_36
	.long	L150_0_set_16
	.long	L150_0_set_8
	.long	L150_0_set_8
	.long	L150_0_set_106
	.long	L150_0_set_178
	.long	L150_0_set_54
	.long	L150_0_set_100
.set L150_1_set_98, LBB150_98-LJTI150_1
.set L150_1_set_134, LBB150_134-LJTI150_1
.set L150_1_set_131, LBB150_131-LJTI150_1
.set L150_1_set_137, LBB150_137-LJTI150_1
LJTI150_1:
	.long	L150_1_set_98
	.long	L150_1_set_134
	.long	L150_1_set_131
	.long	L150_1_set_137
	.end_data_region
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__cff_index_get
_stbtt__cff_index_get:                  ## @stbtt__cff_index_get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	shrq	$32, %rsi
	testl	%esi, %esi
	js	LBB151_48
## %bb.1:
	xorl	%ecx, %ecx
	movl	$0, %eax
	movl	$0, %r11d
	testl	%esi, %esi
	je	LBB151_3
## %bb.2:
	movzbl	(%rdi), %r11d
	shll	$8, %r11d
	movl	$1, %eax
LBB151_3:
	cmpl	%esi, %eax
	jge	LBB151_5
## %bb.4:
	movl	%eax, %ecx
	incl	%eax
	movzbl	(%rdi,%rcx), %ecx
LBB151_5:
	cmpl	%esi, %eax
	jge	LBB151_7
## %bb.6:
	movl	%eax, %ebx
	incl	%eax
	movb	(%rdi,%rbx), %bl
	testl	%edx, %edx
	jns	LBB151_8
	jmp	LBB151_49
LBB151_7:
	xorl	%ebx, %ebx
	testl	%edx, %edx
	js	LBB151_49
LBB151_8:
	orl	%ecx, %r11d
	cmpl	%edx, %r11d
	jle	LBB151_49
## %bb.9:
	testb	%bl, %bl
	setne	%r8b
	cmpb	$5, %bl
	setb	%cl
	cmpb	%r8b, %cl
	jne	LBB151_50
## %bb.10:
	movzbl	%bl, %r8d
	imull	%r8d, %edx
	addl	%eax, %edx
	js	LBB151_48
## %bb.11:
	cmpl	%esi, %edx
	jg	LBB151_48
## %bb.12:
	leal	-1(%r8), %r10d
	cmpl	$3, %r10d
	ja	LBB151_51
## %bb.13:
	movl	%r8d, %r9d
	andl	$1, %r9d
	testl	%r10d, %r10d
	je	LBB151_33
## %bb.14:
	movl	%r9d, %ecx
	subl	%r8d, %ecx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB151_15:                              ## =>This Inner Loop Header: Depth=1
	shll	$8, %r14d
	cmpl	%esi, %edx
	jge	LBB151_17
## %bb.16:                              ##   in Loop: Header=BB151_15 Depth=1
	movslq	%edx, %rax
	incl	%edx
	movzbl	(%rdi,%rax), %eax
	jmp	LBB151_18
	.p2align	4, 0x90
LBB151_17:                              ##   in Loop: Header=BB151_15 Depth=1
	xorl	%eax, %eax
LBB151_18:                              ##   in Loop: Header=BB151_15 Depth=1
	movzbl	%al, %eax
	orl	%eax, %r14d
	shll	$8, %r14d
	cmpl	%esi, %edx
	jge	LBB151_20
## %bb.19:                              ##   in Loop: Header=BB151_15 Depth=1
	movslq	%edx, %rax
	incl	%edx
	movzbl	(%rdi,%rax), %eax
	jmp	LBB151_21
	.p2align	4, 0x90
LBB151_20:                              ##   in Loop: Header=BB151_15 Depth=1
	xorl	%eax, %eax
LBB151_21:                              ##   in Loop: Header=BB151_15 Depth=1
	movzbl	%al, %eax
	orl	%eax, %r14d
	addl	$2, %ecx
	jne	LBB151_15
## %bb.22:
	movl	%r14d, %eax
	shll	$8, %eax
	testl	%r9d, %r9d
	jne	LBB151_34
LBB151_23:
	testl	%r10d, %r10d
	je	LBB151_37
LBB151_24:
	movl	%r9d, %eax
	subl	%r8d, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB151_25:                              ## =>This Inner Loop Header: Depth=1
	shll	$8, %ecx
	cmpl	%esi, %edx
	jge	LBB151_27
## %bb.26:                              ##   in Loop: Header=BB151_25 Depth=1
	movslq	%edx, %rbx
	incl	%edx
	movzbl	(%rdi,%rbx), %ebx
	jmp	LBB151_28
	.p2align	4, 0x90
LBB151_27:                              ##   in Loop: Header=BB151_25 Depth=1
	xorl	%ebx, %ebx
LBB151_28:                              ##   in Loop: Header=BB151_25 Depth=1
	movzbl	%bl, %ebx
	orl	%ebx, %ecx
	shll	$8, %ecx
	cmpl	%esi, %edx
	jge	LBB151_30
## %bb.29:                              ##   in Loop: Header=BB151_25 Depth=1
	movslq	%edx, %rbx
	incl	%edx
	movzbl	(%rdi,%rbx), %ebx
	jmp	LBB151_31
	.p2align	4, 0x90
LBB151_30:                              ##   in Loop: Header=BB151_25 Depth=1
	xorl	%ebx, %ebx
LBB151_31:                              ##   in Loop: Header=BB151_25 Depth=1
	movzbl	%bl, %ebx
	orl	%ebx, %ecx
	addl	$2, %eax
	jne	LBB151_25
## %bb.32:
	movl	%ecx, %eax
	shll	$8, %eax
	testl	%r9d, %r9d
	jne	LBB151_38
	jmp	LBB151_41
LBB151_33:
	xorl	%eax, %eax
                                        ## implicit-def: $r14d
	testl	%r9d, %r9d
	je	LBB151_23
LBB151_34:
	xorl	%ecx, %ecx
	cmpl	%esi, %edx
	jge	LBB151_36
## %bb.35:
	movslq	%edx, %rcx
	incl	%edx
	movzbl	(%rdi,%rcx), %ecx
LBB151_36:
	orl	%ecx, %eax
	movl	%eax, %r14d
	testl	%r10d, %r10d
	jne	LBB151_24
LBB151_37:
	xorl	%eax, %eax
                                        ## implicit-def: $ecx
	testl	%r9d, %r9d
	je	LBB151_41
LBB151_38:
	xorl	%ecx, %ecx
	cmpl	%esi, %edx
	jge	LBB151_40
## %bb.39:
	movslq	%edx, %rcx
	movzbl	(%rdi,%rcx), %ecx
LBB151_40:
	orl	%ecx, %eax
	movl	%eax, %ecx
LBB151_41:
	incl	%r11d
	imull	%r8d, %r11d
	leal	2(%r11,%r14), %r8d
	subl	%r14d, %ecx
	movl	%ecx, %eax
	orl	%r8d, %eax
	js	LBB151_45
## %bb.42:
	xorl	%eax, %eax
	cmpl	%esi, %r8d
	jg	LBB151_46
## %bb.43:
	subl	%r8d, %esi
	movl	$0, %edx
	cmpl	%ecx, %esi
	jl	LBB151_47
## %bb.44:
	movslq	%r8d, %rax
	addq	%rax, %rdi
	shlq	$32, %rcx
	movq	%rdi, %rax
	movq	%rcx, %rdx
	jmp	LBB151_47
LBB151_45:
	xorl	%eax, %eax
LBB151_46:
	xorl	%edx, %edx
LBB151_47:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB151_48:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
LBB151_49:
	leaq	L___func__.stbtt__cff_index_get(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.91(%rip), %rcx
	movl	$1266, %edx             ## imm = 0x4F2
	callq	___assert_rtn
LBB151_50:
	leaq	L___func__.stbtt__cff_index_get(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.92(%rip), %rcx
	movl	$1267, %edx             ## imm = 0x4F3
	callq	___assert_rtn
LBB151_51:
	leaq	L___func__.stbtt__buf_get(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.96(%rip), %rcx
	movl	$1162, %edx             ## imm = 0x48A
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__csctx_rmove_to
_stbtt__csctx_rmove_to:                 ## @stbtt__csctx_rmove_to
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movss	8(%rdi), %xmm3          ## xmm3 = mem[0],zero,zero,zero
	movss	12(%rdi), %xmm4         ## xmm4 = mem[0],zero,zero,zero
	movss	16(%rdi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm2, %xmm3
	jne	LBB152_3
	jp	LBB152_3
## %bb.1:
	movss	20(%rdi), %xmm5         ## xmm5 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm4
	jne	LBB152_3
	jnp	LBB152_2
LBB152_3:
	cvttss2si	%xmm3, %ecx
	cvttss2si	%xmm4, %r8d
	cmpl	$0, (%rdi)
	je	LBB152_17
## %bb.4:
	cmpl	%ecx, 28(%rdi)
	jl	LBB152_6
## %bb.5:
	cmpl	$0, 4(%rdi)
	je	LBB152_6
## %bb.7:
	cmpl	%r8d, 36(%rdi)
	jl	LBB152_9
LBB152_8:
	cmpl	$0, 4(%rdi)
	je	LBB152_9
## %bb.10:
	cmpl	%ecx, 24(%rdi)
	jg	LBB152_12
LBB152_11:
	cmpl	$0, 4(%rdi)
	je	LBB152_12
## %bb.13:
	cmpl	%r8d, 32(%rdi)
	jg	LBB152_15
LBB152_14:
	cmpl	$0, 4(%rdi)
	jne	LBB152_16
	jmp	LBB152_15
LBB152_6:
	movl	%ecx, 28(%rdi)
	cmpl	%r8d, 36(%rdi)
	jge	LBB152_8
LBB152_9:
	movl	%r8d, 36(%rdi)
	cmpl	%ecx, 24(%rdi)
	jle	LBB152_11
LBB152_12:
	movl	%ecx, 24(%rdi)
	cmpl	%r8d, 32(%rdi)
	jle	LBB152_14
LBB152_15:
	movl	%r8d, 32(%rdi)
LBB152_16:
	movl	$1, 4(%rdi)
	movl	48(%rdi), %eax
	jmp	LBB152_18
LBB152_17:
	movq	40(%rdi), %rsi
	movslq	48(%rdi), %rax
	movq	%rax, %rdx
	shlq	$4, %rdx
	subq	%rax, %rdx
	subq	%rax, %rdx
	movb	$2, 12(%rsi,%rdx)
	movw	%cx, (%rsi,%rdx)
	movw	%r8w, 2(%rsi,%rdx)
	movq	$0, 4(%rsi,%rdx)
	movss	16(%rdi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
LBB152_18:
	incl	%eax
	movl	%eax, 48(%rdi)
	insertps	$16, 20(%rdi), %xmm2 ## xmm2 = xmm2[0],mem[0],xmm2[2,3]
LBB152_19:
	insertps	$16, %xmm1, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	addps	%xmm2, %xmm0
	movshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	movddup	%xmm0, %xmm2            ## xmm2 = xmm0[0,0]
	movupd	%xmm2, 8(%rdi)
	cvttss2si	%xmm0, %ecx
	cvttss2si	%xmm1, %r8d
	cmpl	$0, (%rdi)
	je	LBB152_33
## %bb.20:
	cmpl	%ecx, 28(%rdi)
	jl	LBB152_22
## %bb.21:
	cmpl	$0, 4(%rdi)
	je	LBB152_22
## %bb.23:
	cmpl	%r8d, 36(%rdi)
	jl	LBB152_25
LBB152_24:
	cmpl	$0, 4(%rdi)
	je	LBB152_25
## %bb.26:
	cmpl	%ecx, 24(%rdi)
	jg	LBB152_28
LBB152_27:
	cmpl	$0, 4(%rdi)
	je	LBB152_28
## %bb.29:
	cmpl	%r8d, 32(%rdi)
	jg	LBB152_31
LBB152_30:
	cmpl	$0, 4(%rdi)
	jne	LBB152_32
	jmp	LBB152_31
LBB152_22:
	movl	%ecx, 28(%rdi)
	cmpl	%r8d, 36(%rdi)
	jge	LBB152_24
LBB152_25:
	movl	%r8d, 36(%rdi)
	cmpl	%ecx, 24(%rdi)
	jle	LBB152_27
LBB152_28:
	movl	%ecx, 24(%rdi)
	cmpl	%r8d, 32(%rdi)
	jle	LBB152_30
LBB152_31:
	movl	%r8d, 32(%rdi)
LBB152_32:
	movl	$1, 4(%rdi)
	movl	48(%rdi), %eax
	jmp	LBB152_34
LBB152_33:
	movq	40(%rdi), %rsi
	movslq	48(%rdi), %rax
	movq	%rax, %rdx
	shlq	$4, %rdx
	subq	%rax, %rdx
	subq	%rax, %rdx
	movb	$1, 12(%rsi,%rdx)
	movw	%cx, (%rsi,%rdx)
	movw	%r8w, 2(%rsi,%rdx)
	movq	$0, 4(%rsi,%rdx)
LBB152_34:
	incl	%eax
	movl	%eax, 48(%rdi)
	popq	%rbp
	retq
LBB152_2:
	insertps	$16, %xmm5, %xmm2 ## xmm2 = xmm2[0],xmm5[0],xmm2[2,3]
	jmp	LBB152_19
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__csctx_rccurve_to
_stbtt__csctx_rccurve_to:               ## @stbtt__csctx_rccurve_to
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	addss	16(%rdi), %xmm0
	addss	20(%rdi), %xmm1
	addss	%xmm0, %xmm2
	addss	%xmm1, %xmm3
	addss	%xmm2, %xmm4
	movss	%xmm4, 16(%rdi)
	addss	%xmm3, %xmm5
	movss	%xmm5, 20(%rdi)
	cvttss2si	%xmm4, %ebx
	cvttss2si	%xmm5, %edx
	cvttss2si	%xmm0, %r14d
	cvttss2si	%xmm1, %r10d
	cvttss2si	%xmm2, %r9d
	cvttss2si	%xmm3, %r8d
	cmpl	$0, (%rdi)
	je	LBB153_30
## %bb.1:
	movl	28(%rdi), %r11d
	cmpl	%ebx, %r11d
	jl	LBB153_3
## %bb.2:
	cmpl	$0, 4(%rdi)
	jne	LBB153_4
LBB153_3:
	movl	%ebx, 28(%rdi)
	movl	%ebx, %r11d
LBB153_4:
	movl	36(%rdi), %ecx
	cmpl	%edx, %ecx
	jl	LBB153_6
## %bb.5:
	cmpl	$0, 4(%rdi)
	jne	LBB153_7
LBB153_6:
	movl	%edx, 36(%rdi)
	movl	%edx, %ecx
LBB153_7:
	movl	24(%rdi), %esi
	cmpl	%ebx, %esi
	jg	LBB153_9
## %bb.8:
	cmpl	$0, 4(%rdi)
	jne	LBB153_10
LBB153_9:
	movl	%ebx, 24(%rdi)
	movl	%ebx, %esi
LBB153_10:
	movl	32(%rdi), %ebx
	cmpl	%edx, %ebx
	jg	LBB153_12
## %bb.11:
	cmpl	$0, 4(%rdi)
	jne	LBB153_13
LBB153_12:
	movl	%edx, 32(%rdi)
	movl	%edx, %ebx
LBB153_13:
	movl	$1, 4(%rdi)
	cmpl	%r14d, %r11d
	jl	LBB153_14
## %bb.15:
	cmpl	%r10d, %ecx
	jl	LBB153_16
LBB153_17:
	cmpl	%r14d, %esi
	jg	LBB153_18
LBB153_19:
	cmpl	%r10d, %ebx
	jle	LBB153_21
LBB153_20:
	movl	%r10d, 32(%rdi)
	movl	%r10d, %ebx
LBB153_21:
	movl	$1, 4(%rdi)
	cmpl	%r9d, %r11d
	jl	LBB153_22
## %bb.23:
	cmpl	%r8d, %ecx
	jl	LBB153_24
LBB153_25:
	cmpl	%r9d, %esi
	jg	LBB153_26
LBB153_27:
	cmpl	%r8d, %ebx
	jle	LBB153_29
LBB153_28:
	movl	%r8d, 32(%rdi)
LBB153_29:
	movl	$1, 4(%rdi)
	movl	48(%rdi), %eax
	jmp	LBB153_31
LBB153_30:
	movq	40(%rdi), %rsi
	movslq	48(%rdi), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	subq	%rax, %rcx
	subq	%rax, %rcx
	movb	$4, 12(%rsi,%rcx)
	movw	%bx, (%rsi,%rcx)
	movw	%dx, 2(%rsi,%rcx)
	movw	%r14w, 4(%rsi,%rcx)
	movw	%r10w, 6(%rsi,%rcx)
	movw	%r9w, 8(%rsi,%rcx)
	movw	%r8w, 10(%rsi,%rcx)
LBB153_31:
	incl	%eax
	movl	%eax, 48(%rdi)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB153_14:
	movl	%r14d, 28(%rdi)
	movl	%r14d, %r11d
	cmpl	%r10d, %ecx
	jge	LBB153_17
LBB153_16:
	movl	%r10d, 36(%rdi)
	movl	%r10d, %ecx
	cmpl	%r14d, %esi
	jle	LBB153_19
LBB153_18:
	movl	%r14d, 24(%rdi)
	movl	%r14d, %esi
	cmpl	%r10d, %ebx
	jg	LBB153_20
	jmp	LBB153_21
LBB153_22:
	movl	%r9d, 28(%rdi)
	cmpl	%r8d, %ecx
	jge	LBB153_25
LBB153_24:
	movl	%r8d, 36(%rdi)
	cmpl	%r9d, %esi
	jle	LBB153_27
LBB153_26:
	movl	%r9d, 24(%rdi)
	cmpl	%r8d, %ebx
	jg	LBB153_28
	jmp	LBB153_29
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__cff_int
_stbtt__cff_int:                        ## @stbtt__cff_int
	.cfi_startproc
## %bb.0:
	movslq	8(%rdi), %rcx
	movl	12(%rdi), %r9d
	cmpl	%r9d, %ecx
	jge	LBB154_25
## %bb.1:
	movq	(%rdi), %r8
	leaq	1(%rcx), %rdx
	movl	%edx, 8(%rdi)
	movzbl	(%r8,%rcx), %esi
	leal	-32(%rsi), %eax
	cmpb	$-42, %al
	ja	LBB154_3
## %bb.2:
	addl	$-139, %esi
	movl	%esi, %eax
	retq
LBB154_3:
	leal	9(%rsi), %eax
	cmpb	$3, %al
	ja	LBB154_7
## %bb.4:
	shll	$8, %esi
	addl	$-63232, %esi           ## imm = 0xFFFF0900
	xorl	%eax, %eax
	cmpl	%r9d, %edx
	jge	LBB154_6
## %bb.5:
	leal	2(%rcx), %eax
	movl	%eax, 8(%rdi)
	movzbl	(%r8,%rdx), %eax
LBB154_6:
	orl	%esi, %eax
	addl	$108, %eax
	retq
LBB154_7:
	cmpb	$-5, %sil
	jb	LBB154_12
## %bb.8:
	cmpb	$-1, %sil
	je	LBB154_12
## %bb.9:
	shll	$8, %esi
	xorl	%r10d, %r10d
	cmpl	%r9d, %edx
	jge	LBB154_11
## %bb.10:
	leal	2(%rcx), %eax
	movl	%eax, 8(%rdi)
	movzbl	1(%r8,%rcx), %r10d
	negl	%r10d
LBB154_11:
	movl	$64148, %eax            ## imm = 0xFA94
	subl	%esi, %eax
	addl	%r10d, %eax
	retq
LBB154_12:
	cmpb	$29, %sil
	je	LBB154_19
## %bb.13:
	cmpb	$28, %sil
	jne	LBB154_25
## %bb.14:
	xorl	%esi, %esi
	movl	$0, %eax
	cmpl	%r9d, %edx
	jl	LBB154_15
## %bb.16:
	cmpl	%r9d, %edx
	jl	LBB154_17
LBB154_18:
	orl	%esi, %eax
	retq
LBB154_19:
	xorl	%esi, %esi
	movl	$0, %eax
	cmpl	%r9d, %edx
	jge	LBB154_21
## %bb.20:
	leal	2(%rcx), %ecx
	movl	%ecx, 8(%rdi)
	movzbl	(%r8,%rdx), %eax
	shll	$8, %eax
	movl	%ecx, %edx
LBB154_21:
	cmpl	%r9d, %edx
	jge	LBB154_23
## %bb.22:
	movslq	%edx, %rcx
	leal	1(%rdx), %edx
	movl	%edx, 8(%rdi)
	movzbl	(%r8,%rcx), %esi
                                        ## kill: def $edx killed $edx def $rdx
LBB154_23:
	orl	%esi, %eax
	shll	$8, %eax
	xorl	%ecx, %ecx
	cmpl	%r9d, %edx
	jge	LBB154_24
## %bb.26:
	movslq	%edx, %rsi
	leal	1(%rdx), %edx
	movl	%edx, 8(%rdi)
	movzbl	(%r8,%rsi), %esi
                                        ## kill: def $edx killed $edx def $rdx
	jmp	LBB154_27
LBB154_15:
	leal	2(%rcx), %edx
	movl	%edx, 8(%rdi)
	movzbl	1(%r8,%rcx), %eax
	shll	$8, %eax
	cmpl	%r9d, %edx
	jge	LBB154_18
LBB154_17:
	leal	1(%rdx), %ecx
	movl	%ecx, 8(%rdi)
	movslq	%edx, %rcx
	movzbl	(%r8,%rcx), %esi
	orl	%esi, %eax
	retq
LBB154_24:
	xorl	%esi, %esi
LBB154_27:
	orl	%esi, %eax
	shll	$8, %eax
	cmpl	%r9d, %edx
	jge	LBB154_29
## %bb.28:
	leal	1(%rdx), %ecx
	movl	%ecx, 8(%rdi)
	movslq	%edx, %rcx
	movzbl	(%r8,%rcx), %ecx
LBB154_29:
	orl	%ecx, %eax
	retq
LBB154_25:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L___func__.stbtt__cff_int(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$1212, %edx             ## imm = 0x4BC
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__get_subrs
_stbtt__get_subrs:                      ## @stbtt__get_subrs
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	%rdi, -56(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -80(%rbp)
	movl	$0, -28(%rbp)
	movq	$0, -40(%rbp)
	leaq	-88(%rbp), %rdi
	leaq	-40(%rbp), %rcx
	movl	$18, %esi
	movl	$2, %edx
	callq	_stbtt__dict_get_ints
	movslq	-36(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB155_12
## %bb.1:
	movl	-40(%rbp), %eax
	testq	%rax, %rax
	je	LBB155_12
## %bb.2:
	shrq	$32, %r14
	movl	%eax, %ecx
	orl	%ebx, %ecx
	js	LBB155_6
## %bb.3:
	xorl	%ecx, %ecx
	cmpl	%r14d, %ebx
	jg	LBB155_7
## %bb.4:
	movl	%r14d, %esi
	subl	%ebx, %esi
	movl	$0, %edx
	cmpl	%eax, %esi
	jl	LBB155_8
## %bb.5:
	addq	%rbx, %r15
	shlq	$32, %rax
	movq	%r15, %rcx
	movq	%rax, %rdx
	jmp	LBB155_8
LBB155_6:
	xorl	%ecx, %ecx
LBB155_7:
	xorl	%edx, %edx
LBB155_8:
	movq	%rcx, -72(%rbp)
	movq	%rdx, -64(%rbp)
	leaq	-72(%rbp), %rdi
	leaq	-28(%rbp), %rcx
	movl	$19, %esi
	movl	$1, %edx
	callq	_stbtt__dict_get_ints
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	je	LBB155_12
## %bb.9:
	addl	%ebx, %eax
	js	LBB155_14
## %bb.10:
	cmpl	%r14d, %eax
	jg	LBB155_14
## %bb.11:
	movl	%eax, -48(%rbp)
	leaq	-56(%rbp), %rdi
	callq	_stbtt__cff_get_index
	jmp	LBB155_13
LBB155_12:
	xorl	%eax, %eax
	xorl	%edx, %edx
LBB155_13:
	addq	$72, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB155_14:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__dict_get_ints
_stbtt__dict_get_ints:                  ## @stbtt__dict_get_ints
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	movl	12(%rdi), %r8d
	testl	%r8d, %r8d
	js	LBB156_40
## %bb.1:
	movq	%rcx, %r15
	movq	%rdi, %r14
	movl	$0, 8(%rdi)
	je	LBB156_26
## %bb.2:
	movl	%esi, %r12d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB156_3:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB156_5 Depth 2
                                        ##       Child Loop BB156_10 Depth 3
	cmpl	%r8d, %r13d
	jge	LBB156_17
## %bb.4:                               ##   in Loop: Header=BB156_3 Depth=1
	movl	%r13d, %ecx
	.p2align	4, 0x90
LBB156_5:                               ##   Parent Loop BB156_3 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB156_10 Depth 3
	movq	(%r14), %rsi
	movslq	%ecx, %rdi
	movb	(%rsi,%rdi), %al
	cmpb	$28, %al
	jb	LBB156_18
## %bb.6:                               ##   in Loop: Header=BB156_5 Depth=2
	cmpb	$30, %al
	jne	LBB156_14
## %bb.7:                               ##   in Loop: Header=BB156_5 Depth=2
	incl	%ecx
	js	LBB156_40
## %bb.8:                               ##   in Loop: Header=BB156_5 Depth=2
	movl	%ecx, 8(%r14)
	cmpl	%r8d, %ecx
	jge	LBB156_13
## %bb.9:                               ##   in Loop: Header=BB156_5 Depth=2
	movslq	%r8d, %rdx
	movslq	%ecx, %rdi
	incq	%rdi
	.p2align	4, 0x90
LBB156_10:                              ##   Parent Loop BB156_3 Depth=1
                                        ##     Parent Loop BB156_5 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	incl	%ecx
	movl	%ecx, 8(%r14)
	movzbl	-1(%rsi,%rdi), %ebx
	movl	%ebx, %eax
	andl	$-16, %eax
	cmpl	$240, %eax
	je	LBB156_13
## %bb.11:                              ##   in Loop: Header=BB156_10 Depth=3
	andl	$15, %ebx
	cmpl	$15, %ebx
	je	LBB156_13
## %bb.12:                              ##   in Loop: Header=BB156_10 Depth=3
	cmpq	%rdx, %rdi
	leaq	1(%rdi), %rdi
	jl	LBB156_10
	.p2align	4, 0x90
LBB156_13:                              ##   in Loop: Header=BB156_5 Depth=2
	cmpl	%r8d, %ecx
	jl	LBB156_5
	jmp	LBB156_15
	.p2align	4, 0x90
LBB156_14:                              ##   in Loop: Header=BB156_5 Depth=2
	movq	%r14, %rdi
	callq	_stbtt__cff_int
	movl	8(%r14), %ecx
	movl	12(%r14), %r8d
	cmpl	%r8d, %ecx
	jl	LBB156_5
LBB156_15:                              ##   in Loop: Header=BB156_3 Depth=1
	movl	%ecx, %edx
	jmp	LBB156_16
	.p2align	4, 0x90
LBB156_17:                              ##   in Loop: Header=BB156_3 Depth=1
	movl	%r13d, %edx
	movl	%r13d, %ecx
LBB156_16:                              ##   in Loop: Header=BB156_3 Depth=1
	xorl	%edi, %edi
	cmpl	%r12d, %edi
	jne	LBB156_24
	jmp	LBB156_27
	.p2align	4, 0x90
LBB156_18:                              ##   in Loop: Header=BB156_3 Depth=1
	leaq	1(%rdi), %rdx
	movl	%edx, 8(%r14)
	movzbl	(%rsi,%rdi), %edi
	cmpl	$12, %edi
	jne	LBB156_23
## %bb.19:                              ##   in Loop: Header=BB156_3 Depth=1
	cmpl	%r8d, %edx
	jge	LBB156_21
## %bb.20:                              ##   in Loop: Header=BB156_3 Depth=1
	leal	2(%rcx), %eax
	movl	%eax, 8(%r14)
	movb	(%rsi,%rdx), %sil
	movl	%eax, %edx
	jmp	LBB156_22
LBB156_21:                              ##   in Loop: Header=BB156_3 Depth=1
	xorl	%esi, %esi
LBB156_22:                              ##   in Loop: Header=BB156_3 Depth=1
	movzbl	%sil, %edi
	orl	$256, %edi              ## imm = 0x100
	.p2align	4, 0x90
LBB156_23:                              ##   in Loop: Header=BB156_3 Depth=1
	cmpl	%r12d, %edi
	je	LBB156_27
LBB156_24:                              ##   in Loop: Header=BB156_3 Depth=1
	movl	%edx, %r13d
	cmpl	%r8d, %edx
	jl	LBB156_3
## %bb.25:
	testl	%r8d, %r8d
	js	LBB156_31
LBB156_26:
	movq	(%r14), %rdx
	jmp	LBB156_32
LBB156_27:
	subl	%r13d, %ecx
	movl	%ecx, %eax
	orl	%r13d, %eax
	js	LBB156_31
## %bb.28:
	xorl	%edx, %edx
	subl	%r13d, %r8d
	movl	-44(%rbp), %eax         ## 4-byte Reload
	jl	LBB156_39
## %bb.29:
	movl	$0, %esi
	cmpl	%ecx, %r8d
	jl	LBB156_33
## %bb.30:
	movslq	%r13d, %rdx
	addq	(%r14), %rdx
	shlq	$32, %rcx
	movq	%rcx, %rsi
	jmp	LBB156_33
LBB156_31:
	xorl	%edx, %edx
LBB156_32:
	xorl	%esi, %esi
	movl	-44(%rbp), %eax         ## 4-byte Reload
LBB156_33:
	movq	%rdx, -64(%rbp)
	movq	%rsi, -56(%rbp)
	testl	%eax, %eax
	jle	LBB156_38
## %bb.34:
	shrq	$32, %rsi
	testl	%esi, %esi
	jle	LBB156_38
## %bb.35:
	movslq	%eax, %r12
	movl	$1, %ebx
	leaq	-64(%rbp), %r14
	.p2align	4, 0x90
LBB156_36:                              ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	_stbtt__cff_int
	movl	%eax, -4(%r15,%rbx,4)
	cmpq	%r12, %rbx
	jge	LBB156_38
## %bb.37:                              ##   in Loop: Header=BB156_36 Depth=1
	movl	-56(%rbp), %eax
	incq	%rbx
	cmpl	-52(%rbp), %eax
	jl	LBB156_36
LBB156_38:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB156_39:
	xorl	%esi, %esi
	jmp	LBB156_33
LBB156_40:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__cff_get_index
_stbtt__cff_get_index:                  ## @stbtt__cff_get_index
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	8(%rdi), %r9d
	movl	12(%rdi), %esi
	movslq	%r9d, %r8
	xorl	%eax, %eax
	movl	%r9d, %ecx
	movl	$0, %edx
	cmpl	%r8d, %esi
	jle	LBB157_1
## %bb.18:
	movq	(%rdi), %rdx
	leal	1(%r8), %ecx
	movl	%ecx, 8(%rdi)
	movzbl	(%rdx,%r8), %edx
	shll	$8, %edx
	cmpl	%esi, %ecx
	jl	LBB157_19
LBB157_2:
	orl	%eax, %edx
	je	LBB157_27
LBB157_3:
	cmpl	%esi, %ecx
	jge	LBB157_35
## %bb.4:
	movq	(%rdi), %r11
	leal	1(%rcx), %eax
	movl	%eax, 8(%rdi)
	movslq	%ecx, %rcx
	movzbl	(%r11,%rcx), %ebx
	testl	%ebx, %ebx
	setne	%r10b
	cmpl	$5, %ebx
	setb	%cl
	cmpb	%r10b, %cl
	jne	LBB157_35
## %bb.5:
	imull	%ebx, %edx
	addl	%edx, %eax
	js	LBB157_34
## %bb.6:
	cmpl	%eax, %esi
	jl	LBB157_34
## %bb.7:
	movl	%eax, 8(%rdi)
	leal	-1(%rbx), %ecx
	cmpl	$3, %ecx
	ja	LBB157_36
## %bb.8:
	movl	%ebx, %r10d
	andl	$1, %r10d
	testl	%ecx, %ecx
	je	LBB157_20
## %bb.9:
	movl	%r10d, %ecx
	subl	%ebx, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB157_10:                              ## =>This Inner Loop Header: Depth=1
	shll	$8, %edx
	cmpl	%esi, %eax
	jge	LBB157_12
## %bb.11:                              ##   in Loop: Header=BB157_10 Depth=1
	movslq	%eax, %rbx
	leal	1(%rax), %eax
	movl	%eax, 8(%rdi)
	movzbl	(%r11,%rbx), %ebx
                                        ## kill: def $eax killed $eax def $rax
	jmp	LBB157_13
	.p2align	4, 0x90
LBB157_12:                              ##   in Loop: Header=BB157_10 Depth=1
	xorl	%ebx, %ebx
LBB157_13:                              ##   in Loop: Header=BB157_10 Depth=1
	movzbl	%bl, %ebx
	orl	%ebx, %edx
	shll	$8, %edx
	cmpl	%esi, %eax
	jge	LBB157_15
## %bb.14:                              ##   in Loop: Header=BB157_10 Depth=1
	movslq	%eax, %rbx
	leal	1(%rax), %eax
	movl	%eax, 8(%rdi)
	movzbl	(%r11,%rbx), %ebx
                                        ## kill: def $eax killed $eax def $rax
	jmp	LBB157_16
	.p2align	4, 0x90
LBB157_15:                              ##   in Loop: Header=BB157_10 Depth=1
	xorl	%ebx, %ebx
LBB157_16:                              ##   in Loop: Header=BB157_10 Depth=1
	movzbl	%bl, %ebx
	orl	%ebx, %edx
	addl	$2, %ecx
	jne	LBB157_10
## %bb.17:
	movl	%edx, %ecx
	shll	$8, %ecx
	testl	%r10d, %r10d
	jne	LBB157_21
	jmp	LBB157_24
LBB157_1:
	cmpl	%esi, %ecx
	jge	LBB157_2
LBB157_19:
	movq	(%rdi), %rax
	movslq	%ecx, %rbx
	leal	1(%rcx), %ecx
	movl	%ecx, 8(%rdi)
	movzbl	(%rax,%rbx), %eax
                                        ## kill: def $ecx killed $ecx def $rcx
	orl	%eax, %edx
	jne	LBB157_3
	jmp	LBB157_27
LBB157_20:
	xorl	%ecx, %ecx
                                        ## implicit-def: $edx
	testl	%r10d, %r10d
	je	LBB157_24
LBB157_21:
	xorl	%edx, %edx
	cmpl	%esi, %eax
	jge	LBB157_23
## %bb.22:
	movslq	%eax, %rdx
	leal	1(%rax), %eax
	movl	%eax, 8(%rdi)
	movzbl	(%r11,%rdx), %edx
                                        ## kill: def $eax killed $eax def $rax
LBB157_23:
	orl	%edx, %ecx
	movl	%ecx, %edx
LBB157_24:
	addl	%edx, %eax
	movl	%eax, %ecx
	decl	%ecx
	js	LBB157_34
## %bb.25:
	cmpl	%ecx, %esi
	jl	LBB157_34
## %bb.26:
	movl	%ecx, 8(%rdi)
LBB157_27:
	subl	%r9d, %ecx
	movl	%ecx, %eax
	orl	%r9d, %eax
	js	LBB157_31
## %bb.28:
	xorl	%eax, %eax
	subl	%r9d, %esi
	jl	LBB157_32
## %bb.29:
	movl	$0, %edx
	cmpl	%ecx, %esi
	jl	LBB157_33
## %bb.30:
	addq	(%rdi), %r8
	shlq	$32, %rcx
	movq	%r8, %rax
	movq	%rcx, %rdx
	jmp	LBB157_33
LBB157_31:
	xorl	%eax, %eax
LBB157_32:
	xorl	%edx, %edx
LBB157_33:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB157_34:
	leaq	L___func__.stbtt__buf_seek(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.93(%rip), %rcx
	movl	$1149, %edx             ## imm = 0x47D
	callq	___assert_rtn
LBB157_35:
	leaq	L___func__.stbtt__cff_get_index(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.92(%rip), %rcx
	movl	$1197, %edx             ## imm = 0x4AD
	callq	___assert_rtn
LBB157_36:
	leaq	L___func__.stbtt__buf_get(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.96(%rip), %rcx
	movl	$1162, %edx             ## imm = 0x48A
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__GetGlyphClass
_stbtt__GetGlyphClass:                  ## @stbtt__GetGlyphClass
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movzwl	(%rdi), %ecx
	rolw	$8, %cx
	cmpw	$2, %cx
	je	LBB158_5
## %bb.1:
	movl	$-1, %eax
	cmpw	$1, %cx
	jne	LBB158_16
## %bb.2:
	movzbl	2(%rdi), %eax
	shll	$8, %eax
	movzbl	3(%rdi), %ecx
	orl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	%esi, %ecx
	jg	LBB158_16
## %bb.3:
	movzbl	4(%rdi), %r8d
	shll	$8, %r8d
	movzbl	5(%rdi), %edx
	orl	%r8d, %edx
	addl	%ecx, %edx
	cmpl	%esi, %edx
	jle	LBB158_16
## %bb.4:
	subl	%ecx, %esi
	movslq	%esi, %rax
	movzbl	6(%rdi,%rax,2), %ecx
	shll	$8, %ecx
	movzbl	7(%rdi,%rax,2), %eax
	jmp	LBB158_15
LBB158_5:
	movzbl	2(%rdi), %eax
	shll	$8, %eax
	movzbl	3(%rdi), %r8d
	orl	%eax, %r8d
	je	LBB158_6
## %bb.7:
	decl	%r8d
	xorl	%r9d, %r9d
	.p2align	4, 0x90
LBB158_8:                               ## =>This Inner Loop Header: Depth=1
	leal	(%r9,%r8), %edx
	sarl	%edx
	movslq	%edx, %rax
	addq	%rax, %rax
	leaq	(%rax,%rax,2), %r10
	movzbl	4(%rdi,%r10), %ecx
	shll	$8, %ecx
	movzbl	5(%rdi,%r10), %eax
	orl	%ecx, %eax
	cmpl	%esi, %eax
	jle	LBB158_10
## %bb.9:                               ##   in Loop: Header=BB158_8 Depth=1
	decl	%edx
	movl	%edx, %r8d
	cmpl	%r8d, %r9d
	jle	LBB158_8
	jmp	LBB158_13
	.p2align	4, 0x90
LBB158_10:                              ##   in Loop: Header=BB158_8 Depth=1
	movzbl	6(%rdi,%r10), %eax
	shll	$8, %eax
	movzbl	7(%rdi,%r10), %ecx
	orl	%eax, %ecx
	cmpl	%esi, %ecx
	jge	LBB158_14
## %bb.11:                              ##   in Loop: Header=BB158_8 Depth=1
	incl	%edx
	movl	%edx, %r9d
	cmpl	%r8d, %r9d
	jle	LBB158_8
LBB158_13:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB158_6:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB158_14:
	movzbl	8(%rdi,%r10), %ecx
	shll	$8, %ecx
	movzbl	9(%rdi,%r10), %eax
LBB158_15:
	orl	%ecx, %eax
LBB158_16:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function stbtt__tesselate_curve
LCPI159_0:
	.long	1048576000              ## float 0.25
	.long	1048576000              ## float 0.25
	.space	4
	.space	4
LCPI159_1:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.space	4
	.space	4
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI159_2:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbtt__tesselate_curve:                ## @stbtt__tesselate_curve
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movaps	%xmm5, -64(%rbp)        ## 16-byte Spill
	movaps	%xmm4, -48(%rbp)        ## 16-byte Spill
	cmpl	$16, %edx
	jg	LBB159_7
## %bb.1:
	movl	%edx, %ebx
	movaps	%xmm3, %xmm8
	movaps	%xmm2, %xmm7
	movq	%rsi, %r14
	movq	%rdi, %r15
	movaps	%xmm2, %xmm4
	insertps	$16, %xmm3, %xmm4 ## xmm4 = xmm4[0],xmm3[0],xmm4[2,3]
	addps	%xmm4, %xmm4
	movaps	%xmm0, %xmm2
	insertps	$16, %xmm1, %xmm2 ## xmm2 = xmm2[0],xmm1[0],xmm2[2,3]
	addps	%xmm2, %xmm4
	movaps	-48(%rbp), %xmm3        ## 16-byte Reload
	insertps	$16, -64(%rbp), %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0],xmm3[2,3]
	addps	%xmm3, %xmm4
	mulps	LCPI159_0(%rip), %xmm4
	movaps	%xmm3, -80(%rbp)        ## 16-byte Spill
	addps	%xmm3, %xmm2
	mulps	LCPI159_1(%rip), %xmm2
	subps	%xmm4, %xmm2
	decl	%ebx
	movss	%xmm6, -28(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB159_2:                               ## =>This Inner Loop Header: Depth=1
	mulps	%xmm2, %xmm2
	movshdup	%xmm2, %xmm3    ## xmm3 = xmm2[1,1,3,3]
	addss	%xmm2, %xmm3
	ucomiss	%xmm6, %xmm3
	jbe	LBB159_4
## %bb.3:                               ##   in Loop: Header=BB159_2 Depth=1
	movaps	%xmm0, %xmm2
	addss	%xmm7, %xmm2
	movss	LCPI159_2(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	movaps	%xmm3, %xmm5
	mulss	%xmm3, %xmm2
	movaps	%xmm1, %xmm3
	addss	%xmm8, %xmm3
	mulss	%xmm5, %xmm3
	leal	2(%rbx), %edx
	movshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	movaps	%xmm5, -128(%rbp)       ## 16-byte Spill
	movq	%r15, %rdi
	movq	%r14, %rsi
	movaps	%xmm7, -144(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -112(%rbp)       ## 16-byte Spill
	movss	-28(%rbp), %xmm6        ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	movaps	%xmm8, -96(%rbp)        ## 16-byte Spill
	callq	_stbtt__tesselate_curve
	movaps	-144(%rbp), %xmm7       ## 16-byte Reload
	movss	-28(%rbp), %xmm6        ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	insertps	$16, -96(%rbp), %xmm7 ## 16-byte Folded Reload
                                        ## xmm7 = xmm7[0],mem[0],xmm7[2,3]
	movaps	-80(%rbp), %xmm0        ## 16-byte Reload
	addps	%xmm0, %xmm7
	movaps	LCPI159_1(%rip), %xmm1  ## xmm1 = <5.0E-1,5.0E-1,u,u>
	mulps	%xmm1, %xmm7
	movaps	%xmm7, %xmm3
	addps	%xmm7, %xmm3
	movaps	-112(%rbp), %xmm4       ## 16-byte Reload
	addps	%xmm4, %xmm3
	addps	%xmm0, %xmm3
	mulps	LCPI159_0(%rip), %xmm3
	movaps	%xmm4, %xmm2
	addps	%xmm0, %xmm2
	mulps	%xmm1, %xmm2
	subps	%xmm3, %xmm2
	movshdup	%xmm7, %xmm8    ## xmm8 = xmm7[1,1,3,3]
	incl	%ebx
	movaps	-128(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm4, %xmm0
	movaps	%xmm3, %xmm4
	cmpl	$15, %ebx
	jle	LBB159_2
	jmp	LBB159_7
LBB159_4:
	movslq	(%r14), %rax
	testq	%r15, %r15
	je	LBB159_6
## %bb.5:
	movaps	-48(%rbp), %xmm0        ## 16-byte Reload
	movss	%xmm0, (%r15,%rax,8)
	movaps	-64(%rbp), %xmm0        ## 16-byte Reload
	movss	%xmm0, 4(%r15,%rax,8)
LBB159_6:
	incl	%eax
	movl	%eax, (%r14)
LBB159_7:
	addq	$120, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt__tesselate_cubic
LCPI160_0:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI160_1:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.space	4
	.space	4
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbtt__tesselate_cubic:                ## @stbtt__tesselate_cubic
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %ebx
	movaps	%xmm7, -64(%rbp)        ## 16-byte Spill
	movaps	%xmm6, -48(%rbp)        ## 16-byte Spill
	movq	%rsi, %r14
	movq	%rdi, %r15
	insertps	$16, %xmm4, %xmm0 ## xmm0 = xmm0[0],xmm4[0],xmm0[2,3]
	insertps	$16, %xmm5, %xmm1 ## xmm1 = xmm1[0],xmm5[0],xmm1[2,3]
	cmpl	$16, %ebx
	jle	LBB160_2
	jmp	LBB160_7
	.p2align	4, 0x90
LBB160_3:                               ##   in Loop: Header=BB160_2 Depth=1
	movaps	%xmm6, %xmm11
	addss	%xmm2, %xmm7
	movss	LCPI160_0(%rip), %xmm6  ## xmm6 = mem[0],zero,zero,zero
	movaps	%xmm6, %xmm12
	mulss	%xmm6, %xmm7
	addss	%xmm3, %xmm10
	mulss	%xmm6, %xmm10
	insertps	$16, %xmm9, %xmm2 ## xmm2 = xmm2[0],xmm9[0],xmm2[2,3]
	addps	%xmm0, %xmm2
	movaps	LCPI160_1(%rip), %xmm4  ## xmm4 = <5.0E-1,5.0E-1,u,u>
	movaps	%xmm4, %xmm6
	mulps	%xmm4, %xmm2
	movaps	%xmm2, -80(%rbp)        ## 16-byte Spill
	insertps	$16, %xmm8, %xmm3 ## xmm3 = xmm3[0],xmm8[0],xmm3[2,3]
	addps	%xmm1, %xmm3
	mulps	%xmm4, %xmm3
	movaps	%xmm3, -112(%rbp)       ## 16-byte Spill
	movsldup	%xmm7, %xmm4    ## xmm4 = xmm7[0,0,2,2]
	addps	%xmm2, %xmm4
	mulps	%xmm6, %xmm4
	movsldup	%xmm10, %xmm5   ## xmm5 = xmm10[0,0,2,2]
	addps	%xmm3, %xmm5
	mulps	%xmm6, %xmm5
	movshdup	%xmm4, %xmm6    ## xmm6 = xmm4[1,1,3,3]
	movaps	%xmm6, -160(%rbp)       ## 16-byte Spill
	movaps	%xmm4, %xmm7
	addss	%xmm6, %xmm7
	mulss	%xmm12, %xmm7
	movaps	%xmm7, %xmm6
	movaps	%xmm7, -96(%rbp)        ## 16-byte Spill
	movshdup	%xmm5, %xmm8    ## xmm8 = xmm5[1,1,3,3]
	movaps	%xmm8, -144(%rbp)       ## 16-byte Spill
	movaps	%xmm5, %xmm7
	addss	%xmm8, %xmm7
	mulss	%xmm12, %xmm7
	movaps	%xmm7, -128(%rbp)       ## 16-byte Spill
	incl	%ebx
	movss	%xmm11, (%rsp)
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	callq	_stbtt__tesselate_cubic
	movaps	-96(%rbp), %xmm0        ## 16-byte Reload
	blendps	$14, -80(%rbp), %xmm0   ## 16-byte Folded Reload
                                        ## xmm0 = xmm0[0],mem[1,2,3]
	movaps	-128(%rbp), %xmm1       ## 16-byte Reload
	blendps	$14, -112(%rbp), %xmm1  ## 16-byte Folded Reload
                                        ## xmm1 = xmm1[0],mem[1,2,3]
	movaps	-160(%rbp), %xmm2       ## 16-byte Reload
	movaps	-144(%rbp), %xmm3       ## 16-byte Reload
	cmpl	$16, %ebx
	jg	LBB160_7
LBB160_2:                               ## =>This Inner Loop Header: Depth=1
	movaps	%xmm2, %xmm4
	subss	%xmm0, %xmm4
	movaps	%xmm3, %xmm5
	subss	%xmm1, %xmm5
	movshdup	%xmm0, %xmm7    ## xmm7 = xmm0[1,1,3,3]
	movaps	%xmm7, %xmm6
	subss	%xmm2, %xmm6
	movshdup	%xmm1, %xmm10   ## xmm10 = xmm1[1,1,3,3]
	mulss	%xmm4, %xmm4
	mulss	%xmm5, %xmm5
	addss	%xmm4, %xmm5
	movaps	%xmm10, %xmm4
	subss	%xmm3, %xmm4
	mulss	%xmm6, %xmm6
	mulss	%xmm4, %xmm4
	addss	%xmm6, %xmm4
	movaps	-48(%rbp), %xmm9        ## 16-byte Reload
	movaps	%xmm9, %xmm6
	subss	%xmm7, %xmm6
	cvtss2sd	%xmm5, %xmm5
	sqrtsd	%xmm5, %xmm5
	cvtss2sd	%xmm4, %xmm4
	sqrtsd	%xmm4, %xmm4
	addsd	%xmm5, %xmm4
	movaps	-64(%rbp), %xmm8        ## 16-byte Reload
	movaps	%xmm8, %xmm5
	subss	%xmm10, %xmm5
	mulss	%xmm6, %xmm6
	mulss	%xmm5, %xmm5
	addss	%xmm6, %xmm5
	movaps	%xmm9, %xmm6
	subss	%xmm0, %xmm6
	cvtss2sd	%xmm5, %xmm5
	sqrtsd	%xmm5, %xmm5
	addsd	%xmm4, %xmm5
	movaps	%xmm8, %xmm4
	subss	%xmm1, %xmm4
	mulss	%xmm6, %xmm6
	mulss	%xmm4, %xmm4
	addss	%xmm6, %xmm4
	cvtsd2ss	%xmm5, %xmm5
	sqrtss	%xmm4, %xmm4
	mulss	%xmm5, %xmm5
	mulss	%xmm4, %xmm4
	subss	%xmm4, %xmm5
	movss	16(%rbp), %xmm6         ## xmm6 = mem[0],zero,zero,zero
	ucomiss	%xmm6, %xmm5
	ja	LBB160_3
## %bb.4:
	movslq	(%r14), %rax
	testq	%r15, %r15
	je	LBB160_6
## %bb.5:
	movss	%xmm9, (%r15,%rax,8)
	movss	%xmm8, 4(%r15,%rax,8)
LBB160_6:
	incl	%eax
	movl	%eax, (%r14)
LBB160_7:
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__sort_edges_quicksort
_stbtt__sort_edges_quicksort:           ## @stbtt__sort_edges_quicksort
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpl	$13, %esi
	jl	LBB161_15
## %bb.1:
	movl	%esi, %r14d
	movq	%rdi, %r15
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB161_2:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB161_5 Depth 2
                                        ##       Child Loop BB161_6 Depth 3
                                        ##       Child Loop BB161_8 Depth 3
	movl	%r14d, %eax
	shrl	%eax
	movss	4(%r15), %xmm0          ## xmm0 = mem[0],zero,zero,zero
	leaq	(%rax,%rax,4), %rcx
	movss	4(%r15,%rcx,4), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm1
	seta	%dil
	leal	-1(%r14), %eax
	movslq	%eax, %rdx
	leaq	(%rdx,%rdx,4), %rsi
	movss	4(%r15,%rsi,4), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm2
	leaq	(%r15,%rcx,4), %rcx
	seta	%bl
	xorb	%dil, %bl
	je	LBB161_4
## %bb.3:                               ##   in Loop: Header=BB161_2 Depth=1
	ucomiss	%xmm1, %xmm2
	seta	%sil
	ucomiss	%xmm0, %xmm2
	setbe	%bl
	xorb	%sil, %bl
	cmovneq	%r13, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	movl	16(%r15,%rdx,4), %esi
	movl	%esi, -48(%rbp)
	movq	(%r15,%rdx,4), %rsi
	movq	8(%r15,%rdx,4), %rdi
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	16(%rcx), %esi
	movl	%esi, 16(%r15,%rdx,4)
	movq	(%rcx), %rsi
	movq	8(%rcx), %rdi
	movq	%rdi, 8(%r15,%rdx,4)
	movq	%rsi, (%r15,%rdx,4)
	movl	-48(%rbp), %edx
	movl	%edx, 16(%rcx)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	%rsi, 8(%rcx)
	movq	%rdx, (%rcx)
LBB161_4:                               ##   in Loop: Header=BB161_2 Depth=1
	movl	16(%r15), %edx
	movl	%edx, -48(%rbp)
	movq	(%r15), %rdx
	movq	8(%r15), %rsi
	movq	%rsi, -56(%rbp)
	movq	%rdx, -64(%rbp)
	movl	16(%rcx), %edx
	movl	%edx, 16(%r15)
	movq	(%rcx), %rdx
	movq	8(%rcx), %rsi
	movq	%rsi, 8(%r15)
	movq	%rdx, (%r15)
	movl	-48(%rbp), %edx
	movl	%edx, 16(%rcx)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	%rsi, 8(%rcx)
	movq	%rdx, (%rcx)
	leaq	20(%r15), %r8
	movl	$1, %edx
	jmp	LBB161_5
	.p2align	4, 0x90
LBB161_10:                              ##   in Loop: Header=BB161_5 Depth=2
	movl	16(%r15,%rbx), %esi
	movl	%esi, -48(%rbp)
	movq	(%r15,%rbx), %rsi
	movq	8(%r15,%rbx), %rcx
	movq	%rcx, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	16(%rdi), %ecx
	movl	%ecx, 16(%r15,%rbx)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rsi
	movq	%rsi, 8(%r15,%rbx)
	movq	%rcx, (%r15,%rbx)
	movl	-48(%rbp), %ecx
	movl	%ecx, 16(%rdi)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rsi
	movq	%rsi, 8(%rdi)
	movq	%rcx, (%rdi)
LBB161_5:                               ##   Parent Loop BB161_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB161_6 Depth 3
                                        ##       Child Loop BB161_8 Depth 3
	movss	4(%r15), %xmm0          ## xmm0 = mem[0],zero,zero,zero
	movslq	%edx, %rdx
	leal	-1(%rdx), %esi
	leaq	(%rdx,%rdx,4), %rdi
	leaq	-20(,%rdi,4), %rbx
	.p2align	4, 0x90
LBB161_6:                               ##   Parent Loop BB161_2 Depth=1
                                        ##     Parent Loop BB161_5 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	incq	%rdx
	incl	%esi
	ucomiss	24(%r15,%rbx), %xmm0
	leaq	20(%rbx), %rbx
	ja	LBB161_6
## %bb.7:                               ##   in Loop: Header=BB161_5 Depth=2
	movslq	%eax, %rdi
	leaq	(%rdi,%rdi,4), %rdi
	leaq	(%r8,%rdi,4), %rdi
	.p2align	4, 0x90
LBB161_8:                               ##   Parent Loop BB161_2 Depth=1
                                        ##     Parent Loop BB161_5 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movss	-16(%rdi), %xmm1        ## xmm1 = mem[0],zero,zero,zero
	decl	%eax
	addq	$-20, %rdi
	ucomiss	%xmm0, %xmm1
	ja	LBB161_8
## %bb.9:                               ##   in Loop: Header=BB161_5 Depth=2
	leal	1(%rax), %r12d
	cmpl	%r12d, %esi
	jl	LBB161_10
## %bb.11:                              ##   in Loop: Header=BB161_2 Depth=1
	subl	%esi, %r14d
	addq	%r15, %rbx
	cmpl	%r12d, %r14d
	jle	LBB161_13
## %bb.12:                              ##   in Loop: Header=BB161_2 Depth=1
	movq	%r15, %rdi
	movl	%r12d, %esi
	callq	_stbtt__sort_edges_quicksort
	movl	%r14d, %r12d
	movq	%rbx, %r15
	jmp	LBB161_14
	.p2align	4, 0x90
LBB161_13:                              ##   in Loop: Header=BB161_2 Depth=1
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_stbtt__sort_edges_quicksort
LBB161_14:                              ##   in Loop: Header=BB161_2 Depth=1
	movl	%r12d, %r14d
	cmpl	$12, %r12d
	jg	LBB161_2
LBB161_15:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function stbtt__handle_clipped_edge
LCPI162_0:
	.long	3204448256              ## float -0.5
LCPI162_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_stbtt__handle_clipped_edge:            ## @stbtt__handle_clipped_edge
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $esi killed $esi def $rsi
	ucomiss	%xmm3, %xmm1
	jne	LBB162_1
	jp	LBB162_1
LBB162_35:
	popq	%rbp
	retq
LBB162_1:
	ucomiss	%xmm1, %xmm3
	jbe	LBB162_36
## %bb.2:
	movss	24(%rdx), %xmm5         ## xmm5 = mem[0],zero,zero,zero
	movss	28(%rdx), %xmm4         ## xmm4 = mem[0],zero,zero,zero
	ucomiss	%xmm5, %xmm4
	jb	LBB162_37
## %bb.3:
	ucomiss	%xmm3, %xmm5
	ja	LBB162_35
## %bb.4:
	ucomiss	%xmm4, %xmm1
	ja	LBB162_35
## %bb.5:
	ucomiss	%xmm1, %xmm5
	jbe	LBB162_6
## %bb.7:
	movaps	%xmm2, %xmm6
	subss	%xmm0, %xmm6
	movaps	%xmm5, %xmm7
	subss	%xmm1, %xmm7
	mulss	%xmm6, %xmm7
	movaps	%xmm3, %xmm6
	subss	%xmm1, %xmm6
	divss	%xmm6, %xmm7
	addss	%xmm7, %xmm0
	ucomiss	%xmm4, %xmm3
	ja	LBB162_10
LBB162_9:
	movaps	%xmm3, %xmm4
	jmp	LBB162_11
LBB162_6:
	movaps	%xmm1, %xmm5
	ucomiss	%xmm4, %xmm3
	jbe	LBB162_9
LBB162_10:
	movaps	%xmm2, %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm4, %xmm6
	subss	%xmm3, %xmm6
	mulss	%xmm1, %xmm6
	subss	%xmm5, %xmm3
	divss	%xmm3, %xmm6
	addss	%xmm6, %xmm2
LBB162_11:
	xorps	%xmm1, %xmm1
	cvtsi2ssl	%esi, %xmm1
	leal	1(%rsi), %eax
	xorps	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	ucomiss	%xmm1, %xmm0
	jne	LBB162_14
	jp	LBB162_14
## %bb.12:
	ucomiss	%xmm2, %xmm3
	jae	LBB162_25
## %bb.13:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.111(%rip), %rcx
	movl	$3045, %edx             ## imm = 0xBE5
	callq	___assert_rtn
LBB162_14:
	ucomiss	%xmm3, %xmm0
	jne	LBB162_17
	jp	LBB162_17
## %bb.15:
	ucomiss	%xmm1, %xmm2
	jae	LBB162_25
## %bb.16:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.112(%rip), %rcx
	movl	$3047, %edx             ## imm = 0xBE7
	callq	___assert_rtn
LBB162_17:
	ucomiss	%xmm0, %xmm1
	jae	LBB162_18
## %bb.20:
	ucomiss	%xmm3, %xmm0
	jae	LBB162_21
## %bb.23:
	ucomiss	%xmm1, %xmm2
	jb	LBB162_38
## %bb.24:
	ucomiss	%xmm2, %xmm3
	jae	LBB162_25
LBB162_38:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.115(%rip), %rcx
	movl	$3053, %edx             ## imm = 0xBED
	callq	___assert_rtn
LBB162_18:
	ucomiss	%xmm2, %xmm1
	jae	LBB162_25
## %bb.19:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.113(%rip), %rcx
	movl	$3049, %edx             ## imm = 0xBE9
	callq	___assert_rtn
LBB162_21:
	ucomiss	%xmm3, %xmm2
	jb	LBB162_22
LBB162_25:
	ucomiss	%xmm0, %xmm1
	jb	LBB162_28
## %bb.26:
	ucomiss	%xmm2, %xmm1
	jb	LBB162_28
## %bb.27:
	subss	%xmm5, %xmm4
	mulss	20(%rdx), %xmm4
	movslq	%esi, %rax
	addss	(%rdi,%rax,4), %xmm4
	movss	%xmm4, (%rdi,%rax,4)
	popq	%rbp
	retq
LBB162_28:
	ucomiss	%xmm3, %xmm0
	jb	LBB162_30
## %bb.29:
	ucomiss	%xmm3, %xmm2
	jae	LBB162_35
LBB162_30:
	ucomiss	%xmm2, %xmm3
	jb	LBB162_39
## %bb.31:
	ucomiss	%xmm1, %xmm0
	jb	LBB162_39
## %bb.32:
	ucomiss	%xmm0, %xmm3
	jb	LBB162_39
## %bb.33:
	ucomiss	%xmm1, %xmm2
	jb	LBB162_39
## %bb.34:
	subss	%xmm5, %xmm4
	mulss	20(%rdx), %xmm4
	subss	%xmm1, %xmm0
	subss	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	mulss	LCPI162_0(%rip), %xmm2
	addss	LCPI162_1(%rip), %xmm2
	mulss	%xmm4, %xmm2
	movslq	%esi, %rax
	addss	(%rdi,%rax,4), %xmm2
	movss	%xmm2, (%rdi,%rax,4)
	popq	%rbp
	retq
LBB162_36:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.109(%rip), %rcx
	movl	$3031, %edx             ## imm = 0xBD7
	callq	___assert_rtn
LBB162_37:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.110(%rip), %rcx
	movl	$3032, %edx             ## imm = 0xBD8
	callq	___assert_rtn
LBB162_39:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.116(%rip), %rcx
	movl	$3060, %edx             ## imm = 0xBF4
	callq	___assert_rtn
LBB162_22:
	leaq	L___func__.stbtt__handle_clipped_edge(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.114(%rip), %rcx
	movl	$3051, %edx             ## imm = 0xBEB
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__isfont
_stbtt__isfont:                         ## @stbtt__isfont
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	(%rdi), %al
	cmpb	$78, %al
	jg	LBB163_7
## %bb.1:
	testb	%al, %al
	je	LBB163_16
## %bb.2:
	cmpb	$49, %al
	jne	LBB163_22
## %bb.3:
	cmpb	$0, 1(%rdi)
	jne	LBB163_22
## %bb.4:
	cmpb	$0, 2(%rdi)
	jne	LBB163_22
## %bb.5:
	cmpb	$0, 3(%rdi)
	jne	LBB163_22
## %bb.6:
	movl	$1, %eax
	popq	%rbp
	retq
LBB163_7:
	cmpb	$79, %al
	je	LBB163_13
## %bb.8:
	cmpb	$116, %al
	jne	LBB163_22
## %bb.9:
	movb	1(%rdi), %al
	cmpb	$114, %al
	je	LBB163_20
## %bb.10:
	cmpb	$121, %al
	jne	LBB163_22
## %bb.11:
	cmpb	$112, 2(%rdi)
	jne	LBB163_22
## %bb.12:
	movl	$1, %eax
	cmpb	$49, 3(%rdi)
	je	LBB163_23
	jmp	LBB163_22
LBB163_16:
	cmpb	$1, 1(%rdi)
	jne	LBB163_22
## %bb.17:
	cmpb	$0, 2(%rdi)
	jne	LBB163_22
## %bb.18:
	cmpb	$0, 3(%rdi)
	jne	LBB163_22
## %bb.19:
	movl	$1, %eax
	popq	%rbp
	retq
LBB163_13:
	cmpb	$84, 1(%rdi)
	jne	LBB163_22
## %bb.14:
	cmpb	$84, 2(%rdi)
	jne	LBB163_22
## %bb.15:
	movl	$1, %eax
	cmpb	$79, 3(%rdi)
	jne	LBB163_22
LBB163_23:
	popq	%rbp
	retq
LBB163_20:
	cmpb	$117, 2(%rdi)
	jne	LBB163_22
## %bb.21:
	movl	$1, %eax
	cmpb	$101, 3(%rdi)
	je	LBB163_23
LBB163_22:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__matchpair
_stbtt__matchpair:                      ## @stbtt__matchpair
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, -68(%rbp)         ## 4-byte Spill
	movl	%ecx, -44(%rbp)         ## 4-byte Spill
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, %r14
	movl	%esi, %edx
	movzbl	2(%rdi,%rdx), %ecx
	shlq	$8, %rcx
	movzbl	3(%rdi,%rdx), %edi
	orq	%rcx, %rdi
	xorl	%eax, %eax
	testl	%edi, %edi
	je	LBB164_21
## %bb.1:
	movl	%esi, %r15d
	movzbl	4(%r14,%rdx), %ecx
	shll	$8, %ecx
	movzbl	5(%r14,%rdx), %eax
	orl	%ecx, %eax
	addl	%esi, %eax
	addl	$6, %r15d
	cltq
	addq	%r14, %rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movl	$1, %r12d
	movl	%r8d, -52(%rbp)         ## 4-byte Spill
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB164_2:                               ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %r15d
	movzbl	6(%r14,%r15), %eax
	shll	$8, %eax
	movzbl	7(%r14,%r15), %ecx
	orl	%eax, %ecx
	cmpl	%r8d, %ecx
	jne	LBB164_17
## %bb.3:                               ##   in Loop: Header=BB164_2 Depth=1
	movzwl	(%r14,%r15), %r13d
	movzwl	2(%r14,%r15), %ebx
	rolw	$8, %r13w
	rolw	$8, %bx
	movzwl	4(%r14,%r15), %eax
	movw	%ax, -46(%rbp)          ## 2-byte Spill
	testw	%r13w, %r13w
	je	LBB164_6
## %bb.4:                               ##   in Loop: Header=BB164_2 Depth=1
	cmpw	$1, %bx
	sete	%al
	cmpw	$10, %bx
	sete	%cl
	cmpw	$3, %r13w
	jne	LBB164_17
## %bb.5:                               ##   in Loop: Header=BB164_2 Depth=1
	orb	%cl, %al
	je	LBB164_17
LBB164_6:                               ##   in Loop: Header=BB164_2 Depth=1
	movzbl	8(%r14,%r15), %eax
	shll	$8, %eax
	movzbl	9(%r14,%r15), %ecx
	orl	%eax, %ecx
	movzbl	10(%r14,%r15), %eax
	shlq	$8, %rax
	movzbl	11(%r14,%r15), %edx
	orq	%rax, %rdx
	addq	-80(%rbp), %rdx         ## 8-byte Folded Reload
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movl	-44(%rbp), %esi         ## 4-byte Reload
	callq	_stbtt__CompareUTF8toUTF16_bigendian_prefix
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movl	-52(%rbp), %r8d         ## 4-byte Reload
	testl	%eax, %eax
	js	LBB164_17
## %bb.7:                               ##   in Loop: Header=BB164_2 Depth=1
	cmpq	%rdi, %r12
	jae	LBB164_16
## %bb.8:                               ##   in Loop: Header=BB164_2 Depth=1
	movzbl	18(%r14,%r15), %ecx
	shll	$8, %ecx
	movzbl	19(%r14,%r15), %edx
	orl	%ecx, %edx
	cmpl	-68(%rbp), %edx         ## 4-byte Folded Reload
	jne	LBB164_16
## %bb.9:                               ##   in Loop: Header=BB164_2 Depth=1
	movzwl	12(%r14,%r15), %ecx
	rolw	$8, %cx
	cmpw	%r13w, %cx
	jne	LBB164_16
## %bb.10:                              ##   in Loop: Header=BB164_2 Depth=1
	movzwl	14(%r14,%r15), %ecx
	rolw	$8, %cx
	cmpw	%bx, %cx
	jne	LBB164_16
## %bb.11:                              ##   in Loop: Header=BB164_2 Depth=1
	movzwl	-46(%rbp), %edx         ## 2-byte Folded Reload
	rolw	$8, %dx
	movzwl	16(%r14,%r15), %ecx
	rolw	$8, %cx
	cmpw	%dx, %cx
	jne	LBB164_16
## %bb.12:                              ##   in Loop: Header=BB164_2 Depth=1
	movzbl	20(%r14,%r15), %edx
	shll	$8, %edx
	movzbl	21(%r14,%r15), %ecx
	orl	%edx, %ecx
	testw	%cx, %cx
	je	LBB164_16
## %bb.13:                              ##   in Loop: Header=BB164_2 Depth=1
	cmpl	-44(%rbp), %eax         ## 4-byte Folded Reload
	jge	LBB164_17
## %bb.14:                              ##   in Loop: Header=BB164_2 Depth=1
	movslq	%eax, %rsi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	cmpb	$32, (%rdx,%rsi)
	jne	LBB164_17
## %bb.15:                              ##   in Loop: Header=BB164_2 Depth=1
	movzbl	22(%r14,%r15), %edi
	shlq	$8, %rdi
	movzbl	23(%r14,%r15), %edx
	orq	%rdi, %rdx
	incl	%eax
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	leaq	1(%rdi,%rsi), %rdi
	movl	-44(%rbp), %ebx         ## 4-byte Reload
	subl	%eax, %ebx
	addq	-80(%rbp), %rdx         ## 8-byte Folded Reload
	movl	%ebx, %esi
	callq	_stbtt__CompareUTF8toUTF16_bigendian_prefix
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movl	-52(%rbp), %r8d         ## 4-byte Reload
	cmpl	%ebx, %eax
	jne	LBB164_17
	jmp	LBB164_20
	.p2align	4, 0x90
LBB164_16:                              ##   in Loop: Header=BB164_2 Depth=1
	cmpl	-44(%rbp), %eax         ## 4-byte Folded Reload
	je	LBB164_20
LBB164_17:                              ##   in Loop: Header=BB164_2 Depth=1
	addl	$12, %r15d
	cmpq	%rdi, %r12
	leaq	1(%r12), %r12
	jb	LBB164_2
## %bb.18:
	xorl	%eax, %eax
LBB164_21:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB164_20:
	movl	$1, %eax
	jmp	LBB164_21
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function stbtt__CompareUTF8toUTF16_bigendian_prefix
_stbtt__CompareUTF8toUTF16_bigendian_prefix: ## @stbtt__CompareUTF8toUTF16_bigendian_prefix
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testl	%ecx, %ecx
	je	LBB165_1
## %bb.2:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
LBB165_3:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdx), %r11d
	movl	%r11d, %r9d
	shll	$8, %r9d
	movzbl	1(%rdx), %r10d
	orl	%r10d, %r9d
	cmpl	$127, %r9d
	ja	LBB165_7
## %bb.4:                               ##   in Loop: Header=BB165_3 Depth=1
	movl	$-1, %eax
	cmpl	%esi, %r8d
	jge	LBB165_26
## %bb.5:                               ##   in Loop: Header=BB165_3 Depth=1
	movslq	%r8d, %rbx
	movzbl	(%rdi,%rbx), %ebx
	cmpl	%ebx, %r9d
	jne	LBB165_26
## %bb.6:                               ##   in Loop: Header=BB165_3 Depth=1
	incl	%r8d
	jmp	LBB165_25
	.p2align	4, 0x90
LBB165_7:                               ##   in Loop: Header=BB165_3 Depth=1
	cmpl	$2047, %r9d             ## imm = 0x7FF
	ja	LBB165_12
## %bb.8:                               ##   in Loop: Header=BB165_3 Depth=1
	movslq	%r8d, %rbx
	leaq	1(%rbx), %r11
	movl	$-1, %eax
	cmpl	%esi, %r11d
	jge	LBB165_26
## %bb.9:                               ##   in Loop: Header=BB165_3 Depth=1
	movzbl	(%rdi,%rbx), %ebx
	shrl	$6, %r9d
	addl	$192, %r9d
	cmpl	%ebx, %r9d
	jne	LBB165_26
## %bb.10:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	(%rdi,%r11), %ebx
	andl	$63, %r10d
	orl	$128, %r10d
	cmpl	%ebx, %r10d
	jne	LBB165_26
## %bb.11:                              ##   in Loop: Header=BB165_3 Depth=1
	addl	$2, %r8d
	jmp	LBB165_25
	.p2align	4, 0x90
LBB165_12:                              ##   in Loop: Header=BB165_3 Depth=1
	movl	%r11d, %ebx
	andl	$-4, %ebx
	cmpl	$216, %ebx
	jne	LBB165_19
## %bb.13:                              ##   in Loop: Header=BB165_3 Depth=1
	movslq	%r8d, %r11
	leaq	3(%r11), %r10
	movl	$-1, %eax
	cmpl	%esi, %r10d
	jge	LBB165_26
## %bb.14:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	2(%rdx), %ebx
	movzbl	3(%rdx), %r14d
	shll	$8, %ebx
	orl	%r14d, %ebx
	shll	$10, %r9d
	leal	-56613888(%r9,%rbx), %r9d
	movzbl	(%rdi,%r11), %r14d
	movl	%r9d, %ebx
	shrl	$18, %ebx
	addl	$240, %ebx
	cmpl	%r14d, %ebx
	jne	LBB165_26
## %bb.15:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	1(%rdi,%r11), %r14d
	movl	%r9d, %ebx
	shrl	$12, %ebx
	andl	$63, %ebx
	orl	$128, %ebx
	cmpl	%r14d, %ebx
	jne	LBB165_26
## %bb.16:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	2(%rdi,%r11), %r11d
	movl	%r9d, %ebx
	shrl	$6, %ebx
	andl	$63, %ebx
	orl	$128, %ebx
	cmpl	%r11d, %ebx
	jne	LBB165_26
## %bb.17:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	(%rdi,%r10), %ebx
	andl	$63, %r9d
	orl	$128, %r9d
	cmpl	%ebx, %r9d
	jne	LBB165_26
## %bb.18:                              ##   in Loop: Header=BB165_3 Depth=1
	addq	$2, %rdx
	addl	$4, %r8d
	addl	$-2, %ecx
	jmp	LBB165_25
LBB165_19:                              ##   in Loop: Header=BB165_3 Depth=1
	movslq	%r8d, %r15
	leaq	2(%r15), %r14
	movl	$-1, %eax
	cmpl	%esi, %r14d
	jge	LBB165_26
## %bb.20:                              ##   in Loop: Header=BB165_3 Depth=1
	cmpl	$220, %ebx
	je	LBB165_26
## %bb.21:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	(%rdi,%r15), %ebx
	shrl	$4, %r11d
	orl	$224, %r11d
	cmpl	%ebx, %r11d
	jne	LBB165_26
## %bb.22:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	1(%rdi,%r15), %ebx
	shrl	$6, %r9d
	andl	$63, %r9d
	orl	$128, %r9d
	cmpl	%ebx, %r9d
	jne	LBB165_26
## %bb.23:                              ##   in Loop: Header=BB165_3 Depth=1
	movzbl	(%rdi,%r14), %ebx
	andl	$63, %r10d
	orl	$128, %r10d
	cmpl	%ebx, %r10d
	jne	LBB165_26
## %bb.24:                              ##   in Loop: Header=BB165_3 Depth=1
	addl	$3, %r8d
	.p2align	4, 0x90
LBB165_25:                              ##   in Loop: Header=BB165_3 Depth=1
	addq	$2, %rdx
	movl	%r8d, %eax
	addl	$-2, %ecx
	jne	LBB165_3
	jmp	LBB165_26
LBB165_1:
	xorl	%eax, %eax
LBB165_26:
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.tbss _stbi__g_failure_reason$tlv$init, 8, 3 ## @stbi__g_failure_reason

	.section	__DATA,__thread_vars,thread_local_variables
_stbi__g_failure_reason:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__g_failure_reason$tlv$init

.zerofill __DATA,__bss,_stbi__vertically_flip_on_load_global,4,2 ## @stbi__vertically_flip_on_load_global
.tbss _stbi__vertically_flip_on_load_local$tlv$init, 4, 2 ## @stbi__vertically_flip_on_load_local

_stbi__vertically_flip_on_load_local:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__vertically_flip_on_load_local$tlv$init

.tbss _stbi__vertically_flip_on_load_set$tlv$init, 1, 2 ## @stbi__vertically_flip_on_load_set

_stbi__vertically_flip_on_load_set:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__vertically_flip_on_load_set$tlv$init

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"rb"

L_.str.1:                               ## @.str.1
	.asciz	"can't fopen"

	.section	__DATA,__data
	.p2align	2               ## @stbi__l2h_gamma
_stbi__l2h_gamma:
	.long	1074580685              ## float 2.20000005

	.p2align	2               ## @stbi__l2h_scale
_stbi__l2h_scale:
	.long	1065353216              ## float 1

.zerofill __DATA,__bss,_stbi__unpremultiply_on_load_global,4,2 ## @stbi__unpremultiply_on_load_global
.zerofill __DATA,__bss,_stbi__de_iphone_flag_global,4,2 ## @stbi__de_iphone_flag_global
.tbss _stbi__unpremultiply_on_load_local$tlv$init, 4, 2 ## @stbi__unpremultiply_on_load_local

	.section	__DATA,__thread_vars,thread_local_variables
_stbi__unpremultiply_on_load_local:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__unpremultiply_on_load_local$tlv$init

.tbss _stbi__unpremultiply_on_load_set$tlv$init, 1, 2 ## @stbi__unpremultiply_on_load_set

_stbi__unpremultiply_on_load_set:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__unpremultiply_on_load_set$tlv$init

.tbss _stbi__de_iphone_flag_local$tlv$init, 4, 2 ## @stbi__de_iphone_flag_local

_stbi__de_iphone_flag_local:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__de_iphone_flag_local$tlv$init

.tbss _stbi__de_iphone_flag_set$tlv$init, 1, 2 ## @stbi__de_iphone_flag_set

_stbi__de_iphone_flag_set:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_stbi__de_iphone_flag_set$tlv$init

	.section	__TEXT,__cstring,cstring_literals
L___func__.stbtt_FindGlyphIndex:        ## @__func__.stbtt_FindGlyphIndex
	.asciz	"stbtt_FindGlyphIndex"

L_.str.2:                               ## @.str.2
	.asciz	"code/stb_truetype.h"

L_.str.3:                               ## @.str.3
	.asciz	"0"

L___func__.stbtt_PackSetOversampling:   ## @__func__.stbtt_PackSetOversampling
	.asciz	"stbtt_PackSetOversampling"

L_.str.5:                               ## @.str.5
	.asciz	"h_oversample <= 8"

L_.str.6:                               ## @.str.6
	.asciz	"v_oversample <= 8"

L___func__.stbtt_GetGlyphSDF:           ## @__func__.stbtt_GetGlyphSDF
	.asciz	"stbtt_GetGlyphSDF"

L_.str.7:                               ## @.str.7
	.asciz	"i != 0"

L_.str.9:                               ## @.str.9
	.asciz	"failed to load %s\n"

L___func__.load_image:                  ## @__func__.load_image
	.asciz	"load_image"

L_.str.10:                              ## @.str.10
	.asciz	"code/main.c"

L_.str.11:                              ## @.str.11
	.asciz	"n == 3 || n == 4"

L_.str.12:                              ## @.str.12
	.asciz	"r"

L_.str.13:                              ## @.str.13
	.asciz	"failed to load file: %s\n"

L___func__.load_entire_file:            ## @__func__.load_entire_file
	.asciz	"load_entire_file"

L_.str.14:                              ## @.str.14
	.asciz	"f"

L_.str.15:                              ## @.str.15
	.asciz	"result"

L___func__.draw_img:                    ## @__func__.draw_img
	.asciz	"draw_img"

L_.str.16:                              ## @.str.16
	.asciz	"code/draw.c"

L_.str.17:                              ## @.str.17
	.asciz	"(max_x - min_x) % 4 == 0"

.zerofill __DATA,__bss,_font_advance_x,4,2 ## @font_advance_x
.zerofill __DATA,__bss,_font_line_height,1,2 ## @font_line_height
L___func__.draw_char:                   ## @__func__.draw_char
	.asciz	"draw_char"

.zerofill __DATA,__bss,_font_bitmaps,2048,4 ## @font_bitmaps
	.comm	_entry_curr,4,2         ## @entry_curr
	.comm	_entry_count,4,2        ## @entry_count
.zerofill __DATA,__bss,_entries,1408000,4 ## @entries
	.comm	_entry_completed,4,2    ## @entry_completed
	.comm	_semaphore,8,3          ## @semaphore
L___func__.visual_col_to_text_col:      ## @__func__.visual_col_to_text_col
	.asciz	"visual_col_to_text_col"

L_.str.18:                              ## @.str.18
	.asciz	"code/texor.c"

L___func__.buffer_erase_range:          ## @__func__.buffer_erase_range
	.asciz	"buffer_erase_range"

L_.str.19:                              ## @.str.19
	.asciz	"start <= end"

L___func__.do_command_:                 ## @__func__.do_command_
	.asciz	"do_command_"

L_.str.20:                              ## @.str.20
	.asciz	"buffer->undo_count < (int)array_length(buffer->undo)"

L_.str.21:                              ## @.str.21
	.asciz	"c->erased_text"

L_.str.22:                              ## @.str.22
	.asciz	"c->erase_range_start + len - 1 < buffer->size"

L___func__.update_and_render_buffer:    ## @__func__.update_and_render_buffer
	.asciz	"update_and_render_buffer"

L_.str.23:                              ## @.str.23
	.asciz	"buffer->cursor_pos >= 0 && buffer->cursor_pos < buffer->size"

L_.str.24:                              ## @.str.24
	.asciz	"text_height % font_line_height == 0"

.zerofill __DATA,__bss,_clipboard,8,3   ## @clipboard
	.comm	_start,16,3             ## @start
	.comm	_main_is_waiting,4,2    ## @main_is_waiting
L_.str.26:                              ## @.str.26
	.asciz	"%d"

L_.str.27:                              ## @.str.27
	.asciz	"%s"

L_.str.28:                              ## @.str.28
	.asciz	"%d,%d    %d%%"

L_.str.29:                              ## @.str.29
	.asciz	"empty for now"

.zerofill __DATA,__bss,_active_buffer,8,3 ## @active_buffer
.zerofill __DATA,__bss,_test_image_count,1,2 ## @test_image_count
.zerofill __DATA,__bss,_update_and_render_buffer.frame,4,2 ## @update_and_render_buffer.frame
.zerofill __DATA,__bss,_test_image,1536,4 ## @test_image
	.globl	_nframes                ## @nframes
.zerofill __DATA,__common,_nframes,4,2
	.globl	_time_sum               ## @time_sum
.zerofill __DATA,__common,_time_sum,8,3
.zerofill __DATA,__bss,_update_and_render_the_editor.first_frame,1,2 ## @update_and_render_the_editor.first_frame
L_.str.30:                              ## @.str.30
	.asciz	"test"

.zerofill __DATA,__bss,_buffers,16780032,4 ## @buffers
.zerofill __DATA,__bss,_buffer_count,4,2 ## @buffer_count
L_.str.31:                              ## @.str.31
	.asciz	"cow.png"

L_.str.32:                              ## @.str.32
	.asciz	"%d %d\n"

L_.str.33:                              ## @.str.33
	.asciz	"liberation-mono.ttf"

L___func__.update_and_render_the_editor: ## @__func__.update_and_render_the_editor
	.asciz	"update_and_render_the_editor"

L_.str.34:                              ## @.str.34
	.asciz	"file"

L_.str.35:                              ## @.str.35
	.space	1

.zerofill __DATA,__bss,_should_quit,1,2 ## @should_quit
L_.str.36:                              ## @.str.36
	.asciz	"failed to write to file '%s'\n"

L_.str.37:                              ## @.str.37
	.asciz	"failed to open file '%s'\n"

	.comm	_finish,16,3            ## @finish
L_.str.38:                              ## @.str.38
	.asciz	"%f\n"

L_.str.39:                              ## @.str.39
	.asciz	"final time: %f\n"

	.section	__TEXT,__const
	.p2align	3               ## @__const.main.back_buffer
l___const.main.back_buffer:
	.long	1920                    ## 0x780
	.long	1080                    ## 0x438
	.long	0                       ## 0x0
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.40:                              ## @.str.40
	.asciz	"texor"

L___func__.main:                        ## @__func__.main
	.asciz	"main"

L_.str.41:                              ## @.str.41
	.asciz	"((uintptr_t)back_buffer.pixels & 15) == 0"

L_.str.42:                              ## @.str.42
	.asciz	"back_buffer.pixels"

L_.str.43:                              ## @.str.43
	.asciz	"window && renderer && screen_texture"

	.comm	_g_screen_buffer,8,3    ## @g_screen_buffer
	.section	__DATA,__const
	.p2align	3               ## @stbi__stdio_callbacks
_stbi__stdio_callbacks:
	.quad	_stbi__stdio_read
	.quad	_stbi__stdio_skip
	.quad	_stbi__stdio_eof

	.section	__TEXT,__cstring,cstring_literals
L___func__.stbi__load_and_postprocess_8bit: ## @__func__.stbi__load_and_postprocess_8bit
	.asciz	"stbi__load_and_postprocess_8bit"

L_.str.45:                              ## @.str.45
	.asciz	"code/stb_image.h"

L_.str.46:                              ## @.str.46
	.asciz	"ri.bits_per_channel == 8 || ri.bits_per_channel == 16"

L_.str.47:                              ## @.str.47
	.asciz	"unknown image type"

	.section	__TEXT,__const
_stbi__check_png_header.png_sig:        ## @stbi__check_png_header.png_sig
	.ascii	"\211PNG\r\n\032\n"

	.section	__TEXT,__cstring,cstring_literals
L_.str.48:                              ## @.str.48
	.asciz	"bad png sig"

L_.str.49:                              ## @.str.49
	.asciz	"bad req_comp"

L_.str.50:                              ## @.str.50
	.asciz	"bad bits_per_channel"

L_.str.51:                              ## @.str.51
	.asciz	"multiple IHDR"

L_.str.52:                              ## @.str.52
	.asciz	"bad IHDR len"

L_.str.53:                              ## @.str.53
	.asciz	"too large"

L_.str.54:                              ## @.str.54
	.asciz	"1/2/4/8/16-bit only"

L_.str.55:                              ## @.str.55
	.asciz	"bad ctype"

L_.str.56:                              ## @.str.56
	.asciz	"bad comp method"

L_.str.57:                              ## @.str.57
	.asciz	"bad filter method"

L_.str.58:                              ## @.str.58
	.asciz	"bad interlace method"

L_.str.59:                              ## @.str.59
	.asciz	"0-pixel image"

L_.str.60:                              ## @.str.60
	.asciz	"first not IHDR"

L_.str.61:                              ## @.str.61
	.asciz	"invalid PLTE"

L_.str.62:                              ## @.str.62
	.asciz	"tRNS after IDAT"

L_.str.63:                              ## @.str.63
	.asciz	"tRNS before PLTE"

L_.str.64:                              ## @.str.64
	.asciz	"bad tRNS len"

L_.str.65:                              ## @.str.65
	.asciz	"tRNS with alpha"

	.section	__TEXT,__const
_stbi__depth_scale_table:               ## @stbi__depth_scale_table
	.ascii	"\000\377U\000\021\000\000\000\001"

	.section	__TEXT,__cstring,cstring_literals
L_.str.66:                              ## @.str.66
	.asciz	"no PLTE"

L_.str.67:                              ## @.str.67
	.asciz	"outofmem"

L_.str.68:                              ## @.str.68
	.asciz	"outofdata"

L_.str.69:                              ## @.str.69
	.asciz	"no IDAT"

	.section	__DATA,__data
	.p2align	4               ## @stbi__parse_png_file.invalid_chunk
_stbi__parse_png_file.invalid_chunk:
	.asciz	"XXXX PNG chunk not known"

	.section	__TEXT,__const
	.p2align	4               ## @__const.stbi__create_png_image.xorig
l___const.stbi__create_png_image.xorig:
	.long	0                       ## 0x0
	.long	4                       ## 0x4
	.long	0                       ## 0x0
	.long	2                       ## 0x2
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	0                       ## 0x0

	.p2align	4               ## @__const.stbi__create_png_image.yorig
l___const.stbi__create_png_image.yorig:
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	4                       ## 0x4
	.long	0                       ## 0x0
	.long	2                       ## 0x2
	.long	0                       ## 0x0
	.long	1                       ## 0x1

	.p2align	4               ## @__const.stbi__create_png_image.xspc
l___const.stbi__create_png_image.xspc:
	.long	8                       ## 0x8
	.long	8                       ## 0x8
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	2                       ## 0x2
	.long	2                       ## 0x2
	.long	1                       ## 0x1

	.p2align	4               ## @__const.stbi__create_png_image.yspc
l___const.stbi__create_png_image.yspc:
	.long	8                       ## 0x8
	.long	8                       ## 0x8
	.long	8                       ## 0x8
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	2                       ## 0x2
	.long	2                       ## 0x2

	.section	__TEXT,__cstring,cstring_literals
L___func__.stbi__create_png_image_raw:  ## @__func__.stbi__create_png_image_raw
	.asciz	"stbi__create_png_image_raw"

L_.str.70:                              ## @.str.70
	.asciz	"out_n == s->img_n || out_n == s->img_n+1"

L_.str.71:                              ## @.str.71
	.asciz	"not enough pixels"

L_.str.72:                              ## @.str.72
	.asciz	"invalid filter"

L_.str.73:                              ## @.str.73
	.asciz	"invalid width"

	.section	__TEXT,__const
_first_row_filter:                      ## @first_row_filter
	.ascii	"\000\001\000\005\006"

	.section	__TEXT,__cstring,cstring_literals
L_.str.74:                              ## @.str.74
	.asciz	"img_n+1 == out_n"

L_.str.75:                              ## @.str.75
	.asciz	"img_n == 3"

L___func__.stbi__compute_transparency16: ## @__func__.stbi__compute_transparency16
	.asciz	"stbi__compute_transparency16"

L_.str.76:                              ## @.str.76
	.asciz	"out_n == 2 || out_n == 4"

L___func__.stbi__compute_transparency:  ## @__func__.stbi__compute_transparency
	.asciz	"stbi__compute_transparency"

L___func__.stbi__de_iphone:             ## @__func__.stbi__de_iphone
	.asciz	"stbi__de_iphone"

L_.str.77:                              ## @.str.77
	.asciz	"s->img_out_n == 4"

L___func__.stbi__convert_format:        ## @__func__.stbi__convert_format
	.asciz	"stbi__convert_format"

L___func__.stbi__convert_format16:      ## @__func__.stbi__convert_format16
	.asciz	"stbi__convert_format16"

L___func__.stbi__load_and_postprocess_16bit: ## @__func__.stbi__load_and_postprocess_16bit
	.asciz	"stbi__load_and_postprocess_16bit"

	.section	__TEXT,__const
	.p2align	4               ## @stbi__zdefault_length
_stbi__zdefault_length:
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\b\b\b\b\b\b\b\b"

	.p2align	4               ## @stbi__zdefault_distance
_stbi__zdefault_distance:
	.space	32,5

	.section	__TEXT,__cstring,cstring_literals
L_.str.79:                              ## @.str.79
	.asciz	"bad zlib header"

L_.str.80:                              ## @.str.80
	.asciz	"no preset dict"

L_.str.81:                              ## @.str.81
	.asciz	"bad compression"

L_.str.82:                              ## @.str.82
	.asciz	"zlib corrupt"

L_.str.83:                              ## @.str.83
	.asciz	"read past buffer"

L_.str.84:                              ## @.str.84
	.asciz	"output buffer limit"

L_.str.85:                              ## @.str.85
	.asciz	"bad sizes"

L_.str.86:                              ## @.str.86
	.asciz	"bad codelengths"

	.section	__TEXT,__const
	.p2align	4               ## @stbi__compute_huffman_codes.length_dezigzag
_stbi__compute_huffman_codes.length_dezigzag:
	.ascii	"\020\021\022\000\b\007\t\006\n\005\013\004\f\003\r\002\016\001\017"

	.section	__TEXT,__cstring,cstring_literals
L_.str.88:                              ## @.str.88
	.asciz	"bad huffman code"

	.section	__TEXT,__const
	.p2align	4               ## @stbi__zlength_base
_stbi__zlength_base:
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	6                       ## 0x6
	.long	7                       ## 0x7
	.long	8                       ## 0x8
	.long	9                       ## 0x9
	.long	10                      ## 0xa
	.long	11                      ## 0xb
	.long	13                      ## 0xd
	.long	15                      ## 0xf
	.long	17                      ## 0x11
	.long	19                      ## 0x13
	.long	23                      ## 0x17
	.long	27                      ## 0x1b
	.long	31                      ## 0x1f
	.long	35                      ## 0x23
	.long	43                      ## 0x2b
	.long	51                      ## 0x33
	.long	59                      ## 0x3b
	.long	67                      ## 0x43
	.long	83                      ## 0x53
	.long	99                      ## 0x63
	.long	115                     ## 0x73
	.long	131                     ## 0x83
	.long	163                     ## 0xa3
	.long	195                     ## 0xc3
	.long	227                     ## 0xe3
	.long	258                     ## 0x102
	.long	0                       ## 0x0
	.long	0                       ## 0x0

	.p2align	4               ## @stbi__zlength_extra
_stbi__zlength_extra:
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	2                       ## 0x2
	.long	2                       ## 0x2
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.long	3                       ## 0x3
	.long	3                       ## 0x3
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	5                       ## 0x5
	.long	5                       ## 0x5
	.long	5                       ## 0x5
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0

	.p2align	4               ## @stbi__zdist_base
_stbi__zdist_base:
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	7                       ## 0x7
	.long	9                       ## 0x9
	.long	13                      ## 0xd
	.long	17                      ## 0x11
	.long	25                      ## 0x19
	.long	33                      ## 0x21
	.long	49                      ## 0x31
	.long	65                      ## 0x41
	.long	97                      ## 0x61
	.long	129                     ## 0x81
	.long	193                     ## 0xc1
	.long	257                     ## 0x101
	.long	385                     ## 0x181
	.long	513                     ## 0x201
	.long	769                     ## 0x301
	.long	1025                    ## 0x401
	.long	1537                    ## 0x601
	.long	2049                    ## 0x801
	.long	3073                    ## 0xc01
	.long	4097                    ## 0x1001
	.long	6145                    ## 0x1801
	.long	8193                    ## 0x2001
	.long	12289                   ## 0x3001
	.long	16385                   ## 0x4001
	.long	24577                   ## 0x6001
	.long	0                       ## 0x0
	.long	0                       ## 0x0

	.p2align	4               ## @stbi__zdist_extra
_stbi__zdist_extra:
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	5                       ## 0x5
	.long	6                       ## 0x6
	.long	6                       ## 0x6
	.long	7                       ## 0x7
	.long	7                       ## 0x7
	.long	8                       ## 0x8
	.long	8                       ## 0x8
	.long	9                       ## 0x9
	.long	9                       ## 0x9
	.long	10                      ## 0xa
	.long	10                      ## 0xa
	.long	11                      ## 0xb
	.long	11                      ## 0xb
	.long	12                      ## 0xc
	.long	12                      ## 0xc
	.long	13                      ## 0xd
	.long	13                      ## 0xd
	.long	0                       ## 0x0
	.long	0                       ## 0x0

	.section	__TEXT,__cstring,cstring_literals
L_.str.89:                              ## @.str.89
	.asciz	"bad dist"

L___func__.stbtt__GetGlyfOffset:        ## @__func__.stbtt__GetGlyfOffset
	.asciz	"stbtt__GetGlyfOffset"

L_.str.90:                              ## @.str.90
	.asciz	"!info->cff.size"

L___func__.stbtt__cff_index_get:        ## @__func__.stbtt__cff_index_get
	.asciz	"stbtt__cff_index_get"

L_.str.91:                              ## @.str.91
	.asciz	"i >= 0 && i < count"

L_.str.92:                              ## @.str.92
	.asciz	"offsize >= 1 && offsize <= 4"

L___func__.stbtt__buf_seek:             ## @__func__.stbtt__buf_seek
	.asciz	"stbtt__buf_seek"

L_.str.93:                              ## @.str.93
	.asciz	"!(o > b->size || o < 0)"

L___func__.stbtt__cff_get_index:        ## @__func__.stbtt__cff_get_index
	.asciz	"stbtt__cff_get_index"

L___func__.stbtt__buf_get:              ## @__func__.stbtt__buf_get
	.asciz	"stbtt__buf_get"

L_.str.96:                              ## @.str.96
	.asciz	"n >= 1 && n <= 4"

L___func__.stbtt__cff_int:              ## @__func__.stbtt__cff_int
	.asciz	"stbtt__cff_int"

L___func__.stbtt__GetGlyphShapeTT:      ## @__func__.stbtt__GetGlyphShapeTT
	.asciz	"stbtt__GetGlyphShapeTT"

L___func__.stbtt__GetGlyphShapeT2:      ## @__func__.stbtt__GetGlyphShapeT2
	.asciz	"stbtt__GetGlyphShapeT2"

L_.str.97:                              ## @.str.97
	.asciz	"output_ctx.num_vertices == count_ctx.num_vertices"

L___func__.stbtt__rasterize_sorted_edges: ## @__func__.stbtt__rasterize_sorted_edges
	.asciz	"stbtt__rasterize_sorted_edges"

L_.str.99:                              ## @.str.99
	.asciz	"z->direction"

L_.str.100:                             ## @.str.100
	.asciz	"z->ey >= scan_y_top"

L___func__.stbtt__new_active:           ## @__func__.stbtt__new_active
	.asciz	"stbtt__new_active"

L_.str.101:                             ## @.str.101
	.asciz	"z != ((void*)0)"

L___func__.stbtt__fill_active_edges_new: ## @__func__.stbtt__fill_active_edges_new
	.asciz	"stbtt__fill_active_edges_new"

L_.str.102:                             ## @.str.102
	.asciz	"e->ey >= y_top"

L_.str.103:                             ## @.str.103
	.asciz	"e->sy <= y_bottom && e->ey >= y_top"

L_.str.104:                             ## @.str.104
	.asciz	"x >= 0 && x < len"

L_.str.105:                             ## @.str.105
	.asciz	"dy >= 0"

L_.str.106:                             ## @.str.106
	.asciz	"dx >= 0"

L_.str.107:                             ## @.str.107
	.asciz	"fabs(area) <= 1.01f"

L_.str.108:                             ## @.str.108
	.asciz	"sy1 > y_final-0.01f"

L___func__.stbtt__handle_clipped_edge:  ## @__func__.stbtt__handle_clipped_edge
	.asciz	"stbtt__handle_clipped_edge"

L_.str.109:                             ## @.str.109
	.asciz	"y0 < y1"

L_.str.110:                             ## @.str.110
	.asciz	"e->sy <= e->ey"

L_.str.111:                             ## @.str.111
	.asciz	"x1 <= x+1"

L_.str.112:                             ## @.str.112
	.asciz	"x1 >= x"

L_.str.113:                             ## @.str.113
	.asciz	"x1 <= x"

L_.str.114:                             ## @.str.114
	.asciz	"x1 >= x+1"

L_.str.115:                             ## @.str.115
	.asciz	"x1 >= x && x1 <= x+1"

L_.str.116:                             ## @.str.116
	.asciz	"x0 >= x && x0 <= x+1 && x1 >= x && x1 <= x+1"

L___func__.stbtt__sized_trapezoid_area: ## @__func__.stbtt__sized_trapezoid_area
	.asciz	"stbtt__sized_trapezoid_area"

L_.str.117:                             ## @.str.117
	.asciz	"top_width >= 0"

L_.str.118:                             ## @.str.118
	.asciz	"bottom_width >= 0"

L___func__.stbtt__h_prefilter:          ## @__func__.stbtt__h_prefilter
	.asciz	"stbtt__h_prefilter"

L_.str.119:                             ## @.str.119
	.asciz	"pixels[i] == 0"

L___func__.stbtt__v_prefilter:          ## @__func__.stbtt__v_prefilter
	.asciz	"stbtt__v_prefilter"

L_.str.120:                             ## @.str.120
	.asciz	"pixels[i*stride_in_bytes] == 0"

L___func__.stbtt_BakeFontBitmap_internal: ## @__func__.stbtt_BakeFontBitmap_internal
	.asciz	"stbtt_BakeFontBitmap_internal"

L_.str.121:                             ## @.str.121
	.asciz	"x+gw < pw"


.subsections_via_symbols

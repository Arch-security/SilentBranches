	.file	"main.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function victim_function
.LCPI0_0:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
.LCPI0_1:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.text
	.globl	victim_function
	.p2align	4
	.type	victim_function,@function
victim_function:                        # @victim_function
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edi, -20(%rsp)
	movl	%esi, -24(%rsp)
	movl	%edx, -28(%rsp)
	movl	$0, -32(%rsp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-32(%rsp), %eax
	cmpl	$200, %eax
	jl	.LBB0_3
# %bb.2:                                # %for.cond.cleanup
	jmp	.LBB0_5
.LBB0_3:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_4
.LBB0_4:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-32(%rsp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rsp)
	jmp	.LBB0_1
.LBB0_5:                                # %for.end
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	movl	-28(%rsp), %eax
	movzbl	array+2048, %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_7
# %bb.6:                                # %if.then
	movl	-20(%rsp), %eax
	movl	-24(%rsp), %ecx
	btl	%ecx, %eax
	movabsq	$4679240012837945344, %rax      # imm = 0x40F0000000000000
	movabsq	$4748437441418039, %rcx         # imm = 0x10DEADBEEF1337
	cmovbq	%rax, %rcx
	movq	%rcx, -16(%rsp)
	movq	-16(%rsp), %rax
	imulq	%rax, %rax
	movq	%rax, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = [1127219200,1160773632,0,0]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	.LCPI0_1(%rip), %xmm1           # xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	subpd	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	unpckhpd	%xmm1, %xmm1                    # xmm1 = xmm1[1,1]
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%rsp)
	#APP
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0
	sqrtsd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm0

	#NO_APP
	movq	global_variable, %rax
.LBB0_7:                                # %if.end
	xorps	%xmm0, %xmm0
	retq
.Lfunc_end0:
	.size	victim_function, .Lfunc_end0-victim_function
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$168, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	8(%rsi), %rdi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %r14
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	movl	$array, %edi
	movl	$262144, %edx                   # imm = 0x40000
	xorl	%esi, %esi
	callq	memset@PLT
	movb	$10, array+2048(%rip)
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 32(%rsp)
	movl	$0, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	$7, %eax
	jg	.LBB1_3
# %bb.1:                                # %for.body8.preheader
	xorl	%ebx, %ebx
	movl	$array+2048, %r15d
	movl	$global_variable, %r12d
	.p2align	4
.LBB1_2:                                # %for.body8
                                        # =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	victim_function
	movq	$0, 24(%rsp)
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	victim_function
	movq	$0, 8(%rsp)
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	#APP
	clflush	(%r15)
	#NO_APP
	#APP
	clflush	(%r12)
	#NO_APP
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	movl	4(%rsp), %esi
	movl	%r14d, %edi
	movl	$100, %edx
	callq	victim_function
	movq	$0, 16(%rsp)
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	rdtscp
	shlq	$32, %rdx
	orq	%rax, %rdx
	movl	%ecx, dummy1(%rip)
	movq	%rdx, start(%rip)
	movzbl	global_variable(%rip), %eax
	rdtscp
	shlq	$32, %rdx
	orq	%rax, %rdx
	subq	start(%rip), %rdx
	movl	%ecx, dummy1(%rip)
	movq	%rdx, end(%rip)
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	xorl	%eax, %eax
	movq	end(%rip), %rcx
	cmpq	$131, %rcx
	movslq	4(%rsp), %rdx
	movq	%rcx, 96(%rsp,%rdx,8)
	setb	%al
	movslq	4(%rsp), %rcx
	movq	%rax, 32(%rsp,%rcx,8)
	movl	4(%rsp), %ecx
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	#APP

	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop


	nop

	#NO_APP
	incl	4(%rsp)
                                        # kill: def $cl killed $cl killed $ecx
	shll	%cl, %eax
	orl	%eax, %ebx
	movl	4(%rsp), %eax
	cmpl	$8, %eax
	jl	.LBB1_2
.LBB1_3:                                # %for.cond.cleanup7
	#APP
	lfence

	mfence

	sfence
	#NO_APP
	xorl	%r15d, %r15d
	.p2align	4
.LBB1_4:                                # %for.body29
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp,%r15,8), %rsi
	movq	96(%rsp,%r15,8), %rdx
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	incq	%r15
	cmpq	$8, %r15
	jne	.LBB1_4
# %bb.5:                                # %for.cond.cleanup28
	movl	$.L.str.1, %edi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%edx, %edx
	cmpl	%r14d, %ebx
	sete	%dl
	movl	$.L.str.2, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$168, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	global_variable,@object         # @global_variable
	.data
	.globl	global_variable
	.p2align	3, 0x0
global_variable:
	.quad	15                              # 0xf
	.size	global_variable, 8

	.type	array,@object                   # @array
	.local	array
	.comm	array,262144,512
	.type	dummy1,@object                  # @dummy1
	.bss
	.globl	dummy1
	.p2align	2, 0x0
dummy1:
	.long	0                               # 0x0
	.size	dummy1, 4

	.type	start,@object                   # @start
	.globl	start
	.p2align	3, 0x0
start:
	.quad	0                               # 0x0
	.size	start, 8

	.type	end,@object                     # @end
	.globl	end
	.p2align	3, 0x0
end:
	.quad	0                               # 0x0
	.size	end, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d, %3ld\n"
	.size	.L.str, 10

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"secret : %3d "
	.size	.L.str.1, 14

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Guess : %3d, --> %d\n"
	.size	.L.str.2, 21

	.type	tmp,@object                     # @tmp
	.bss
	.globl	tmp
	.p2align	3, 0x0
tmp:
	.quad	0                               # 0x0
	.size	tmp, 8

	.type	value,@object                   # @value
	.globl	value
	.p2align	3, 0x0
value:
	.quad	0x0000000000000000              # double 0
	.size	value, 8

	.type	fast,@object                    # @fast
	.globl	fast
	.p2align	3, 0x0
fast:
	.quad	0                               # 0x0
	.size	fast, 8

	.type	slow,@object                    # @slow
	.globl	slow
	.p2align	3, 0x0
slow:
	.quad	0                               # 0x0
	.size	slow, 8

	.ident	"clang version 22.0.0git (git@github.com:llvm/llvm-project.git ab6923b9b7a75de79ee06b400ae73771e130339e)"
	.section	".note.GNU-stack","",@progbits

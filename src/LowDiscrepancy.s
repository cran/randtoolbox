	.text
	.globl _sqnorm_
_sqnorm_:
LFB0:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movsd	LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	LC1(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	LC2(%rip), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	LC3(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	LC4(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	LC5(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	LC6(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	LC7(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	LC8(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	LC9(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	LC10(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	LC11(%rip), %xmm1
	subsd	-96(%rbp), %xmm1
	ucomisd	%xmm1, %xmm0
	jb	L2
	movsd	LC11(%rip), %xmm0
	subsd	-96(%rbp), %xmm0
	movq	-136(%rbp), %rax
	movsd	%xmm0, (%rax)
L2:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	-96(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jb	L4
	movq	-136(%rbp), %rax
	movsd	-96(%rbp), %xmm0
	movsd	%xmm0, (%rax)
L4:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	ucomisd	LC12(%rip), %xmm0
	jp	L6
	ucomisd	LC12(%rip), %xmm0
	jne	L6
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	movsd	-128(%rbp), %xmm0
	jmp	L12
L6:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	ucomisd	LC12(%rip), %xmm0
	jbe	L8
	movsd	LC11(%rip), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
L8:
	movq	-8(%rbp), %rax
	movq	%rax, -144(%rbp)
	movsd	-144(%rbp), %xmm0
	call	_log
	addsd	%xmm0, %xmm0
	movsd	LC14(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm0
	movsd	%xmm0, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	-104(%rbp), %xmm0
	mulsd	-88(%rbp), %xmm0
	addsd	-80(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)
	movsd	-112(%rbp), %xmm0
	divsd	-120(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	LC12(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	L10
	movsd	-128(%rbp), %xmm1
	movsd	LC14(%rip), %xmm0
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
L10:
	movsd	-128(%rbp), %xmm0
L12:
	leave
LCFI2:
	ret
LFE0:
	.globl _nextsobol_
_nextsobol_:
LFB1:
	pushq	%rbp
LCFI3:
	movq	%rsp, %rbp
LCFI4:
	pushq	%r12
LCFI5:
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%r8, -88(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r11
	movl	$0, %r12d
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovns	%rax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movl	$0, %ecx
	testq	%rax, %rax
	cmovs	%rcx, %rax
	movq	%rax, %r9
	movl	$0, %r10d
	movq	%rdx, %r9
	notq	%r9
	movl	$0, -24(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
L19:
	addl	$1, -24(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	andl	$1, %eax
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	L18
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	jmp	L19
L18:
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, -20(%rbp)
	cmpl	%eax, -20(%rbp)
	jg	L20
L21:
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	-1(%rcx), %rsi
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	-1(%rcx), %rdi
	movq	-64(%rbp), %rcx
	movsd	(%rcx,%rdi,8), %xmm1
	movq	-72(%rbp), %rcx
	movl	(%rcx), %ecx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %edi
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rdx, %rcx
	leaq	(%rcx,%r9), %r8
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %r8
	movq	-88(%rbp), %rcx
	movl	(%rcx,%r8,4), %ecx
	xorl	%edi, %ecx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	movq	-72(%rbp), %rcx
	movl	(%rcx), %ecx
	pxor	%xmm1, %xmm1
	cvtsi2sd	%ecx, %xmm1
	divsd	%xmm1, %xmm0
	movq	-64(%rbp), %rcx
	movsd	%xmm0, (%rcx,%rsi,8)
	cmpl	%eax, -20(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -20(%rbp)
	testl	%ecx, %ecx
	jne	L20
	jmp	L21
L20:
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-80(%rbp), %rax
	movl	%edx, (%rax)
	nop
	popq	%r12
	popq	%rbp
LCFI6:
	ret
LFE1:
	.globl _initsobol_
_initsobol_:
LFB2:
	pushq	%rbp
LCFI7:
	movq	%rsp, %rbp
LCFI8:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8696, %rsp
LCFI9:
	movq	%rdi, -8680(%rbp)
	movq	%rsi, -8688(%rbp)
	movq	%rdx, -8696(%rbp)
	movq	%rcx, -8704(%rbp)
	movq	%r8, -8712(%rbp)
	movq	%r9, -8720(%rbp)
	movq	-8680(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovns	%rax, %rdx
	movq	%rdx, %r13
	movq	%r13, %rax
	salq	$4, %rax
	subq	%r13, %rax
	addq	%rax, %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%r13, %r14
	notq	%r14
	movq	-8680(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -8736(%rbp)
	movq	$0, -8728(%rbp)
	movq	-8680(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	movq	%rdx, %rbx
	cmovns	%rax, %rbx
	movq	%rbx, %rax
	salq	$4, %rax
	subq	%rbx, %rax
	addq	%rax, %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	salq	$2, %rax
	movl	$1, %edx
	testq	%rax, %rax
	cmove	%rdx, %rax
	movq	%rax, %rdi
	call	_malloc
	movq	%rax, -136(%rbp)
	movq	%rbx, %r12
	notq	%r12
	movl	$30, -228(%rbp)
	movl	$1073741823, -140(%rbp)
	movq	-8680(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -236(%rbp)
	movl	-236(%rbp), %eax
	cmpl	$13, %eax
	jg	L24
	movl	-236(%rbp), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,4), %rdx
	leaq	_tau.3519(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -144(%rbp)
	jmp	L25
L24:
	movl	$-1, -144(%rbp)
L25:
	movl	-140(%rbp), %eax
	movl	%eax, -52(%rbp)
	movl	$0, -232(%rbp)
L26:
	movl	-232(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -232(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jg	L26
	movl	-232(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L27
L28:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	addq	%r12, %rdx
	leaq	1(%rdx), %rcx
	movq	-136(%rbp), %rdx
	movl	$1, (%rdx,%rcx,4)
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L27
	jmp	L28
L27:
	movl	-236(%rbp), %eax
	movl	$2, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L29
L41:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	subq	$2, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	_poly.3504(%rip), %rdx
	movl	(%rcx,%rdx), %edx
	movl	%edx, -56(%rbp)
	movl	$0, -68(%rbp)
L31:
	movl	-56(%rbp), %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	movl	%edx, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jle	L30
	addl	$1, -68(%rbp)
	jmp	L31
L30:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	subq	$2, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	_poly.3504(%rip), %rdx
	movl	(%rcx,%rdx), %edx
	movl	%edx, -56(%rbp)
	movl	-68(%rbp), %edx
	movl	%edx, -60(%rbp)
	cmpl	$0, -60(%rbp)
	jle	L32
L33:
	movl	-60(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movl	-56(%rbp), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	andl	$1, %edx
	subl	%ecx, %edx
	cmpl	$1, %edx
	sete	%dl
	movzbl	%dl, %edx
	movl	%edx, -224(%rbp,%rsi,4)
	movl	-56(%rbp), %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	movl	%edx, -56(%rbp)
	cmpl	$1, -60(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	subl	$1, -60(%rbp)
	testl	%edx, %edx
	jne	L32
	jmp	L33
L32:
	movl	-68(%rbp), %edx
	movl	$1, -56(%rbp)
	cmpl	%edx, -56(%rbp)
	jg	L34
L35:
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$1110, %rcx, %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rsi, %rcx
	subq	$1112, %rcx
	leaq	0(,%rcx,4), %rsi
	leaq	_vinit.3539(%rip), %rcx
	movl	(%rsi,%rcx), %esi
	movq	-136(%rbp), %rcx
	movl	%esi, (%rcx,%rdi,4)
	cmpl	%edx, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L34
	jmp	L35
L34:
	movl	-68(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	-232(%rbp), %edx
	movl	%ecx, -56(%rbp)
	cmpl	%edx, -56(%rbp)
	jg	L36
L40:
	movl	-56(%rbp), %ecx
	subl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rsi
	movq	-136(%rbp), %rcx
	movl	(%rcx,%rsi,4), %ecx
	movl	%ecx, -76(%rbp)
	movl	$1, -64(%rbp)
	movl	-68(%rbp), %ecx
	movl	$1, -60(%rbp)
	cmpl	%ecx, -60(%rbp)
	jg	L37
L39:
	sall	-64(%rbp)
	movl	-60(%rbp), %esi
	movslq	%esi, %rsi
	subq	$1, %rsi
	movl	-224(%rbp,%rsi,4), %esi
	testl	%esi, %esi
	je	L38
	movl	-56(%rbp), %esi
	subl	-60(%rbp), %esi
	movslq	%esi, %rsi
	imulq	%rbx, %rsi
	leaq	(%rsi,%r12), %rdi
	movl	-52(%rbp), %esi
	movslq	%esi, %rsi
	addq	%rsi, %rdi
	movq	-136(%rbp), %rsi
	movl	(%rsi,%rdi,4), %esi
	imull	-64(%rbp), %esi
	xorl	%esi, -76(%rbp)
L38:
	cmpl	%ecx, -60(%rbp)
	sete	%sil
	movzbl	%sil, %esi
	addl	$1, -60(%rbp)
	testl	%esi, %esi
	jne	L37
	jmp	L39
L37:
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movq	-136(%rbp), %rcx
	movl	-76(%rbp), %esi
	movl	%esi, (%rcx,%rdi,4)
	cmpl	%edx, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L36
	jmp	L40
L36:
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L29
	jmp	L41
L29:
	movl	$1, -64(%rbp)
	movl	-232(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jle	L42
L45:
	sall	-64(%rbp)
	movl	-236(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L43
L44:
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%rdx,%r12), %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%rdx,%r12), %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-136(%rbp), %rdx
	movl	(%rdx,%rcx,4), %edx
	imull	-64(%rbp), %edx
	movl	%edx, %ecx
	movq	-136(%rbp), %rdx
	movl	%ecx, (%rdx,%rsi,4)
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L43
	jmp	L44
L43:
	cmpl	$1, -56(%rbp)
	sete	%al
	movzbl	%al, %eax
	subl	$1, -56(%rbp)
	testl	%eax, %eax
	jne	L42
	jmp	L45
L42:
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	L46
	movl	-236(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L47
L50:
	movl	-232(%rbp), %edx
	movl	$1, -56(%rbp)
	cmpl	%edx, -56(%rbp)
	jg	L48
L49:
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%r13, %rcx
	leaq	(%rcx,%r14), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rsi
	movq	-136(%rbp), %rcx
	movl	(%rcx,%rsi,4), %esi
	movq	-8712(%rbp), %rcx
	movl	%esi, (%rcx,%rdi,4)
	cmpl	%edx, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L48
	jmp	L49
L48:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	movl	$0, -4688(%rbp,%rdx,4)
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L47
	jmp	L50
L47:
	movl	-232(%rbp), %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	__gfortran_pow_i4_i4
	movl	%eax, %edx
	movq	-8696(%rbp), %rax
	movl	%edx, (%rax)
	jmp	L51
L46:
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	L52
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	L53
L52:
	leaq	-232(%rbp), %rsi
	leaq	-236(%rbp), %rcx
	leaq	-4688(%rbp), %rdx
	leaq	-228(%rbp), %rax
	movq	16(%rbp), %r9
	movq	%rsi, %r8
	leaq	_lsm.3496(%rip), %rsi
	movq	%rax, %rdi
	call	_sgenscrml_
	movl	-236(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L54
L61:
	movl	-232(%rbp), %edx
	movl	$1, -56(%rbp)
	cmpl	%edx, -56(%rbp)
	jg	L55
L60:
	movl	$1, -64(%rbp)
	movl	$0, -92(%rbp)
	movl	-228(%rbp), %ecx
	movl	%ecx, -80(%rbp)
	cmpl	$0, -80(%rbp)
	jle	L56
L59:
	movl	$0, -88(%rbp)
	movl	-232(%rbp), %esi
	movl	$1, -60(%rbp)
	cmpl	%esi, -60(%rbp)
	jg	L57
L58:
	movl	-80(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$1111, %rcx, %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	subq	$1112, %rcx
	leaq	0(,%rcx,4), %rdi
	leaq	_lsm.3496(%rip), %rcx
	movl	(%rdi,%rcx), %edi
	movl	-60(%rbp), %ecx
	subl	$1, %ecx
	sarl	%cl, %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%ecx, %r8d
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rdi
	movq	-136(%rbp), %rcx
	movl	(%rcx,%rdi,4), %edi
	movl	-60(%rbp), %ecx
	subl	$1, %ecx
	sarl	%cl, %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	imull	%r8d, %ecx
	movl	%ecx, -148(%rbp)
	movl	-148(%rbp), %ecx
	addl	%ecx, -88(%rbp)
	cmpl	%esi, -60(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -60(%rbp)
	testl	%ecx, %ecx
	jne	L57
	jmp	L58
L57:
	movl	-88(%rbp), %ecx
	movl	%ecx, %esi
	sarl	$31, %esi
	shrl	$31, %esi
	addl	%esi, %ecx
	andl	$1, %ecx
	subl	%esi, %ecx
	movl	%ecx, -88(%rbp)
	movl	-88(%rbp), %ecx
	imull	-64(%rbp), %ecx
	addl	%ecx, -92(%rbp)
	sall	-64(%rbp)
	cmpl	$1, -80(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	subl	$1, -80(%rbp)
	testl	%ecx, %ecx
	jne	L56
	jmp	L59
L56:
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%r13, %rcx
	leaq	(%rcx,%r14), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movq	-8712(%rbp), %rcx
	movl	-92(%rbp), %esi
	movl	%esi, (%rcx,%rdi,4)
	cmpl	%edx, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L55
	jmp	L60
L55:
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L54
	jmp	L61
L54:
	movl	-228(%rbp), %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	__gfortran_pow_i4_i4
	movl	%eax, %edx
	movq	-8696(%rbp), %rax
	movl	%edx, (%rax)
L53:
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	L62
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	L51
L62:
	leaq	-232(%rbp), %rdx
	leaq	-4816(%rbp), %rsi
	leaq	-8672(%rbp), %rax
	movq	16(%rbp), %rcx
	movq	%rax, %rdi
	call	_sgenscrmu_
	movq	-8720(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	jne	L63
	movl	-232(%rbp), %eax
	movl	%eax, -72(%rbp)
	jmp	L64
L63:
	movl	-228(%rbp), %eax
	movl	%eax, -72(%rbp)
L64:
	movl	-236(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L65
L83:
	movl	-232(%rbp), %edx
	movl	$1, -56(%rbp)
	cmpl	%edx, -56(%rbp)
	jg	L66
L71:
	movl	-72(%rbp), %ecx
	movl	%ecx, -80(%rbp)
	movl	-72(%rbp), %esi
	movl	$1, -60(%rbp)
	cmpl	%esi, -60(%rbp)
	jg	L67
L70:
	movq	-8720(%rbp), %rcx
	movl	(%rcx), %ecx
	cmpl	$2, %ecx
	jne	L68
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$34441, %rcx, %rdi
	movl	-80(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$1111, %rcx, %rcx
	addq	%rcx, %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	leaq	-35553(%rcx), %r9
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rbx, %rcx
	leaq	(%rcx,%r12), %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rdi
	movq	-136(%rbp), %rcx
	movl	(%rcx,%rdi,4), %edi
	movl	-60(%rbp), %ecx
	subl	$1, %ecx
	sarl	%cl, %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%ecx, %r8d
	leaq	0(,%r9,4), %rdi
	leaq	_tv.3527(%rip), %rcx
	movl	%r8d, (%rdi,%rcx)
	jmp	L69
L68:
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$34441, %rcx, %rdi
	movl	-80(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$1111, %rcx, %rcx
	addq	%rcx, %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	leaq	-35553(%rcx), %r9
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%r13, %rcx
	leaq	(%rcx,%r14), %rdi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rdi
	movq	-8712(%rbp), %rcx
	movl	(%rcx,%rdi,4), %edi
	movl	-60(%rbp), %ecx
	subl	$1, %ecx
	sarl	%cl, %edi
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%ecx, %r8d
	leaq	0(,%r9,4), %rdi
	leaq	_tv.3527(%rip), %rcx
	movl	%r8d, (%rdi,%rcx)
L69:
	subl	$1, -80(%rbp)
	cmpl	%esi, -60(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -60(%rbp)
	testl	%ecx, %ecx
	jne	L67
	jmp	L70
L67:
	cmpl	%edx, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L66
	jmp	L71
L66:
	movl	-232(%rbp), %edx
	movl	$1, -84(%rbp)
	cmpl	%edx, -84(%rbp)
	jg	L72
L82:
	movl	$0, -92(%rbp)
	movl	$0, -100(%rbp)
	movl	$1, -64(%rbp)
	movl	-72(%rbp), %ecx
	movl	%ecx, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jle	L73
L78:
	movl	$0, -88(%rbp)
	movl	$0, -96(%rbp)
	movl	-232(%rbp), %ecx
	movl	$1, -80(%rbp)
	cmpl	%ecx, -80(%rbp)
	jg	L74
L76:
	movl	-80(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$34441, %rsi, %rdi
	movl	-56(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$1111, %rsi, %rsi
	addq	%rsi, %rdi
	movl	-52(%rbp), %esi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	subq	$35553, %rsi
	leaq	0(,%rsi,4), %rdi
	leaq	_tv.3527(%rip), %rsi
	movl	(%rdi,%rsi), %r8d
	movl	-84(%rbp), %esi
	movslq	%esi, %rdi
	movq	%rdi, %rsi
	salq	$5, %rsi
	subq	%rdi, %rsi
	movq	%rsi, %rdi
	movl	-80(%rbp), %esi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	subq	$32, %rsi
	movl	-8672(%rbp,%rsi,4), %esi
	imull	%r8d, %esi
	addl	%esi, -88(%rbp)
	cmpl	$1, -84(%rbp)
	jne	L75
	movl	-80(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$34441, %rsi, %rdi
	movl	-56(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$1111, %rsi, %rsi
	addq	%rsi, %rdi
	movl	-52(%rbp), %esi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	subq	$35553, %rsi
	leaq	0(,%rsi,4), %rdi
	leaq	_tv.3527(%rip), %rsi
	movl	(%rdi,%rsi), %edi
	movl	-80(%rbp), %esi
	movslq	%esi, %rsi
	subq	$1, %rsi
	movl	-4816(%rbp,%rsi,4), %esi
	imull	%edi, %esi
	addl	%esi, -96(%rbp)
L75:
	cmpl	%ecx, -80(%rbp)
	sete	%sil
	movzbl	%sil, %esi
	addl	$1, -80(%rbp)
	testl	%esi, %esi
	jne	L74
	jmp	L76
L74:
	movl	-88(%rbp), %ecx
	movl	%ecx, %esi
	sarl	$31, %esi
	shrl	$31, %esi
	addl	%esi, %ecx
	andl	$1, %ecx
	subl	%esi, %ecx
	movl	%ecx, -88(%rbp)
	movl	-88(%rbp), %ecx
	imull	-64(%rbp), %ecx
	addl	%ecx, -92(%rbp)
	cmpl	$1, -84(%rbp)
	jne	L77
	movl	-96(%rbp), %ecx
	movl	%ecx, %esi
	sarl	$31, %esi
	shrl	$31, %esi
	addl	%esi, %ecx
	andl	$1, %ecx
	subl	%esi, %ecx
	movl	%ecx, -96(%rbp)
	movl	-96(%rbp), %ecx
	imull	-64(%rbp), %ecx
	addl	%ecx, -100(%rbp)
L77:
	sall	-64(%rbp)
	cmpl	$1, -56(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	subl	$1, -56(%rbp)
	testl	%ecx, %ecx
	jne	L73
	jmp	L78
L73:
	movl	-84(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%r13, %rcx
	leaq	(%rcx,%r14), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movq	-8712(%rbp), %rcx
	movl	-92(%rbp), %esi
	movl	%esi, (%rcx,%rdi,4)
	cmpl	$1, -84(%rbp)
	jne	L79
	movq	-8720(%rbp), %rcx
	movl	(%rcx), %ecx
	cmpl	$3, %ecx
	jne	L80
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	-1(%rcx), %rsi
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	subq	$1, %rcx
	movl	-4688(%rbp,%rcx,4), %ecx
	xorl	-100(%rbp), %ecx
	movl	%ecx, -4688(%rbp,%rsi,4)
	jmp	L79
L80:
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	-1(%rcx), %rsi
	movl	-100(%rbp), %ecx
	movl	%ecx, -4688(%rbp,%rsi,4)
L79:
	cmpl	%edx, -84(%rbp)
	sete	%cl
	movzbl	%cl, %ecx
	addl	$1, -84(%rbp)
	testl	%ecx, %ecx
	jne	L72
	jmp	L82
L72:
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L65
	jmp	L83
L65:
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	__gfortran_pow_i4_i4
	movl	%eax, %edx
	movq	-8696(%rbp), %rax
	movl	%edx, (%rax)
L51:
	movq	-8696(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	LC11(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -160(%rbp)
	movq	-8704(%rbp), %rax
	movl	$0, (%rax)
	movl	-236(%rbp), %eax
	movl	$1, -52(%rbp)
	cmpl	%eax, -52(%rbp)
	jg	L88
L85:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	movl	-4688(%rbp,%rdx,4), %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	mulsd	-160(%rbp), %xmm0
	movq	-8688(%rbp), %rdx
	movsd	%xmm0, (%rdx,%rcx,8)
	cmpl	%eax, -52(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -52(%rbp)
	testl	%edx, %edx
	jne	L88
	jmp	L85
L88:
	nop
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	_free
	nop
	addq	$8696, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI10:
	ret
LFE2:
	.globl _sgenscrmu_
_sgenscrmu_:
LFB3:
	pushq	%rbp
LCFI11:
	movq	%rsp, %rbp
LCFI12:
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
LCFI13:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %ebx
	movl	$1, -20(%rbp)
	cmpl	%ebx, -20(%rbp)
	jg	L98
L96:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_unis_
	movapd	%xmm0, %xmm1
	movsd	LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -32(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-48(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movq	-56(%rbp), %rax
	movl	(%rax), %r12d
	movl	$1, -24(%rbp)
	cmpl	%r12d, -24(%rbp)
	jg	L91
L95:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne	L92
	movl	$1, -28(%rbp)
	jmp	L93
L92:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	L94
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_unis_
	movapd	%xmm0, %xmm1
	movsd	LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -28(%rbp)
	jmp	L93
L94:
	movl	$0, -28(%rbp)
L93:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$5, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-32(%rax), %rcx
	movq	-40(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	cmpl	%r12d, -24(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -24(%rbp)
	testl	%eax, %eax
	jne	L91
	jmp	L95
L91:
	cmpl	%ebx, -20(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -20(%rbp)
	testl	%eax, %eax
	jne	L98
	jmp	L96
L98:
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
LCFI14:
	ret
LFE3:
	.globl _unis_
_unis_:
LFB4:
	pushq	%rbp
LCFI15:
	movq	%rsp, %rbp
LCFI16:
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movl	$-2092037281, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$16, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	imull	$-127773, %eax, %eax
	addl	%edx, %eax
	imull	$16807, %eax, %edx
	movl	-4(%rbp), %eax
	imull	$-2836, %eax, %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jns	L100
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	2147483647(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
L100:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	LC16(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	popq	%rbp
LCFI17:
	ret
LFE4:
	.globl _sgenscrml_
_sgenscrml_:
LFB5:
	pushq	%rbp
LCFI18:
	movq	%rsp, %rbp
LCFI19:
	pushq	%rbx
	subq	$80, %rsp
LCFI20:
	movq	%rdi, -48(%rbp)
	movq	%rsi, -56(%rbp)
	movq	%rdx, -64(%rbp)
	movq	%rcx, -72(%rbp)
	movq	%r8, -80(%rbp)
	movq	%r9, -88(%rbp)
	movq	-72(%rbp), %rax
	movl	(%rax), %ebx
	movl	$1, -28(%rbp)
	cmpl	%ebx, -28(%rbp)
	jg	L113
L111:
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movl	$0, (%rax,%rdx,4)
	movl	$1, -20(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jle	L104
L110:
	movl	-12(%rbp), %eax
	cltq
	imulq	$1111, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1112(%rax), %rdx
	movq	-56(%rbp), %rax
	movl	$0, (%rax,%rdx,4)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_unis_
	movapd	%xmm0, %xmm1
	movsd	LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -36(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-64(%rbp), %rax
	movl	(%rax,%rcx,4), %ecx
	movl	-36(%rbp), %eax
	imull	-20(%rbp), %eax
	addl	%eax, %ecx
	movq	-64(%rbp), %rax
	movl	%ecx, (%rax,%rdx,4)
	sall	-20(%rbp)
	movl	$1, -24(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	cmpl	$0, -16(%rbp)
	jle	L105
L109:
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	L106
	movl	$1, -32(%rbp)
	jmp	L107
L106:
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	L108
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	_unis_
	movapd	%xmm0, %xmm1
	movsd	LC15(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -32(%rbp)
	jmp	L107
L108:
	movl	$0, -32(%rbp)
L107:
	movl	-12(%rbp), %eax
	cltq
	imulq	$1111, %rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1112(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	imulq	$1111, %rax, %rcx
	movl	-28(%rbp), %eax
	cltq
	addq	%rcx, %rax
	leaq	-1112(%rax), %rcx
	movq	-56(%rbp), %rax
	movl	(%rax,%rcx,4), %ecx
	movl	-32(%rbp), %eax
	imull	-24(%rbp), %eax
	addl	%eax, %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, (%rax,%rdx,4)
	sall	-24(%rbp)
	cmpl	$1, -16(%rbp)
	sete	%al
	movzbl	%al, %eax
	subl	$1, -16(%rbp)
	testl	%eax, %eax
	jne	L105
	jmp	L109
L105:
	cmpl	$1, -12(%rbp)
	sete	%al
	movzbl	%al, %eax
	subl	$1, -12(%rbp)
	testl	%eax, %eax
	jne	L104
	jmp	L110
L104:
	cmpl	%ebx, -28(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -28(%rbp)
	testl	%eax, %eax
	jne	L113
	jmp	L111
L113:
	nop
	addq	$80, %rsp
	popq	%rbx
	popq	%rbp
LCFI21:
	ret
LFE5:
	.globl _hqnorm_
_hqnorm_:
LFB6:
	pushq	%rbp
LCFI22:
	movq	%rsp, %rbp
LCFI23:
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movsd	LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	LC1(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	LC2(%rip), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	LC3(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	LC4(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	LC5(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	LC6(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	LC7(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	LC8(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	LC9(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	LC10(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	LC11(%rip), %xmm1
	subsd	-96(%rbp), %xmm1
	ucomisd	%xmm1, %xmm0
	jb	L115
	movsd	LC11(%rip), %xmm0
	subsd	-96(%rbp), %xmm0
	movq	-136(%rbp), %rax
	movsd	%xmm0, (%rax)
L115:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	-96(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jb	L117
	movq	-136(%rbp), %rax
	movsd	-96(%rbp), %xmm0
	movsd	%xmm0, (%rax)
L117:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	ucomisd	LC12(%rip), %xmm0
	jp	L119
	ucomisd	LC12(%rip), %xmm0
	jne	L119
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	movsd	-128(%rbp), %xmm0
	jmp	L125
L119:
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	ucomisd	LC12(%rip), %xmm0
	jbe	L121
	movsd	LC11(%rip), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
L121:
	movq	-8(%rbp), %rax
	movq	%rax, -144(%rbp)
	movsd	-144(%rbp), %xmm0
	call	_log
	addsd	%xmm0, %xmm0
	movsd	LC14(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm0
	movsd	%xmm0, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	-104(%rbp), %xmm0
	mulsd	-88(%rbp), %xmm0
	addsd	-80(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	mulsd	-104(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)
	movsd	-112(%rbp), %xmm0
	divsd	-120(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	LC12(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	L123
	movsd	-128(%rbp), %xmm1
	movsd	LC14(%rip), %xmm0
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
L123:
	movsd	-128(%rbp), %xmm0
L125:
	leave
LCFI24:
	ret
LFE6:
	.globl _nexthalton_
_nexthalton_:
LFB7:
	pushq	%rbp
LCFI25:
	movq	%rsp, %rbp
LCFI26:
	pushq	%r13
	pushq	%r12
	subq	$96, %rsp
LCFI27:
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %r8
	movl	$0, %r9d
	salq	$2, %rax
	movl	$1, %edx
	testq	%rax, %rax
	cmove	%rdx, %rax
	movq	%rax, %rdi
	call	_malloc
	movq	%rax, -64(%rbp)
	movq	-88(%rbp), %rax
	movl	(%rax), %ecx
	movl	$1, -28(%rbp)
	cmpl	%ecx, -28(%rbp)
	jg	L131
L134:
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-112(%rbp), %rax
	movl	(%rax), %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax,%rsi,4)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-96(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-104(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	LC11(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
L133:
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	je	L132
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-104(%rbp), %rdx
	movl	(%rdx,%rsi,4), %esi
	cltd
	idivl	%esi
	movl	%edx, -68(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-96(%rbp), %rax
	movsd	(%rax,%rsi,8), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-68(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movq	-96(%rbp), %rax
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	subl	-68(%rbp), %eax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rdi
	movq	-104(%rbp), %rdx
	movl	(%rdx,%rdi,4), %edi
	cltd
	idivl	%edi
	movl	%eax, %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax,%rsi,4)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-104(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	-24(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	L133
L132:
	cmpl	%ecx, -28(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -28(%rbp)
	testl	%eax, %eax
	jne	L131
	jmp	L134
L131:
	movq	-112(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-112(%rbp), %rax
	movl	%edx, (%rax)
	nop
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_free
	nop
	addq	$96, %rsp
	popq	%r12
	popq	%r13
	popq	%rbp
LCFI28:
	ret
LFE7:
	.globl _inithalton_
_inithalton_:
LFB8:
	pushq	%rbp
LCFI29:
	movq	%rsp, %rbp
LCFI30:
	pushq	%r13
	pushq	%r12
	subq	$112, %rsp
LCFI31:
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %r8
	movl	$0, %r9d
	salq	$2, %rax
	movl	$1, %edx
	testq	%rax, %rax
	cmove	%rdx, %rax
	movq	%rax, %rdi
	call	_malloc
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	movl	$2, (%rax)
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jle	L137
	movq	-120(%rbp), %rax
	movl	$3, 4(%rax)
L137:
	movl	$3, -36(%rbp)
	movl	$2, -44(%rbp)
L143:
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-44(%rbp), %eax
	jle	L138
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -84(%rbp)
	movl	$0, -32(%rbp)
	movl	-36(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L139
	movl	-36(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	je	L139
	movl	-84(%rbp), %ecx
	movl	$5, -28(%rbp)
	cmpl	%ecx, -28(%rbp)
	jg	L140
L142:
	movl	-36(%rbp), %eax
	cltd
	idivl	-28(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L141
	addl	$1, -32(%rbp)
L141:
	cmpl	%ecx, -28(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -28(%rbp)
	testl	%eax, %eax
	jne	L140
	jmp	L142
L140:
	cmpl	$0, -32(%rbp)
	jne	L139
	addl	$1, -44(%rbp)
	movl	-44(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-120(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
L139:
	addl	$1, -36(%rbp)
	jmp	L143
L138:
	movq	-128(%rbp), %rax
	movl	$0, (%rax)
	movq	-104(%rbp), %rax
	movl	(%rax), %ecx
	movl	$1, -40(%rbp)
	cmpl	%ecx, -40(%rbp)
	jg	L144
L147:
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-128(%rbp), %rax
	movl	(%rax), %edx
	movq	-80(%rbp), %rax
	movl	%edx, (%rax,%rsi,4)
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-112(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	LC11(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
L146:
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-80(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	je	L145
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-80(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-120(%rbp), %rdx
	movl	(%rdx,%rsi,4), %esi
	cltd
	idivl	%esi
	movl	%edx, -88(%rbp)
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-112(%rbp), %rax
	movsd	(%rax,%rsi,8), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-88(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movq	-112(%rbp), %rax
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rsi
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-80(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	subl	-88(%rbp), %eax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rdi
	movq	-120(%rbp), %rdx
	movl	(%rdx,%rdi,4), %edi
	cltd
	idivl	%edi
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movl	%edx, (%rax,%rsi,4)
	movl	-40(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-120(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	-24(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	L146
L145:
	cmpl	%ecx, -40(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -40(%rbp)
	testl	%eax, %eax
	jne	L144
	jmp	L147
L144:
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, (%rax)
	nop
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_free
	nop
	addq	$112, %rsp
	popq	%r12
	popq	%r13
	popq	%rbp
LCFI32:
	ret
LFE8:
	.globl _halton_f_
_halton_f_:
LFB9:
	pushq	%rbp
LCFI33:
	movq	%rsp, %rbp
LCFI34:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
LCFI35:
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%r8, -136(%rbp)
	movq	%r9, -144(%rbp)
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	-112(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	movq	%rdx, %rbx
	cmovns	%rax, %rbx
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -80(%rbp)
	movq	%rbx, %rax
	imulq	-80(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%rbx, %r14
	notq	%r14
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	salq	$3, %rax
	movl	$1, %edx
	testq	%rax, %rax
	cmove	%rdx, %rax
	movq	%rax, %rdi
	call	_malloc
	movq	%rax, -96(%rbp)
	movq	-144(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	L150
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	_inithalton_
L150:
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	L151
	movq	-112(%rbp), %rax
	movl	(%rax), %r12d
	movl	$1, -52(%rbp)
	cmpl	%r12d, -52(%rbp)
	jg	L162
L155:
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	_nexthalton_
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, -56(%rbp)
	cmpl	%eax, -56(%rbp)
	jg	L153
L154:
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%rdx,%r14), %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-96(%rbp), %rdx
	movsd	(%rdx,%rsi,8), %xmm0
	movq	-104(%rbp), %rdx
	movsd	%xmm0, (%rdx,%rcx,8)
	cmpl	%eax, -56(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -56(%rbp)
	testl	%edx, %edx
	jne	L153
	jmp	L154
L153:
	cmpl	%r12d, -52(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -52(%rbp)
	testl	%eax, %eax
	jne	L162
	jmp	L155
L151:
	movq	-112(%rbp), %rax
	movl	(%rax), %r12d
	movl	$1, -52(%rbp)
	cmpl	%r12d, -52(%rbp)
	jg	L162
L159:
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	_nexthalton_
	movq	-120(%rbp), %rax
	movl	(%rax), %r13d
	movl	$1, -56(%rbp)
	cmpl	%r13d, -56(%rbp)
	jg	L157
L158:
	movl	-56(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%rax,%r14), %rdx
	movl	-52(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %r15
	movl	-56(%rbp), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	_hqnorm_
	movq	%xmm0, %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, (%rax,%r15,8)
	cmpl	%r13d, -56(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -56(%rbp)
	testl	%eax, %eax
	jne	L157
	jmp	L158
L157:
	cmpl	%r12d, -52(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -52(%rbp)
	testl	%eax, %eax
	jne	L162
	jmp	L159
L162:
	nop
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_free
	nop
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI36:
	ret
LFE9:
	.globl _sobol_f_
_sobol_f_:
LFB10:
	pushq	%rbp
LCFI37:
	movq	%rsp, %rbp
LCFI38:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
LCFI39:
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%r8, -136(%rbp)
	movq	%r9, -144(%rbp)
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovns	%rax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	-112(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	movq	%rdx, %rbx
	cmovns	%rax, %rbx
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -88(%rbp)
	movq	%rbx, %rax
	imulq	-88(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	%rbx, %r14
	notq	%r14
	movq	40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	L164
	movq	24(%rbp), %rdi
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	subq	$8, %rsp
	pushq	32(%rbp)
	movq	%rdi, %r9
	movq	16(%rbp), %r8
	movq	%rax, %rdi
	call	_initsobol_
	addq	$16, %rsp
L164:
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	L165
	movq	-112(%rbp), %rax
	movl	(%rax), %r12d
	movl	$1, -52(%rbp)
	cmpl	%r12d, -52(%rbp)
	jg	L175
L169:
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	16(%rbp), %r8
	movq	%rax, %rdi
	call	_nextsobol_
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, -56(%rbp)
	cmpl	%eax, -56(%rbp)
	jg	L167
L168:
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%rdx,%r14), %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-128(%rbp), %rdx
	movsd	(%rdx,%rsi,8), %xmm0
	movq	-104(%rbp), %rdx
	movsd	%xmm0, (%rdx,%rcx,8)
	cmpl	%eax, -56(%rbp)
	sete	%dl
	movzbl	%dl, %edx
	addl	$1, -56(%rbp)
	testl	%edx, %edx
	jne	L167
	jmp	L168
L167:
	cmpl	%r12d, -52(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -52(%rbp)
	testl	%eax, %eax
	jne	L175
	jmp	L169
L165:
	movq	-112(%rbp), %rax
	movl	(%rax), %r12d
	movl	$1, -52(%rbp)
	cmpl	%r12d, -52(%rbp)
	jg	L175
L173:
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	16(%rbp), %r8
	movq	%rax, %rdi
	call	_nextsobol_
	movq	-120(%rbp), %rax
	movl	(%rax), %r13d
	movl	$1, -56(%rbp)
	cmpl	%r13d, -56(%rbp)
	jg	L171
L172:
	movl	-56(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%rax,%r14), %rdx
	movl	-52(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %r15
	movl	-56(%rbp), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	_sqnorm_
	movq	%xmm0, %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, (%rax,%r15,8)
	cmpl	%r13d, -56(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -56(%rbp)
	testl	%eax, %eax
	jne	L171
	jmp	L172
L171:
	cmpl	%r12d, -52(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	$1, -52(%rbp)
	testl	%eax, %eax
	jne	L175
	jmp	L173
L175:
	nop
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI40:
	ret
LFE10:
	.data
	.align 5
_tau.3519:
	.long	0
	.long	0
	.long	1
	.long	3
	.long	5
	.long	8
	.long	11
	.long	15
	.long	19
	.long	23
	.long	27
	.long	31
	.long	35
	.align 5
_poly.3504:
	.long	3
	.long	7
	.long	11
	.long	13
	.long	19
	.long	25
	.long	37
	.long	59
	.long	47
	.long	61
	.long	55
	.long	41
	.long	67
	.long	97
	.long	91
	.long	109
	.long	103
	.long	115
	.long	131
	.long	193
	.long	137
	.long	145
	.long	143
	.long	241
	.long	157
	.long	185
	.long	167
	.long	229
	.long	171
	.long	213
	.long	191
	.long	253
	.long	203
	.long	211
	.long	239
	.long	247
	.long	285
	.long	369
	.long	299
	.long	301
	.long	333
	.long	351
	.long	355
	.long	357
	.long	361
	.long	391
	.long	397
	.long	425
	.long	451
	.long	463
	.long	487
	.long	501
	.long	529
	.long	539
	.long	545
	.long	557
	.long	563
	.long	601
	.long	607
	.long	617
	.long	623
	.long	631
	.long	637
	.long	647
	.long	661
	.long	675
	.long	677
	.long	687
	.long	695
	.long	701
	.long	719
	.long	721
	.long	731
	.long	757
	.long	761
	.long	787
	.long	789
	.long	799
	.long	803
	.long	817
	.long	827
	.long	847
	.long	859
	.long	865
	.long	875
	.long	877
	.long	883
	.long	895
	.long	901
	.long	911
	.long	949
	.long	953
	.long	967
	.long	971
	.long	973
	.long	981
	.long	985
	.long	995
	.long	1001
	.long	1019
	.long	1033
	.long	1051
	.long	1063
	.long	1069
	.long	1125
	.long	1135
	.long	1153
	.long	1163
	.long	1221
	.long	1239
	.long	1255
	.long	1267
	.long	1279
	.long	1293
	.long	1305
	.long	1315
	.long	1329
	.long	1341
	.long	1347
	.long	1367
	.long	1387
	.long	1413
	.long	1423
	.long	1431
	.long	1441
	.long	1479
	.long	1509
	.long	1527
	.long	1531
	.long	1555
	.long	1557
	.long	1573
	.long	1591
	.long	1603
	.long	1615
	.long	1627
	.long	1657
	.long	1663
	.long	1673
	.long	1717
	.long	1729
	.long	1747
	.long	1759
	.long	1789
	.long	1815
	.long	1821
	.long	1825
	.long	1849
	.long	1863
	.long	1869
	.long	1877
	.long	1881
	.long	1891
	.long	1917
	.long	1933
	.long	1939
	.long	1969
	.long	2011
	.long	2035
	.long	2041
	.long	2053
	.long	2071
	.long	2091
	.long	2093
	.long	2119
	.long	2147
	.long	2149
	.long	2161
	.long	2171
	.long	2189
	.long	2197
	.long	2207
	.long	2217
	.long	2225
	.long	2255
	.long	2257
	.long	2273
	.long	2279
	.long	2283
	.long	2293
	.long	2317
	.long	2323
	.long	2341
	.long	2345
	.long	2363
	.long	2365
	.long	2373
	.long	2377
	.long	2385
	.long	2395
	.long	2419
	.long	2421
	.long	2431
	.long	2435
	.long	2447
	.long	2475
	.long	2477
	.long	2489
	.long	2503
	.long	2521
	.long	2533
	.long	2551
	.long	2561
	.long	2567
	.long	2579
	.long	2581
	.long	2601
	.long	2633
	.long	2657
	.long	2669
	.long	2681
	.long	2687
	.long	2693
	.long	2705
	.long	2717
	.long	2727
	.long	2731
	.long	2739
	.long	2741
	.long	2773
	.long	2783
	.long	2793
	.long	2799
	.long	2801
	.long	2811
	.long	2819
	.long	2825
	.long	2833
	.long	2867
	.long	2879
	.long	2881
	.long	2891
	.long	2905
	.long	2911
	.long	2917
	.long	2927
	.long	2941
	.long	2951
	.long	2955
	.long	2963
	.long	2965
	.long	2991
	.long	2999
	.long	3005
	.long	3017
	.long	3035
	.long	3037
	.long	3047
	.long	3053
	.long	3083
	.long	3085
	.long	3097
	.long	3103
	.long	3159
	.long	3169
	.long	3179
	.long	3187
	.long	3205
	.long	3209
	.long	3223
	.long	3227
	.long	3229
	.long	3251
	.long	3263
	.long	3271
	.long	3277
	.long	3283
	.long	3285
	.long	3299
	.long	3305
	.long	3319
	.long	3331
	.long	3343
	.long	3357
	.long	3367
	.long	3373
	.long	3393
	.long	3399
	.long	3413
	.long	3417
	.long	3427
	.long	3439
	.long	3441
	.long	3475
	.long	3487
	.long	3497
	.long	3515
	.long	3517
	.long	3529
	.long	3543
	.long	3547
	.long	3553
	.long	3559
	.long	3573
	.long	3589
	.long	3613
	.long	3617
	.long	3623
	.long	3627
	.long	3635
	.long	3641
	.long	3655
	.long	3659
	.long	3669
	.long	3679
	.long	3697
	.long	3707
	.long	3709
	.long	3713
	.long	3731
	.long	3743
	.long	3747
	.long	3771
	.long	3791
	.long	3805
	.long	3827
	.long	3833
	.long	3851
	.long	3865
	.long	3889
	.long	3895
	.long	3933
	.long	3947
	.long	3949
	.long	3957
	.long	3971
	.long	3985
	.long	3991
	.long	3995
	.long	4007
	.long	4013
	.long	4021
	.long	4045
	.long	4051
	.long	4069
	.long	4073
	.long	4179
	.long	4201
	.long	4219
	.long	4221
	.long	4249
	.long	4305
	.long	4331
	.long	4359
	.long	4383
	.long	4387
	.long	4411
	.long	4431
	.long	4439
	.long	4449
	.long	4459
	.long	4485
	.long	4531
	.long	4569
	.long	4575
	.long	4621
	.long	4663
	.long	4669
	.long	4711
	.long	4723
	.long	4735
	.long	4793
	.long	4801
	.long	4811
	.long	4879
	.long	4893
	.long	4897
	.long	4921
	.long	4927
	.long	4941
	.long	4977
	.long	5017
	.long	5027
	.long	5033
	.long	5127
	.long	5169
	.long	5175
	.long	5199
	.long	5213
	.long	5223
	.long	5237
	.long	5287
	.long	5293
	.long	5331
	.long	5391
	.long	5405
	.long	5453
	.long	5523
	.long	5573
	.long	5591
	.long	5597
	.long	5611
	.long	5641
	.long	5703
	.long	5717
	.long	5721
	.long	5797
	.long	5821
	.long	5909
	.long	5913
	.long	5955
	.long	5957
	.long	6005
	.long	6025
	.long	6061
	.long	6067
	.long	6079
	.long	6081
	.long	6231
	.long	6237
	.long	6289
	.long	6295
	.long	6329
	.long	6383
	.long	6427
	.long	6453
	.long	6465
	.long	6501
	.long	6523
	.long	6539
	.long	6577
	.long	6589
	.long	6601
	.long	6607
	.long	6631
	.long	6683
	.long	6699
	.long	6707
	.long	6761
	.long	6795
	.long	6865
	.long	6881
	.long	6901
	.long	6923
	.long	6931
	.long	6943
	.long	6999
	.long	7057
	.long	7079
	.long	7103
	.long	7105
	.long	7123
	.long	7173
	.long	7185
	.long	7191
	.long	7207
	.long	7245
	.long	7303
	.long	7327
	.long	7333
	.long	7355
	.long	7365
	.long	7369
	.long	7375
	.long	7411
	.long	7431
	.long	7459
	.long	7491
	.long	7505
	.long	7515
	.long	7541
	.long	7557
	.long	7561
	.long	7701
	.long	7705
	.long	7727
	.long	7749
	.long	7761
	.long	7783
	.long	7795
	.long	7823
	.long	7907
	.long	7953
	.long	7963
	.long	7975
	.long	8049
	.long	8089
	.long	8123
	.long	8125
	.long	8137
	.long	8219
	.long	8231
	.long	8245
	.long	8275
	.long	8293
	.long	8303
	.long	8331
	.long	8333
	.long	8351
	.long	8357
	.long	8367
	.long	8379
	.long	8381
	.long	8387
	.long	8393
	.long	8417
	.long	8435
	.long	8461
	.long	8469
	.long	8489
	.long	8495
	.long	8507
	.long	8515
	.long	8551
	.long	8555
	.long	8569
	.long	8585
	.long	8599
	.long	8605
	.long	8639
	.long	8641
	.long	8647
	.long	8653
	.long	8671
	.long	8675
	.long	8689
	.long	8699
	.long	8729
	.long	8741
	.long	8759
	.long	8765
	.long	8771
	.long	8795
	.long	8797
	.long	8825
	.long	8831
	.long	8841
	.long	8855
	.long	8859
	.long	8883
	.long	8895
	.long	8909
	.long	8943
	.long	8951
	.long	8955
	.long	8965
	.long	8999
	.long	9003
	.long	9031
	.long	9045
	.long	9049
	.long	9071
	.long	9073
	.long	9085
	.long	9095
	.long	9101
	.long	9109
	.long	9123
	.long	9129
	.long	9137
	.long	9143
	.long	9147
	.long	9185
	.long	9197
	.long	9209
	.long	9227
	.long	9235
	.long	9247
	.long	9253
	.long	9257
	.long	9277
	.long	9297
	.long	9303
	.long	9313
	.long	9325
	.long	9343
	.long	9347
	.long	9371
	.long	9373
	.long	9397
	.long	9407
	.long	9409
	.long	9415
	.long	9419
	.long	9443
	.long	9481
	.long	9495
	.long	9501
	.long	9505
	.long	9517
	.long	9529
	.long	9555
	.long	9557
	.long	9571
	.long	9585
	.long	9591
	.long	9607
	.long	9611
	.long	9621
	.long	9625
	.long	9631
	.long	9647
	.long	9661
	.long	9669
	.long	9679
	.long	9687
	.long	9707
	.long	9731
	.long	9733
	.long	9745
	.long	9773
	.long	9791
	.long	9803
	.long	9811
	.long	9817
	.long	9833
	.long	9847
	.long	9851
	.long	9863
	.long	9875
	.long	9881
	.long	9905
	.long	9911
	.long	9917
	.long	9923
	.long	9963
	.long	9973
	.long	10003
	.long	10025
	.long	10043
	.long	10063
	.long	10071
	.long	10077
	.long	10091
	.long	10099
	.long	10105
	.long	10115
	.long	10129
	.long	10145
	.long	10169
	.long	10183
	.long	10187
	.long	10207
	.long	10223
	.long	10225
	.long	10247
	.long	10265
	.long	10271
	.long	10275
	.long	10289
	.long	10299
	.long	10301
	.long	10309
	.long	10343
	.long	10357
	.long	10373
	.long	10411
	.long	10413
	.long	10431
	.long	10445
	.long	10453
	.long	10463
	.long	10467
	.long	10473
	.long	10491
	.long	10505
	.long	10511
	.long	10513
	.long	10523
	.long	10539
	.long	10549
	.long	10559
	.long	10561
	.long	10571
	.long	10581
	.long	10615
	.long	10621
	.long	10625
	.long	10643
	.long	10655
	.long	10671
	.long	10679
	.long	10685
	.long	10691
	.long	10711
	.long	10739
	.long	10741
	.long	10755
	.long	10767
	.long	10781
	.long	10785
	.long	10803
	.long	10805
	.long	10829
	.long	10857
	.long	10863
	.long	10865
	.long	10875
	.long	10877
	.long	10917
	.long	10921
	.long	10929
	.long	10949
	.long	10967
	.long	10971
	.long	10987
	.long	10995
	.long	11009
	.long	11029
	.long	11043
	.long	11045
	.long	11055
	.long	11063
	.long	11075
	.long	11081
	.long	11117
	.long	11135
	.long	11141
	.long	11159
	.long	11163
	.long	11181
	.long	11187
	.long	11225
	.long	11237
	.long	11261
	.long	11279
	.long	11297
	.long	11307
	.long	11309
	.long	11327
	.long	11329
	.long	11341
	.long	11377
	.long	11403
	.long	11405
	.long	11413
	.long	11427
	.long	11439
	.long	11453
	.long	11461
	.long	11473
	.long	11479
	.long	11489
	.long	11495
	.long	11499
	.long	11533
	.long	11545
	.long	11561
	.long	11567
	.long	11575
	.long	11579
	.long	11589
	.long	11611
	.long	11623
	.long	11637
	.long	11657
	.long	11663
	.long	11687
	.long	11691
	.long	11701
	.long	11747
	.long	11761
	.long	11773
	.long	11783
	.long	11795
	.long	11797
	.long	11817
	.long	11849
	.long	11855
	.long	11867
	.long	11869
	.long	11873
	.long	11883
	.long	11919
	.long	11921
	.long	11927
	.long	11933
	.long	11947
	.long	11955
	.long	11961
	.long	11999
	.long	12027
	.long	12029
	.long	12037
	.long	12041
	.long	12049
	.long	12055
	.long	12095
	.long	12097
	.long	12107
	.long	12109
	.long	12121
	.long	12127
	.long	12133
	.long	12137
	.long	12181
	.long	12197
	.long	12207
	.long	12209
	.long	12239
	.long	12253
	.long	12263
	.long	12269
	.long	12277
	.long	12287
	.long	12295
	.long	12309
	.long	12313
	.long	12335
	.long	12361
	.long	12367
	.long	12391
	.long	12409
	.long	12415
	.long	12433
	.long	12449
	.long	12469
	.long	12479
	.long	12481
	.long	12499
	.long	12505
	.long	12517
	.long	12527
	.long	12549
	.long	12559
	.long	12597
	.long	12615
	.long	12621
	.long	12639
	.long	12643
	.long	12657
	.long	12667
	.long	12707
	.long	12713
	.long	12727
	.long	12741
	.long	12745
	.long	12763
	.long	12769
	.long	12779
	.long	12781
	.long	12787
	.long	12799
	.long	12809
	.long	12815
	.long	12829
	.long	12839
	.long	12857
	.long	12875
	.long	12883
	.long	12889
	.long	12901
	.long	12929
	.long	12947
	.long	12953
	.long	12959
	.long	12969
	.long	12983
	.long	12987
	.long	12995
	.long	13015
	.long	13019
	.long	13031
	.long	13063
	.long	13077
	.long	13103
	.long	13137
	.long	13149
	.long	13173
	.long	13207
	.long	13211
	.long	13227
	.long	13241
	.long	13249
	.long	13255
	.long	13269
	.long	13283
	.long	13285
	.long	13303
	.long	13307
	.long	13321
	.long	13339
	.long	13351
	.long	13377
	.long	13389
	.long	13407
	.long	13417
	.long	13431
	.long	13435
	.long	13447
	.long	13459
	.long	13465
	.long	13477
	.long	13501
	.long	13513
	.long	13531
	.long	13543
	.long	13561
	.long	13581
	.long	13599
	.long	13605
	.long	13617
	.long	13623
	.long	13637
	.long	13647
	.long	13661
	.long	13677
	.long	13683
	.long	13695
	.long	13725
	.long	13729
	.long	13753
	.long	13773
	.long	13781
	.long	13785
	.long	13795
	.long	13801
	.long	13807
	.long	13825
	.long	13835
	.long	13855
	.long	13861
	.long	13871
	.long	13883
	.long	13897
	.long	13905
	.long	13915
	.long	13939
	.long	13941
	.long	13969
	.long	13979
	.long	13981
	.long	13997
	.long	14027
	.long	14035
	.long	14037
	.long	14051
	.long	14063
	.long	14085
	.long	14095
	.long	14107
	.long	14113
	.long	14125
	.long	14137
	.long	14145
	.long	14151
	.long	14163
	.long	14193
	.long	14199
	.long	14219
	.long	14229
	.long	14233
	.long	14243
	.long	14277
	.long	14287
	.long	14289
	.long	14295
	.long	14301
	.long	14305
	.long	14323
	.long	14339
	.long	14341
	.long	14359
	.long	14365
	.long	14375
	.long	14387
	.long	14411
	.long	14425
	.long	14441
	.long	14449
	.long	14499
	.long	14513
	.long	14523
	.long	14537
	.long	14543
	.long	14561
	.long	14579
	.long	14585
	.long	14593
	.long	14599
	.long	14603
	.long	14611
	.long	14641
	.long	14671
	.long	14695
	.long	14701
	.long	14723
	.long	14725
	.long	14743
	.long	14753
	.long	14759
	.long	14765
	.long	14795
	.long	14797
	.long	14803
	.long	14831
	.long	14839
	.long	14845
	.long	14855
	.long	14889
	.long	14895
	.long	14909
	.long	14929
	.long	14941
	.long	14945
	.long	14951
	.long	14963
	.long	14965
	.long	14985
	.long	15033
	.long	15039
	.long	15053
	.long	15059
	.long	15061
	.long	15071
	.long	15077
	.long	15081
	.long	15099
	.long	15121
	.long	15147
	.long	15149
	.long	15157
	.long	15167
	.long	15187
	.long	15193
	.long	15203
	.long	15205
	.long	15215
	.long	15217
	.long	15223
	.long	15243
	.long	15257
	.long	15269
	.long	15273
	.long	15287
	.long	15291
	.long	15313
	.long	15335
	.long	15347
	.long	15359
	.long	15373
	.long	15379
	.long	15381
	.long	15391
	.long	15395
	.long	15397
	.long	15419
	.long	15439
	.long	15453
	.long	15469
	.long	15491
	.long	15503
	.long	15517
	.long	15527
	.long	15531
	.long	15545
	.long	15559
	.long	15593
	.long	15611
	.long	15613
	.long	15619
	.long	15639
	.long	15643
	.long	15649
	.long	15661
	.long	15667
	.long	15669
	.long	15681
	.long	15693
	.long	15717
	.long	15721
	.long	15741
	.long	15745
	.long	15765
	.long	15793
	.long	15799
	.long	15811
	.long	15825
	.long	15835
	.long	15847
	.long	15851
	.long	15865
	.long	15877
	.long	15881
	.long	15887
	.long	15899
	.long	15915
	.long	15935
	.long	15937
	.long	15955
	.long	15973
	.long	15977
	.long	16011
	.long	16035
	.long	16061
	.long	16069
	.long	16087
	.long	16093
	.long	16097
	.long	16121
	.long	16141
	.long	16153
	.long	16159
	.long	16165
	.long	16183
	.long	16189
	.long	16195
	.long	16197
	.long	16201
	.long	16209
	.long	16215
	.long	16225
	.long	16259
	.long	16265
	.long	16273
	.long	16299
	.long	16309
	.long	16355
	.long	16375
	.long	16381
	.align 5
_vinit.3539:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.space 4
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.space 8
	.long	7
	.long	5
	.long	1
	.long	3
	.long	3
	.long	7
	.long	5
	.long	5
	.long	7
	.long	7
	.long	1
	.long	3
	.long	3
	.long	7
	.long	5
	.long	1
	.long	1
	.long	5
	.long	3
	.long	7
	.long	1
	.long	7
	.long	5
	.long	1
	.long	3
	.long	7
	.long	7
	.long	1
	.long	1
	.long	1
	.long	5
	.long	7
	.long	7
	.long	5
	.long	1
	.long	3
	.long	3
	.long	7
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	5
	.long	1
	.long	1
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	7
	.long	5
	.long	7
	.long	3
	.long	7
	.long	1
	.long	3
	.long	3
	.long	5
	.long	1
	.long	3
	.long	5
	.long	5
	.long	7
	.long	7
	.long	7
	.long	1
	.long	1
	.long	3
	.long	3
	.long	1
	.long	1
	.long	5
	.long	1
	.long	5
	.long	7
	.long	5
	.long	1
	.long	7
	.long	5
	.long	3
	.long	3
	.long	1
	.long	5
	.long	7
	.long	1
	.long	7
	.long	5
	.long	1
	.long	7
	.long	3
	.long	1
	.long	7
	.long	1
	.long	7
	.long	3
	.long	3
	.long	5
	.long	7
	.long	3
	.long	3
	.long	5
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	5
	.long	1
	.long	3
	.long	3
	.long	3
	.long	7
	.long	1
	.long	1
	.long	7
	.long	3
	.long	1
	.long	3
	.long	7
	.long	5
	.long	5
	.long	7
	.long	5
	.long	5
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	3
	.long	7
	.long	3
	.long	3
	.long	1
	.long	7
	.long	5
	.long	1
	.long	7
	.long	7
	.long	5
	.long	7
	.long	5
	.long	1
	.long	3
	.long	1
	.long	7
	.long	3
	.long	7
	.long	3
	.long	5
	.long	7
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	1
	.long	5
	.long	7
	.long	3
	.long	3
	.long	7
	.long	7
	.long	7
	.long	5
	.long	3
	.long	1
	.long	7
	.long	1
	.long	3
	.long	7
	.long	5
	.long	3
	.long	3
	.long	3
	.long	7
	.long	1
	.long	1
	.long	3
	.long	1
	.long	5
	.long	7
	.long	1
	.long	3
	.long	5
	.long	3
	.long	5
	.long	3
	.long	3
	.long	7
	.long	5
	.long	5
	.long	3
	.long	3
	.long	1
	.long	3
	.long	7
	.long	7
	.long	7
	.long	1
	.long	5
	.long	7
	.long	1
	.long	3
	.long	1
	.long	1
	.long	7
	.long	1
	.long	3
	.long	1
	.long	7
	.long	1
	.long	5
	.long	3
	.long	5
	.long	3
	.long	1
	.long	1
	.long	5
	.long	5
	.long	3
	.long	3
	.long	5
	.long	7
	.long	1
	.long	5
	.long	3
	.long	7
	.long	7
	.long	3
	.long	5
	.long	3
	.long	3
	.long	1
	.long	7
	.long	3
	.long	1
	.long	3
	.long	5
	.long	7
	.long	1
	.long	3
	.long	7
	.long	1
	.long	5
	.long	1
	.long	3
	.long	1
	.long	5
	.long	3
	.long	1
	.long	7
	.long	1
	.long	5
	.long	5
	.long	5
	.long	3
	.long	7
	.long	1
	.long	1
	.long	7
	.long	3
	.long	1
	.long	1
	.long	7
	.long	5
	.long	7
	.long	5
	.long	7
	.long	7
	.long	3
	.long	7
	.long	1
	.long	3
	.long	7
	.long	7
	.long	3
	.long	5
	.long	1
	.long	1
	.long	7
	.long	1
	.long	5
	.long	5
	.long	5
	.long	1
	.long	5
	.long	1
	.long	7
	.long	5
	.long	5
	.long	7
	.long	1
	.long	1
	.long	7
	.long	1
	.long	7
	.long	7
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	7
	.long	7
	.long	5
	.long	3
	.long	7
	.long	3
	.long	1
	.long	3
	.long	7
	.long	5
	.long	3
	.long	3
	.long	5
	.long	7
	.long	1
	.long	1
	.long	5
	.long	5
	.long	7
	.long	7
	.long	1
	.long	1
	.long	1
	.long	1
	.long	5
	.long	5
	.long	5
	.long	7
	.long	5
	.long	7
	.long	1
	.long	1
	.long	3
	.long	5
	.long	1
	.long	3
	.long	3
	.long	7
	.long	3
	.long	7
	.long	5
	.long	3
	.long	5
	.long	3
	.long	1
	.long	7
	.long	1
	.long	7
	.long	7
	.long	1
	.long	1
	.long	7
	.long	7
	.long	7
	.long	5
	.long	5
	.long	1
	.long	1
	.long	7
	.long	5
	.long	5
	.long	7
	.long	5
	.long	1
	.long	1
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	1
	.long	3
	.long	1
	.long	5
	.long	7
	.long	3
	.long	3
	.long	5
	.long	7
	.long	3
	.long	7
	.long	1
	.long	7
	.long	7
	.long	1
	.long	3
	.long	5
	.long	1
	.long	5
	.long	5
	.long	3
	.long	7
	.long	3
	.long	7
	.long	7
	.long	5
	.long	7
	.long	5
	.long	7
	.long	1
	.long	1
	.long	5
	.long	3
	.long	5
	.long	1
	.long	5
	.long	3
	.long	7
	.long	1
	.long	5
	.long	7
	.long	7
	.long	3
	.long	5
	.long	1
	.long	3
	.long	5
	.long	1
	.long	5
	.long	3
	.long	3
	.long	3
	.long	7
	.long	3
	.long	5
	.long	1
	.long	3
	.long	7
	.long	7
	.long	3
	.long	7
	.long	5
	.long	3
	.long	3
	.long	1
	.long	7
	.long	5
	.long	1
	.long	1
	.long	3
	.long	7
	.long	1
	.long	7
	.long	1
	.long	7
	.long	3
	.long	7
	.long	3
	.long	5
	.long	7
	.long	3
	.long	5
	.long	3
	.long	1
	.long	1
	.long	1
	.long	5
	.long	7
	.long	7
	.long	3
	.long	3
	.long	1
	.long	1
	.long	1
	.long	5
	.long	5
	.long	7
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	7
	.long	3
	.long	3
	.long	5
	.long	1
	.long	3
	.long	7
	.long	3
	.long	3
	.long	7
	.long	3
	.long	5
	.long	7
	.long	5
	.long	7
	.long	7
	.long	3
	.long	3
	.long	5
	.long	1
	.long	3
	.long	5
	.long	3
	.long	1
	.long	3
	.long	5
	.long	1
	.long	1
	.long	3
	.long	7
	.long	7
	.long	1
	.long	5
	.long	1
	.long	3
	.long	7
	.long	3
	.long	7
	.long	3
	.long	5
	.long	1
	.long	7
	.long	1
	.long	1
	.long	3
	.long	5
	.long	3
	.long	7
	.long	1
	.long	5
	.long	5
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	7
	.long	1
	.long	7
	.long	3
	.long	1
	.long	7
	.long	3
	.long	1
	.long	7
	.long	3
	.long	5
	.long	3
	.long	5
	.long	7
	.long	3
	.long	3
	.long	3
	.long	5
	.long	1
	.long	7
	.long	7
	.long	1
	.long	3
	.long	1
	.long	3
	.long	7
	.long	7
	.long	1
	.long	3
	.long	7
	.long	3
	.long	1
	.long	5
	.long	3
	.long	1
	.long	1
	.long	1
	.long	5
	.long	3
	.long	3
	.long	7
	.long	1
	.long	5
	.long	3
	.long	5
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	5
	.long	7
	.long	7
	.long	1
	.long	1
	.long	5
	.long	3
	.long	1
	.long	5
	.long	1
	.long	1
	.long	7
	.long	7
	.long	3
	.long	5
	.long	5
	.long	1
	.long	7
	.long	1
	.long	5
	.long	1
	.long	1
	.long	3
	.long	1
	.long	5
	.long	7
	.long	5
	.long	7
	.long	7
	.long	1
	.long	5
	.long	1
	.long	1
	.long	3
	.long	5
	.long	1
	.long	5
	.long	5
	.long	3
	.long	1
	.long	3
	.long	1
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	5
	.long	5
	.long	7
	.long	5
	.long	5
	.long	7
	.long	5
	.long	7
	.long	1
	.long	3
	.long	7
	.long	7
	.long	3
	.long	5
	.long	5
	.long	7
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	1
	.long	7
	.long	1
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	5
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	3
	.long	7
	.long	1
	.long	7
	.long	7
	.long	3
	.long	7
	.long	1
	.long	1
	.long	5
	.long	7
	.long	1
	.long	7
	.long	1
	.long	7
	.long	7
	.long	1
	.long	3
	.long	7
	.long	5
	.long	1
	.long	3
	.long	5
	.long	5
	.long	5
	.long	1
	.long	1
	.long	7
	.long	1
	.long	7
	.long	1
	.long	7
	.long	7
	.long	3
	.long	1
	.long	1
	.long	5
	.long	1
	.long	5
	.long	1
	.long	5
	.long	3
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	7
	.long	3
	.long	3
	.long	5
	.long	5
	.long	3
	.long	7
	.long	1
	.long	5
	.long	7
	.long	5
	.long	1
	.long	5
	.long	5
	.long	3
	.long	5
	.long	5
	.long	7
	.long	5
	.long	3
	.long	5
	.long	5
	.long	5
	.long	1
	.long	5
	.long	5
	.long	5
	.long	5
	.long	1
	.long	3
	.long	5
	.long	3
	.long	1
	.long	7
	.long	5
	.long	5
	.long	7
	.long	1
	.long	5
	.long	3
	.long	3
	.long	1
	.long	5
	.long	3
	.long	7
	.long	1
	.long	7
	.long	5
	.long	1
	.long	1
	.long	3
	.long	1
	.long	1
	.long	7
	.long	1
	.long	5
	.long	5
	.long	3
	.long	7
	.long	3
	.long	7
	.long	5
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	5
	.long	5
	.long	7
	.long	5
	.long	3
	.long	7
	.long	7
	.long	7
	.long	3
	.long	7
	.long	3
	.long	7
	.long	1
	.long	3
	.long	1
	.long	7
	.long	7
	.long	1
	.long	7
	.long	3
	.long	7
	.long	3
	.long	7
	.long	3
	.long	7
	.long	3
	.long	5
	.long	1
	.long	1
	.long	7
	.long	3
	.long	1
	.long	5
	.long	5
	.long	7
	.long	1
	.long	5
	.long	5
	.long	5
	.long	7
	.long	1
	.long	5
	.long	5
	.long	1
	.long	5
	.long	5
	.long	3
	.long	1
	.long	3
	.long	1
	.long	7
	.long	3
	.long	1
	.long	3
	.long	5
	.long	7
	.long	7
	.long	7
	.long	1
	.long	1
	.long	7
	.long	3
	.long	1
	.long	5
	.long	5
	.long	5
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	5
	.long	3
	.long	5
	.long	1
	.long	3
	.long	5
	.long	3
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3
	.long	7
	.long	3
	.long	7
	.long	5
	.long	7
	.long	1
	.long	5
	.long	5
	.long	7
	.long	5
	.long	3
	.long	3
	.long	7
	.long	5
	.long	3
	.long	1
	.long	1
	.long	3
	.long	1
	.long	3
	.long	1
	.long	1
	.long	3
	.long	7
	.long	1
	.long	7
	.long	1
	.long	1
	.long	5
	.long	1
	.long	7
	.long	5
	.long	3
	.long	7
	.long	3
	.long	5
	.long	3
	.long	1
	.long	1
	.long	5
	.long	5
	.long	1
	.long	7
	.long	7
	.long	3
	.long	7
	.long	3
	.long	7
	.long	1
	.long	5
	.long	1
	.long	5
	.long	3
	.long	7
	.long	3
	.long	5
	.long	7
	.long	7
	.long	7
	.long	3
	.long	3
	.long	1
	.long	1
	.long	5
	.long	5
	.long	3
	.long	7
	.long	1
	.long	1
	.long	1
	.long	3
	.long	5
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	7
	.long	5
	.long	1
	.long	1
	.long	3
	.long	7
	.long	1
	.long	5
	.long	7
	.long	3
	.long	7
	.long	5
	.long	5
	.long	7
	.long	3
	.long	5
	.long	3
	.long	1
	.long	5
	.long	3
	.long	1
	.long	1
	.long	7
	.long	5
	.long	1
	.long	7
	.long	3
	.long	7
	.long	5
	.long	1
	.long	7
	.long	1
	.long	7
	.long	7
	.long	1
	.long	1
	.long	7
	.long	1
	.long	5
	.long	5
	.long	1
	.long	1
	.long	7
	.long	5
	.long	7
	.long	1
	.long	5
	.long	3
	.long	5
	.long	3
	.long	3
	.long	7
	.long	1
	.long	5
	.long	1
	.long	1
	.long	5
	.long	5
	.long	3
	.long	3
	.long	7
	.long	5
	.long	5
	.long	1
	.long	1
	.long	1
	.long	3
	.long	1
	.long	5
	.long	7
	.long	7
	.long	1
	.long	7
	.long	5
	.long	7
	.long	3
	.long	7
	.long	3
	.long	1
	.long	3
	.long	7
	.long	3
	.long	1
	.long	5
	.long	5
	.long	3
	.long	5
	.long	1
	.long	3
	.long	5
	.long	5
	.long	5
	.long	1
	.long	1
	.long	7
	.long	7
	.long	1
	.long	5
	.long	5
	.long	1
	.long	3
	.long	5
	.long	1
	.long	5
	.long	3
	.long	5
	.long	3
	.long	3
	.long	7
	.long	5
	.long	7
	.long	3
	.long	7
	.long	3
	.long	1
	.long	3
	.long	7
	.long	7
	.long	3
	.long	3
	.long	1
	.long	1
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	5
	.long	7
	.long	7
	.long	1
	.long	5
	.long	7
	.long	3
	.long	7
	.long	1
	.long	1
	.long	3
	.long	5
	.long	7
	.long	5
	.long	3
	.long	3
	.long	3
	.space 16
	.long	1
	.long	7
	.long	9
	.long	13
	.long	11
	.long	1
	.long	3
	.long	7
	.long	9
	.long	5
	.long	13
	.long	13
	.long	11
	.long	3
	.long	15
	.long	5
	.long	3
	.long	15
	.long	7
	.long	9
	.long	13
	.long	9
	.long	1
	.long	11
	.long	7
	.long	5
	.long	15
	.long	1
	.long	15
	.long	11
	.long	5
	.long	11
	.long	1
	.long	7
	.long	9
	.long	7
	.long	7
	.long	1
	.long	15
	.long	15
	.long	15
	.long	13
	.long	3
	.long	3
	.long	15
	.long	5
	.long	9
	.long	7
	.long	13
	.long	3
	.long	7
	.long	5
	.long	11
	.long	9
	.long	1
	.long	9
	.long	1
	.long	5
	.long	7
	.long	13
	.long	9
	.long	9
	.long	1
	.long	7
	.long	3
	.long	5
	.long	1
	.long	11
	.long	11
	.long	13
	.long	7
	.long	7
	.long	9
	.long	9
	.long	1
	.long	1
	.long	3
	.long	9
	.long	15
	.long	1
	.long	5
	.long	13
	.long	1
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	13
	.long	11
	.long	3
	.long	5
	.long	11
	.long	11
	.long	13
	.long	5
	.long	3
	.long	15
	.long	1
	.long	11
	.long	11
	.long	7
	.long	13
	.long	15
	.long	11
	.long	13
	.long	9
	.long	11
	.long	15
	.long	15
	.long	13
	.long	3
	.long	15
	.long	7
	.long	9
	.long	11
	.long	13
	.long	11
	.long	9
	.long	9
	.long	5
	.long	13
	.long	9
	.long	1
	.long	13
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	5
	.long	9
	.long	7
	.long	13
	.long	11
	.long	9
	.long	11
	.long	15
	.long	3
	.long	13
	.long	11
	.long	1
	.long	11
	.long	3
	.long	3
	.long	9
	.long	11
	.long	1
	.long	7
	.long	1
	.long	15
	.long	15
	.long	3
	.long	1
	.long	9
	.long	1
	.long	7
	.long	13
	.long	11
	.long	3
	.long	13
	.long	11
	.long	7
	.long	3
	.long	3
	.long	5
	.long	13
	.long	11
	.long	5
	.long	11
	.long	1
	.long	3
	.long	9
	.long	7
	.long	15
	.long	7
	.long	5
	.long	13
	.long	7
	.long	9
	.long	13
	.long	15
	.long	13
	.long	9
	.long	7
	.long	15
	.long	7
	.long	9
	.long	5
	.long	11
	.long	11
	.long	13
	.long	13
	.long	9
	.long	3
	.long	5
	.long	13
	.long	9
	.long	11
	.long	15
	.long	11
	.long	7
	.long	1
	.long	7
	.long	13
	.long	3
	.long	13
	.long	3
	.long	13
	.long	9
	.long	15
	.long	7
	.long	13
	.long	13
	.long	3
	.long	13
	.long	15
	.long	15
	.long	11
	.long	9
	.long	13
	.long	9
	.long	15
	.long	1
	.long	1
	.long	15
	.long	11
	.long	11
	.long	7
	.long	1
	.long	11
	.long	13
	.long	9
	.long	13
	.long	3
	.long	5
	.long	11
	.long	13
	.long	9
	.long	9
	.long	13
	.long	1
	.long	11
	.long	15
	.long	13
	.long	3
	.long	13
	.long	7
	.long	15
	.long	1
	.long	15
	.long	3
	.long	3
	.long	11
	.long	7
	.long	13
	.long	7
	.long	7
	.long	9
	.long	7
	.long	5
	.long	15
	.long	9
	.long	5
	.long	5
	.long	7
	.long	15
	.long	13
	.long	15
	.long	5
	.long	15
	.long	5
	.long	3
	.long	1
	.long	11
	.long	7
	.long	1
	.long	5
	.long	7
	.long	9
	.long	3
	.long	11
	.long	1
	.long	15
	.long	1
	.long	3
	.long	15
	.long	11
	.long	13
	.long	5
	.long	13
	.long	1
	.long	7
	.long	1
	.long	15
	.long	7
	.long	5
	.long	1
	.long	1
	.long	15
	.long	13
	.long	11
	.long	11
	.long	13
	.long	5
	.long	11
	.long	7
	.long	9
	.long	7
	.long	1
	.long	5
	.long	3
	.long	9
	.long	5
	.long	5
	.long	11
	.long	5
	.long	1
	.long	7
	.long	1
	.long	11
	.long	7
	.long	9
	.long	13
	.long	15
	.long	13
	.long	3
	.long	1
	.long	11
	.long	13
	.long	15
	.long	1
	.long	1
	.long	11
	.long	9
	.long	13
	.long	3
	.long	13
	.long	11
	.long	15
	.long	13
	.long	9
	.long	9
	.long	9
	.long	5
	.long	5
	.long	5
	.long	5
	.long	1
	.long	15
	.long	5
	.long	9
	.long	11
	.long	7
	.long	15
	.long	5
	.long	3
	.long	13
	.long	5
	.long	3
	.long	11
	.long	5
	.long	1
	.long	11
	.long	13
	.long	9
	.long	11
	.long	3
	.long	7
	.long	13
	.long	15
	.long	1
	.long	7
	.long	11
	.long	1
	.long	13
	.long	1
	.long	15
	.long	1
	.long	9
	.long	7
	.long	3
	.long	9
	.long	11
	.long	1
	.long	9
	.long	13
	.long	13
	.long	3
	.long	11
	.long	7
	.long	9
	.long	1
	.long	7
	.long	15
	.long	9
	.long	1
	.long	5
	.long	13
	.long	5
	.long	11
	.long	3
	.long	9
	.long	15
	.long	11
	.long	13
	.long	5
	.long	1
	.long	7
	.long	7
	.long	5
	.long	13
	.long	7
	.long	7
	.long	9
	.long	5
	.long	11
	.long	11
	.long	1
	.long	1
	.long	15
	.long	3
	.long	13
	.long	9
	.long	13
	.long	9
	.long	9
	.long	11
	.long	5
	.long	5
	.long	13
	.long	15
	.long	3
	.long	9
	.long	15
	.long	3
	.long	11
	.long	11
	.long	15
	.long	15
	.long	3
	.long	11
	.long	15
	.long	15
	.long	3
	.long	1
	.long	3
	.long	1
	.long	3
	.long	3
	.long	1
	.long	3
	.long	13
	.long	1
	.long	11
	.long	5
	.long	15
	.long	7
	.long	15
	.long	9
	.long	1
	.long	7
	.long	1
	.long	9
	.long	11
	.long	15
	.long	1
	.long	13
	.long	9
	.long	13
	.long	11
	.long	7
	.long	3
	.long	7
	.long	3
	.long	13
	.long	7
	.long	9
	.long	7
	.long	7
	.long	3
	.long	3
	.long	9
	.long	9
	.long	7
	.long	5
	.long	11
	.long	13
	.long	13
	.long	7
	.long	7
	.long	15
	.long	9
	.long	5
	.long	5
	.long	3
	.long	3
	.long	13
	.long	3
	.long	9
	.long	3
	.long	1
	.long	11
	.long	1
	.long	3
	.long	11
	.long	15
	.long	11
	.long	11
	.long	11
	.long	9
	.long	13
	.long	7
	.long	9
	.long	15
	.long	9
	.long	11
	.long	1
	.long	3
	.long	3
	.long	9
	.long	7
	.long	15
	.long	13
	.long	13
	.long	7
	.long	15
	.long	9
	.long	13
	.long	9
	.long	15
	.long	13
	.long	15
	.long	9
	.long	13
	.long	1
	.long	11
	.long	7
	.long	11
	.long	3
	.long	13
	.long	5
	.long	1
	.long	7
	.long	15
	.long	3
	.long	13
	.long	7
	.long	13
	.long	13
	.long	11
	.long	3
	.long	5
	.long	3
	.long	13
	.long	11
	.long	9
	.long	9
	.long	3
	.long	11
	.long	11
	.long	7
	.long	9
	.long	13
	.long	11
	.long	7
	.long	15
	.long	13
	.long	7
	.long	5
	.long	3
	.long	1
	.long	5
	.long	15
	.long	15
	.long	3
	.long	11
	.long	1
	.long	7
	.long	3
	.long	15
	.long	11
	.long	5
	.long	5
	.long	3
	.long	5
	.long	5
	.long	1
	.long	15
	.long	5
	.long	1
	.long	5
	.long	3
	.long	7
	.long	5
	.long	11
	.long	3
	.long	13
	.long	9
	.long	13
	.long	15
	.long	5
	.long	3
	.long	5
	.long	9
	.long	5
	.long	3
	.long	11
	.long	1
	.long	13
	.long	9
	.long	15
	.long	3
	.long	5
	.long	11
	.long	9
	.long	1
	.long	3
	.long	15
	.long	9
	.long	9
	.long	9
	.long	11
	.long	7
	.long	5
	.long	13
	.long	1
	.long	15
	.long	3
	.long	13
	.long	9
	.long	13
	.long	5
	.long	1
	.long	5
	.long	1
	.long	13
	.long	13
	.long	7
	.long	7
	.long	1
	.long	9
	.long	5
	.long	11
	.long	9
	.long	11
	.long	13
	.long	3
	.long	15
	.long	15
	.long	13
	.long	15
	.long	7
	.long	5
	.long	7
	.long	9
	.long	7
	.long	9
	.long	9
	.long	9
	.long	11
	.long	9
	.long	3
	.long	11
	.long	15
	.long	13
	.long	13
	.long	5
	.long	9
	.long	15
	.long	1
	.long	1
	.long	9
	.long	5
	.long	13
	.long	3
	.long	13
	.long	15
	.long	3
	.long	1
	.long	3
	.long	11
	.long	13
	.long	1
	.long	15
	.long	9
	.long	9
	.long	3
	.long	1
	.long	9
	.long	1
	.long	9
	.long	1
	.long	13
	.long	11
	.long	15
	.long	7
	.long	11
	.long	15
	.long	13
	.long	15
	.long	1
	.long	9
	.long	9
	.long	7
	.long	3
	.long	5
	.long	11
	.long	7
	.long	3
	.long	9
	.long	5
	.long	15
	.long	7
	.long	5
	.long	3
	.long	13
	.long	7
	.long	1
	.long	1
	.long	9
	.long	15
	.long	15
	.long	15
	.long	11
	.long	3
	.long	5
	.long	15
	.long	13
	.long	7
	.long	15
	.long	15
	.long	11
	.long	11
	.long	9
	.long	5
	.long	15
	.long	9
	.long	7
	.long	3
	.long	13
	.long	1
	.long	1
	.long	5
	.long	1
	.long	3
	.long	1
	.long	7
	.long	1
	.long	1
	.long	5
	.long	1
	.long	11
	.long	11
	.long	9
	.long	9
	.long	5
	.long	13
	.long	7
	.long	7
	.long	7
	.long	1
	.long	1
	.long	9
	.long	9
	.long	11
	.long	11
	.long	15
	.long	7
	.long	5
	.long	5
	.long	3
	.long	11
	.long	1
	.long	3
	.long	7
	.long	13
	.long	7
	.long	7
	.long	7
	.long	3
	.long	15
	.long	15
	.long	11
	.long	9
	.long	3
	.long	9
	.long	3
	.long	15
	.long	13
	.long	5
	.long	3
	.long	3
	.long	3
	.long	5
	.long	9
	.long	15
	.long	9
	.long	9
	.long	1
	.long	5
	.long	9
	.long	9
	.long	15
	.long	5
	.long	15
	.long	7
	.long	9
	.long	1
	.long	9
	.long	9
	.long	5
	.long	11
	.long	5
	.long	15
	.long	15
	.long	11
	.long	7
	.long	7
	.long	7
	.long	1
	.long	1
	.long	11
	.long	11
	.long	13
	.long	15
	.long	3
	.long	13
	.long	5
	.long	1
	.long	7
	.long	1
	.long	11
	.long	3
	.long	13
	.long	15
	.long	3
	.long	5
	.long	3
	.long	5
	.long	7
	.long	3
	.long	9
	.long	9
	.long	5
	.long	1
	.long	7
	.long	11
	.long	9
	.long	3
	.long	5
	.long	11
	.long	13
	.long	13
	.long	13
	.long	9
	.long	15
	.long	5
	.long	7
	.long	1
	.long	15
	.long	11
	.long	9
	.long	15
	.long	15
	.long	13
	.long	13
	.long	13
	.long	1
	.long	11
	.long	9
	.long	15
	.long	9
	.long	5
	.long	15
	.long	5
	.long	7
	.long	3
	.long	11
	.long	3
	.long	15
	.long	7
	.long	13
	.long	11
	.long	7
	.long	3
	.long	7
	.long	13
	.long	5
	.long	13
	.long	15
	.long	5
	.long	13
	.long	9
	.long	1
	.long	15
	.long	11
	.long	5
	.long	5
	.long	1
	.long	11
	.long	3
	.long	3
	.long	7
	.long	1
	.long	9
	.long	7
	.long	15
	.long	9
	.long	9
	.long	3
	.long	11
	.long	15
	.long	7
	.long	1
	.long	3
	.long	1
	.long	1
	.long	1
	.long	9
	.long	1
	.long	5
	.long	15
	.long	15
	.long	7
	.long	5
	.long	5
	.long	7
	.long	9
	.long	7
	.long	15
	.long	13
	.long	13
	.long	11
	.long	1
	.long	9
	.long	11
	.long	1
	.long	13
	.long	1
	.long	7
	.long	15
	.long	15
	.long	5
	.long	5
	.long	1
	.long	11
	.long	3
	.long	9
	.long	11
	.long	9
	.long	9
	.long	9
	.long	1
	.long	9
	.long	3
	.long	5
	.long	15
	.long	1
	.long	1
	.long	9
	.long	7
	.long	3
	.long	3
	.long	1
	.long	9
	.long	9
	.long	11
	.long	9
	.long	9
	.long	13
	.long	13
	.long	3
	.long	13
	.long	11
	.long	13
	.long	5
	.long	1
	.long	5
	.long	5
	.long	9
	.long	9
	.long	3
	.long	13
	.long	13
	.long	9
	.long	15
	.long	9
	.long	11
	.long	7
	.long	11
	.long	9
	.long	13
	.long	9
	.long	1
	.long	15
	.long	9
	.long	7
	.long	7
	.long	1
	.long	7
	.long	9
	.long	9
	.long	15
	.long	1
	.long	11
	.long	1
	.long	13
	.long	13
	.long	15
	.long	9
	.long	13
	.long	7
	.long	15
	.long	3
	.long	9
	.long	3
	.long	1
	.long	13
	.long	7
	.long	5
	.long	9
	.long	3
	.long	1
	.long	7
	.long	1
	.long	1
	.long	13
	.long	3
	.long	3
	.long	11
	.long	1
	.long	7
	.long	13
	.long	15
	.long	15
	.long	5
	.long	7
	.long	13
	.long	13
	.long	15
	.long	11
	.long	13
	.long	1
	.long	13
	.long	13
	.long	3
	.long	9
	.long	15
	.long	15
	.long	11
	.long	15
	.long	9
	.long	15
	.long	1
	.long	13
	.long	15
	.long	1
	.long	1
	.long	5
	.long	11
	.long	5
	.long	1
	.long	11
	.long	11
	.long	5
	.long	3
	.long	9
	.long	1
	.long	3
	.long	5
	.long	13
	.long	9
	.long	7
	.long	7
	.long	1
	.long	9
	.long	9
	.long	15
	.long	7
	.long	5
	.long	5
	.long	15
	.long	13
	.long	9
	.long	7
	.long	13
	.long	3
	.long	13
	.long	11
	.long	13
	.long	7
	.long	9
	.long	13
	.long	13
	.long	13
	.long	15
	.long	9
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	1
	.long	3
	.long	15
	.space 24
	.long	9
	.long	3
	.long	27
	.long	15
	.long	29
	.long	21
	.long	23
	.long	19
	.long	11
	.long	25
	.long	7
	.long	13
	.long	17
	.long	1
	.long	25
	.long	29
	.long	3
	.long	31
	.long	11
	.long	5
	.long	23
	.long	27
	.long	19
	.long	21
	.long	5
	.long	1
	.long	17
	.long	13
	.long	7
	.long	15
	.long	9
	.long	31
	.long	25
	.long	3
	.long	5
	.long	23
	.long	7
	.long	3
	.long	17
	.long	23
	.long	3
	.long	3
	.long	21
	.long	25
	.long	25
	.long	23
	.long	11
	.long	19
	.long	3
	.long	11
	.long	31
	.long	7
	.long	9
	.long	5
	.long	17
	.long	23
	.long	17
	.long	17
	.long	25
	.long	13
	.long	11
	.long	31
	.long	27
	.long	19
	.long	17
	.long	23
	.long	7
	.long	5
	.long	11
	.long	19
	.long	19
	.long	7
	.long	13
	.long	21
	.long	21
	.long	7
	.long	9
	.long	11
	.long	1
	.long	5
	.long	21
	.long	11
	.long	13
	.long	25
	.long	9
	.long	7
	.long	7
	.long	27
	.long	15
	.long	25
	.long	15
	.long	21
	.long	17
	.long	19
	.long	19
	.long	21
	.long	5
	.long	11
	.long	3
	.long	5
	.long	29
	.long	31
	.long	29
	.long	5
	.long	5
	.long	1
	.long	31
	.long	27
	.long	11
	.long	13
	.long	1
	.long	3
	.long	7
	.long	11
	.long	7
	.long	3
	.long	23
	.long	13
	.long	31
	.long	17
	.long	1
	.long	27
	.long	11
	.long	25
	.long	1
	.long	23
	.long	29
	.long	17
	.long	25
	.long	7
	.long	25
	.long	27
	.long	17
	.long	13
	.long	17
	.long	23
	.long	5
	.long	17
	.long	5
	.long	13
	.long	11
	.long	21
	.long	5
	.long	11
	.long	5
	.long	9
	.long	31
	.long	19
	.long	17
	.long	9
	.long	9
	.long	27
	.long	21
	.long	15
	.long	15
	.long	1
	.long	1
	.long	29
	.long	5
	.long	31
	.long	11
	.long	17
	.long	23
	.long	19
	.long	21
	.long	25
	.long	15
	.long	11
	.long	5
	.long	5
	.long	1
	.long	19
	.long	19
	.long	19
	.long	7
	.long	13
	.long	21
	.long	17
	.long	17
	.long	25
	.long	23
	.long	19
	.long	23
	.long	15
	.long	13
	.long	5
	.long	19
	.long	25
	.long	9
	.long	7
	.long	3
	.long	21
	.long	17
	.long	25
	.long	1
	.long	27
	.long	25
	.long	27
	.long	25
	.long	9
	.long	13
	.long	3
	.long	17
	.long	25
	.long	23
	.long	9
	.long	25
	.long	9
	.long	13
	.long	17
	.long	17
	.long	3
	.long	15
	.long	7
	.long	7
	.long	29
	.long	3
	.long	19
	.long	29
	.long	29
	.long	19
	.long	29
	.long	13
	.long	15
	.long	25
	.long	27
	.long	1
	.long	3
	.long	9
	.long	9
	.long	13
	.long	31
	.long	29
	.long	31
	.long	5
	.long	15
	.long	29
	.long	1
	.long	19
	.long	5
	.long	9
	.long	19
	.long	5
	.long	15
	.long	3
	.long	5
	.long	7
	.long	15
	.long	17
	.long	17
	.long	23
	.long	11
	.long	9
	.long	23
	.long	19
	.long	3
	.long	17
	.long	1
	.long	27
	.long	9
	.long	9
	.long	17
	.long	13
	.long	25
	.long	29
	.long	23
	.long	29
	.long	11
	.long	31
	.long	25
	.long	21
	.long	29
	.long	19
	.long	27
	.long	31
	.long	3
	.long	5
	.long	3
	.long	3
	.long	13
	.long	21
	.long	9
	.long	29
	.long	3
	.long	17
	.long	11
	.long	11
	.long	9
	.long	21
	.long	19
	.long	7
	.long	17
	.long	31
	.long	25
	.long	1
	.long	27
	.long	5
	.long	15
	.long	27
	.long	29
	.long	29
	.long	29
	.long	25
	.long	27
	.long	25
	.long	3
	.long	21
	.long	17
	.long	25
	.long	13
	.long	15
	.long	17
	.long	13
	.long	23
	.long	9
	.long	3
	.long	11
	.long	7
	.long	9
	.long	9
	.long	7
	.long	17
	.long	7
	.long	1
	.long	27
	.long	1
	.long	9
	.long	5
	.long	31
	.long	21
	.long	25
	.long	25
	.long	21
	.long	11
	.long	1
	.long	23
	.long	19
	.long	27
	.long	15
	.long	3
	.long	5
	.long	23
	.long	9
	.long	25
	.long	7
	.long	29
	.long	11
	.long	9
	.long	13
	.long	5
	.long	11
	.long	1
	.long	3
	.long	31
	.long	27
	.long	3
	.long	17
	.long	27
	.long	11
	.long	13
	.long	15
	.long	29
	.long	15
	.long	1
	.long	15
	.long	23
	.long	25
	.long	13
	.long	21
	.long	15
	.long	3
	.long	29
	.long	29
	.long	5
	.long	25
	.long	17
	.long	11
	.long	7
	.long	15
	.long	5
	.long	21
	.long	7
	.long	31
	.long	13
	.long	11
	.long	23
	.long	5
	.long	7
	.long	23
	.long	27
	.long	21
	.long	29
	.long	15
	.long	7
	.long	27
	.long	27
	.long	19
	.long	7
	.long	15
	.long	27
	.long	27
	.long	19
	.long	19
	.long	9
	.long	15
	.long	1
	.long	3
	.long	29
	.long	29
	.long	5
	.long	27
	.long	31
	.long	9
	.long	1
	.long	7
	.long	3
	.long	19
	.long	19
	.long	29
	.long	9
	.long	3
	.long	21
	.long	31
	.long	29
	.long	25
	.long	1
	.long	3
	.long	9
	.long	27
	.long	5
	.long	27
	.long	25
	.long	21
	.long	11
	.long	29
	.long	31
	.long	27
	.long	21
	.long	29
	.long	17
	.long	9
	.long	17
	.long	13
	.long	11
	.long	25
	.long	15
	.long	21
	.long	11
	.long	19
	.long	31
	.long	3
	.long	19
	.long	5
	.long	3
	.long	3
	.long	9
	.long	13
	.long	13
	.long	3
	.long	29
	.long	7
	.long	5
	.long	9
	.long	23
	.long	13
	.long	21
	.long	23
	.long	21
	.long	31
	.long	11
	.long	7
	.long	7
	.long	3
	.long	23
	.long	1
	.long	23
	.long	5
	.long	9
	.long	17
	.long	21
	.long	1
	.long	17
	.long	29
	.long	7
	.long	5
	.long	17
	.long	13
	.long	25
	.long	17
	.long	9
	.long	19
	.long	9
	.long	5
	.long	7
	.long	21
	.long	19
	.long	13
	.long	9
	.long	7
	.long	3
	.long	9
	.long	3
	.long	15
	.long	31
	.long	29
	.long	29
	.long	25
	.long	13
	.long	9
	.long	21
	.long	9
	.long	31
	.long	7
	.long	15
	.long	5
	.long	31
	.long	7
	.long	15
	.long	27
	.long	25
	.long	19
	.long	9
	.long	9
	.long	25
	.long	25
	.long	23
	.long	1
	.long	9
	.long	7
	.long	11
	.long	15
	.long	19
	.long	15
	.long	27
	.long	17
	.long	11
	.long	11
	.long	31
	.long	13
	.long	25
	.long	25
	.long	9
	.long	7
	.long	13
	.long	29
	.long	19
	.long	5
	.long	19
	.long	31
	.long	25
	.long	13
	.long	25
	.long	15
	.long	5
	.long	9
	.long	29
	.long	31
	.long	9
	.long	29
	.long	27
	.long	25
	.long	27
	.long	11
	.long	17
	.long	5
	.long	17
	.long	3
	.long	23
	.long	15
	.long	9
	.long	9
	.long	17
	.long	17
	.long	31
	.long	11
	.long	19
	.long	25
	.long	13
	.long	23
	.long	15
	.long	25
	.long	21
	.long	31
	.long	19
	.long	3
	.long	11
	.long	25
	.long	7
	.long	15
	.long	19
	.long	7
	.long	5
	.long	3
	.long	13
	.long	13
	.long	1
	.long	23
	.long	5
	.long	25
	.long	11
	.long	25
	.long	15
	.long	13
	.long	21
	.long	11
	.long	23
	.long	29
	.long	5
	.long	17
	.long	27
	.long	9
	.long	19
	.long	15
	.long	5
	.long	29
	.long	23
	.long	19
	.long	1
	.long	27
	.long	3
	.long	23
	.long	21
	.long	19
	.long	27
	.long	11
	.long	17
	.long	13
	.long	27
	.long	11
	.long	31
	.long	23
	.long	5
	.long	9
	.long	21
	.long	31
	.long	29
	.long	11
	.long	21
	.long	17
	.long	15
	.long	7
	.long	15
	.long	7
	.long	9
	.long	21
	.long	27
	.long	25
	.long	29
	.long	11
	.long	3
	.long	21
	.long	13
	.long	23
	.long	19
	.long	27
	.long	17
	.long	29
	.long	25
	.long	17
	.long	9
	.long	1
	.long	19
	.long	23
	.long	5
	.long	23
	.long	1
	.long	17
	.long	17
	.long	13
	.long	27
	.long	23
	.long	7
	.long	7
	.long	11
	.long	13
	.long	17
	.long	13
	.long	11
	.long	21
	.long	13
	.long	23
	.long	1
	.long	27
	.long	13
	.long	9
	.long	7
	.long	1
	.long	27
	.long	29
	.long	5
	.long	13
	.long	25
	.long	21
	.long	3
	.long	31
	.long	15
	.long	13
	.long	3
	.long	19
	.long	13
	.long	1
	.long	27
	.long	15
	.long	17
	.long	1
	.long	3
	.long	13
	.long	13
	.long	13
	.long	31
	.long	29
	.long	27
	.long	7
	.long	7
	.long	21
	.long	29
	.long	15
	.long	17
	.long	17
	.long	21
	.long	19
	.long	17
	.long	3
	.long	15
	.long	5
	.long	27
	.long	27
	.long	3
	.long	31
	.long	31
	.long	7
	.long	21
	.long	3
	.long	13
	.long	11
	.long	17
	.long	27
	.long	25
	.long	1
	.long	9
	.long	7
	.long	29
	.long	27
	.long	21
	.long	23
	.long	13
	.long	25
	.long	29
	.long	15
	.long	17
	.long	29
	.long	9
	.long	15
	.long	3
	.long	21
	.long	15
	.long	17
	.long	17
	.long	31
	.long	9
	.long	9
	.long	23
	.long	19
	.long	25
	.long	3
	.long	1
	.long	11
	.long	27
	.long	29
	.long	1
	.long	31
	.long	29
	.long	25
	.long	29
	.long	1
	.long	23
	.long	29
	.long	25
	.long	13
	.long	3
	.long	31
	.long	25
	.long	5
	.long	5
	.long	11
	.long	3
	.long	21
	.long	9
	.long	23
	.long	7
	.long	11
	.long	23
	.long	11
	.long	1
	.long	1
	.long	3
	.long	23
	.long	25
	.long	23
	.long	1
	.long	23
	.long	3
	.long	27
	.long	9
	.long	27
	.long	3
	.long	23
	.long	25
	.long	19
	.long	29
	.long	29
	.long	13
	.long	27
	.long	5
	.long	9
	.long	29
	.long	29
	.long	13
	.long	17
	.long	3
	.long	23
	.long	19
	.long	7
	.long	13
	.long	3
	.long	19
	.long	23
	.long	5
	.long	29
	.long	29
	.long	13
	.long	13
	.long	5
	.long	19
	.long	5
	.long	17
	.long	9
	.long	11
	.long	11
	.long	29
	.long	27
	.long	23
	.long	19
	.long	17
	.long	25
	.long	13
	.long	1
	.long	13
	.long	3
	.long	11
	.long	1
	.long	17
	.long	29
	.long	1
	.long	13
	.long	17
	.long	9
	.long	17
	.long	21
	.long	1
	.long	11
	.long	1
	.long	1
	.long	25
	.long	5
	.long	7
	.long	29
	.long	29
	.long	19
	.long	19
	.long	1
	.long	29
	.long	13
	.long	3
	.long	1
	.long	31
	.long	15
	.long	13
	.long	3
	.long	1
	.long	11
	.long	19
	.long	5
	.long	29
	.long	13
	.long	29
	.long	23
	.long	3
	.long	1
	.long	31
	.long	13
	.long	19
	.long	17
	.long	5
	.long	5
	.long	1
	.long	29
	.long	23
	.long	3
	.long	19
	.long	25
	.long	19
	.long	27
	.long	9
	.long	27
	.long	13
	.long	15
	.long	29
	.long	23
	.long	13
	.long	25
	.long	25
	.long	17
	.long	19
	.long	17
	.long	15
	.long	27
	.long	3
	.long	25
	.long	17
	.long	27
	.long	3
	.long	27
	.long	31
	.long	23
	.long	13
	.long	31
	.long	11
	.long	15
	.long	7
	.long	21
	.long	19
	.long	27
	.long	19
	.long	21
	.long	29
	.long	7
	.long	31
	.long	13
	.long	9
	.long	9
	.long	7
	.long	21
	.long	13
	.long	11
	.long	9
	.long	11
	.long	29
	.long	19
	.long	11
	.long	19
	.long	21
	.long	5
	.long	29
	.long	13
	.long	7
	.long	19
	.long	19
	.long	27
	.long	23
	.long	31
	.long	1
	.long	27
	.long	21
	.long	7
	.long	3
	.long	7
	.long	11
	.long	23
	.long	13
	.long	29
	.long	11
	.long	31
	.long	19
	.long	1
	.long	5
	.long	5
	.long	11
	.long	5
	.long	3
	.long	27
	.long	5
	.long	7
	.long	11
	.long	31
	.long	1
	.long	27
	.long	31
	.long	31
	.long	23
	.long	5
	.long	21
	.long	27
	.long	9
	.long	25
	.long	3
	.long	15
	.long	19
	.long	1
	.long	19
	.long	9
	.long	5
	.long	25
	.long	21
	.long	15
	.long	25
	.long	29
	.long	15
	.long	21
	.long	11
	.long	19
	.long	15
	.long	3
	.long	7
	.long	13
	.long	11
	.long	25
	.long	17
	.long	1
	.long	5
	.long	31
	.long	13
	.long	29
	.long	23
	.long	9
	.long	5
	.long	29
	.long	7
	.long	17
	.long	27
	.long	7
	.long	17
	.long	31
	.long	9
	.long	31
	.long	9
	.long	9
	.long	7
	.long	21
	.long	3
	.long	3
	.long	3
	.long	9
	.long	11
	.long	21
	.long	11
	.long	31
	.long	9
	.long	25
	.long	5
	.long	1
	.long	31
	.long	13
	.long	29
	.long	9
	.long	29
	.long	1
	.long	11
	.long	19
	.long	7
	.long	27
	.long	13
	.long	31
	.long	7
	.long	31
	.long	7
	.long	25
	.long	23
	.long	21
	.long	29
	.long	11
	.long	11
	.long	13
	.long	11
	.long	27
	.long	1
	.long	23
	.long	31
	.long	21
	.long	23
	.long	21
	.long	19
	.long	31
	.long	5
	.long	31
	.long	25
	.long	25
	.long	19
	.long	17
	.long	11
	.long	25
	.long	7
	.long	13
	.long	1
	.long	29
	.long	17
	.long	23
	.long	15
	.long	7
	.long	29
	.long	17
	.long	13
	.long	3
	.long	17
	.space 48
	.long	37
	.long	33
	.long	7
	.long	5
	.long	11
	.long	39
	.long	63
	.long	59
	.long	17
	.long	15
	.long	23
	.long	29
	.long	3
	.long	21
	.long	13
	.long	31
	.long	25
	.long	9
	.long	49
	.long	33
	.long	19
	.long	29
	.long	11
	.long	19
	.long	27
	.long	15
	.long	25
	.long	63
	.long	55
	.long	17
	.long	63
	.long	49
	.long	19
	.long	41
	.long	59
	.long	3
	.long	57
	.long	33
	.long	49
	.long	53
	.long	57
	.long	57
	.long	39
	.long	21
	.long	7
	.long	53
	.long	9
	.long	55
	.long	15
	.long	59
	.long	19
	.long	49
	.long	31
	.long	3
	.long	39
	.long	5
	.long	5
	.long	41
	.long	9
	.long	19
	.long	9
	.long	57
	.long	25
	.long	1
	.long	15
	.long	51
	.long	11
	.long	19
	.long	61
	.long	53
	.long	29
	.long	19
	.long	11
	.long	9
	.long	21
	.long	19
	.long	43
	.long	13
	.long	13
	.long	41
	.long	25
	.long	31
	.long	9
	.long	11
	.long	19
	.long	5
	.long	53
	.long	37
	.long	7
	.long	51
	.long	45
	.long	7
	.long	7
	.long	61
	.long	23
	.long	45
	.long	7
	.long	59
	.long	41
	.long	1
	.long	29
	.long	61
	.long	37
	.long	27
	.long	47
	.long	15
	.long	31
	.long	35
	.long	31
	.long	17
	.long	51
	.long	13
	.long	25
	.long	45
	.long	5
	.long	5
	.long	33
	.long	39
	.long	5
	.long	47
	.long	29
	.long	35
	.long	47
	.long	63
	.long	45
	.long	37
	.long	47
	.long	59
	.long	21
	.long	59
	.long	33
	.long	51
	.long	9
	.long	27
	.long	13
	.long	25
	.long	43
	.long	3
	.long	17
	.long	21
	.long	59
	.long	61
	.long	27
	.long	47
	.long	57
	.long	11
	.long	17
	.long	39
	.long	1
	.long	63
	.long	21
	.long	59
	.long	17
	.long	13
	.long	31
	.long	3
	.long	31
	.long	7
	.long	9
	.long	27
	.long	37
	.long	23
	.long	31
	.long	9
	.long	45
	.long	43
	.long	31
	.long	63
	.long	21
	.long	39
	.long	51
	.long	27
	.long	7
	.long	53
	.long	11
	.long	1
	.long	59
	.long	39
	.long	23
	.long	49
	.long	23
	.long	7
	.long	55
	.long	59
	.long	3
	.long	19
	.long	35
	.long	13
	.long	9
	.long	13
	.long	15
	.long	23
	.long	9
	.long	7
	.long	43
	.long	55
	.long	3
	.long	19
	.long	9
	.long	27
	.long	33
	.long	27
	.long	49
	.long	23
	.long	47
	.long	19
	.long	7
	.long	11
	.long	55
	.long	27
	.long	35
	.long	5
	.long	5
	.long	55
	.long	35
	.long	37
	.long	9
	.long	33
	.long	29
	.long	47
	.long	25
	.long	11
	.long	47
	.long	53
	.long	61
	.long	59
	.long	3
	.long	53
	.long	47
	.long	5
	.long	19
	.long	59
	.long	5
	.long	47
	.long	23
	.long	45
	.long	53
	.long	3
	.long	49
	.long	61
	.long	47
	.long	39
	.long	29
	.long	17
	.long	57
	.long	5
	.long	17
	.long	31
	.long	23
	.long	41
	.long	39
	.long	5
	.long	27
	.long	7
	.long	29
	.long	29
	.long	33
	.long	31
	.long	41
	.long	31
	.long	29
	.long	17
	.long	29
	.long	29
	.long	9
	.long	9
	.long	31
	.long	27
	.long	53
	.long	35
	.long	5
	.long	61
	.long	1
	.long	49
	.long	13
	.long	57
	.long	29
	.long	5
	.long	21
	.long	43
	.long	25
	.long	57
	.long	49
	.long	37
	.long	27
	.long	11
	.long	61
	.long	37
	.long	49
	.long	5
	.long	63
	.long	63
	.long	3
	.long	45
	.long	37
	.long	63
	.long	21
	.long	21
	.long	19
	.long	27
	.long	59
	.long	21
	.long	45
	.long	23
	.long	13
	.long	15
	.long	3
	.long	43
	.long	63
	.long	39
	.long	19
	.long	63
	.long	31
	.long	41
	.long	41
	.long	15
	.long	43
	.long	63
	.long	53
	.long	1
	.long	63
	.long	31
	.long	7
	.long	17
	.long	11
	.long	61
	.long	31
	.long	51
	.long	37
	.long	29
	.long	59
	.long	25
	.long	63
	.long	59
	.long	47
	.long	15
	.long	27
	.long	19
	.long	29
	.long	45
	.long	35
	.long	55
	.long	39
	.long	19
	.long	43
	.long	21
	.long	19
	.long	13
	.long	17
	.long	51
	.long	37
	.long	5
	.long	33
	.long	35
	.long	49
	.long	25
	.long	45
	.long	1
	.long	63
	.long	47
	.long	9
	.long	63
	.long	15
	.long	25
	.long	25
	.long	15
	.long	41
	.long	13
	.long	3
	.long	19
	.long	51
	.long	49
	.long	37
	.long	25
	.long	49
	.long	13
	.long	53
	.long	47
	.long	23
	.long	35
	.long	29
	.long	33
	.long	21
	.long	35
	.long	23
	.long	3
	.long	43
	.long	31
	.long	63
	.long	9
	.long	1
	.long	61
	.long	43
	.long	3
	.long	11
	.long	55
	.long	11
	.long	35
	.long	1
	.long	63
	.long	35
	.long	49
	.long	19
	.long	45
	.long	9
	.long	57
	.long	51
	.long	1
	.long	47
	.long	41
	.long	9
	.long	11
	.long	37
	.long	19
	.long	55
	.long	23
	.long	55
	.long	55
	.long	13
	.long	7
	.long	47
	.long	37
	.long	11
	.long	43
	.long	17
	.long	3
	.long	25
	.long	19
	.long	55
	.long	59
	.long	37
	.long	33
	.long	43
	.long	1
	.long	5
	.long	21
	.long	5
	.long	63
	.long	49
	.long	61
	.long	21
	.long	51
	.long	15
	.long	19
	.long	43
	.long	47
	.long	17
	.long	9
	.long	53
	.long	45
	.long	11
	.long	51
	.long	25
	.long	11
	.long	25
	.long	47
	.long	47
	.long	1
	.long	43
	.long	29
	.long	17
	.long	31
	.long	15
	.long	59
	.long	27
	.long	63
	.long	11
	.long	41
	.long	51
	.long	29
	.long	7
	.long	27
	.long	63
	.long	31
	.long	43
	.long	3
	.long	29
	.long	39
	.long	3
	.long	59
	.long	59
	.long	1
	.long	53
	.long	63
	.long	23
	.long	63
	.long	47
	.long	51
	.long	23
	.long	61
	.long	39
	.long	47
	.long	21
	.long	39
	.long	15
	.long	3
	.long	9
	.long	57
	.long	61
	.long	39
	.long	37
	.long	21
	.long	51
	.long	1
	.long	23
	.long	43
	.long	27
	.long	25
	.long	11
	.long	13
	.long	21
	.long	43
	.long	7
	.long	11
	.long	33
	.long	55
	.long	1
	.long	37
	.long	35
	.long	27
	.long	61
	.long	39
	.long	5
	.long	19
	.long	61
	.long	61
	.long	57
	.long	59
	.long	21
	.long	59
	.long	61
	.long	57
	.long	25
	.long	55
	.long	27
	.long	31
	.long	41
	.long	33
	.long	63
	.long	19
	.long	57
	.long	35
	.long	13
	.long	63
	.long	35
	.long	17
	.long	11
	.long	11
	.long	49
	.long	41
	.long	55
	.long	5
	.long	45
	.long	17
	.long	35
	.long	5
	.long	31
	.long	31
	.long	37
	.long	17
	.long	45
	.long	51
	.long	1
	.long	39
	.long	49
	.long	55
	.long	19
	.long	41
	.long	13
	.long	5
	.long	51
	.long	5
	.long	49
	.long	1
	.long	21
	.long	13
	.long	17
	.long	59
	.long	51
	.long	11
	.long	3
	.long	61
	.long	1
	.long	33
	.long	37
	.long	33
	.long	61
	.long	25
	.long	27
	.long	59
	.long	7
	.long	49
	.long	13
	.long	63
	.long	3
	.long	33
	.long	3
	.long	15
	.long	9
	.long	13
	.long	35
	.long	39
	.long	11
	.long	59
	.long	59
	.long	1
	.long	57
	.long	11
	.long	5
	.long	57
	.long	13
	.long	31
	.long	13
	.long	11
	.long	55
	.long	45
	.long	9
	.long	55
	.long	55
	.long	19
	.long	25
	.long	41
	.long	23
	.long	45
	.long	29
	.long	63
	.long	59
	.long	27
	.long	39
	.long	21
	.long	37
	.long	7
	.long	61
	.long	49
	.long	35
	.long	39
	.long	9
	.long	29
	.long	7
	.long	25
	.long	23
	.long	57
	.long	5
	.long	19
	.long	15
	.long	33
	.long	49
	.long	37
	.long	25
	.long	17
	.long	45
	.long	29
	.long	15
	.long	25
	.long	3
	.long	3
	.long	49
	.long	11
	.long	39
	.long	15
	.long	19
	.long	57
	.long	39
	.long	15
	.long	11
	.long	3
	.long	57
	.long	31
	.long	55
	.long	61
	.long	19
	.long	5
	.long	41
	.long	35
	.long	59
	.long	61
	.long	39
	.long	41
	.long	53
	.long	53
	.long	63
	.long	31
	.long	9
	.long	59
	.long	13
	.long	35
	.long	55
	.long	41
	.long	49
	.long	5
	.long	41
	.long	25
	.long	27
	.long	43
	.long	5
	.long	5
	.long	43
	.long	5
	.long	5
	.long	17
	.long	5
	.long	15
	.long	27
	.long	29
	.long	17
	.long	9
	.long	3
	.long	55
	.long	31
	.long	1
	.long	45
	.long	45
	.long	13
	.long	57
	.long	17
	.long	3
	.long	61
	.long	15
	.long	49
	.long	15
	.long	47
	.long	9
	.long	37
	.long	45
	.long	9
	.long	51
	.long	61
	.long	21
	.long	33
	.long	11
	.long	21
	.long	63
	.long	63
	.long	47
	.long	57
	.long	61
	.long	49
	.long	9
	.long	59
	.long	19
	.long	29
	.long	21
	.long	23
	.long	55
	.long	23
	.long	43
	.long	41
	.long	57
	.long	9
	.long	39
	.long	27
	.long	41
	.long	35
	.long	61
	.long	29
	.long	57
	.long	63
	.long	21
	.long	31
	.long	59
	.long	35
	.long	49
	.long	3
	.long	49
	.long	47
	.long	49
	.long	33
	.long	21
	.long	19
	.long	21
	.long	35
	.long	11
	.long	17
	.long	37
	.long	23
	.long	59
	.long	13
	.long	37
	.long	35
	.long	55
	.long	57
	.long	1
	.long	29
	.long	45
	.long	11
	.long	1
	.long	15
	.long	9
	.long	33
	.long	19
	.long	53
	.long	43
	.long	39
	.long	23
	.long	7
	.long	13
	.long	13
	.long	1
	.long	19
	.long	41
	.long	55
	.long	1
	.long	13
	.long	15
	.long	59
	.long	55
	.long	15
	.long	3
	.long	57
	.long	37
	.long	31
	.long	17
	.long	1
	.long	3
	.long	21
	.long	29
	.long	25
	.long	55
	.long	9
	.long	37
	.long	33
	.long	53
	.long	41
	.long	51
	.long	19
	.long	57
	.long	13
	.long	63
	.long	43
	.long	19
	.long	7
	.long	13
	.long	37
	.long	33
	.long	19
	.long	15
	.long	63
	.long	51
	.long	11
	.long	49
	.long	23
	.long	57
	.long	47
	.long	51
	.long	15
	.long	53
	.long	41
	.long	1
	.long	15
	.long	37
	.long	61
	.long	11
	.long	35
	.long	29
	.long	33
	.long	23
	.long	55
	.long	11
	.long	59
	.long	19
	.long	61
	.long	61
	.long	45
	.long	13
	.long	49
	.long	13
	.long	63
	.long	5
	.long	61
	.long	5
	.long	31
	.long	17
	.long	61
	.long	63
	.long	13
	.long	27
	.long	57
	.long	1
	.long	21
	.long	5
	.long	11
	.long	39
	.long	57
	.long	51
	.long	53
	.long	39
	.long	25
	.long	41
	.long	39
	.long	37
	.long	23
	.long	31
	.long	25
	.long	33
	.long	17
	.long	57
	.long	29
	.long	27
	.long	23
	.long	47
	.long	41
	.long	29
	.long	19
	.long	47
	.long	41
	.long	25
	.long	5
	.long	51
	.long	43
	.long	39
	.long	29
	.long	7
	.long	31
	.long	45
	.long	51
	.long	49
	.long	55
	.long	17
	.long	43
	.long	49
	.long	45
	.long	9
	.long	29
	.long	3
	.long	5
	.long	47
	.long	9
	.long	15
	.long	19
	.long	51
	.long	45
	.long	57
	.long	63
	.long	9
	.long	21
	.long	59
	.long	3
	.long	9
	.long	13
	.long	45
	.long	23
	.long	15
	.long	31
	.long	21
	.long	15
	.long	51
	.long	35
	.long	9
	.long	11
	.long	61
	.long	23
	.long	53
	.long	29
	.long	51
	.long	45
	.long	31
	.long	29
	.long	5
	.long	35
	.long	29
	.long	53
	.long	35
	.long	17
	.long	59
	.long	55
	.long	27
	.long	51
	.long	59
	.long	27
	.long	47
	.long	15
	.long	29
	.long	37
	.long	7
	.long	49
	.long	55
	.long	5
	.long	19
	.long	45
	.long	29
	.long	19
	.long	57
	.long	33
	.long	53
	.long	45
	.long	21
	.long	9
	.long	3
	.long	35
	.long	29
	.long	43
	.long	31
	.long	39
	.long	3
	.long	45
	.long	1
	.long	41
	.long	29
	.long	5
	.long	59
	.long	41
	.long	33
	.long	35
	.long	27
	.long	19
	.long	13
	.long	25
	.long	27
	.long	43
	.long	33
	.long	35
	.long	17
	.long	17
	.long	23
	.long	7
	.long	35
	.long	15
	.long	61
	.long	61
	.long	53
	.long	5
	.long	15
	.long	23
	.long	11
	.long	13
	.long	43
	.long	55
	.long	47
	.long	25
	.long	43
	.long	15
	.long	57
	.long	45
	.long	1
	.long	49
	.long	63
	.long	57
	.long	15
	.long	31
	.long	31
	.long	7
	.long	53
	.long	27
	.long	15
	.long	47
	.long	23
	.long	7
	.long	29
	.long	53
	.long	47
	.long	9
	.long	53
	.long	3
	.long	25
	.long	55
	.long	45
	.long	63
	.long	21
	.long	17
	.long	23
	.long	31
	.long	27
	.long	27
	.long	43
	.long	63
	.long	55
	.long	63
	.long	45
	.long	51
	.long	15
	.long	27
	.long	5
	.long	37
	.long	43
	.long	11
	.long	27
	.long	5
	.long	27
	.long	59
	.long	21
	.long	7
	.long	39
	.long	27
	.long	63
	.long	35
	.long	47
	.long	55
	.long	17
	.long	17
	.long	17
	.long	3
	.long	19
	.long	21
	.long	13
	.long	49
	.long	61
	.long	39
	.long	15
	.space 72
	.long	13
	.long	33
	.long	115
	.long	41
	.long	79
	.long	17
	.long	29
	.long	119
	.long	75
	.long	73
	.long	105
	.long	7
	.long	59
	.long	65
	.long	21
	.long	3
	.long	113
	.long	61
	.long	89
	.long	45
	.long	107
	.long	21
	.long	71
	.long	79
	.long	19
	.long	71
	.long	61
	.long	41
	.long	57
	.long	121
	.long	87
	.long	119
	.long	55
	.long	85
	.long	121
	.long	119
	.long	11
	.long	23
	.long	61
	.long	11
	.long	35
	.long	33
	.long	43
	.long	107
	.long	113
	.long	101
	.long	29
	.long	87
	.long	119
	.long	97
	.long	29
	.long	17
	.long	89
	.long	5
	.long	127
	.long	89
	.long	119
	.long	117
	.long	103
	.long	105
	.long	41
	.long	83
	.long	25
	.long	41
	.long	55
	.long	69
	.long	117
	.long	49
	.long	127
	.long	29
	.long	1
	.long	99
	.long	53
	.long	83
	.long	15
	.long	31
	.long	73
	.long	115
	.long	35
	.long	21
	.long	89
	.long	5
	.long	1
	.long	91
	.long	53
	.long	35
	.long	95
	.long	83
	.long	19
	.long	85
	.long	55
	.long	51
	.long	101
	.long	33
	.long	41
	.long	55
	.long	45
	.long	95
	.long	61
	.long	27
	.long	37
	.long	89
	.long	75
	.long	57
	.long	61
	.long	15
	.long	117
	.long	15
	.long	21
	.long	27
	.long	25
	.long	27
	.long	123
	.long	39
	.long	109
	.long	93
	.long	51
	.long	21
	.long	91
	.long	109
	.long	107
	.long	45
	.long	15
	.long	93
	.long	127
	.long	3
	.long	53
	.long	81
	.long	79
	.long	107
	.long	79
	.long	87
	.long	35
	.long	109
	.long	73
	.long	35
	.long	83
	.long	107
	.long	1
	.long	51
	.long	7
	.long	59
	.long	33
	.long	115
	.long	43
	.long	111
	.long	45
	.long	121
	.long	105
	.long	125
	.long	87
	.long	101
	.long	41
	.long	95
	.long	75
	.long	1
	.long	57
	.long	117
	.long	21
	.long	27
	.long	67
	.long	29
	.long	53
	.long	117
	.long	63
	.long	1
	.long	77
	.long	89
	.long	115
	.long	49
	.long	127
	.long	15
	.long	79
	.long	81
	.long	29
	.long	65
	.long	103
	.long	33
	.long	73
	.long	79
	.long	29
	.long	21
	.long	113
	.long	31
	.long	33
	.long	107
	.long	95
	.long	111
	.long	59
	.long	99
	.long	117
	.long	63
	.long	63
	.long	99
	.long	39
	.long	9
	.long	35
	.long	63
	.long	125
	.long	99
	.long	45
	.long	93
	.long	33
	.long	93
	.long	9
	.long	105
	.long	75
	.long	51
	.long	115
	.long	11
	.long	37
	.long	17
	.long	41
	.long	21
	.long	43
	.long	73
	.long	19
	.long	93
	.long	7
	.long	95
	.long	81
	.long	93
	.long	79
	.long	81
	.long	55
	.long	9
	.long	51
	.long	63
	.long	45
	.long	89
	.long	73
	.long	19
	.long	115
	.long	39
	.long	47
	.long	81
	.long	39
	.long	5
	.long	5
	.long	45
	.long	53
	.long	65
	.long	49
	.long	17
	.long	105
	.long	13
	.long	107
	.long	5
	.long	5
	.long	19
	.long	73
	.long	59
	.long	43
	.long	83
	.long	97
	.long	115
	.long	27
	.long	1
	.long	69
	.long	103
	.long	3
	.long	99
	.long	103
	.long	63
	.long	67
	.long	25
	.long	121
	.long	97
	.long	77
	.long	13
	.long	83
	.long	103
	.long	41
	.long	11
	.long	27
	.long	81
	.long	37
	.long	33
	.long	125
	.long	71
	.long	41
	.long	41
	.long	59
	.long	41
	.long	87
	.long	123
	.long	43
	.long	101
	.long	63
	.long	45
	.long	39
	.long	21
	.long	97
	.long	15
	.long	97
	.long	111
	.long	21
	.long	49
	.long	13
	.long	17
	.long	79
	.long	91
	.long	65
	.long	105
	.long	75
	.long	1
	.long	45
	.long	67
	.long	83
	.long	107
	.long	125
	.long	87
	.long	15
	.long	81
	.long	95
	.long	105
	.long	65
	.long	45
	.long	59
	.long	103
	.long	23
	.long	103
	.long	99
	.long	67
	.long	99
	.long	47
	.long	117
	.long	71
	.long	89
	.long	35
	.long	53
	.long	73
	.long	9
	.long	115
	.long	49
	.long	37
	.long	1
	.long	35
	.long	9
	.long	45
	.long	81
	.long	19
	.long	127
	.long	17
	.long	17
	.long	105
	.long	89
	.long	49
	.long	101
	.long	7
	.long	37
	.long	33
	.long	11
	.long	95
	.long	95
	.long	17
	.long	111
	.long	105
	.long	41
	.long	115
	.long	5
	.long	69
	.long	101
	.long	27
	.long	27
	.long	101
	.long	103
	.long	53
	.long	9
	.long	21
	.long	43
	.long	79
	.long	91
	.long	65
	.long	117
	.long	87
	.long	125
	.long	55
	.long	45
	.long	63
	.long	85
	.long	83
	.long	97
	.long	45
	.long	83
	.long	87
	.long	113
	.long	93
	.long	95
	.long	5
	.long	17
	.long	77
	.long	77
	.long	127
	.long	123
	.long	45
	.long	81
	.long	85
	.long	121
	.long	119
	.long	27
	.long	85
	.long	41
	.long	49
	.long	15
	.long	107
	.long	21
	.long	51
	.long	119
	.long	11
	.long	87
	.long	101
	.long	115
	.long	63
	.long	63
	.long	37
	.long	121
	.long	109
	.long	7
	.long	43
	.long	69
	.long	19
	.long	77
	.long	49
	.long	71
	.long	59
	.long	35
	.long	7
	.long	13
	.long	55
	.long	101
	.long	127
	.long	103
	.long	85
	.long	109
	.long	29
	.long	61
	.long	67
	.long	21
	.long	111
	.long	67
	.long	23
	.long	57
	.long	75
	.long	71
	.long	101
	.long	123
	.long	41
	.long	107
	.long	101
	.long	107
	.long	125
	.long	27
	.long	47
	.long	119
	.long	41
	.long	19
	.long	127
	.long	33
	.long	31
	.long	109
	.long	7
	.long	91
	.long	91
	.long	39
	.long	125
	.long	105
	.long	47
	.long	125
	.long	123
	.long	91
	.long	9
	.long	103
	.long	45
	.long	23
	.long	117
	.long	9
	.long	125
	.long	73
	.long	11
	.long	37
	.long	61
	.long	79
	.long	21
	.long	5
	.long	47
	.long	117
	.long	67
	.long	53
	.long	85
	.long	33
	.long	81
	.long	121
	.long	47
	.long	61
	.long	51
	.long	127
	.long	29
	.long	65
	.long	45
	.long	41
	.long	95
	.long	57
	.long	73
	.long	33
	.long	117
	.long	61
	.long	111
	.long	59
	.long	123
	.long	65
	.long	47
	.long	105
	.long	23
	.long	29
	.long	107
	.long	37
	.long	81
	.long	67
	.long	29
	.long	115
	.long	119
	.long	75
	.long	73
	.long	99
	.long	103
	.long	7
	.long	57
	.long	45
	.long	61
	.long	95
	.long	49
	.long	101
	.long	101
	.long	35
	.long	47
	.long	119
	.long	39
	.long	67
	.long	31
	.long	103
	.long	7
	.long	61
	.long	127
	.long	87
	.long	3
	.long	35
	.long	29
	.long	73
	.long	95
	.long	103
	.long	71
	.long	75
	.long	51
	.long	87
	.long	57
	.long	97
	.long	11
	.long	105
	.long	87
	.long	41
	.long	73
	.long	109
	.long	69
	.long	35
	.long	121
	.long	39
	.long	111
	.long	1
	.long	77
	.long	39
	.long	47
	.long	53
	.long	91
	.long	3
	.long	17
	.long	51
	.long	83
	.long	39
	.long	125
	.long	85
	.long	111
	.long	21
	.long	69
	.long	85
	.long	29
	.long	55
	.long	11
	.long	117
	.long	1
	.long	47
	.long	17
	.long	65
	.long	63
	.long	47
	.long	117
	.long	17
	.long	115
	.long	51
	.long	25
	.long	33
	.long	123
	.long	123
	.long	83
	.long	51
	.long	113
	.long	95
	.long	121
	.long	51
	.long	91
	.long	109
	.long	43
	.long	55
	.long	35
	.long	55
	.long	87
	.long	33
	.long	37
	.long	5
	.long	3
	.long	45
	.long	21
	.long	105
	.long	127
	.long	35
	.long	17
	.long	35
	.long	37
	.long	97
	.long	97
	.long	21
	.long	77
	.long	123
	.long	17
	.long	89
	.long	53
	.long	105
	.long	75
	.long	25
	.long	125
	.long	13
	.long	47
	.long	21
	.long	125
	.long	23
	.long	55
	.long	63
	.long	61
	.long	5
	.long	17
	.long	93
	.long	57
	.long	121
	.long	69
	.long	73
	.long	93
	.long	121
	.long	105
	.long	75
	.long	91
	.long	67
	.long	95
	.long	75
	.long	9
	.long	69
	.long	97
	.long	99
	.long	93
	.long	11
	.long	53
	.long	19
	.long	73
	.long	5
	.long	33
	.long	79
	.long	107
	.long	65
	.long	69
	.long	79
	.long	125
	.long	25
	.long	93
	.long	55
	.long	61
	.long	17
	.long	117
	.long	69
	.long	97
	.long	87
	.long	111
	.long	37
	.long	93
	.long	59
	.long	79
	.long	95
	.long	53
	.long	115
	.long	53
	.long	85
	.long	85
	.long	65
	.long	59
	.long	23
	.long	75
	.long	21
	.long	67
	.long	27
	.long	99
	.long	79
	.long	27
	.long	3
	.long	95
	.long	27
	.long	69
	.long	19
	.long	75
	.long	47
	.long	59
	.long	41
	.long	85
	.long	77
	.long	99
	.long	55
	.long	49
	.long	93
	.long	93
	.long	119
	.long	51
	.long	125
	.long	63
	.long	13
	.long	15
	.long	45
	.long	61
	.long	19
	.long	105
	.long	115
	.long	17
	.long	83
	.long	7
	.long	7
	.long	11
	.long	61
	.long	37
	.long	63
	.long	89
	.long	95
	.long	119
	.long	113
	.long	67
	.long	123
	.long	91
	.long	33
	.long	37
	.long	99
	.long	43
	.long	11
	.long	33
	.long	65
	.long	81
	.long	79
	.long	81
	.long	107
	.long	63
	.long	63
	.long	55
	.long	89
	.long	91
	.long	25
	.long	93
	.long	101
	.long	27
	.long	55
	.long	75
	.long	121
	.long	79
	.long	43
	.long	125
	.long	73
	.long	27
	.long	109
	.long	35
	.long	21
	.long	71
	.long	113
	.long	89
	.long	59
	.long	95
	.long	41
	.long	45
	.long	113
	.long	119
	.long	113
	.long	39
	.long	59
	.long	73
	.long	15
	.long	13
	.long	59
	.long	67
	.long	121
	.long	27
	.long	7
	.long	105
	.long	15
	.long	59
	.long	59
	.long	35
	.long	91
	.long	89
	.long	23
	.long	125
	.long	97
	.long	53
	.long	41
	.long	91
	.long	111
	.long	29
	.long	31
	.long	3
	.long	103
	.long	61
	.long	71
	.long	35
	.long	7
	.long	119
	.long	29
	.long	45
	.long	49
	.long	111
	.long	41
	.long	109
	.long	59
	.long	125
	.long	13
	.long	27
	.long	19
	.long	79
	.long	9
	.long	75
	.long	83
	.long	81
	.long	33
	.long	91
	.long	109
	.long	33
	.long	29
	.long	107
	.long	111
	.long	101
	.long	107
	.long	109
	.long	65
	.long	59
	.long	43
	.long	37
	.long	1
	.long	9
	.long	15
	.long	109
	.long	37
	.long	111
	.long	113
	.long	119
	.long	79
	.long	73
	.long	65
	.long	71
	.long	93
	.long	17
	.long	101
	.long	87
	.long	97
	.long	43
	.long	23
	.long	75
	.long	109
	.long	41
	.long	49
	.long	53
	.long	31
	.long	97
	.long	105
	.long	109
	.long	119
	.long	51
	.long	9
	.long	53
	.long	113
	.long	97
	.long	73
	.long	89
	.long	79
	.long	49
	.long	61
	.long	105
	.long	13
	.long	99
	.long	53
	.long	71
	.long	7
	.long	87
	.long	21
	.long	101
	.long	5
	.long	71
	.long	31
	.long	123
	.long	121
	.long	121
	.long	73
	.long	79
	.long	115
	.long	13
	.long	39
	.long	101
	.long	19
	.long	37
	.long	51
	.long	83
	.long	97
	.long	55
	.long	81
	.long	91
	.long	127
	.long	105
	.long	89
	.long	63
	.long	47
	.long	49
	.long	75
	.long	37
	.long	77
	.long	15
	.long	49
	.long	107
	.long	23
	.long	23
	.long	35
	.long	19
	.long	69
	.long	17
	.long	59
	.long	63
	.long	73
	.long	29
	.long	125
	.long	61
	.long	65
	.long	95
	.long	101
	.long	81
	.long	57
	.long	69
	.long	83
	.long	37
	.long	11
	.long	37
	.long	95
	.long	1
	.long	73
	.long	27
	.long	29
	.long	57
	.long	7
	.long	65
	.long	83
	.long	99
	.long	69
	.long	19
	.long	103
	.long	43
	.long	95
	.long	25
	.long	19
	.long	103
	.long	41
	.long	125
	.long	97
	.long	71
	.long	105
	.long	83
	.long	83
	.long	61
	.long	39
	.long	9
	.long	45
	.long	117
	.long	63
	.long	31
	.long	5
	.long	117
	.long	67
	.long	125
	.long	41
	.long	117
	.long	43
	.long	77
	.long	97
	.long	15
	.long	29
	.long	5
	.long	59
	.long	25
	.long	63
	.long	87
	.long	39
	.long	39
	.long	77
	.long	85
	.long	37
	.long	81
	.long	73
	.long	89
	.long	29
	.long	125
	.long	109
	.long	21
	.long	23
	.long	119
	.long	105
	.long	43
	.long	93
	.long	97
	.long	15
	.long	125
	.long	29
	.long	51
	.long	69
	.long	37
	.long	45
	.long	31
	.long	75
	.long	109
	.long	119
	.long	53
	.long	5
	.long	101
	.long	125
	.long	121
	.long	35
	.long	29
	.long	7
	.long	63
	.long	17
	.long	63
	.long	13
	.long	69
	.long	15
	.long	105
	.long	51
	.long	127
	.long	105
	.long	9
	.long	57
	.long	95
	.long	59
	.long	109
	.long	35
	.long	49
	.long	23
	.long	33
	.long	107
	.long	55
	.long	33
	.long	57
	.long	79
	.long	73
	.long	69
	.long	59
	.long	107
	.long	55
	.long	11
	.long	63
	.long	95
	.long	103
	.long	23
	.long	125
	.long	91
	.long	31
	.long	91
	.long	51
	.long	65
	.long	61
	.long	75
	.long	69
	.long	107
	.long	65
	.long	101
	.long	59
	.long	35
	.long	15
	.space 144
	.long	7
	.long	23
	.long	39
	.long	217
	.long	141
	.long	27
	.long	53
	.long	181
	.long	169
	.long	35
	.long	15
	.long	207
	.long	45
	.long	247
	.long	185
	.long	117
	.long	41
	.long	81
	.long	223
	.long	151
	.long	81
	.long	189
	.long	61
	.long	95
	.long	185
	.long	23
	.long	73
	.long	113
	.long	239
	.long	85
	.long	9
	.long	201
	.long	83
	.long	53
	.long	183
	.long	203
	.long	91
	.long	149
	.long	101
	.long	13
	.long	111
	.long	239
	.long	3
	.long	205
	.long	253
	.long	247
	.long	121
	.long	189
	.long	169
	.long	179
	.long	197
	.long	175
	.long	217
	.long	249
	.long	195
	.long	95
	.long	63
	.long	19
	.long	7
	.long	5
	.long	75
	.long	217
	.long	245
	.long	111
	.long	189
	.long	165
	.long	169
	.long	141
	.long	221
	.long	249
	.long	159
	.long	253
	.long	207
	.long	249
	.long	219
	.long	23
	.long	49
	.long	127
	.long	237
	.long	5
	.long	25
	.long	177
	.long	37
	.long	103
	.long	65
	.long	167
	.long	81
	.long	87
	.long	119
	.long	45
	.long	79
	.long	143
	.long	57
	.long	79
	.long	187
	.long	143
	.long	183
	.long	75
	.long	97
	.long	211
	.long	149
	.long	175
	.long	37
	.long	135
	.long	189
	.long	225
	.long	241
	.long	63
	.long	33
	.long	43
	.long	13
	.long	73
	.long	213
	.long	57
	.long	239
	.long	183
	.long	117
	.long	21
	.long	29
	.long	115
	.long	43
	.long	205
	.long	223
	.long	15
	.long	3
	.long	159
	.long	51
	.long	101
	.long	127
	.long	99
	.long	239
	.long	171
	.long	113
	.long	171
	.long	119
	.long	189
	.long	245
	.long	201
	.long	27
	.long	185
	.long	229
	.long	105
	.long	153
	.long	189
	.long	33
	.long	35
	.long	137
	.long	77
	.long	97
	.long	17
	.long	181
	.long	55
	.long	197
	.long	201
	.long	155
	.long	37
	.long	197
	.long	137
	.long	223
	.long	25
	.long	179
	.long	91
	.long	23
	.long	235
	.long	53
	.long	253
	.long	49
	.long	181
	.long	249
	.long	53
	.long	173
	.long	97
	.long	247
	.long	67
	.long	115
	.long	103
	.long	159
	.long	239
	.long	69
	.long	173
	.long	217
	.long	95
	.long	221
	.long	247
	.long	97
	.long	91
	.long	123
	.long	223
	.long	213
	.long	129
	.long	181
	.long	87
	.long	239
	.long	85
	.long	89
	.long	249
	.long	141
	.long	39
	.long	57
	.long	249
	.long	71
	.long	101
	.long	159
	.long	33
	.long	137
	.long	189
	.long	71
	.long	253
	.long	205
	.long	171
	.long	13
	.long	249
	.long	109
	.long	131
	.long	199
	.long	189
	.long	179
	.long	31
	.long	99
	.long	113
	.long	41
	.long	173
	.long	23
	.long	189
	.long	197
	.long	3
	.long	135
	.long	9
	.long	95
	.long	195
	.long	27
	.long	183
	.long	1
	.long	123
	.long	73
	.long	53
	.long	99
	.long	197
	.long	59
	.long	27
	.long	101
	.long	55
	.long	193
	.long	31
	.long	61
	.long	119
	.long	11
	.long	7
	.long	255
	.long	233
	.long	53
	.long	157
	.long	193
	.long	97
	.long	83
	.long	65
	.long	81
	.long	239
	.long	167
	.long	69
	.long	71
	.long	109
	.long	97
	.long	137
	.long	71
	.long	193
	.long	189
	.long	115
	.long	79
	.long	205
	.long	37
	.long	227
	.long	53
	.long	33
	.long	91
	.long	229
	.long	245
	.long	105
	.long	77
	.long	229
	.long	161
	.long	103
	.long	93
	.long	13
	.long	161
	.long	229
	.long	223
	.long	69
	.long	15
	.long	25
	.long	23
	.long	233
	.long	93
	.long	25
	.long	217
	.long	247
	.long	61
	.long	75
	.long	27
	.long	9
	.long	223
	.long	213
	.long	55
	.long	197
	.long	145
	.long	89
	.long	199
	.long	41
	.long	201
	.long	5
	.long	149
	.long	35
	.long	119
	.long	183
	.long	53
	.long	11
	.long	13
	.long	3
	.long	179
	.long	229
	.long	43
	.long	55
	.long	187
	.long	233
	.long	47
	.long	133
	.long	91
	.long	47
	.long	71
	.long	93
	.long	105
	.long	145
	.long	45
	.long	255
	.long	221
	.long	115
	.long	175
	.long	19
	.long	129
	.long	5
	.long	209
	.long	197
	.long	57
	.long	177
	.long	115
	.long	187
	.long	119
	.long	77
	.long	211
	.long	111
	.long	33
	.long	113
	.long	23
	.long	87
	.long	137
	.long	41
	.long	7
	.long	83
	.long	43
	.long	121
	.long	145
	.long	5
	.long	219
	.long	27
	.long	11
	.long	111
	.long	207
	.long	55
	.long	97
	.long	63
	.long	229
	.long	53
	.long	33
	.long	149
	.long	23
	.long	187
	.long	153
	.long	91
	.long	193
	.long	183
	.long	59
	.long	211
	.long	93
	.long	139
	.long	59
	.long	179
	.long	163
	.long	209
	.long	77
	.long	39
	.long	111
	.long	79
	.long	229
	.long	85
	.long	237
	.long	199
	.long	137
	.long	147
	.long	25
	.long	73
	.long	121
	.long	129
	.long	83
	.long	87
	.long	93
	.long	205
	.long	167
	.long	53
	.long	107
	.long	229
	.long	213
	.long	95
	.long	219
	.long	109
	.long	175
	.long	13
	.long	209
	.long	97
	.long	61
	.long	147
	.long	19
	.long	13
	.long	123
	.long	73
	.long	35
	.long	141
	.long	81
	.long	19
	.long	171
	.long	255
	.long	111
	.long	107
	.long	233
	.long	113
	.long	133
	.long	89
	.long	9
	.long	231
	.long	95
	.long	69
	.long	33
	.long	1
	.long	253
	.long	219
	.long	253
	.long	247
	.long	129
	.long	11
	.long	251
	.long	221
	.long	153
	.long	35
	.long	103
	.long	239
	.long	7
	.long	27
	.long	235
	.long	181
	.long	5
	.long	207
	.long	53
	.long	149
	.long	155
	.long	225
	.long	165
	.long	137
	.long	155
	.long	201
	.long	97
	.long	245
	.long	203
	.long	47
	.long	39
	.long	35
	.long	105
	.long	239
	.long	49
	.long	15
	.long	253
	.long	7
	.long	237
	.long	213
	.long	55
	.long	87
	.long	199
	.long	27
	.long	175
	.long	49
	.long	41
	.long	229
	.long	85
	.long	3
	.long	149
	.long	179
	.long	129
	.long	185
	.long	249
	.long	197
	.long	15
	.long	97
	.long	197
	.long	139
	.long	203
	.long	63
	.long	33
	.long	251
	.long	217
	.long	199
	.long	199
	.long	99
	.long	249
	.long	33
	.long	229
	.long	177
	.long	13
	.long	209
	.long	147
	.long	97
	.long	31
	.long	125
	.long	177
	.long	137
	.long	187
	.long	11
	.long	91
	.long	223
	.long	29
	.long	169
	.long	231
	.long	59
	.long	31
	.long	163
	.long	41
	.long	57
	.long	87
	.long	247
	.long	25
	.long	127
	.long	101
	.long	207
	.long	187
	.long	73
	.long	61
	.long	105
	.long	27
	.long	91
	.long	171
	.long	243
	.long	33
	.long	3
	.long	1
	.long	21
	.long	229
	.long	93
	.long	71
	.long	61
	.long	37
	.long	183
	.long	65
	.long	211
	.long	53
	.long	11
	.long	151
	.long	165
	.long	47
	.long	5
	.long	129
	.long	79
	.long	101
	.long	147
	.long	169
	.long	181
	.long	19
	.long	95
	.long	77
	.long	139
	.long	197
	.long	219
	.long	97
	.long	239
	.long	183
	.long	143
	.long	9
	.long	13
	.long	209
	.long	23
	.long	215
	.long	53
	.long	137
	.long	203
	.long	19
	.long	151
	.long	171
	.long	133
	.long	219
	.long	231
	.long	3
	.long	15
	.long	253
	.long	225
	.long	33
	.long	111
	.long	183
	.long	213
	.long	169
	.long	119
	.long	111
	.long	15
	.long	201
	.long	123
	.long	121
	.long	225
	.long	113
	.long	113
	.long	225
	.long	161
	.long	165
	.long	1
	.long	139
	.long	55
	.long	3
	.long	93
	.long	217
	.long	193
	.long	97
	.long	29
	.long	69
	.long	231
	.long	161
	.long	93
	.long	69
	.long	143
	.long	137
	.long	9
	.long	87
	.long	183
	.long	113
	.long	183
	.long	73
	.long	215
	.long	137
	.long	89
	.long	251
	.long	163
	.long	41
	.long	227
	.long	145
	.long	57
	.long	81
	.long	57
	.long	11
	.long	135
	.long	145
	.long	161
	.long	175
	.long	159
	.long	25
	.long	55
	.long	167
	.long	157
	.long	211
	.long	97
	.long	247
	.long	249
	.long	23
	.long	129
	.long	159
	.long	71
	.long	197
	.long	127
	.long	141
	.long	219
	.long	5
	.long	233
	.long	131
	.long	217
	.long	101
	.long	131
	.long	33
	.long	157
	.long	173
	.long	69
	.long	207
	.long	239
	.long	81
	.long	205
	.long	11
	.long	41
	.long	169
	.long	65
	.long	193
	.long	77
	.long	201
	.long	173
	.long	1
	.long	221
	.long	157
	.long	1
	.long	15
	.long	113
	.long	147
	.long	137
	.long	205
	.long	225
	.long	73
	.long	45
	.long	49
	.long	149
	.long	113
	.long	253
	.long	99
	.long	17
	.long	119
	.long	105
	.long	117
	.long	129
	.long	243
	.long	75
	.long	203
	.long	53
	.long	29
	.long	247
	.long	35
	.long	247
	.long	171
	.long	31
	.long	199
	.long	213
	.long	29
	.long	251
	.long	7
	.long	251
	.long	187
	.long	91
	.long	11
	.long	149
	.long	13
	.long	205
	.long	37
	.long	249
	.long	137
	.long	139
	.long	9
	.long	7
	.long	113
	.long	183
	.long	205
	.long	187
	.long	39
	.long	3
	.long	79
	.long	155
	.long	227
	.long	89
	.long	185
	.long	51
	.long	127
	.long	63
	.long	83
	.long	41
	.long	133
	.long	183
	.long	181
	.long	127
	.long	19
	.long	255
	.long	219
	.long	59
	.long	251
	.long	3
	.long	187
	.long	57
	.long	217
	.long	115
	.long	217
	.long	229
	.long	181
	.long	185
	.long	149
	.long	83
	.long	115
	.long	11
	.long	123
	.long	19
	.long	109
	.long	165
	.long	103
	.long	123
	.long	219
	.long	129
	.long	155
	.long	207
	.long	177
	.long	9
	.long	49
	.long	181
	.long	231
	.long	33
	.long	233
	.long	67
	.long	155
	.long	41
	.long	9
	.long	95
	.long	123
	.long	65
	.long	117
	.long	249
	.long	85
	.long	169
	.long	129
	.long	241
	.long	173
	.long	251
	.long	225
	.long	147
	.long	165
	.long	69
	.long	81
	.long	239
	.long	95
	.long	23
	.long	83
	.long	227
	.long	249
	.long	143
	.long	171
	.long	193
	.long	9
	.long	21
	.long	57
	.long	73
	.long	97
	.long	57
	.long	29
	.long	239
	.long	151
	.long	159
	.long	191
	.long	47
	.long	51
	.long	1
	.long	223
	.long	251
	.long	251
	.long	151
	.long	41
	.long	119
	.long	127
	.long	131
	.long	33
	.long	209
	.long	123
	.long	53
	.long	241
	.long	25
	.long	31
	.long	183
	.long	107
	.long	25
	.long	115
	.long	39
	.long	11
	.long	213
	.long	239
	.long	219
	.long	109
	.long	185
	.long	35
	.long	133
	.long	123
	.long	185
	.long	27
	.long	55
	.long	245
	.long	61
	.long	75
	.long	205
	.long	213
	.long	169
	.long	163
	.long	63
	.long	55
	.long	49
	.long	83
	.long	195
	.long	51
	.long	31
	.long	41
	.long	15
	.long	203
	.long	41
	.long	63
	.long	127
	.long	161
	.long	5
	.long	143
	.long	7
	.long	199
	.long	251
	.long	95
	.long	75
	.long	101
	.long	15
	.long	43
	.long	237
	.long	197
	.long	117
	.long	167
	.long	155
	.long	21
	.long	83
	.long	205
	.long	255
	.long	49
	.long	101
	.long	213
	.long	237
	.long	135
	.long	135
	.long	21
	.long	73
	.long	93
	.long	115
	.long	7
	.long	85
	.long	223
	.long	237
	.long	79
	.long	89
	.long	5
	.long	57
	.long	239
	.long	67
	.long	65
	.long	201
	.long	155
	.long	71
	.long	85
	.long	195
	.long	89
	.long	181
	.long	119
	.long	135
	.long	147
	.long	237
	.long	173
	.long	41
	.long	155
	.long	67
	.long	113
	.long	111
	.long	21
	.long	183
	.long	23
	.long	103
	.long	207
	.long	253
	.long	69
	.long	219
	.long	205
	.long	195
	.long	43
	.long	197
	.long	229
	.long	139
	.long	177
	.long	129
	.long	69
	.long	97
	.long	201
	.long	163
	.long	189
	.long	11
	.long	99
	.long	91
	.long	253
	.long	239
	.long	91
	.long	145
	.long	19
	.long	179
	.long	231
	.long	121
	.long	7
	.long	225
	.long	237
	.long	125
	.long	191
	.long	119
	.long	59
	.long	175
	.long	237
	.long	131
	.long	79
	.long	43
	.long	45
	.long	205
	.long	199
	.long	251
	.long	153
	.long	207
	.long	37
	.long	179
	.long	113
	.long	255
	.long	107
	.long	217
	.long	61
	.long	7
	.long	181
	.long	247
	.long	31
	.long	13
	.long	113
	.long	145
	.long	107
	.long	233
	.long	233
	.long	43
	.long	79
	.long	23
	.long	169
	.long	137
	.long	129
	.long	183
	.long	53
	.long	91
	.long	55
	.long	103
	.long	223
	.long	87
	.long	177
	.long	157
	.long	79
	.long	213
	.long	139
	.long	183
	.long	231
	.long	205
	.long	143
	.long	129
	.long	243
	.long	205
	.long	93
	.long	59
	.long	15
	.long	89
	.long	9
	.long	11
	.long	47
	.long	133
	.long	227
	.long	75
	.long	9
	.long	91
	.long	19
	.long	171
	.long	163
	.long	79
	.long	7
	.long	103
	.long	5
	.long	119
	.long	155
	.long	75
	.long	11
	.long	71
	.long	95
	.long	17
	.long	13
	.long	243
	.long	207
	.long	187
	.space 208
	.long	235
	.long	307
	.long	495
	.long	417
	.long	57
	.long	151
	.long	19
	.long	119
	.long	375
	.long	451
	.long	55
	.long	449
	.long	501
	.long	53
	.long	185
	.long	317
	.long	17
	.long	21
	.long	487
	.long	13
	.long	347
	.long	393
	.long	15
	.long	391
	.long	307
	.long	189
	.long	381
	.long	71
	.long	163
	.long	99
	.long	467
	.long	167
	.long	433
	.long	337
	.long	257
	.long	179
	.long	47
	.long	385
	.long	23
	.long	117
	.long	369
	.long	425
	.long	207
	.long	433
	.long	301
	.long	147
	.long	333
	.long	85
	.long	221
	.long	423
	.long	49
	.long	3
	.long	43
	.long	229
	.long	227
	.long	201
	.long	383
	.long	281
	.long	229
	.long	207
	.long	21
	.long	343
	.long	251
	.long	397
	.long	173
	.long	507
	.long	421
	.long	443
	.long	399
	.long	53
	.long	345
	.long	77
	.long	385
	.long	317
	.long	155
	.long	187
	.long	269
	.long	501
	.long	19
	.long	169
	.long	235
	.long	415
	.long	61
	.long	247
	.long	183
	.long	5
	.long	257
	.long	401
	.long	451
	.long	95
	.long	455
	.long	49
	.long	489
	.long	75
	.long	459
	.long	377
	.long	87
	.long	463
	.long	155
	.long	233
	.long	115
	.long	429
	.long	211
	.long	419
	.long	143
	.long	487
	.long	195
	.long	209
	.long	461
	.long	193
	.long	157
	.long	193
	.long	363
	.long	181
	.long	271
	.long	445
	.long	381
	.long	231
	.long	135
	.long	327
	.long	403
	.long	171
	.long	197
	.long	181
	.long	343
	.long	113
	.long	313
	.long	393
	.long	311
	.long	415
	.long	267
	.long	247
	.long	425
	.long	233
	.long	289
	.long	55
	.long	39
	.long	247
	.long	327
	.long	141
	.long	5
	.long	189
	.long	183
	.long	27
	.long	337
	.long	341
	.long	327
	.long	87
	.long	429
	.long	357
	.long	265
	.long	251
	.long	437
	.long	201
	.long	29
	.long	339
	.long	257
	.long	377
	.long	17
	.long	53
	.long	327
	.long	47
	.long	375
	.long	393
	.long	369
	.long	403
	.long	125
	.long	429
	.long	257
	.long	157
	.long	217
	.long	85
	.long	267
	.long	117
	.long	337
	.long	447
	.long	219
	.long	501
	.long	41
	.long	41
	.long	193
	.long	509
	.long	131
	.long	207
	.long	505
	.long	421
	.long	149
	.long	111
	.long	177
	.long	167
	.long	223
	.long	291
	.long	91
	.long	29
	.long	305
	.long	151
	.long	177
	.long	337
	.long	183
	.long	361
	.long	435
	.long	307
	.long	507
	.long	77
	.long	181
	.long	507
	.long	315
	.long	145
	.long	423
	.long	71
	.long	103
	.long	493
	.long	271
	.long	469
	.long	339
	.long	237
	.long	437
	.long	483
	.long	31
	.long	219
	.long	61
	.long	131
	.long	391
	.long	233
	.long	219
	.long	69
	.long	57
	.long	459
	.long	225
	.long	421
	.long	7
	.long	461
	.long	111
	.long	451
	.long	277
	.long	185
	.long	193
	.long	125
	.long	251
	.long	199
	.long	73
	.long	71
	.long	7
	.long	409
	.long	417
	.long	149
	.long	193
	.long	53
	.long	437
	.long	29
	.long	467
	.long	229
	.long	31
	.long	35
	.long	75
	.long	105
	.long	503
	.long	75
	.long	317
	.long	401
	.long	367
	.long	131
	.long	365
	.long	441
	.long	433
	.long	93
	.long	377
	.long	405
	.long	465
	.long	259
	.long	283
	.long	443
	.long	143
	.long	445
	.long	3
	.long	461
	.long	329
	.long	309
	.long	77
	.long	323
	.long	155
	.long	347
	.long	45
	.long	381
	.long	315
	.long	463
	.long	207
	.long	321
	.long	157
	.long	109
	.long	479
	.long	313
	.long	345
	.long	167
	.long	439
	.long	307
	.long	235
	.long	473
	.long	79
	.long	101
	.long	245
	.long	19
	.long	381
	.long	251
	.long	35
	.long	25
	.long	107
	.long	187
	.long	115
	.long	113
	.long	321
	.long	115
	.long	445
	.long	61
	.long	77
	.long	293
	.long	405
	.long	13
	.long	53
	.long	17
	.long	171
	.long	299
	.long	41
	.long	79
	.long	3
	.long	485
	.long	331
	.long	13
	.long	257
	.long	59
	.long	201
	.long	497
	.long	81
	.long	451
	.long	199
	.long	171
	.long	81
	.long	253
	.long	365
	.long	75
	.long	451
	.long	149
	.long	483
	.long	81
	.long	453
	.long	469
	.long	485
	.long	305
	.long	163
	.long	401
	.long	15
	.long	91
	.long	3
	.long	129
	.long	35
	.long	239
	.long	355
	.long	211
	.long	387
	.long	101
	.long	299
	.long	67
	.long	375
	.long	405
	.long	357
	.long	267
	.long	363
	.long	79
	.long	83
	.long	437
	.long	457
	.long	39
	.long	97
	.long	473
	.long	289
	.long	179
	.long	57
	.long	23
	.long	49
	.long	79
	.long	71
	.long	341
	.long	287
	.long	95
	.long	229
	.long	271
	.long	475
	.long	49
	.long	241
	.long	261
	.long	495
	.long	353
	.long	381
	.long	13
	.long	291
	.long	37
	.long	251
	.long	105
	.long	399
	.long	81
	.long	89
	.long	265
	.long	507
	.long	205
	.long	145
	.long	331
	.long	129
	.long	119
	.long	503
	.long	249
	.long	1
	.long	289
	.long	463
	.long	163
	.long	443
	.long	63
	.long	123
	.long	361
	.long	261
	.long	49
	.long	429
	.long	137
	.long	355
	.long	175
	.long	507
	.long	59
	.long	277
	.long	391
	.long	25
	.long	185
	.long	381
	.long	197
	.long	39
	.long	5
	.long	429
	.long	119
	.long	247
	.long	177
	.long	329
	.long	465
	.long	421
	.long	271
	.long	467
	.long	151
	.long	45
	.long	429
	.long	137
	.long	471
	.long	11
	.long	17
	.long	409
	.long	347
	.long	199
	.long	463
	.long	177
	.long	11
	.long	51
	.long	361
	.long	95
	.long	497
	.long	163
	.long	351
	.long	127
	.long	395
	.long	511
	.long	327
	.long	353
	.long	49
	.long	105
	.long	151
	.long	321
	.long	331
	.long	329
	.long	509
	.long	107
	.long	109
	.long	303
	.long	467
	.long	287
	.long	161
	.long	45
	.long	385
	.long	289
	.long	363
	.long	331
	.long	265
	.long	407
	.long	37
	.long	433
	.long	315
	.long	343
	.long	63
	.long	51
	.long	185
	.long	71
	.long	27
	.long	267
	.long	503
	.long	239
	.long	293
	.long	245
	.long	281
	.long	297
	.long	75
	.long	461
	.long	371
	.long	129
	.long	189
	.long	189
	.long	339
	.long	287
	.long	111
	.long	111
	.long	379
	.long	93
	.long	27
	.long	185
	.long	347
	.long	337
	.long	247
	.long	507
	.long	161
	.long	231
	.long	43
	.long	499
	.long	73
	.long	327
	.long	263
	.long	331
	.long	249
	.long	493
	.long	37
	.long	25
	.long	115
	.long	3
	.long	167
	.long	197
	.long	127
	.long	357
	.long	497
	.long	103
	.long	125
	.long	191
	.long	165
	.long	55
	.long	101
	.long	95
	.long	79
	.long	351
	.long	341
	.long	43
	.long	125
	.long	135
	.long	173
	.long	289
	.long	373
	.long	133
	.long	421
	.long	241
	.long	281
	.long	213
	.long	177
	.long	363
	.long	151
	.long	227
	.long	145
	.long	363
	.long	239
	.long	431
	.long	81
	.long	397
	.long	241
	.long	67
	.long	291
	.long	255
	.long	405
	.long	421
	.long	399
	.long	75
	.long	399
	.long	105
	.long	329
	.long	41
	.long	425
	.long	7
	.long	283
	.long	375
	.long	475
	.long	427
	.long	277
	.long	209
	.long	411
	.long	3
	.long	137
	.long	195
	.long	289
	.long	509
	.long	121
	.long	55
	.long	147
	.long	275
	.long	251
	.long	19
	.long	129
	.long	285
	.long	415
	.long	487
	.long	491
	.long	193
	.long	219
	.long	403
	.long	23
	.long	97
	.long	65
	.long	285
	.long	75
	.long	21
	.long	373
	.long	261
	.long	339
	.long	239
	.long	495
	.long	415
	.long	333
	.long	107
	.long	435
	.long	297
	.long	213
	.long	149
	.long	463
	.long	199
	.long	323
	.long	45
	.long	19
	.long	301
	.long	121
	.long	499
	.long	187
	.long	229
	.long	63
	.long	425
	.long	99
	.long	281
	.long	35
	.long	125
	.long	349
	.long	87
	.long	101
	.long	59
	.long	195
	.long	511
	.long	355
	.long	73
	.long	263
	.long	243
	.long	101
	.long	165
	.long	141
	.long	11
	.long	389
	.long	219
	.long	187
	.long	449
	.long	447
	.long	393
	.long	477
	.long	305
	.long	221
	.long	51
	.long	355
	.long	209
	.long	499
	.long	479
	.long	265
	.long	377
	.long	145
	.long	411
	.long	173
	.long	11
	.long	433
	.long	483
	.long	135
	.long	385
	.long	341
	.long	89
	.long	209
	.long	391
	.long	33
	.long	395
	.long	319
	.long	451
	.long	119
	.long	341
	.long	227
	.long	375
	.long	61
	.long	331
	.long	493
	.long	411
	.long	293
	.long	47
	.long	203
	.long	375
	.long	167
	.long	395
	.long	155
	.long	5
	.long	237
	.long	361
	.long	489
	.long	127
	.long	21
	.long	345
	.long	101
	.long	371
	.long	233
	.long	431
	.long	109
	.long	119
	.long	277
	.long	125
	.long	263
	.long	73
	.long	135
	.long	123
	.long	83
	.long	123
	.long	405
	.long	69
	.long	75
	.long	287
	.long	401
	.long	23
	.long	283
	.long	393
	.long	41
	.long	379
	.long	431
	.long	11
	.long	475
	.long	505
	.long	19
	.long	365
	.long	265
	.long	271
	.long	499
	.long	489
	.long	443
	.long	165
	.long	91
	.long	83
	.long	291
	.long	319
	.long	199
	.long	107
	.long	245
	.long	389
	.long	143
	.long	137
	.long	89
	.long	125
	.long	281
	.long	381
	.long	215
	.long	131
	.long	299
	.long	249
	.long	375
	.long	455
	.long	43
	.long	73
	.long	281
	.long	217
	.long	297
	.long	229
	.long	431
	.long	357
	.long	81
	.long	357
	.long	171
	.long	451
	.long	481
	.long	13
	.long	387
	.long	491
	.long	489
	.long	439
	.long	385
	.long	487
	.long	177
	.long	393
	.long	33
	.long	71
	.long	375
	.long	443
	.long	129
	.long	407
	.long	395
	.long	127
	.long	65
	.long	333
	.long	309
	.long	119
	.long	197
	.long	435
	.long	497
	.long	373
	.long	71
	.long	379
	.long	509
	.long	387
	.long	159
	.long	265
	.long	477
	.long	463
	.long	449
	.long	47
	.long	353
	.long	249
	.long	335
	.long	505
	.long	89
	.long	141
	.long	55
	.long	235
	.long	187
	.long	87
	.long	363
	.long	93
	.long	363
	.long	101
	.long	67
	.long	215
	.long	321
	.long	331
	.long	305
	.long	261
	.long	411
	.long	491
	.long	479
	.long	65
	.long	307
	.long	469
	.long	415
	.long	131
	.long	315
	.long	487
	.long	83
	.long	455
	.long	19
	.long	113
	.long	163
	.long	503
	.long	99
	.long	499
	.long	251
	.long	239
	.long	81
	.long	167
	.long	391
	.long	255
	.long	317
	.long	363
	.long	359
	.long	395
	.long	419
	.long	307
	.long	251
	.long	267
	.long	171
	.long	461
	.long	183
	.long	465
	.long	165
	.long	163
	.long	293
	.long	477
	.long	223
	.long	403
	.long	389
	.long	97
	.long	335
	.long	357
	.long	297
	.long	19
	.long	469
	.long	501
	.long	249
	.long	85
	.long	213
	.long	311
	.long	265
	.long	379
	.long	297
	.long	283
	.long	393
	.long	449
	.long	463
	.long	289
	.long	159
	.long	289
	.long	499
	.long	407
	.long	129
	.long	137
	.long	221
	.long	43
	.long	89
	.long	403
	.long	271
	.long	75
	.long	83
	.long	445
	.long	453
	.long	389
	.long	149
	.long	143
	.long	423
	.long	499
	.long	317
	.long	445
	.long	157
	.long	137
	.long	453
	.long	163
	.long	87
	.long	23
	.long	391
	.long	119
	.long	427
	.long	323
	.long	173
	.long	89
	.long	259
	.long	377
	.long	511
	.long	249
	.long	31
	.long	363
	.long	229
	.long	353
	.long	329
	.long	493
	.long	427
	.long	57
	.long	205
	.long	389
	.long	91
	.long	83
	.long	13
	.long	219
	.long	439
	.long	45
	.long	35
	.long	371
	.long	441
	.long	17
	.long	267
	.long	501
	.long	53
	.long	25
	.long	333
	.long	17
	.long	201
	.long	475
	.long	257
	.long	417
	.long	345
	.long	381
	.long	377
	.long	55
	.long	403
	.long	77
	.long	389
	.long	347
	.long	363
	.long	211
	.long	413
	.long	419
	.long	5
	.long	167
	.long	219
	.long	201
	.long	285
	.long	425
	.long	11
	.long	77
	.long	269
	.long	489
	.long	281
	.long	403
	.long	79
	.long	425
	.long	125
	.long	81
	.long	331
	.long	437
	.long	271
	.long	397
	.long	299
	.long	475
	.long	271
	.long	249
	.long	413
	.long	233
	.long	261
	.long	495
	.long	171
	.long	69
	.long	27
	.long	409
	.long	21
	.long	421
	.long	367
	.long	81
	.long	483
	.long	255
	.long	15
	.long	219
	.long	365
	.long	497
	.long	181
	.long	75
	.long	431
	.long	99
	.long	325
	.long	407
	.long	229
	.long	281
	.long	63
	.long	83
	.long	493
	.long	5
	.long	113
	.long	15
	.long	271
	.long	37
	.long	87
	.long	451
	.long	299
	.long	83
	.long	451
	.long	311
	.long	441
	.long	47
	.long	455
	.long	47
	.long	253
	.long	13
	.long	109
	.long	369
	.long	347
	.long	11
	.long	409
	.long	275
	.long	63
	.long	441
	.long	15
	.space 400
	.long	519
	.long	307
	.long	931
	.long	1023
	.long	517
	.long	771
	.long	151
	.long	1023
	.long	539
	.long	725
	.long	45
	.long	927
	.long	707
	.long	29
	.long	125
	.long	371
	.long	275
	.long	279
	.long	817
	.long	389
	.long	453
	.long	989
	.long	1015
	.long	29
	.long	169
	.long	743
	.long	99
	.long	923
	.long	981
	.long	181
	.long	693
	.long	309
	.long	227
	.long	111
	.long	219
	.long	897
	.long	377
	.long	425
	.long	609
	.long	227
	.long	19
	.long	221
	.long	143
	.long	581
	.long	147
	.long	919
	.long	127
	.long	725
	.long	793
	.long	289
	.long	411
	.long	835
	.long	921
	.long	957
	.long	443
	.long	349
	.long	813
	.long	5
	.long	105
	.long	457
	.long	393
	.long	539
	.long	101
	.long	197
	.long	697
	.long	27
	.long	343
	.long	515
	.long	69
	.long	485
	.long	383
	.long	855
	.long	693
	.long	133
	.long	87
	.long	743
	.long	747
	.long	475
	.long	87
	.long	469
	.long	763
	.long	721
	.long	345
	.long	479
	.long	965
	.long	527
	.long	121
	.long	271
	.long	353
	.long	467
	.long	177
	.long	245
	.long	627
	.long	113
	.long	357
	.long	7
	.long	691
	.long	725
	.long	355
	.long	889
	.long	635
	.long	737
	.long	429
	.long	545
	.long	925
	.long	357
	.long	873
	.long	187
	.long	351
	.long	677
	.long	999
	.long	921
	.long	477
	.long	233
	.long	765
	.long	495
	.long	81
	.long	953
	.long	479
	.long	89
	.long	173
	.long	473
	.long	131
	.long	961
	.long	411
	.long	291
	.long	967
	.long	65
	.long	511
	.long	13
	.long	805
	.long	945
	.long	369
	.long	827
	.long	295
	.long	163
	.long	835
	.long	259
	.long	207
	.long	331
	.long	29
	.long	315
	.long	999
	.long	133
	.long	967
	.long	41
	.long	117
	.long	677
	.long	471
	.long	717
	.long	881
	.long	755
	.long	351
	.long	723
	.long	259
	.long	879
	.long	455
	.long	721
	.long	289
	.long	149
	.long	199
	.long	805
	.long	987
	.long	851
	.long	423
	.long	597
	.long	129
	.long	11
	.long	733
	.long	549
	.long	153
	.long	285
	.long	451
	.long	559
	.long	377
	.long	109
	.long	357
	.long	143
	.long	693
	.long	615
	.long	677
	.long	701
	.long	475
	.long	767
	.long	85
	.long	229
	.long	509
	.long	547
	.long	151
	.long	389
	.long	711
	.long	785
	.long	657
	.long	319
	.long	509
	.long	99
	.long	1007
	.long	775
	.long	359
	.long	697
	.long	677
	.long	85
	.long	497
	.long	105
	.long	615
	.long	891
	.long	71
	.long	449
	.long	835
	.long	609
	.long	377
	.long	693
	.long	665
	.long	627
	.long	215
	.long	911
	.long	503
	.long	729
	.long	131
	.long	19
	.long	895
	.long	199
	.long	161
	.long	239
	.long	633
	.long	1013
	.long	537
	.long	255
	.long	23
	.long	149
	.long	679
	.long	1021
	.long	595
	.long	199
	.long	557
	.long	659
	.long	251
	.long	829
	.long	727
	.long	439
	.long	495
	.long	647
	.long	223
	.long	949
	.long	625
	.long	87
	.long	481
	.long	85
	.long	799
	.long	917
	.long	769
	.long	949
	.long	739
	.long	115
	.long	499
	.long	945
	.long	547
	.long	225
	.long	1015
	.long	469
	.long	737
	.long	495
	.long	353
	.long	103
	.long	17
	.long	665
	.long	639
	.long	525
	.long	75
	.long	447
	.long	185
	.long	43
	.long	729
	.long	577
	.long	863
	.long	735
	.long	317
	.long	99
	.long	17
	.long	477
	.long	893
	.long	537
	.long	519
	.long	1017
	.long	375
	.long	297
	.long	325
	.long	999
	.long	353
	.long	343
	.long	729
	.long	135
	.long	489
	.long	859
	.long	267
	.long	141
	.long	831
	.long	141
	.long	893
	.long	249
	.long	807
	.long	53
	.long	613
	.long	131
	.long	547
	.long	977
	.long	131
	.long	999
	.long	175
	.long	31
	.long	341
	.long	739
	.long	467
	.long	675
	.long	241
	.long	645
	.long	247
	.long	391
	.long	583
	.long	183
	.long	973
	.long	433
	.long	367
	.long	131
	.long	467
	.long	571
	.long	309
	.long	385
	.long	977
	.long	111
	.long	917
	.long	935
	.long	473
	.long	345
	.long	411
	.long	313
	.long	97
	.long	149
	.long	959
	.long	841
	.long	839
	.long	669
	.long	431
	.long	51
	.long	41
	.long	301
	.long	247
	.long	1015
	.long	377
	.long	329
	.long	945
	.long	269
	.long	67
	.long	979
	.long	581
	.long	643
	.long	823
	.long	557
	.long	91
	.long	405
	.long	117
	.long	801
	.long	509
	.long	347
	.long	893
	.long	303
	.long	227
	.long	783
	.long	555
	.long	867
	.long	99
	.long	703
	.long	111
	.long	797
	.long	873
	.long	541
	.long	919
	.long	513
	.long	343
	.long	319
	.long	517
	.long	135
	.long	871
	.long	917
	.long	285
	.long	663
	.long	301
	.long	15
	.long	763
	.long	89
	.long	323
	.long	757
	.long	317
	.long	807
	.long	309
	.long	1013
	.long	345
	.long	499
	.long	279
	.long	711
	.long	915
	.long	411
	.long	281
	.long	193
	.long	739
	.long	365
	.long	315
	.long	375
	.long	809
	.long	469
	.long	487
	.long	621
	.long	857
	.long	975
	.long	537
	.long	939
	.long	585
	.long	129
	.long	625
	.long	447
	.long	129
	.long	1017
	.long	133
	.long	83
	.long	3
	.long	415
	.long	661
	.long	53
	.long	115
	.long	903
	.long	49
	.long	79
	.long	55
	.long	385
	.long	261
	.long	345
	.long	297
	.long	199
	.long	385
	.long	617
	.long	25
	.long	515
	.long	275
	.long	849
	.long	401
	.long	471
	.long	377
	.long	661
	.long	535
	.long	505
	.long	939
	.long	465
	.long	225
	.long	929
	.long	219
	.long	955
	.long	659
	.long	441
	.long	117
	.long	527
	.long	427
	.long	515
	.long	287
	.long	191
	.long	33
	.long	389
	.long	197
	.long	825
	.long	63
	.long	417
	.long	949
	.long	35
	.long	571
	.long	9
	.long	131
	.long	609
	.long	439
	.long	95
	.long	19
	.long	569
	.long	893
	.long	451
	.long	397
	.long	971
	.long	801
	.long	125
	.long	471
	.long	187
	.long	257
	.long	67
	.long	949
	.long	621
	.long	453
	.long	411
	.long	621
	.long	955
	.long	309
	.long	783
	.long	893
	.long	597
	.long	377
	.long	753
	.long	145
	.long	637
	.long	941
	.long	593
	.long	317
	.long	555
	.long	375
	.long	575
	.long	175
	.long	403
	.long	571
	.long	555
	.long	109
	.long	377
	.long	931
	.long	499
	.long	649
	.long	653
	.long	329
	.long	279
	.long	271
	.long	647
	.long	721
	.long	665
	.long	429
	.long	957
	.long	803
	.long	767
	.long	425
	.long	477
	.long	995
	.long	105
	.long	495
	.long	575
	.long	687
	.long	385
	.long	227
	.long	923
	.long	563
	.long	723
	.long	481
	.long	717
	.long	111
	.long	633
	.long	113
	.long	369
	.long	955
	.long	253
	.long	321
	.long	409
	.long	909
	.long	367
	.long	33
	.long	967
	.long	453
	.long	863
	.long	449
	.long	539
	.long	781
	.long	911
	.long	113
	.long	7
	.long	219
	.long	725
	.long	1015
	.long	971
	.long	1021
	.long	525
	.long	785
	.long	873
	.long	191
	.long	893
	.long	297
	.long	507
	.long	215
	.long	21
	.long	153
	.long	645
	.long	913
	.long	755
	.long	371
	.long	881
	.long	113
	.long	903
	.long	225
	.long	49
	.long	587
	.long	201
	.long	927
	.long	429
	.long	599
	.long	513
	.long	97
	.long	319
	.long	331
	.long	833
	.long	325
	.long	887
	.long	139
	.long	927
	.long	399
	.long	163
	.long	307
	.long	803
	.long	169
	.long	1019
	.long	869
	.long	537
	.long	907
	.long	479
	.long	335
	.long	697
	.long	479
	.long	353
	.long	769
	.long	787
	.long	1023
	.long	855
	.long	493
	.long	883
	.long	521
	.long	735
	.long	297
	.long	1011
	.long	991
	.long	879
	.long	855
	.long	591
	.long	415
	.long	917
	.long	375
	.long	453
	.long	553
	.long	189
	.long	841
	.long	339
	.long	211
	.long	601
	.long	57
	.long	765
	.long	745
	.long	621
	.long	209
	.long	875
	.long	639
	.long	7
	.long	595
	.long	971
	.long	263
	.long	1009
	.long	201
	.long	23
	.long	77
	.long	621
	.long	33
	.long	535
	.long	963
	.long	661
	.long	523
	.long	263
	.long	917
	.long	103
	.long	623
	.long	231
	.long	47
	.long	301
	.long	549
	.long	337
	.long	675
	.long	189
	.long	357
	.long	1005
	.long	789
	.long	189
	.long	319
	.long	721
	.long	1005
	.long	525
	.long	675
	.long	539
	.long	191
	.long	813
	.long	917
	.long	51
	.long	167
	.long	415
	.long	579
	.long	755
	.long	605
	.long	721
	.long	837
	.long	529
	.long	31
	.long	327
	.long	799
	.long	961
	.long	279
	.long	409
	.long	847
	.long	649
	.long	241
	.long	285
	.long	545
	.long	407
	.long	161
	.long	591
	.long	73
	.long	313
	.long	811
	.long	17
	.long	663
	.long	269
	.long	261
	.long	37
	.long	783
	.long	127
	.long	917
	.long	231
	.long	577
	.long	975
	.long	793
	.long	921
	.long	343
	.long	751
	.long	139
	.long	221
	.long	79
	.long	817
	.long	393
	.long	545
	.long	11
	.long	781
	.long	71
	.long	1
	.long	699
	.long	767
	.long	917
	.long	9
	.long	107
	.long	341
	.long	587
	.long	903
	.long	965
	.long	599
	.long	507
	.long	843
	.long	739
	.long	579
	.long	397
	.long	397
	.long	325
	.long	775
	.long	565
	.long	925
	.long	75
	.long	55
	.long	979
	.long	931
	.long	93
	.long	957
	.long	857
	.long	753
	.long	965
	.long	795
	.long	67
	.long	5
	.long	87
	.long	909
	.long	97
	.long	995
	.long	271
	.long	875
	.long	671
	.long	613
	.long	33
	.long	351
	.long	69
	.long	811
	.long	669
	.long	729
	.long	401
	.long	647
	.long	241
	.long	435
	.long	447
	.long	721
	.long	271
	.long	745
	.long	53
	.long	775
	.long	99
	.long	343
	.long	451
	.long	427
	.long	593
	.long	339
	.long	845
	.long	243
	.long	345
	.long	17
	.long	573
	.long	421
	.long	517
	.long	971
	.long	499
	.long	435
	.long	769
	.long	75
	.long	203
	.long	793
	.long	985
	.long	343
	.long	955
	.long	735
	.long	523
	.long	659
	.long	703
	.long	303
	.long	421
	.long	951
	.long	405
	.long	631
	.long	825
	.long	735
	.long	433
	.long	841
	.long	485
	.long	49
	.long	749
	.long	107
	.long	669
	.long	211
	.long	497
	.long	143
	.long	99
	.long	57
	.long	277
	.long	969
	.long	107
	.long	397
	.long	563
	.long	551
	.long	447
	.long	381
	.long	187
	.long	57
	.long	405
	.long	731
	.long	769
	.long	923
	.long	955
	.long	915
	.long	737
	.long	595
	.long	341
	.long	253
	.long	823
	.long	197
	.long	321
	.long	315
	.long	181
	.long	885
	.long	497
	.long	159
	.long	571
	.long	981
	.long	899
	.long	785
	.long	947
	.long	217
	.long	217
	.long	135
	.long	753
	.long	623
	.long	565
	.long	717
	.long	903
	.long	581
	.long	955
	.long	621
	.long	361
	.long	869
	.long	87
	.long	943
	.long	907
	.long	853
	.long	353
	.long	335
	.long	197
	.long	771
	.long	433
	.long	743
	.long	195
	.long	91
	.long	1023
	.long	63
	.long	301
	.long	647
	.long	205
	.long	485
	.long	927
	.long	1003
	.long	987
	.long	359
	.long	577
	.long	147
	.long	141
	.long	1017
	.long	701
	.long	273
	.long	89
	.long	589
	.long	487
	.long	859
	.long	343
	.long	91
	.long	847
	.long	341
	.long	173
	.long	287
	.long	1003
	.long	289
	.long	639
	.long	983
	.long	685
	.long	697
	.long	35
	.long	701
	.long	645
	.long	911
	.long	501
	.long	705
	.long	873
	.long	763
	.long	745
	.long	657
	.long	559
	.long	699
	.long	315
	.long	347
	.long	429
	.long	197
	.long	165
	.long	955
	.long	859
	.long	167
	.long	303
	.long	833
	.long	531
	.long	473
	.long	635
	.long	641
	.long	195
	.long	589
	.long	821
	.long	205
	.long	3
	.long	635
	.long	371
	.long	891
	.long	249
	.long	123
	.long	77
	.long	623
	.long	993
	.long	401
	.long	525
	.long	427
	.long	71
	.long	655
	.long	951
	.long	357
	.long	851
	.long	899
	.long	535
	.long	493
	.long	323
	.long	1003
	.long	343
	.long	515
	.long	859
	.long	1017
	.long	5
	.long	423
	.long	315
	.long	1011
	.long	703
	.long	41
	.long	777
	.long	163
	.long	95
	.long	831
	.long	79
	.long	975
	.long	235
	.long	633
	.long	723
	.long	297
	.long	589
	.long	317
	.long	679
	.long	981
	.long	195
	.long	399
	.long	1003
	.long	121
	.long	501
	.long	155
	.space 640
	.long	7
	.long	2011
	.long	1001
	.long	49
	.long	825
	.long	415
	.long	1441
	.long	383
	.long	1581
	.long	623
	.long	1621
	.long	1319
	.long	1387
	.long	619
	.long	839
	.long	217
	.long	75
	.long	1955
	.long	505
	.long	281
	.long	1629
	.long	1379
	.long	53
	.long	1111
	.long	1399
	.long	301
	.long	209
	.long	49
	.long	155
	.long	1647
	.long	631
	.long	129
	.long	1569
	.long	335
	.long	67
	.long	1955
	.long	1611
	.long	2021
	.long	1305
	.long	121
	.long	37
	.long	877
	.long	835
	.long	1457
	.long	669
	.long	1405
	.long	935
	.long	1735
	.long	665
	.long	551
	.long	789
	.long	1543
	.long	1267
	.long	1027
	.long	1
	.long	1911
	.long	163
	.long	1929
	.long	67
	.long	1975
	.long	1681
	.long	1413
	.long	191
	.long	1711
	.long	1307
	.long	401
	.long	725
	.long	1229
	.long	1403
	.long	1609
	.long	2035
	.long	917
	.long	921
	.long	1789
	.long	41
	.long	2003
	.long	187
	.long	67
	.long	1635
	.long	717
	.long	1449
	.long	277
	.long	1903
	.long	1179
	.long	363
	.long	1211
	.long	1231
	.long	647
	.long	1261
	.long	1029
	.long	1485
	.long	1309
	.long	1149
	.long	317
	.long	1335
	.long	171
	.long	243
	.long	271
	.long	1055
	.long	1601
	.long	1129
	.long	1653
	.long	205
	.long	1463
	.long	1681
	.long	1621
	.long	197
	.long	951
	.long	573
	.long	1697
	.long	1265
	.long	1321
	.long	1805
	.long	1235
	.long	1853
	.long	1307
	.long	945
	.long	1197
	.long	1411
	.long	833
	.long	273
	.long	1517
	.long	1747
	.long	1095
	.long	1345
	.long	869
	.long	57
	.long	1383
	.long	221
	.long	1713
	.long	335
	.long	1751
	.long	1141
	.long	839
	.long	523
	.long	1861
	.long	1105
	.long	389
	.long	1177
	.long	1877
	.long	805
	.long	93
	.long	1591
	.long	423
	.long	1835
	.long	99
	.long	1781
	.long	1515
	.long	1909
	.long	1011
	.long	303
	.long	385
	.long	1635
	.long	357
	.long	973
	.long	1781
	.long	1707
	.long	1363
	.long	1053
	.long	649
	.long	1469
	.long	623
	.long	1429
	.long	1241
	.long	1151
	.long	1055
	.long	503
	.long	921
	.long	3
	.long	349
	.long	1149
	.long	293
	.long	45
	.long	303
	.long	877
	.long	1565
	.long	1583
	.long	1001
	.long	663
	.long	1535
	.long	395
	.long	1141
	.long	1481
	.long	1797
	.long	643
	.long	1507
	.long	465
	.long	2027
	.long	1695
	.long	367
	.long	937
	.long	719
	.long	545
	.long	1991
	.long	83
	.long	819
	.long	239
	.long	1791
	.long	1461
	.long	1647
	.long	1501
	.long	1161
	.long	1629
	.long	139
	.long	1595
	.long	1921
	.long	1267
	.long	1415
	.long	509
	.long	347
	.long	777
	.long	1083
	.long	363
	.long	269
	.long	1015
	.long	1809
	.long	1105
	.long	1429
	.long	1471
	.long	2019
	.long	381
	.long	2025
	.long	1223
	.long	827
	.long	1733
	.long	887
	.long	1321
	.long	803
	.long	1951
	.long	1297
	.long	1995
	.long	833
	.long	1107
	.long	1135
	.long	1181
	.long	1251
	.long	983
	.long	1389
	.long	1565
	.long	273
	.long	137
	.long	71
	.long	735
	.long	1005
	.long	933
	.long	67
	.long	1471
	.long	551
	.long	457
	.long	1667
	.long	1729
	.long	919
	.long	285
	.long	1629
	.long	1815
	.long	653
	.long	1919
	.long	1039
	.long	531
	.long	393
	.long	1411
	.long	359
	.long	221
	.long	699
	.long	1485
	.long	471
	.long	1357
	.long	1715
	.long	595
	.long	1677
	.long	153
	.long	1903
	.long	1281
	.long	215
	.long	781
	.long	543
	.long	293
	.long	1807
	.long	965
	.long	1695
	.long	443
	.long	1985
	.long	321
	.long	879
	.long	1227
	.long	1915
	.long	839
	.long	1945
	.long	1993
	.long	1165
	.long	51
	.long	557
	.long	723
	.long	1491
	.long	817
	.long	1237
	.long	947
	.long	1215
	.long	1911
	.long	1225
	.long	1965
	.long	1889
	.long	1503
	.long	1177
	.long	73
	.long	1767
	.long	303
	.long	177
	.long	1897
	.long	1401
	.long	321
	.long	921
	.long	217
	.long	1779
	.long	327
	.long	1889
	.long	333
	.long	615
	.long	1665
	.long	1825
	.long	1639
	.long	237
	.long	1205
	.long	361
	.long	129
	.long	1655
	.long	983
	.long	1089
	.long	1171
	.long	401
	.long	677
	.long	643
	.long	749
	.long	303
	.long	1407
	.long	1873
	.long	1579
	.long	1491
	.long	1393
	.long	1247
	.long	789
	.long	763
	.long	49
	.long	5
	.long	1607
	.long	1891
	.long	735
	.long	1557
	.long	1909
	.long	1765
	.long	1777
	.long	1127
	.long	813
	.long	695
	.long	97
	.long	731
	.long	1503
	.long	1751
	.long	333
	.long	769
	.long	865
	.long	693
	.long	377
	.long	1919
	.long	957
	.long	1359
	.long	1627
	.long	1039
	.long	1783
	.long	1065
	.long	1665
	.long	1917
	.long	1947
	.long	991
	.long	1997
	.long	841
	.long	459
	.long	221
	.long	327
	.long	1595
	.long	1881
	.long	1269
	.long	1007
	.long	129
	.long	1413
	.long	475
	.long	1105
	.long	791
	.long	1983
	.long	1359
	.long	503
	.long	691
	.long	659
	.long	691
	.long	343
	.long	1375
	.long	1919
	.long	263
	.long	1373
	.long	603
	.long	1383
	.long	297
	.long	781
	.long	145
	.long	285
	.long	767
	.long	1739
	.long	1715
	.long	715
	.long	317
	.long	1333
	.long	85
	.long	831
	.long	1615
	.long	81
	.long	1667
	.long	1467
	.long	1457
	.long	1453
	.long	1825
	.long	109
	.long	387
	.long	1207
	.long	2039
	.long	213
	.long	1351
	.long	1329
	.long	1173
	.long	57
	.long	1769
	.long	951
	.long	183
	.long	23
	.long	451
	.long	1155
	.long	1551
	.long	2037
	.long	811
	.long	635
	.long	1671
	.long	1451
	.long	863
	.long	1499
	.long	1673
	.long	363
	.long	1029
	.long	1077
	.long	1525
	.long	277
	.long	1023
	.long	655
	.long	665
	.long	1869
	.long	1255
	.long	965
	.long	277
	.long	1601
	.long	329
	.long	1603
	.long	1901
	.long	395
	.long	65
	.long	1307
	.long	2029
	.long	21
	.long	1321
	.long	543
	.long	1569
	.long	1185
	.long	1905
	.long	1701
	.long	413
	.long	2041
	.long	1697
	.long	725
	.long	1417
	.long	1847
	.long	411
	.long	211
	.long	915
	.long	1891
	.long	17
	.long	1877
	.long	1699
	.long	687
	.long	1089
	.long	1973
	.long	1809
	.long	851
	.long	1495
	.long	1257
	.long	63
	.long	1323
	.long	1307
	.long	609
	.long	881
	.long	1543
	.long	177
	.long	617
	.long	1505
	.long	1747
	.long	1537
	.long	925
	.long	183
	.long	77
	.long	1723
	.long	1877
	.long	1703
	.long	397
	.long	459
	.long	521
	.long	257
	.long	1177
	.long	389
	.long	1947
	.long	1553
	.long	1583
	.long	1831
	.long	261
	.long	485
	.long	289
	.long	1281
	.long	1543
	.long	1591
	.long	1123
	.long	573
	.long	821
	.long	1065
	.long	1933
	.long	1373
	.long	2005
	.long	905
	.long	207
	.long	173
	.long	1573
	.long	1597
	.long	573
	.long	1883
	.long	1795
	.long	1499
	.long	1743
	.long	553
	.long	335
	.long	333
	.long	1645
	.long	791
	.long	871
	.long	1157
	.long	969
	.long	557
	.long	141
	.long	223
	.long	1129
	.long	1685
	.long	423
	.long	1069
	.long	391
	.long	99
	.long	95
	.long	1847
	.long	531
	.long	1859
	.long	1833
	.long	1833
	.long	341
	.long	237
	.long	1997
	.long	1799
	.long	409
	.long	431
	.long	1917
	.long	363
	.long	335
	.long	1039
	.long	1085
	.long	1657
	.long	1975
	.long	1527
	.long	1111
	.long	659
	.long	389
	.long	899
	.long	595
	.long	1439
	.long	1861
	.long	1979
	.long	1569
	.long	1087
	.long	1009
	.long	165
	.long	1895
	.long	1481
	.long	1583
	.long	29
	.long	1193
	.long	1673
	.long	1075
	.long	301
	.long	1081
	.long	1377
	.long	1747
	.long	1497
	.long	1103
	.long	1789
	.long	887
	.long	739
	.long	1577
	.long	313
	.long	1367
	.long	1299
	.long	1801
	.long	1131
	.long	1837
	.long	73
	.long	1865
	.long	1065
	.long	843
	.long	635
	.long	55
	.long	1655
	.long	913
	.long	1037
	.long	223
	.long	1871
	.long	1161
	.long	461
	.long	479
	.long	511
	.long	1721
	.long	1107
	.long	389
	.long	151
	.long	35
	.long	375
	.long	1099
	.long	937
	.long	1185
	.long	1701
	.long	769
	.long	639
	.long	1633
	.long	1609
	.long	379
	.long	1613
	.long	2031
	.long	685
	.long	289
	.long	975
	.long	671
	.long	1599
	.long	1447
	.long	871
	.long	647
	.long	99
	.long	139
	.long	1427
	.long	959
	.long	89
	.long	117
	.long	841
	.long	891
	.long	1959
	.long	223
	.long	1697
	.long	1145
	.long	499
	.long	1435
	.long	1809
	.long	1413
	.long	1445
	.long	1675
	.long	171
	.long	1073
	.long	1349
	.long	1545
	.long	2039
	.long	1027
	.long	1563
	.long	859
	.long	215
	.long	1673
	.long	1919
	.long	1633
	.long	779
	.long	411
	.long	1845
	.long	1477
	.long	1489
	.long	447
	.long	1545
	.long	351
	.long	1989
	.long	495
	.long	183
	.long	1639
	.long	1385
	.long	1805
	.long	1097
	.long	1249
	.long	1431
	.long	1571
	.long	591
	.long	697
	.long	1509
	.long	709
	.long	31
	.long	1563
	.long	165
	.long	513
	.long	1425
	.long	1299
	.long	1081
	.long	145
	.long	1841
	.long	1211
	.long	941
	.long	609
	.long	845
	.long	1169
	.long	1865
	.long	1593
	.long	347
	.long	293
	.long	1277
	.long	157
	.long	211
	.long	93
	.long	1679
	.long	1799
	.long	527
	.long	41
	.long	473
	.long	563
	.long	187
	.long	1525
	.long	575
	.long	1579
	.long	857
	.long	703
	.long	1211
	.long	647
	.long	709
	.long	981
	.long	285
	.long	697
	.long	163
	.long	981
	.long	153
	.long	1515
	.long	47
	.long	1553
	.long	599
	.long	225
	.long	1147
	.long	381
	.long	135
	.long	821
	.long	1965
	.long	609
	.long	1033
	.long	983
	.long	503
	.long	1117
	.long	327
	.long	453
	.long	2005
	.long	1257
	.long	343
	.long	1649
	.long	1199
	.long	599
	.long	1877
	.long	569
	.long	695
	.long	1587
	.long	1475
	.long	187
	.long	973
	.long	233
	.long	511
	.long	51
	.long	1083
	.long	665
	.long	1321
	.long	531
	.long	1875
	.long	1939
	.long	859
	.long	1507
	.long	1979
	.long	1203
	.long	1965
	.long	737
	.long	921
	.long	1565
	.long	1943
	.long	819
	.long	223
	.long	365
	.long	167
	.long	1705
	.long	413
	.long	1577
	.long	745
	.long	1573
	.long	655
	.long	1633
	.long	1003
	.long	91
	.long	1123
	.long	477
	.long	1741
	.long	1663
	.long	35
	.long	715
	.long	37
	.long	1513
	.long	815
	.long	941
	.long	1379
	.long	263
	.long	1831
	.long	1735
	.long	1111
	.long	1449
	.long	353
	.long	1941
	.long	1655
	.long	1349
	.long	877
	.long	285
	.long	1723
	.long	125
	.long	1753
	.long	985
	.long	723
	.long	175
	.long	439
	.long	791
	.long	1051
	.long	1261
	.long	717
	.long	1555
	.long	1757
	.long	1777
	.long	577
	.long	1583
	.long	1957
	.long	873
	.long	331
	.long	1163
	.long	313
	.long	1
	.long	1963
	.long	963
	.long	1905
	.long	821
	.long	1677
	.long	185
	.long	709
	.long	545
	.long	1723
	.long	215
	.long	1885
	.long	1249
	.long	583
	.long	1803
	.long	839
	.long	885
	.long	485
	.long	413
	.long	1767
	.long	425
	.long	129
	.long	1035
	.long	329
	.long	1263
	.long	1881
	.long	1779
	.long	1565
	.long	359
	.long	367
	.long	453
	.long	707
	.long	1419
	.long	831
	.long	1889
	.long	887
	.long	1871
	.long	1869
	.long	747
	.long	223
	.long	1547
	.long	1799
	.long	433
	.long	1441
	.long	553
	.long	2021
	.long	1303
	.long	1505
	.long	1735
	.long	1619
	.long	1065
	.long	1161
	.long	2047
	.long	347
	.long	867
	.long	881
	.long	1447
	.long	329
	.long	781
	.long	1065
	.long	219
	.long	589
	.long	645
	.long	1257
	.long	1833
	.long	749
	.long	1841
	.long	1733
	.long	1179
	.long	1191
	.long	1025
	.long	1639
	.long	1955
	.long	1423
	.long	1685
	.long	1711
	.long	493
	.long	549
	.long	783
	.long	1653
	.long	397
	.long	895
	.long	233
	.long	759
	.long	1505
	.long	677
	.long	1449
	.long	1573
	.long	1297
	.long	1821
	.long	1691
	.long	791
	.long	289
	.long	1187
	.long	867
	.long	1535
	.long	575
	.long	183
	.space 1344
	.long	3915
	.long	97
	.long	3047
	.long	937
	.long	2897
	.long	953
	.long	127
	.long	1201
	.long	3819
	.long	193
	.long	2053
	.long	3061
	.long	3759
	.long	1553
	.long	2007
	.long	2493
	.long	603
	.long	3343
	.long	3751
	.long	1059
	.long	783
	.long	1789
	.long	1589
	.long	283
	.long	1093
	.long	3919
	.long	2747
	.long	277
	.long	2605
	.long	2169
	.long	2905
	.long	721
	.long	4069
	.long	233
	.long	261
	.long	1137
	.long	3993
	.long	3619
	.long	2881
	.long	1275
	.long	3865
	.long	1299
	.long	3757
	.long	1193
	.long	733
	.long	993
	.long	1153
	.long	2945
	.long	3163
	.long	3179
	.long	437
	.long	271
	.long	3493
	.long	3971
	.long	1005
	.long	2615
	.long	2253
	.long	1131
	.long	585
	.long	2775
	.long	2171
	.long	2383
	.long	2937
	.long	2447
	.long	1745
	.long	663
	.long	1515
	.long	3767
	.long	2709
	.long	1767
	.long	3185
	.long	3017
	.long	2815
	.long	1829
	.long	87
	.long	3341
	.long	793
	.long	2627
	.long	2169
	.long	1875
	.long	3745
	.long	367
	.long	3783
	.long	783
	.long	827
	.long	3253
	.long	2639
	.long	2955
	.long	3539
	.long	1579
	.long	2109
	.long	379
	.long	2939
	.long	3019
	.long	1999
	.long	2253
	.long	2911
	.long	3733
	.long	481
	.long	1767
	.long	1055
	.long	4019
	.long	4085
	.long	105
	.long	1829
	.long	2097
	.long	2379
	.long	1567
	.long	2713
	.long	737
	.long	3423
	.long	3941
	.long	2659
	.long	3961
	.long	1755
	.long	3613
	.long	1937
	.long	1559
	.long	2287
	.long	2743
	.long	67
	.long	2859
	.long	325
	.long	2601
	.long	1149
	.long	3259
	.long	2403
	.long	3947
	.long	2011
	.long	175
	.long	3389
	.long	3915
	.long	1315
	.long	2447
	.long	141
	.long	359
	.long	3609
	.long	3933
	.long	729
	.long	2051
	.long	1755
	.long	2149
	.long	2107
	.long	1741
	.long	1051
	.long	3681
	.long	471
	.long	1055
	.long	845
	.long	257
	.long	1559
	.long	1061
	.long	2803
	.long	2219
	.long	1315
	.long	1369
	.long	3211
	.long	4027
	.long	105
	.long	11
	.long	1077
	.long	2857
	.long	337
	.long	3553
	.long	3503
	.long	3917
	.long	2665
	.long	3823
	.long	3403
	.long	3711
	.long	2085
	.long	1103
	.long	1641
	.long	701
	.long	4095
	.long	2883
	.long	1435
	.long	653
	.long	2363
	.long	1597
	.long	767
	.long	869
	.long	1825
	.long	1117
	.long	1297
	.long	501
	.long	505
	.long	149
	.long	873
	.long	2673
	.long	551
	.long	1499
	.long	2793
	.long	3277
	.long	2143
	.long	3663
	.long	533
	.long	3991
	.long	575
	.long	1877
	.long	1009
	.long	3929
	.long	473
	.long	3009
	.long	2595
	.long	3249
	.long	675
	.long	3593
	.long	2453
	.long	1567
	.long	973
	.long	595
	.long	1335
	.long	1715
	.long	589
	.long	85
	.long	2265
	.long	3069
	.long	461
	.long	1659
	.long	2627
	.long	1307
	.long	1731
	.long	1501
	.long	1699
	.long	3545
	.long	3803
	.long	2157
	.long	453
	.long	2813
	.long	2047
	.long	2999
	.long	3841
	.long	2361
	.long	1079
	.long	573
	.long	69
	.long	1363
	.long	1597
	.long	3427
	.long	2899
	.long	2771
	.long	1327
	.long	1117
	.long	1523
	.long	3521
	.long	2393
	.long	2537
	.long	1979
	.long	3179
	.long	683
	.long	2453
	.long	453
	.long	1227
	.long	779
	.long	671
	.long	3483
	.long	2135
	.long	3139
	.long	3381
	.long	3945
	.long	57
	.long	1541
	.long	3405
	.long	3381
	.long	2371
	.long	2879
	.long	1985
	.long	987
	.long	3017
	.long	3031
	.long	3839
	.long	1401
	.long	3749
	.long	2977
	.long	681
	.long	1175
	.long	1519
	.long	3355
	.long	907
	.long	117
	.long	771
	.long	3741
	.long	3337
	.long	1743
	.long	1227
	.long	3335
	.long	2755
	.long	1909
	.long	3603
	.long	2397
	.long	653
	.long	87
	.long	2025
	.long	2617
	.long	3257
	.long	287
	.long	3051
	.long	3809
	.long	897
	.long	2215
	.long	63
	.long	2043
	.long	1757
	.long	3671
	.long	297
	.long	3131
	.long	1305
	.long	293
	.long	3865
	.long	3173
	.long	3397
	.long	2269
	.long	3673
	.long	717
	.long	3041
	.long	3341
	.long	3595
	.long	3819
	.long	2871
	.long	3973
	.long	1129
	.long	513
	.long	871
	.long	1485
	.long	3977
	.long	2473
	.long	1171
	.long	1143
	.long	3063
	.long	3547
	.long	2183
	.long	3993
	.long	133
	.long	2529
	.long	2699
	.long	233
	.long	2355
	.long	231
	.long	3241
	.long	611
	.long	1309
	.long	3829
	.long	1839
	.long	1495
	.long	301
	.long	1169
	.long	1613
	.long	2673
	.long	243
	.long	3601
	.long	3669
	.long	2813
	.long	2671
	.long	2679
	.long	3463
	.long	2477
	.long	1795
	.long	617
	.long	2317
	.long	1855
	.long	1057
	.long	1703
	.long	1761
	.long	2515
	.long	801
	.long	1205
	.long	1311
	.long	473
	.long	3963
	.long	697
	.long	1221
	.long	251
	.long	381
	.long	3887
	.long	1761
	.long	3093
	.long	3721
	.long	2079
	.long	4085
	.long	379
	.long	3601
	.long	3845
	.long	433
	.long	1781
	.long	29
	.long	1897
	.long	1599
	.long	2163
	.long	75
	.long	3475
	.long	3957
	.long	1641
	.long	3911
	.long	2959
	.long	2833
	.long	1279
	.long	1099
	.long	403
	.long	799
	.long	2183
	.long	2699
	.long	1711
	.long	2037
	.long	727
	.long	289
	.long	1785
	.long	1575
	.long	3633
	.long	2367
	.long	1261
	.long	3953
	.long	1735
	.long	171
	.long	1959
	.long	2867
	.long	859
	.long	2951
	.long	3211
	.long	15
	.long	1279
	.long	1323
	.long	599
	.long	1651
	.long	3951
	.long	1011
	.long	315
	.long	3513
	.long	3351
	.long	1725
	.long	3793
	.long	2399
	.long	287
	.long	4017
	.long	3571
	.long	1007
	.long	541
	.long	3115
	.long	429
	.long	1585
	.long	1285
	.long	755
	.long	1211
	.long	3047
	.long	915
	.long	3611
	.long	2697
	.long	2129
	.long	3669
	.long	81
	.long	3939
	.long	2437
	.long	915
	.long	779
	.long	3567
	.long	3701
	.long	2479
	.long	3807
	.long	1893
	.long	3927
	.long	2619
	.long	2543
	.long	3633
	.long	2007
	.long	3857
	.long	3837
	.long	487
	.long	1769
	.long	3759
	.long	3105
	.long	2727
	.long	3155
	.long	2479
	.long	1341
	.long	1657
	.long	2767
	.long	2541
	.long	577
	.long	2105
	.long	799
	.long	17
	.long	2871
	.long	3637
	.long	953
	.long	65
	.long	69
	.long	2897
	.long	3841
	.long	3559
	.long	4067
	.long	2335
	.long	3409
	.long	1087
	.long	425
	.long	2813
	.long	1705
	.long	1701
	.long	1237
	.long	821
	.long	1375
	.long	3673
	.long	2693
	.long	3925
	.long	1541
	.long	1871
	.long	2285
	.long	847
	.long	4035
	.long	1101
	.long	2029
	.long	855
	.long	2733
	.long	2503
	.long	121
	.long	2855
	.long	1069
	.long	3463
	.long	3505
	.long	1539
	.long	607
	.long	1349
	.long	575
	.long	2301
	.long	2321
	.long	1101
	.long	333
	.long	291
	.long	2171
	.long	4085
	.long	2173
	.long	2541
	.long	1195
	.long	925
	.long	4039
	.long	1379
	.long	699
	.long	1979
	.long	275
	.long	953
	.long	1755
	.long	1643
	.long	325
	.long	101
	.long	2263
	.long	3329
	.long	3673
	.long	3413
	.long	1977
	.long	2727
	.long	2313
	.long	1419
	.long	887
	.long	609
	.long	2475
	.long	591
	.long	2613
	.long	2081
	.long	3805
	.long	3435
	.long	2409
	.long	111
	.long	3557
	.long	3607
	.long	903
	.long	231
	.long	3059
	.long	473
	.long	2959
	.long	2925
	.long	3861
	.long	2043
	.long	3887
	.long	351
	.long	2865
	.long	369
	.long	1377
	.long	2639
	.long	1261
	.long	3625
	.long	3279
	.long	2201
	.long	2949
	.long	3049
	.long	449
	.long	1297
	.long	897
	.long	1891
	.long	411
	.long	2773
	.long	749
	.long	2753
	.long	1825
	.long	853
	.long	2775
	.long	3547
	.long	3923
	.long	3923
	.long	987
	.long	3723
	.long	2189
	.long	3877
	.long	3577
	.long	297
	.long	2763
	.long	1845
	.long	3083
	.long	2951
	.long	483
	.long	2169
	.long	3985
	.long	245
	.long	3655
	.long	3441
	.long	1023
	.long	235
	.long	835
	.long	3693
	.long	3585
	.long	327
	.long	1003
	.long	543
	.long	3059
	.long	2637
	.long	2923
	.long	87
	.long	3617
	.long	1031
	.long	1043
	.long	903
	.long	2913
	.long	2177
	.long	2641
	.long	3279
	.long	389
	.long	2009
	.long	525
	.long	4085
	.long	3299
	.long	987
	.long	2409
	.long	813
	.long	2683
	.long	373
	.long	2695
	.long	3775
	.long	2375
	.long	1119
	.long	2791
	.long	223
	.long	325
	.long	587
	.long	1379
	.long	2877
	.long	2867
	.long	3793
	.long	655
	.long	831
	.long	3425
	.long	1663
	.long	1681
	.long	2657
	.long	1865
	.long	3943
	.long	2977
	.long	1979
	.long	2271
	.long	3247
	.long	1267
	.long	1747
	.long	811
	.long	159
	.long	429
	.long	2001
	.long	1195
	.long	3065
	.long	553
	.long	1499
	.long	3529
	.long	1081
	.long	2877
	.long	3077
	.long	845
	.long	1793
	.long	2409
	.long	3995
	.long	2559
	.long	4081
	.long	1195
	.long	2955
	.long	1117
	.long	1409
	.long	785
	.long	287
	.long	1521
	.long	1607
	.long	85
	.long	3055
	.long	3123
	.long	2533
	.long	2329
	.long	3477
	.long	799
	.long	3683
	.long	3715
	.long	337
	.long	3139
	.long	3311
	.long	431
	.long	3511
	.long	2299
	.long	365
	.long	2941
	.long	3067
	.long	1331
	.long	1081
	.long	1097
	.long	2853
	.long	2299
	.long	495
	.long	1745
	.long	749
	.long	3819
	.long	619
	.long	1059
	.long	3559
	.long	183
	.long	3743
	.long	723
	.long	949
	.long	3501
	.long	733
	.long	2599
	.long	3983
	.long	3961
	.long	911
	.long	1899
	.long	985
	.long	2493
	.long	1795
	.long	653
	.long	157
	.long	433
	.long	2361
	.long	3093
	.long	3119
	.long	3679
	.long	2367
	.long	1701
	.long	1445
	.long	1321
	.long	2397
	.long	1241
	.long	3305
	.long	3985
	.long	2349
	.long	4067
	.long	3805
	.long	3073
	.long	2837
	.long	1567
	.long	3783
	.long	451
	.long	2441
	.long	1181
	.long	487
	.long	543
	.long	1201
	.long	3735
	.long	2517
	.long	733
	.long	1535
	.long	2175
	.long	3613
	.long	3019
	.space 1920
	.long	2319
	.long	653
	.long	1379
	.long	1675
	.long	1951
	.long	7075
	.long	2087
	.long	7147
	.long	1427
	.long	893
	.long	171
	.long	2019
	.long	7235
	.long	5697
	.long	3615
	.long	1961
	.long	7517
	.long	6849
	.long	2893
	.long	1883
	.long	2863
	.long	2173
	.long	4543
	.long	73
	.long	381
	.long	3893
	.long	6045
	.long	1643
	.long	7669
	.long	1027
	.long	1549
	.long	3983
	.long	1985
	.long	6589
	.long	7497
	.long	2745
	.long	2375
	.long	7047
	.long	1117
	.long	1171
	.long	1975
	.long	5199
	.long	3915
	.long	3695
	.long	8113
	.long	4303
	.long	3773
	.long	7705
	.long	6855
	.long	1675
	.long	2245
	.long	2817
	.long	1719
	.long	569
	.long	1021
	.long	2077
	.long	5945
	.long	1833
	.long	2631
	.long	4851
	.long	6371
	.long	833
	.long	7987
	.long	331
	.long	1899
	.long	8093
	.long	6719
	.long	6903
	.long	5903
	.long	5657
	.long	5007
	.long	2689
	.long	6637
	.long	2675
	.long	1645
	.long	1819
	.long	689
	.long	6709
	.long	7717
	.long	6295
	.long	7013
	.long	7695
	.long	3705
	.long	7069
	.long	2621
	.long	3631
	.long	6571
	.long	6259
	.long	7261
	.long	3397
	.long	7645
	.long	1115
	.long	4753
	.long	2047
	.long	7579
	.long	2271
	.long	5403
	.long	4911
	.long	7629
	.long	4225
	.long	1209
	.long	6955
	.long	6951
	.long	1829
	.long	5579
	.long	5231
	.long	1783
	.long	4285
	.long	7425
	.long	599
	.long	5785
	.long	3275
	.long	5643
	.long	2263
	.long	657
	.long	6769
	.long	6261
	.long	1251
	.long	3249
	.long	4447
	.long	4111
	.long	3991
	.long	1215
	.long	131
	.long	4397
	.long	3487
	.long	7585
	.long	5565
	.long	7199
	.long	3573
	.long	7105
	.long	7409
	.long	1671
	.long	949
	.long	3889
	.long	5971
	.long	3333
	.long	225
	.long	3647
	.long	5403
	.long	3409
	.long	7459
	.long	6879
	.long	5789
	.long	6567
	.long	5581
	.long	4919
	.long	1927
	.long	4407
	.long	8085
	.long	4691
	.long	611
	.long	3005
	.long	591
	.long	753
	.long	589
	.long	171
	.long	5729
	.long	5891
	.long	1033
	.long	3049
	.long	6567
	.long	5257
	.long	8003
	.long	1757
	.long	4489
	.long	4923
	.long	6379
	.long	5171
	.long	1757
	.long	689
	.long	3081
	.long	1389
	.long	4113
	.long	455
	.long	2761
	.long	847
	.long	7575
	.long	5829
	.long	633
	.long	6629
	.long	1103
	.long	7635
	.long	803
	.long	6175
	.long	6587
	.long	2711
	.long	3879
	.long	67
	.long	1179
	.long	4761
	.long	7281
	.long	1557
	.long	3379
	.long	2459
	.long	4273
	.long	4127
	.long	7147
	.long	35
	.long	3549
	.long	395
	.long	3735
	.long	5787
	.long	4179
	.long	5889
	.long	5057
	.long	7473
	.long	4713
	.long	2133
	.long	2897
	.long	1841
	.long	2125
	.long	1029
	.long	1695
	.long	6523
	.long	1143
	.long	5105
	.long	7133
	.long	3351
	.long	2775
	.long	3971
	.long	4503
	.long	7589
	.long	5155
	.long	4305
	.long	1641
	.long	4717
	.long	2427
	.long	5617
	.long	1267
	.long	399
	.long	5831
	.long	4305
	.long	4241
	.long	3395
	.long	3045
	.long	4899
	.long	1713
	.long	171
	.long	411
	.long	7099
	.long	5473
	.long	5209
	.long	1195
	.long	1077
	.long	1309
	.long	2953
	.long	7343
	.long	4887
	.long	3229
	.long	6759
	.long	6721
	.long	6775
	.long	675
	.long	4039
	.long	2493
	.long	7511
	.long	3269
	.long	4199
	.long	6625
	.long	7943
	.long	2013
	.long	4145
	.long	667
	.long	513
	.long	2303
	.long	4591
	.long	7941
	.long	2741
	.long	987
	.long	8061
	.long	3161
	.long	5951
	.long	1431
	.long	831
	.long	5559
	.long	7405
	.long	1357
	.long	4319
	.long	4235
	.long	5421
	.long	2559
	.long	4415
	.long	2439
	.long	823
	.long	1725
	.long	6219
	.long	4903
	.long	6699
	.long	5451
	.long	349
	.long	7703
	.long	2927
	.long	7809
	.long	6179
	.long	1417
	.long	5987
	.long	3017
	.long	4983
	.long	3479
	.long	4525
	.long	4643
	.long	4911
	.long	227
	.long	5475
	.long	2287
	.long	5581
	.long	6817
	.long	1937
	.long	1421
	.long	4415
	.long	7977
	.long	1789
	.long	3907
	.long	6815
	.long	6789
	.long	6003
	.long	5609
	.long	4507
	.long	337
	.long	7427
	.long	7943
	.long	3075
	.long	6427
	.long	1019
	.long	7121
	.long	4763
	.long	81
	.long	3587
	.long	2929
	.long	1795
	.long	8067
	.long	2415
	.long	1265
	.long	4025
	.long	5599
	.long	4771
	.long	3025
	.long	2313
	.long	6129
	.long	7611
	.long	6881
	.long	5253
	.long	4413
	.long	7869
	.long	105
	.long	3173
	.long	1629
	.long	2537
	.long	1023
	.long	4409
	.long	7209
	.long	4413
	.long	7107
	.long	7469
	.long	33
	.long	1955
	.long	2881
	.long	5167
	.long	6451
	.long	4211
	.long	179
	.long	5573
	.long	7879
	.long	3387
	.long	7759
	.long	5455
	.long	7157
	.long	1891
	.long	5683
	.long	5689
	.long	6535
	.long	3109
	.long	6555
	.long	6873
	.long	1249
	.long	4251
	.long	6437
	.long	49
	.long	2745
	.long	1201
	.long	7327
	.long	4179
	.long	6783
	.long	623
	.long	2779
	.long	5963
	.long	2585
	.long	6927
	.long	5333
	.long	4033
	.long	285
	.long	7467
	.long	4443
	.long	4917
	.long	3
	.long	4319
	.long	5517
	.long	3449
	.long	813
	.long	5499
	.long	2515
	.long	5771
	.long	3357
	.long	2073
	.long	4395
	.long	4925
	.long	2643
	.long	7215
	.long	5817
	.long	1199
	.long	1597
	.long	1619
	.long	7535
	.long	4833
	.long	609
	.long	4797
	.long	8171
	.long	6847
	.long	793
	.long	6757
	.long	8165
	.long	3371
	.long	2431
	.long	5235
	.long	4739
	.long	7703
	.long	7223
	.long	6525
	.long	5891
	.long	5605
	.long	4433
	.long	3533
	.long	5267
	.long	5125
	.long	5037
	.long	225
	.long	6717
	.long	1121
	.long	5741
	.long	2013
	.long	4327
	.long	4839
	.long	569
	.long	5227
	.long	7677
	.long	4315
	.long	2391
	.long	5551
	.long	859
	.long	3627
	.long	6377
	.long	3903
	.long	4311
	.long	6527
	.long	7573
	.long	4905
	.long	7731
	.long	1909
	.long	1555
	.long	3279
	.long	1949
	.long	1887
	.long	6675
	.long	5509
	.long	2033
	.long	5473
	.long	3539
	.long	5033
	.long	5935
	.long	6095
	.long	4761
	.long	1771
	.long	1271
	.long	1717
	.long	4415
	.long	5083
	.long	6277
	.long	3147
	.long	7695
	.long	2461
	.long	4783
	.long	4539
	.long	5833
	.long	5583
	.long	651
	.long	1419
	.long	2605
	.long	5511
	.long	3913
	.long	5795
	.long	2333
	.long	2329
	.long	4431
	.long	3725
	.long	6069
	.long	2699
	.long	7055
	.long	6879
	.long	1017
	.long	3121
	.long	2547
	.long	4603
	.long	2385
	.long	6915
	.long	6103
	.long	5669
	.long	7833
	.long	2001
	.long	4287
	.long	6619
	.long	955
	.long	2761
	.long	5711
	.long	6291
	.long	3415
	.long	3909
	.long	2841
	.long	5627
	.long	4939
	.long	7671
	.long	6059
	.long	6275
	.long	6517
	.long	1931
	.long	4583
	.long	7301
	.long	1267
	.long	7509
	.long	1435
	.long	2169
	.long	6939
	.long	3515
	.long	2985
	.long	2787
	.long	2123
	.long	1969
	.long	3307
	.long	353
	.long	4359
	.long	7059
	.long	5273
	.long	5873
	.long	6657
	.long	6765
	.long	6229
	.long	3179
	.long	1583
	.long	6237
	.long	2155
	.long	371
	.long	273
	.long	7491
	.long	3309
	.long	6805
	.long	3015
	.long	6831
	.long	7819
	.long	713
	.long	4747
	.long	3935
	.long	4109
	.long	1311
	.long	709
	.long	3089
	.long	7059
	.long	4247
	.long	2989
	.long	1509
	.long	4919
	.long	1841
	.long	3045
	.long	3821
	.long	6929
	.long	4655
	.long	1333
	.long	6429
	.long	6649
	.long	2131
	.long	5265
	.long	1051
	.long	261
	.long	8057
	.long	3379
	.long	2179
	.long	1993
	.long	5655
	.long	3063
	.long	6381
	.long	3587
	.long	7417
	.long	1579
	.long	1541
	.long	2107
	.long	5085
	.long	2873
	.long	6141
	.long	955
	.long	3537
	.long	2157
	.long	841
	.long	1999
	.long	1465
	.long	5171
	.long	5651
	.long	1535
	.long	7235
	.long	4349
	.long	1263
	.long	1453
	.long	1005
	.long	6893
	.long	2919
	.long	1947
	.long	1635
	.long	3963
	.long	397
	.long	969
	.long	4569
	.long	655
	.long	6737
	.long	2995
	.long	7235
	.long	7713
	.long	973
	.long	4821
	.long	2377
	.long	1673
	.long	1
	.long	6541
	.zerofill __DATA,__bss5,_lsm.3496,137764,5
	.zerofill __DATA,__bss5,_tv.3527,4270684,5
	.literal8
	.align 3
LC0:
	.long	3221225472
	.long	-1076584588
	.align 3
LC1:
	.long	0
	.long	-1074790400
	.align 3
LC2:
	.long	1610612736
	.long	-1076500661
	.align 3
LC3:
	.long	2147483648
	.long	-1080759860
	.align 3
LC4:
	.long	3221225472
	.long	-1090008914
	.align 3
LC5:
	.long	2684354560
	.long	1069117158
	.align 3
LC6:
	.long	0
	.long	1071830441
	.align 3
LC7:
	.long	3221225472
	.long	1071709900
	.align 3
LC8:
	.long	1073741824
	.long	1069187443
	.align 3
LC9:
	.long	3758096384
	.long	1064277699
	.align 3
LC10:
	.long	2696277389
	.long	1051772663
	.align 3
LC11:
	.long	0
	.long	1072693248
	.align 3
LC12:
	.long	0
	.long	1071644672
	.literal16
	.align 4
LC14:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.literal8
	.align 3
LC15:
	.long	0
	.long	1083129856
	.align 3
LC16:
	.long	1859432
	.long	1040187392
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB0-.
	.set L$set$2,LFE0-LFB0
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB0
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$6,LEFDE3-LASFDE3
	.long L$set$6
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB1-.
	.set L$set$7,LFE1-LFB1
	.quad L$set$7
	.byte	0
	.byte	0x4
	.set L$set$8,LCFI3-LFB1
	.long L$set$8
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$12,LEFDE5-LASFDE5
	.long L$set$12
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB2-.
	.set L$set$13,LFE2-LFB2
	.quad L$set$13
	.byte	0
	.byte	0x4
	.set L$set$14,LCFI7-LFB2
	.long L$set$14
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$15,LCFI8-LCFI7
	.long L$set$15
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$16,LCFI9-LCFI8
	.long L$set$16
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$17,LCFI10-LCFI9
	.long L$set$17
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$18,LEFDE7-LASFDE7
	.long L$set$18
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB3-.
	.set L$set$19,LFE3-LFB3
	.quad L$set$19
	.byte	0
	.byte	0x4
	.set L$set$20,LCFI11-LFB3
	.long L$set$20
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$21,LCFI12-LCFI11
	.long L$set$21
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$22,LCFI13-LCFI12
	.long L$set$22
	.byte	0x8c
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$23,LCFI14-LCFI13
	.long L$set$23
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$24,LEFDE9-LASFDE9
	.long L$set$24
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB4-.
	.set L$set$25,LFE4-LFB4
	.quad L$set$25
	.byte	0
	.byte	0x4
	.set L$set$26,LCFI15-LFB4
	.long L$set$26
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$27,LCFI16-LCFI15
	.long L$set$27
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$28,LCFI17-LCFI16
	.long L$set$28
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$29,LEFDE11-LASFDE11
	.long L$set$29
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB5-.
	.set L$set$30,LFE5-LFB5
	.quad L$set$30
	.byte	0
	.byte	0x4
	.set L$set$31,LCFI18-LFB5
	.long L$set$31
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$32,LCFI19-LCFI18
	.long L$set$32
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$33,LCFI20-LCFI19
	.long L$set$33
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$34,LCFI21-LCFI20
	.long L$set$34
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$35,LEFDE13-LASFDE13
	.long L$set$35
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB6-.
	.set L$set$36,LFE6-LFB6
	.quad L$set$36
	.byte	0
	.byte	0x4
	.set L$set$37,LCFI22-LFB6
	.long L$set$37
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$38,LCFI23-LCFI22
	.long L$set$38
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$39,LCFI24-LCFI23
	.long L$set$39
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE13:
LSFDE15:
	.set L$set$40,LEFDE15-LASFDE15
	.long L$set$40
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB7-.
	.set L$set$41,LFE7-LFB7
	.quad L$set$41
	.byte	0
	.byte	0x4
	.set L$set$42,LCFI25-LFB7
	.long L$set$42
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$43,LCFI26-LCFI25
	.long L$set$43
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$44,LCFI27-LCFI26
	.long L$set$44
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x4
	.set L$set$45,LCFI28-LCFI27
	.long L$set$45
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE15:
LSFDE17:
	.set L$set$46,LEFDE17-LASFDE17
	.long L$set$46
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB8-.
	.set L$set$47,LFE8-LFB8
	.quad L$set$47
	.byte	0
	.byte	0x4
	.set L$set$48,LCFI29-LFB8
	.long L$set$48
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$49,LCFI30-LCFI29
	.long L$set$49
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$50,LCFI31-LCFI30
	.long L$set$50
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x4
	.set L$set$51,LCFI32-LCFI31
	.long L$set$51
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE17:
LSFDE19:
	.set L$set$52,LEFDE19-LASFDE19
	.long L$set$52
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB9-.
	.set L$set$53,LFE9-LFB9
	.quad L$set$53
	.byte	0
	.byte	0x4
	.set L$set$54,LCFI33-LFB9
	.long L$set$54
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$55,LCFI34-LCFI33
	.long L$set$55
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$56,LCFI35-LCFI34
	.long L$set$56
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$57,LCFI36-LCFI35
	.long L$set$57
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE19:
LSFDE21:
	.set L$set$58,LEFDE21-LASFDE21
	.long L$set$58
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB10-.
	.set L$set$59,LFE10-LFB10
	.quad L$set$59
	.byte	0
	.byte	0x4
	.set L$set$60,LCFI37-LFB10
	.long L$set$60
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$61,LCFI38-LCFI37
	.long L$set$61
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$62,LCFI39-LCFI38
	.long L$set$62
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$63,LCFI40-LCFI39
	.long L$set$63
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE21:
	.subsections_via_symbols

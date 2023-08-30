
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <entry_from_boot>:
# The entry_from_boot routine sets the stack pointer to the top of the
# OS kernel stack, then jumps to the `kernel` routine.

.globl entry_from_boot
entry_from_boot:
        movq $0x80000, %rsp
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
        movq %rsp, %rbp
   40007:	48 89 e5             	mov    %rsp,%rbp
        pushq $0
   4000a:	6a 00                	push   $0x0
        popfq
   4000c:	9d                   	popf   
        // Check for multiboot command line; if found pass it along.
        cmpl $0x2BADB002, %eax
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
        jne 1f
   40012:	75 0d                	jne    40021 <entry_from_boot+0x21>
        testl $4, (%rbx)
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
        je 1f
   4001a:	74 05                	je     40021 <entry_from_boot+0x21>
        movl 16(%rbx), %edi
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
        jmp 2f
   4001f:	eb 07                	jmp    40028 <entry_from_boot+0x28>
1:      movq $0, %rdi
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
2:      jmp kernel
   40028:	e9 3a 01 00 00       	jmp    40167 <kernel>
   4002d:	90                   	nop

000000000004002e <gpf_int_handler>:
# Interrupt handlers
.align 2

        .globl gpf_int_handler
gpf_int_handler:
        pushq $13               // trap number
   4002e:	6a 0d                	push   $0xd
        jmp generic_exception_handler
   40030:	eb 6e                	jmp    400a0 <generic_exception_handler>

0000000000040032 <pagefault_int_handler>:

        .globl pagefault_int_handler
pagefault_int_handler:
        pushq $14
   40032:	6a 0e                	push   $0xe
        jmp generic_exception_handler
   40034:	eb 6a                	jmp    400a0 <generic_exception_handler>

0000000000040036 <timer_int_handler>:

        .globl timer_int_handler
timer_int_handler:
        pushq $0                // error code
   40036:	6a 00                	push   $0x0
        pushq $32
   40038:	6a 20                	push   $0x20
        jmp generic_exception_handler
   4003a:	eb 64                	jmp    400a0 <generic_exception_handler>

000000000004003c <sys48_int_handler>:

sys48_int_handler:
        pushq $0
   4003c:	6a 00                	push   $0x0
        pushq $48
   4003e:	6a 30                	push   $0x30
        jmp generic_exception_handler
   40040:	eb 5e                	jmp    400a0 <generic_exception_handler>

0000000000040042 <sys49_int_handler>:

sys49_int_handler:
        pushq $0
   40042:	6a 00                	push   $0x0
        pushq $49
   40044:	6a 31                	push   $0x31
        jmp generic_exception_handler
   40046:	eb 58                	jmp    400a0 <generic_exception_handler>

0000000000040048 <sys50_int_handler>:

sys50_int_handler:
        pushq $0
   40048:	6a 00                	push   $0x0
        pushq $50
   4004a:	6a 32                	push   $0x32
        jmp generic_exception_handler
   4004c:	eb 52                	jmp    400a0 <generic_exception_handler>

000000000004004e <sys51_int_handler>:

sys51_int_handler:
        pushq $0
   4004e:	6a 00                	push   $0x0
        pushq $51
   40050:	6a 33                	push   $0x33
        jmp generic_exception_handler
   40052:	eb 4c                	jmp    400a0 <generic_exception_handler>

0000000000040054 <sys52_int_handler>:

sys52_int_handler:
        pushq $0
   40054:	6a 00                	push   $0x0
        pushq $52
   40056:	6a 34                	push   $0x34
        jmp generic_exception_handler
   40058:	eb 46                	jmp    400a0 <generic_exception_handler>

000000000004005a <sys53_int_handler>:

sys53_int_handler:
        pushq $0
   4005a:	6a 00                	push   $0x0
        pushq $53
   4005c:	6a 35                	push   $0x35
        jmp generic_exception_handler
   4005e:	eb 40                	jmp    400a0 <generic_exception_handler>

0000000000040060 <sys54_int_handler>:

sys54_int_handler:
        pushq $0
   40060:	6a 00                	push   $0x0
        pushq $54
   40062:	6a 36                	push   $0x36
        jmp generic_exception_handler
   40064:	eb 3a                	jmp    400a0 <generic_exception_handler>

0000000000040066 <sys55_int_handler>:

sys55_int_handler:
        pushq $0
   40066:	6a 00                	push   $0x0
        pushq $55
   40068:	6a 37                	push   $0x37
        jmp generic_exception_handler
   4006a:	eb 34                	jmp    400a0 <generic_exception_handler>

000000000004006c <sys56_int_handler>:

sys56_int_handler:
        pushq $0
   4006c:	6a 00                	push   $0x0
        pushq $56
   4006e:	6a 38                	push   $0x38
        jmp generic_exception_handler
   40070:	eb 2e                	jmp    400a0 <generic_exception_handler>

0000000000040072 <sys57_int_handler>:

sys57_int_handler:
        pushq $0
   40072:	6a 00                	push   $0x0
        pushq $57
   40074:	6a 39                	push   $0x39
        jmp generic_exception_handler
   40076:	eb 28                	jmp    400a0 <generic_exception_handler>

0000000000040078 <sys58_int_handler>:

sys58_int_handler:
        pushq $0
   40078:	6a 00                	push   $0x0
        pushq $58
   4007a:	6a 3a                	push   $0x3a
        jmp generic_exception_handler
   4007c:	eb 22                	jmp    400a0 <generic_exception_handler>

000000000004007e <sys59_int_handler>:

sys59_int_handler:
        pushq $0
   4007e:	6a 00                	push   $0x0
        pushq $59
   40080:	6a 3b                	push   $0x3b
        jmp generic_exception_handler
   40082:	eb 1c                	jmp    400a0 <generic_exception_handler>

0000000000040084 <sys60_int_handler>:

sys60_int_handler:
        pushq $0
   40084:	6a 00                	push   $0x0
        pushq $60
   40086:	6a 3c                	push   $0x3c
        jmp generic_exception_handler
   40088:	eb 16                	jmp    400a0 <generic_exception_handler>

000000000004008a <sys61_int_handler>:

sys61_int_handler:
        pushq $0
   4008a:	6a 00                	push   $0x0
        pushq $61
   4008c:	6a 3d                	push   $0x3d
        jmp generic_exception_handler
   4008e:	eb 10                	jmp    400a0 <generic_exception_handler>

0000000000040090 <sys62_int_handler>:

sys62_int_handler:
        pushq $0
   40090:	6a 00                	push   $0x0
        pushq $62
   40092:	6a 3e                	push   $0x3e
        jmp generic_exception_handler
   40094:	eb 0a                	jmp    400a0 <generic_exception_handler>

0000000000040096 <sys63_int_handler>:

sys63_int_handler:
        pushq $0
   40096:	6a 00                	push   $0x0
        pushq $63
   40098:	6a 3f                	push   $0x3f
        jmp generic_exception_handler
   4009a:	eb 04                	jmp    400a0 <generic_exception_handler>

000000000004009c <default_int_handler>:

        .globl default_int_handler
default_int_handler:
        pushq $0
   4009c:	6a 00                	push   $0x0
        jmp generic_exception_handler
   4009e:	eb 00                	jmp    400a0 <generic_exception_handler>

00000000000400a0 <generic_exception_handler>:


generic_exception_handler:
        pushq %gs
   400a0:	0f a8                	push   %gs
        pushq %fs
   400a2:	0f a0                	push   %fs
        pushq %r15
   400a4:	41 57                	push   %r15
        pushq %r14
   400a6:	41 56                	push   %r14
        pushq %r13
   400a8:	41 55                	push   %r13
        pushq %r12
   400aa:	41 54                	push   %r12
        pushq %r11
   400ac:	41 53                	push   %r11
        pushq %r10
   400ae:	41 52                	push   %r10
        pushq %r9
   400b0:	41 51                	push   %r9
        pushq %r8
   400b2:	41 50                	push   %r8
        pushq %rdi
   400b4:	57                   	push   %rdi
        pushq %rsi
   400b5:	56                   	push   %rsi
        pushq %rbp
   400b6:	55                   	push   %rbp
        pushq %rbx
   400b7:	53                   	push   %rbx
        pushq %rdx
   400b8:	52                   	push   %rdx
        pushq %rcx
   400b9:	51                   	push   %rcx
        pushq %rax
   400ba:	50                   	push   %rax
        movq %rsp, %rdi
   400bb:	48 89 e7             	mov    %rsp,%rdi
        call exception
   400be:	e8 9b 09 00 00       	call   40a5e <exception>

00000000000400c3 <exception_return>:
        # `exception` should never return.


        .globl exception_return
exception_return:
        movq %rdi, %rsp
   400c3:	48 89 fc             	mov    %rdi,%rsp
        popq %rax
   400c6:	58                   	pop    %rax
        popq %rcx
   400c7:	59                   	pop    %rcx
        popq %rdx
   400c8:	5a                   	pop    %rdx
        popq %rbx
   400c9:	5b                   	pop    %rbx
        popq %rbp
   400ca:	5d                   	pop    %rbp
        popq %rsi
   400cb:	5e                   	pop    %rsi
        popq %rdi
   400cc:	5f                   	pop    %rdi
        popq %r8
   400cd:	41 58                	pop    %r8
        popq %r9
   400cf:	41 59                	pop    %r9
        popq %r10
   400d1:	41 5a                	pop    %r10
        popq %r11
   400d3:	41 5b                	pop    %r11
        popq %r12
   400d5:	41 5c                	pop    %r12
        popq %r13
   400d7:	41 5d                	pop    %r13
        popq %r14
   400d9:	41 5e                	pop    %r14
        popq %r15
   400db:	41 5f                	pop    %r15
        popq %fs
   400dd:	0f a1                	pop    %fs
        popq %gs
   400df:	0f a9                	pop    %gs
        addq $16, %rsp
   400e1:	48 83 c4 10          	add    $0x10,%rsp
        iretq
   400e5:	48 cf                	iretq  

00000000000400e7 <sys_int_handlers>:
   400e7:	3c 00                	cmp    $0x0,%al
   400e9:	04 00                	add    $0x0,%al
   400eb:	00 00                	add    %al,(%rax)
   400ed:	00 00                	add    %al,(%rax)
   400ef:	42 00 04 00          	add    %al,(%rax,%r8,1)
   400f3:	00 00                	add    %al,(%rax)
   400f5:	00 00                	add    %al,(%rax)
   400f7:	48 00 04 00          	rex.W add %al,(%rax,%rax,1)
   400fb:	00 00                	add    %al,(%rax)
   400fd:	00 00                	add    %al,(%rax)
   400ff:	4e 00 04 00          	rex.WRX add %r8b,(%rax,%r8,1)
   40103:	00 00                	add    %al,(%rax)
   40105:	00 00                	add    %al,(%rax)
   40107:	54                   	push   %rsp
   40108:	00 04 00             	add    %al,(%rax,%rax,1)
   4010b:	00 00                	add    %al,(%rax)
   4010d:	00 00                	add    %al,(%rax)
   4010f:	5a                   	pop    %rdx
   40110:	00 04 00             	add    %al,(%rax,%rax,1)
   40113:	00 00                	add    %al,(%rax)
   40115:	00 00                	add    %al,(%rax)
   40117:	60                   	(bad)  
   40118:	00 04 00             	add    %al,(%rax,%rax,1)
   4011b:	00 00                	add    %al,(%rax)
   4011d:	00 00                	add    %al,(%rax)
   4011f:	66 00 04 00          	data16 add %al,(%rax,%rax,1)
   40123:	00 00                	add    %al,(%rax)
   40125:	00 00                	add    %al,(%rax)
   40127:	6c                   	insb   (%dx),%es:(%rdi)
   40128:	00 04 00             	add    %al,(%rax,%rax,1)
   4012b:	00 00                	add    %al,(%rax)
   4012d:	00 00                	add    %al,(%rax)
   4012f:	72 00                	jb     40131 <sys_int_handlers+0x4a>
   40131:	04 00                	add    $0x0,%al
   40133:	00 00                	add    %al,(%rax)
   40135:	00 00                	add    %al,(%rax)
   40137:	78 00                	js     40139 <sys_int_handlers+0x52>
   40139:	04 00                	add    $0x0,%al
   4013b:	00 00                	add    %al,(%rax)
   4013d:	00 00                	add    %al,(%rax)
   4013f:	7e 00                	jle    40141 <sys_int_handlers+0x5a>
   40141:	04 00                	add    $0x0,%al
   40143:	00 00                	add    %al,(%rax)
   40145:	00 00                	add    %al,(%rax)
   40147:	84 00                	test   %al,(%rax)
   40149:	04 00                	add    $0x0,%al
   4014b:	00 00                	add    %al,(%rax)
   4014d:	00 00                	add    %al,(%rax)
   4014f:	8a 00                	mov    (%rax),%al
   40151:	04 00                	add    $0x0,%al
   40153:	00 00                	add    %al,(%rax)
   40155:	00 00                	add    %al,(%rax)
   40157:	90                   	nop
   40158:	00 04 00             	add    %al,(%rax,%rax,1)
   4015b:	00 00                	add    %al,(%rax)
   4015d:	00 00                	add    %al,(%rax)
   4015f:	96                   	xchg   %eax,%esi
   40160:	00 04 00             	add    %al,(%rax,%rax,1)
   40163:	00 00                	add    %al,(%rax)
	...

0000000000040167 <kernel>:
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void kernel(const char* command) {
   40167:	55                   	push   %rbp
   40168:	48 89 e5             	mov    %rsp,%rbp
   4016b:	48 83 ec 20          	sub    $0x20,%rsp
   4016f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   40173:	e8 a0 1a 00 00       	call   41c18 <hardware_init>
    pageinfo_init();
   40178:	e8 ff 10 00 00       	call   4127c <pageinfo_init>
    console_clear();
   4017d:	e8 0a 45 00 00       	call   4468c <console_clear>
    timer_init(HZ);
   40182:	bf 64 00 00 00       	mov    $0x64,%edi
   40187:	e8 78 1f 00 00       	call   42104 <timer_init>


    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   4018c:	ba 00 0e 00 00       	mov    $0xe00,%edx
   40191:	be 00 00 00 00       	mov    $0x0,%esi
   40196:	bf 20 30 05 00       	mov    $0x53020,%edi
   4019b:	e8 d2 35 00 00       	call   43772 <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   401a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   401a7:	eb 44                	jmp    401ed <kernel+0x86>
        processes[i].p_pid = i;
   401a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401ac:	48 63 d0             	movslq %eax,%rdx
   401af:	48 89 d0             	mov    %rdx,%rax
   401b2:	48 c1 e0 03          	shl    $0x3,%rax
   401b6:	48 29 d0             	sub    %rdx,%rax
   401b9:	48 c1 e0 05          	shl    $0x5,%rax
   401bd:	48 8d 90 20 30 05 00 	lea    0x53020(%rax),%rdx
   401c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401c7:	89 02                	mov    %eax,(%rdx)
        processes[i].p_state = P_FREE;
   401c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401cc:	48 63 d0             	movslq %eax,%rdx
   401cf:	48 89 d0             	mov    %rdx,%rax
   401d2:	48 c1 e0 03          	shl    $0x3,%rax
   401d6:	48 29 d0             	sub    %rdx,%rax
   401d9:	48 c1 e0 05          	shl    $0x5,%rax
   401dd:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   401e3:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    for (pid_t i = 0; i < NPROC; i++) {
   401e9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   401ed:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   401f1:	7e b6                	jle    401a9 <kernel+0x42>
    }

    // Ensure user applications can't read from or write to kernel memory
    virtual_memory_map(kernel_pagetable, 0,  0, PROC_START_ADDR, PTE_P | PTE_W);
   401f3:	48 8b 05 06 6e 01 00 	mov    0x16e06(%rip),%rax        # 57000 <kernel_pagetable>
   401fa:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40200:	b9 00 00 10 00       	mov    $0x100000,%ecx
   40205:	ba 00 00 00 00       	mov    $0x0,%edx
   4020a:	be 00 00 00 00       	mov    $0x0,%esi
   4020f:	48 89 c7             	mov    %rax,%rdi
   40212:	e8 4b 2c 00 00       	call   42e62 <virtual_memory_map>
    // Map CGA console as user-accessible
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40217:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   4021c:	be 00 80 0b 00       	mov    $0xb8000,%esi
   40221:	48 8b 05 d8 6d 01 00 	mov    0x16dd8(%rip),%rax        # 57000 <kernel_pagetable>
   40228:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4022e:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40233:	48 89 c7             	mov    %rax,%rdi
   40236:	e8 27 2c 00 00       	call   42e62 <virtual_memory_map>

    if (command && strcmp(command, "fork") == 0) {
   4023b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40240:	74 29                	je     4026b <kernel+0x104>
   40242:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40246:	be e0 46 04 00       	mov    $0x446e0,%esi
   4024b:	48 89 c7             	mov    %rax,%rdi
   4024e:	e8 18 36 00 00       	call   4386b <strcmp>
   40253:	85 c0                	test   %eax,%eax
   40255:	75 14                	jne    4026b <kernel+0x104>
        process_setup(1, 4);
   40257:	be 04 00 00 00       	mov    $0x4,%esi
   4025c:	bf 01 00 00 00       	mov    $0x1,%edi
   40261:	e8 d1 00 00 00       	call   40337 <process_setup>
   40266:	e9 c2 00 00 00       	jmp    4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   4026b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40270:	74 29                	je     4029b <kernel+0x134>
   40272:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40276:	be e5 46 04 00       	mov    $0x446e5,%esi
   4027b:	48 89 c7             	mov    %rax,%rdi
   4027e:	e8 e8 35 00 00       	call   4386b <strcmp>
   40283:	85 c0                	test   %eax,%eax
   40285:	75 14                	jne    4029b <kernel+0x134>
        process_setup(1, 5);
   40287:	be 05 00 00 00       	mov    $0x5,%esi
   4028c:	bf 01 00 00 00       	mov    $0x1,%edi
   40291:	e8 a1 00 00 00       	call   40337 <process_setup>
   40296:	e9 92 00 00 00       	jmp    4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   4029b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402a0:	74 26                	je     402c8 <kernel+0x161>
   402a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402a6:	be ee 46 04 00       	mov    $0x446ee,%esi
   402ab:	48 89 c7             	mov    %rax,%rdi
   402ae:	e8 b8 35 00 00       	call   4386b <strcmp>
   402b3:	85 c0                	test   %eax,%eax
   402b5:	75 11                	jne    402c8 <kernel+0x161>
        process_setup(1, 6);
   402b7:	be 06 00 00 00       	mov    $0x6,%esi
   402bc:	bf 01 00 00 00       	mov    $0x1,%edi
   402c1:	e8 71 00 00 00       	call   40337 <process_setup>
   402c6:	eb 65                	jmp    4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   402c8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402cd:	74 39                	je     40308 <kernel+0x1a1>
   402cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402d3:	be f3 46 04 00       	mov    $0x446f3,%esi
   402d8:	48 89 c7             	mov    %rax,%rdi
   402db:	e8 8b 35 00 00       	call   4386b <strcmp>
   402e0:	85 c0                	test   %eax,%eax
   402e2:	75 24                	jne    40308 <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   402e4:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   402eb:	eb 13                	jmp    40300 <kernel+0x199>
            process_setup(i, 6);
   402ed:	8b 45 f8             	mov    -0x8(%rbp),%eax
   402f0:	be 06 00 00 00       	mov    $0x6,%esi
   402f5:	89 c7                	mov    %eax,%edi
   402f7:	e8 3b 00 00 00       	call   40337 <process_setup>
        for (pid_t i = 1; i <= 2; ++i) {
   402fc:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   40300:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   40304:	7e e7                	jle    402ed <kernel+0x186>
   40306:	eb 25                	jmp    4032d <kernel+0x1c6>
        }
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   40308:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   4030f:	eb 16                	jmp    40327 <kernel+0x1c0>
            process_setup(i, i - 1);
   40311:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40314:	8d 50 ff             	lea    -0x1(%rax),%edx
   40317:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4031a:	89 d6                	mov    %edx,%esi
   4031c:	89 c7                	mov    %eax,%edi
   4031e:	e8 14 00 00 00       	call   40337 <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   40323:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40327:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   4032b:	7e e4                	jle    40311 <kernel+0x1aa>
        }
    }

    // Switch to the first process using run()
    run(&processes[1]);
   4032d:	bf 00 31 05 00       	mov    $0x53100,%edi
   40332:	e8 e8 0e 00 00       	call   4121f <run>

0000000000040337 <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   40337:	55                   	push   %rbp
   40338:	48 89 e5             	mov    %rsp,%rbp
   4033b:	48 83 ec 70          	sub    $0x70,%rsp
   4033f:	89 7d 9c             	mov    %edi,-0x64(%rbp)
   40342:	89 75 98             	mov    %esi,-0x68(%rbp)

    process_init(&processes[pid], 0);
   40345:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40348:	48 63 d0             	movslq %eax,%rdx
   4034b:	48 89 d0             	mov    %rdx,%rax
   4034e:	48 c1 e0 03          	shl    $0x3,%rax
   40352:	48 29 d0             	sub    %rdx,%rax
   40355:	48 c1 e0 05          	shl    $0x5,%rax
   40359:	48 05 20 30 05 00    	add    $0x53020,%rax
   4035f:	be 00 00 00 00       	mov    $0x0,%esi
   40364:	48 89 c7             	mov    %rax,%rdi
   40367:	e8 29 20 00 00       	call   42395 <process_init>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   4036c:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4036f:	48 63 d0             	movslq %eax,%rdx
   40372:	48 89 d0             	mov    %rdx,%rax
   40375:	48 c1 e0 03          	shl    $0x3,%rax
   40379:	48 29 d0             	sub    %rdx,%rax
   4037c:	48 c1 e0 05          	shl    $0x5,%rax
   40380:	48 05 d8 30 05 00    	add    $0x530d8,%rax
   40386:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    // ASSIGN new page table to each process (5 physical pages) -- check vm.c (virtual_memory_init)
    x86_64_pagetable* process_pagetable[5];
    for(size_t i = 0; i < 5; i ++)
   4038d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40394:	00 
   40395:	eb 3f                	jmp    403d6 <process_setup+0x9f>
    {
        process_pagetable[i] = (x86_64_pagetable*) PAGEADDRESS(assign_next_free_physical_page(pid));
   40397:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4039a:	0f be c0             	movsbl %al,%eax
   4039d:	89 c7                	mov    %eax,%edi
   4039f:	e8 5c 02 00 00       	call   40600 <assign_next_free_physical_page>
   403a4:	48 98                	cltq   
   403a6:	48 c1 e0 0c          	shl    $0xc,%rax
   403aa:	48 89 c2             	mov    %rax,%rdx
   403ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   403b1:	48 89 54 c5 b8       	mov    %rdx,-0x48(%rbp,%rax,8)
        memset(process_pagetable[i], 0, PAGESIZE);
   403b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   403ba:	48 8b 44 c5 b8       	mov    -0x48(%rbp,%rax,8),%rax
   403bf:	ba 00 10 00 00       	mov    $0x1000,%edx
   403c4:	be 00 00 00 00       	mov    $0x0,%esi
   403c9:	48 89 c7             	mov    %rax,%rdi
   403cc:	e8 a1 33 00 00       	call   43772 <memset>
    for(size_t i = 0; i < 5; i ++)
   403d1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   403d6:	48 83 7d f8 04       	cmpq   $0x4,-0x8(%rbp)
   403db:	76 ba                	jbe    40397 <process_setup+0x60>
    }
    // Resetting physical pages is done in assign_next_free_physical_page()
    // Connect the physical pages into a physical pages
    process_pagetable[0]->entry[0] = (x86_64_pageentry_t) process_pagetable[1] | PTE_P | PTE_W | PTE_U;
   403dd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   403e1:	48 89 c2             	mov    %rax,%rdx
   403e4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   403e8:	48 83 ca 07          	or     $0x7,%rdx
   403ec:	48 89 10             	mov    %rdx,(%rax)
    process_pagetable[1]->entry[0] = (x86_64_pageentry_t) process_pagetable[2] | PTE_P | PTE_W | PTE_U;
   403ef:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   403f3:	48 89 c2             	mov    %rax,%rdx
   403f6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   403fa:	48 83 ca 07          	or     $0x7,%rdx
   403fe:	48 89 10             	mov    %rdx,(%rax)
    process_pagetable[2]->entry[0] = (x86_64_pageentry_t) process_pagetable[3] | PTE_P | PTE_W | PTE_U;
   40401:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40405:	48 89 c2             	mov    %rax,%rdx
   40408:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4040c:	48 83 ca 07          	or     $0x7,%rdx
   40410:	48 89 10             	mov    %rdx,(%rax)
    process_pagetable[2]->entry[1] = (x86_64_pageentry_t) process_pagetable[4] | PTE_P | PTE_W | PTE_U;
   40413:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40417:	48 89 c2             	mov    %rax,%rdx
   4041a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4041e:	48 83 ca 07          	or     $0x7,%rdx
   40422:	48 89 50 08          	mov    %rdx,0x8(%rax)
    // Copy mappings from kernel page table to the process' page table
    for (uintptr_t i = 0; i < PROC_START_ADDR; i+=PAGESIZE)
   40426:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
   4042d:	00 
   4042e:	eb 4a                	jmp    4047a <process_setup+0x143>
    {
        vamapping map = virtual_memory_lookup(kernel_pagetable, i);
   40430:	48 8b 0d c9 6b 01 00 	mov    0x16bc9(%rip),%rcx        # 57000 <kernel_pagetable>
   40437:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   4043b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4043f:	48 89 ce             	mov    %rcx,%rsi
   40442:	48 89 c7             	mov    %rax,%rdi
   40445:	e8 d3 2d 00 00       	call   4321d <virtual_memory_lookup>
        // Copy mapping to process' pagetable
        if ((int)map.pa != -1)
   4044a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4044e:	83 f8 ff             	cmp    $0xffffffff,%eax
   40451:	74 1f                	je     40472 <process_setup+0x13b>
        {
            virtual_memory_map(process_pagetable[0], i, map.pa, PAGESIZE, map.perm);
   40453:	8b 4d b0             	mov    -0x50(%rbp),%ecx
   40456:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   4045a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4045e:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40462:	41 89 c8             	mov    %ecx,%r8d
   40465:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4046a:	48 89 c7             	mov    %rax,%rdi
   4046d:	e8 f0 29 00 00       	call   42e62 <virtual_memory_map>
    for (uintptr_t i = 0; i < PROC_START_ADDR; i+=PAGESIZE)
   40472:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   40479:	00 
   4047a:	48 81 7d f0 ff ff 0f 	cmpq   $0xfffff,-0x10(%rbp)
   40481:	00 
   40482:	76 ac                	jbe    40430 <process_setup+0xf9>
        }
    }
    // Assign pagetable to process
    processes[pid].p_pagetable = process_pagetable[0];
   40484:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40488:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4048b:	48 63 d0             	movslq %eax,%rdx
   4048e:	48 89 d0             	mov    %rdx,%rax
   40491:	48 c1 e0 03          	shl    $0x3,%rax
   40495:	48 29 d0             	sub    %rdx,%rax
   40498:	48 c1 e0 05          	shl    $0x5,%rax
   4049c:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   404a2:	48 89 08             	mov    %rcx,(%rax)
    
    // Assign next free page
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   404a5:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404a8:	48 63 d0             	movslq %eax,%rdx
   404ab:	48 89 d0             	mov    %rdx,%rax
   404ae:	48 c1 e0 03          	shl    $0x3,%rax
   404b2:	48 29 d0             	sub    %rdx,%rax
   404b5:	48 c1 e0 05          	shl    $0x5,%rax
   404b9:	48 05 d8 30 05 00    	add    $0x530d8,%rax
   404bf:	48 8b 00             	mov    (%rax),%rax
   404c2:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   404c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    int ret = assign_next_free_physical_page(pid);
   404cc:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404cf:	0f be c0             	movsbl %al,%eax
   404d2:	89 c7                	mov    %eax,%edi
   404d4:	e8 27 01 00 00       	call   40600 <assign_next_free_physical_page>
   404d9:	89 45 e4             	mov    %eax,-0x1c(%rbp)

    virtual_memory_map(processes[pid].p_pagetable, stack_page, PAGEADDRESS(ret),PAGESIZE, PTE_P | PTE_W | PTE_U);
   404dc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   404df:	48 98                	cltq   
   404e1:	48 c1 e0 0c          	shl    $0xc,%rax
   404e5:	48 89 c7             	mov    %rax,%rdi
   404e8:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404eb:	48 63 d0             	movslq %eax,%rdx
   404ee:	48 89 d0             	mov    %rdx,%rax
   404f1:	48 c1 e0 03          	shl    $0x3,%rax
   404f5:	48 29 d0             	sub    %rdx,%rax
   404f8:	48 c1 e0 05          	shl    $0x5,%rax
   404fc:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   40502:	48 8b 00             	mov    (%rax),%rax
   40505:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   40509:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4050f:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40514:	48 89 fa             	mov    %rdi,%rdx
   40517:	48 89 c7             	mov    %rax,%rdi
   4051a:	e8 43 29 00 00       	call   42e62 <virtual_memory_map>
    
    int r = program_load(&processes[pid], program_number, NULL);
   4051f:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40522:	48 63 d0             	movslq %eax,%rdx
   40525:	48 89 d0             	mov    %rdx,%rax
   40528:	48 c1 e0 03          	shl    $0x3,%rax
   4052c:	48 29 d0             	sub    %rdx,%rax
   4052f:	48 c1 e0 05          	shl    $0x5,%rax
   40533:	48 8d 88 20 30 05 00 	lea    0x53020(%rax),%rcx
   4053a:	8b 45 98             	mov    -0x68(%rbp),%eax
   4053d:	ba 00 00 00 00       	mov    $0x0,%edx
   40542:	89 c6                	mov    %eax,%esi
   40544:	48 89 cf             	mov    %rcx,%rdi
   40547:	e8 c8 2d 00 00       	call   43314 <program_load>
   4054c:	89 45 e0             	mov    %eax,-0x20(%rbp)
    assert(r >= 0);
   4054f:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
   40553:	79 14                	jns    40569 <process_setup+0x232>
   40555:	ba f9 46 04 00       	mov    $0x446f9,%edx
   4055a:	be b3 00 00 00       	mov    $0xb3,%esi
   4055f:	bf 00 47 04 00       	mov    $0x44700,%edi
   40564:	e8 fa 25 00 00       	call   42b63 <assert_fail>

    processes[pid].p_state = P_RUNNABLE;
   40569:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4056c:	48 63 d0             	movslq %eax,%rdx
   4056f:	48 89 d0             	mov    %rdx,%rax
   40572:	48 c1 e0 03          	shl    $0x3,%rax
   40576:	48 29 d0             	sub    %rdx,%rax
   40579:	48 c1 e0 05          	shl    $0x5,%rax
   4057d:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   40583:	c7 00 01 00 00 00    	movl   $0x1,(%rax)

}
   40589:	90                   	nop
   4058a:	c9                   	leave  
   4058b:	c3                   	ret    

000000000004058c <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   4058c:	55                   	push   %rbp
   4058d:	48 89 e5             	mov    %rsp,%rbp
   40590:	48 83 ec 10          	sub    $0x10,%rsp
   40594:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40598:	89 f0                	mov    %esi,%eax
   4059a:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   4059d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   405a1:	25 ff 0f 00 00       	and    $0xfff,%eax
   405a6:	48 85 c0             	test   %rax,%rax
   405a9:	75 20                	jne    405cb <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   405ab:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   405b2:	00 
   405b3:	77 16                	ja     405cb <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   405b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   405b9:	48 c1 e8 0c          	shr    $0xc,%rax
   405bd:	48 98                	cltq   
   405bf:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   405c6:	00 
   405c7:	84 c0                	test   %al,%al
   405c9:	74 07                	je     405d2 <assign_physical_page+0x46>
        return -1;
   405cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   405d0:	eb 2c                	jmp    405fe <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   405d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   405d6:	48 c1 e8 0c          	shr    $0xc,%rax
   405da:	48 98                	cltq   
   405dc:	c6 84 00 41 4e 05 00 	movb   $0x1,0x54e41(%rax,%rax,1)
   405e3:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   405e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   405e8:	48 c1 e8 0c          	shr    $0xc,%rax
   405ec:	48 98                	cltq   
   405ee:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   405f2:	88 94 00 40 4e 05 00 	mov    %dl,0x54e40(%rax,%rax,1)
        return 0;
   405f9:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   405fe:	c9                   	leave  
   405ff:	c3                   	ret    

0000000000040600 <assign_next_free_physical_page>:

// Allocates the next free physical page to the given owner
// Returns the page number on success; else -1
int assign_next_free_physical_page(int8_t owner){
   40600:	55                   	push   %rbp
   40601:	48 89 e5             	mov    %rsp,%rbp
   40604:	48 83 ec 18          	sub    $0x18,%rsp
   40608:	89 f8                	mov    %edi,%eax
   4060a:	88 45 ec             	mov    %al,-0x14(%rbp)
    for (size_t i = 0; i < (PAGENUMBER(MEMSIZE_PHYSICAL)); i += 1)
   4060d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40614:	00 
   40615:	eb 39                	jmp    40650 <assign_next_free_physical_page+0x50>
    {
        physical_pageinfo current_page = pageinfo[i];
   40617:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4061b:	0f b7 84 00 40 4e 05 	movzwl 0x54e40(%rax,%rax,1),%eax
   40622:	00 
   40623:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // Find a free page
        if (current_page.refcount == 0)
   40627:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4062b:	84 c0                	test   %al,%al
   4062d:	75 1c                	jne    4064b <assign_next_free_physical_page+0x4b>
        {
            // Assign page to the given owner
            assign_physical_page(PAGEADDRESS(i), owner);
   4062f:	0f be 45 ec          	movsbl -0x14(%rbp),%eax
   40633:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40637:	48 c1 e2 0c          	shl    $0xc,%rdx
   4063b:	89 c6                	mov    %eax,%esi
   4063d:	48 89 d7             	mov    %rdx,%rdi
   40640:	e8 47 ff ff ff       	call   4058c <assign_physical_page>
            return i;
   40645:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40649:	eb 14                	jmp    4065f <assign_next_free_physical_page+0x5f>
    for (size_t i = 0; i < (PAGENUMBER(MEMSIZE_PHYSICAL)); i += 1)
   4064b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   40650:	48 81 7d f8 ff 01 00 	cmpq   $0x1ff,-0x8(%rbp)
   40657:	00 
   40658:	76 bd                	jbe    40617 <assign_next_free_physical_page+0x17>
        }
    }
    return -1;
   4065a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4065f:	c9                   	leave  
   40660:	c3                   	ret    

0000000000040661 <syscall_mapping>:

void syscall_mapping(proc* p){
   40661:	55                   	push   %rbp
   40662:	48 89 e5             	mov    %rsp,%rbp
   40665:	48 83 ec 70          	sub    $0x70,%rsp
   40669:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   4066d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40671:	48 8b 40 38          	mov    0x38(%rax),%rax
   40675:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40679:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4067d:	48 8b 40 30          	mov    0x30(%rax),%rax
   40681:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40685:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40689:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40690:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40694:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40698:	48 89 ce             	mov    %rcx,%rsi
   4069b:	48 89 c7             	mov    %rax,%rdi
   4069e:	e8 7a 2b 00 00       	call   4321d <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   406a3:	8b 45 e0             	mov    -0x20(%rbp),%eax
   406a6:	48 98                	cltq   
   406a8:	83 e0 06             	and    $0x6,%eax
   406ab:	48 83 f8 06          	cmp    $0x6,%rax
   406af:	75 73                	jne    40724 <syscall_mapping+0xc3>
        return;
    uintptr_t endaddr = mapping_ptr + sizeof(vamapping) - 1;
   406b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   406b5:	48 83 c0 17          	add    $0x17,%rax
   406b9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   406bd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   406c1:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   406c8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   406cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   406d0:	48 89 ce             	mov    %rcx,%rsi
   406d3:	48 89 c7             	mov    %rax,%rdi
   406d6:	e8 42 2b 00 00       	call   4321d <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   406db:	8b 45 c8             	mov    -0x38(%rbp),%eax
   406de:	48 98                	cltq   
   406e0:	83 e0 03             	and    $0x3,%eax
   406e3:	48 83 f8 03          	cmp    $0x3,%rax
   406e7:	75 3e                	jne    40727 <syscall_mapping+0xc6>
        return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   406e9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   406ed:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   406f4:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   406f8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   406fc:	48 89 ce             	mov    %rcx,%rsi
   406ff:	48 89 c7             	mov    %rax,%rdi
   40702:	e8 16 2b 00 00       	call   4321d <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40707:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4070b:	48 89 c1             	mov    %rax,%rcx
   4070e:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40712:	ba 18 00 00 00       	mov    $0x18,%edx
   40717:	48 89 c6             	mov    %rax,%rsi
   4071a:	48 89 cf             	mov    %rcx,%rdi
   4071d:	e8 52 2f 00 00       	call   43674 <memcpy>
   40722:	eb 04                	jmp    40728 <syscall_mapping+0xc7>
        return;
   40724:	90                   	nop
   40725:	eb 01                	jmp    40728 <syscall_mapping+0xc7>
        return;
   40727:	90                   	nop
}
   40728:	c9                   	leave  
   40729:	c3                   	ret    

000000000004072a <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   4072a:	55                   	push   %rbp
   4072b:	48 89 e5             	mov    %rsp,%rbp
   4072e:	48 83 ec 18          	sub    $0x18,%rsp
   40732:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40736:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4073a:	48 8b 40 38          	mov    0x38(%rax),%rax
   4073e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40741:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40745:	75 14                	jne    4075b <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40747:	0f b6 05 b2 58 00 00 	movzbl 0x58b2(%rip),%eax        # 46000 <disp_global>
   4074e:	84 c0                	test   %al,%al
   40750:	0f 94 c0             	sete   %al
   40753:	88 05 a7 58 00 00    	mov    %al,0x58a7(%rip)        # 46000 <disp_global>
   40759:	eb 36                	jmp    40791 <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   4075b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   4075f:	78 2f                	js     40790 <syscall_mem_tog+0x66>
   40761:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40765:	7f 29                	jg     40790 <syscall_mem_tog+0x66>
   40767:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4076b:	8b 00                	mov    (%rax),%eax
   4076d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40770:	75 1e                	jne    40790 <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40772:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40776:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   4077d:	84 c0                	test   %al,%al
   4077f:	0f 94 c0             	sete   %al
   40782:	89 c2                	mov    %eax,%edx
   40784:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40788:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   4078e:	eb 01                	jmp    40791 <syscall_mem_tog+0x67>
            return;
   40790:	90                   	nop
    }
}
   40791:	c9                   	leave  
   40792:	c3                   	ret    

0000000000040793 <next_free_process>:

// Return pid of next free process in processes[]
pid_t next_free_process(){
   40793:	55                   	push   %rbp
   40794:	48 89 e5             	mov    %rsp,%rbp
   40797:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    // Don't use processes[0]
    for (size_t i = 1; i < NPROC; i++)
   4079e:	48 c7 45 f8 01 00 00 	movq   $0x1,-0x8(%rbp)
   407a5:	00 
   407a6:	eb 45                	jmp    407ed <next_free_process+0x5a>
    {
        // Return pid of processes[i] if free
        proc curr_process = processes[i];
   407a8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   407ac:	48 89 d0             	mov    %rdx,%rax
   407af:	48 c1 e0 03          	shl    $0x3,%rax
   407b3:	48 29 d0             	sub    %rdx,%rax
   407b6:	48 c1 e0 05          	shl    $0x5,%rax
   407ba:	48 8d 90 20 30 05 00 	lea    0x53020(%rax),%rdx
   407c1:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
   407c8:	48 89 d6             	mov    %rdx,%rsi
   407cb:	ba 1c 00 00 00       	mov    $0x1c,%edx
   407d0:	48 89 c7             	mov    %rax,%rdi
   407d3:	48 89 d1             	mov    %rdx,%rcx
   407d6:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
        if (curr_process.p_state == P_FREE)
   407d9:	8b 45 e0             	mov    -0x20(%rbp),%eax
   407dc:	85 c0                	test   %eax,%eax
   407de:	75 08                	jne    407e8 <next_free_process+0x55>
        {
            return curr_process.p_pid;
   407e0:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
   407e6:	eb 11                	jmp    407f9 <next_free_process+0x66>
    for (size_t i = 1; i < NPROC; i++)
   407e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   407ed:	48 83 7d f8 0f       	cmpq   $0xf,-0x8(%rbp)
   407f2:	76 b4                	jbe    407a8 <next_free_process+0x15>
        } 
    }
    // No free process found
    return -1;
   407f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   407f9:	c9                   	leave  
   407fa:	c3                   	ret    

00000000000407fb <find_next_free_physical_page>:

// Allocates the next free physical page to the given owner
// Returns the page number on success; else -1
int find_next_free_physical_page(){
   407fb:	55                   	push   %rbp
   407fc:	48 89 e5             	mov    %rsp,%rbp
   407ff:	48 83 ec 10          	sub    $0x10,%rsp
    for (size_t i = 0; i < (PAGENUMBER(MEMSIZE_PHYSICAL)); i += 1)
   40803:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4080a:	00 
   4080b:	eb 23                	jmp    40830 <find_next_free_physical_page+0x35>
    {
        physical_pageinfo current_page = pageinfo[i];
   4080d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40811:	0f b7 84 00 40 4e 05 	movzwl 0x54e40(%rax,%rax,1),%eax
   40818:	00 
   40819:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // Find a free page
        if (current_page.refcount == 0)
   4081d:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   40821:	84 c0                	test   %al,%al
   40823:	75 06                	jne    4082b <find_next_free_physical_page+0x30>
        {
            return i;
   40825:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40829:	eb 14                	jmp    4083f <find_next_free_physical_page+0x44>
    for (size_t i = 0; i < (PAGENUMBER(MEMSIZE_PHYSICAL)); i += 1)
   4082b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   40830:	48 81 7d f8 ff 01 00 	cmpq   $0x1ff,-0x8(%rbp)
   40837:	00 
   40838:	76 d3                	jbe    4080d <find_next_free_physical_page+0x12>
        }
    }
    
    return -1;
   4083a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4083f:	c9                   	leave  
   40840:	c3                   	ret    

0000000000040841 <insert_read_only_page>:

// Insert a read-only page into the read_only_pages array
void insert_read_only_page(pid_t owner, int page_number){
   40841:	55                   	push   %rbp
   40842:	48 89 e5             	mov    %rsp,%rbp
   40845:	48 83 ec 08          	sub    $0x8,%rsp
   40849:	89 7d fc             	mov    %edi,-0x4(%rbp)
   4084c:	89 75 f8             	mov    %esi,-0x8(%rbp)
    read_only_pages[read_only_pages_index].owner = owner;
   4084f:	48 8b 05 b2 27 01 00 	mov    0x127b2(%rip),%rax        # 53008 <read_only_pages_index>
   40856:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40859:	89 14 c5 40 3e 05 00 	mov    %edx,0x53e40(,%rax,8)
    read_only_pages[read_only_pages_index].page_number = page_number;
   40860:	48 8b 05 a1 27 01 00 	mov    0x127a1(%rip),%rax        # 53008 <read_only_pages_index>
   40867:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4086a:	89 14 c5 44 3e 05 00 	mov    %edx,0x53e44(,%rax,8)
    read_only_pages_index += 1;
   40871:	48 8b 05 90 27 01 00 	mov    0x12790(%rip),%rax        # 53008 <read_only_pages_index>
   40878:	48 83 c0 01          	add    $0x1,%rax
   4087c:	48 89 05 85 27 01 00 	mov    %rax,0x12785(%rip)        # 53008 <read_only_pages_index>
}
   40883:	90                   	nop
   40884:	c9                   	leave  
   40885:	c3                   	ret    

0000000000040886 <free_pages>:

// Assist in freeing all pages that belong to a process
void free_pages(pid_t pid){
   40886:	55                   	push   %rbp
   40887:	48 89 e5             	mov    %rsp,%rbp
   4088a:	48 83 ec 60          	sub    $0x60,%rsp
   4088e:	89 7d ac             	mov    %edi,-0x54(%rbp)
        //                 pageinfo[read_only_pages[j].page_number].owner = PO_FREE;
        //             }
        //         }
        //     }
        // } 
        for (uintptr_t i = PROC_START_ADDR; i < MEMSIZE_VIRTUAL; i+=PAGESIZE)
   40891:	48 c7 45 f8 00 00 10 	movq   $0x100000,-0x8(%rbp)
   40898:	00 
   40899:	eb 7a                	jmp    40915 <free_pages+0x8f>
        {
            vamapping map = virtual_memory_lookup(processes[pid].p_pagetable, i);
   4089b:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4089e:	48 63 d0             	movslq %eax,%rdx
   408a1:	48 89 d0             	mov    %rdx,%rax
   408a4:	48 c1 e0 03          	shl    $0x3,%rax
   408a8:	48 29 d0             	sub    %rdx,%rax
   408ab:	48 c1 e0 05          	shl    $0x5,%rax
   408af:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   408b5:	48 8b 08             	mov    (%rax),%rcx
   408b8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   408bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   408c0:	48 89 ce             	mov    %rcx,%rsi
   408c3:	48 89 c7             	mov    %rax,%rdi
   408c6:	e8 52 29 00 00       	call   4321d <virtual_memory_lookup>
            if (map.pn != -1)
   408cb:	8b 45 b8             	mov    -0x48(%rbp),%eax
   408ce:	83 f8 ff             	cmp    $0xffffffff,%eax
   408d1:	74 3a                	je     4090d <free_pages+0x87>
            {
                pageinfo[map.pn].refcount -= 1;
   408d3:	8b 45 b8             	mov    -0x48(%rbp),%eax
   408d6:	48 98                	cltq   
   408d8:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   408df:	00 
   408e0:	8d 50 ff             	lea    -0x1(%rax),%edx
   408e3:	8b 45 b8             	mov    -0x48(%rbp),%eax
   408e6:	48 98                	cltq   
   408e8:	88 94 00 41 4e 05 00 	mov    %dl,0x54e41(%rax,%rax,1)
                if (pageinfo[map.pn].refcount == 0)
   408ef:	8b 45 b8             	mov    -0x48(%rbp),%eax
   408f2:	48 98                	cltq   
   408f4:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   408fb:	00 
   408fc:	84 c0                	test   %al,%al
   408fe:	75 0d                	jne    4090d <free_pages+0x87>
                {
                    pageinfo[map.pn].owner = PO_FREE;
   40900:	8b 45 b8             	mov    -0x48(%rbp),%eax
   40903:	48 98                	cltq   
   40905:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   4090c:	00 
        for (uintptr_t i = PROC_START_ADDR; i < MEMSIZE_VIRTUAL; i+=PAGESIZE)
   4090d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40914:	00 
   40915:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   4091c:	00 
   4091d:	0f 86 78 ff ff ff    	jbe    4089b <free_pages+0x15>
                }
            }
        }
    //}
    // Free page tables
    x86_64_pagetable * L4 = (x86_64_pagetable *)PTE_ADDR(processes[pid].p_pagetable);
   40923:	8b 45 ac             	mov    -0x54(%rbp),%eax
   40926:	48 63 d0             	movslq %eax,%rdx
   40929:	48 89 d0             	mov    %rdx,%rax
   4092c:	48 c1 e0 03          	shl    $0x3,%rax
   40930:	48 29 d0             	sub    %rdx,%rax
   40933:	48 c1 e0 05          	shl    $0x5,%rax
   40937:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   4093d:	48 8b 00             	mov    (%rax),%rax
   40940:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40946:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    x86_64_pagetable * L3 = (x86_64_pagetable *)PTE_ADDR(processes[pid].p_pagetable->entry[0]);
   4094a:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4094d:	48 63 d0             	movslq %eax,%rdx
   40950:	48 89 d0             	mov    %rdx,%rax
   40953:	48 c1 e0 03          	shl    $0x3,%rax
   40957:	48 29 d0             	sub    %rdx,%rax
   4095a:	48 c1 e0 05          	shl    $0x5,%rax
   4095e:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   40964:	48 8b 00             	mov    (%rax),%rax
   40967:	48 8b 00             	mov    (%rax),%rax
   4096a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40970:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    x86_64_pagetable * L2 = (x86_64_pagetable *)PTE_ADDR(L3->entry[0]);
   40974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40978:	48 8b 00             	mov    (%rax),%rax
   4097b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40981:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    x86_64_pagetable * L1 = (x86_64_pagetable *)PTE_ADDR(L2->entry[0]);
   40985:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40989:	48 8b 00             	mov    (%rax),%rax
   4098c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40992:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    x86_64_pagetable * L0 = (x86_64_pagetable *)PTE_ADDR(L1->entry[0]);
   40996:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4099a:	48 8b 00             	mov    (%rax),%rax
   4099d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   409a3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    pageinfo[PAGENUMBER(L3)].owner = PO_FREE;
   409a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409ab:	48 c1 e8 0c          	shr    $0xc,%rax
   409af:	48 98                	cltq   
   409b1:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   409b8:	00 
    pageinfo[PAGENUMBER(L3)].refcount = 0;
   409b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409bd:	48 c1 e8 0c          	shr    $0xc,%rax
   409c1:	48 98                	cltq   
   409c3:	c6 84 00 41 4e 05 00 	movb   $0x0,0x54e41(%rax,%rax,1)
   409ca:	00 
    pageinfo[PAGENUMBER(L2)].owner = PO_FREE;
   409cb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   409cf:	48 c1 e8 0c          	shr    $0xc,%rax
   409d3:	48 98                	cltq   
   409d5:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   409dc:	00 
    pageinfo[PAGENUMBER(L2)].refcount = 0;
   409dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   409e1:	48 c1 e8 0c          	shr    $0xc,%rax
   409e5:	48 98                	cltq   
   409e7:	c6 84 00 41 4e 05 00 	movb   $0x0,0x54e41(%rax,%rax,1)
   409ee:	00 
    pageinfo[PAGENUMBER(L1)].owner = PO_FREE;
   409ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409f3:	48 c1 e8 0c          	shr    $0xc,%rax
   409f7:	48 98                	cltq   
   409f9:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   40a00:	00 
    pageinfo[PAGENUMBER(L1)].refcount = 0;
   40a01:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40a05:	48 c1 e8 0c          	shr    $0xc,%rax
   40a09:	48 98                	cltq   
   40a0b:	c6 84 00 41 4e 05 00 	movb   $0x0,0x54e41(%rax,%rax,1)
   40a12:	00 
    pageinfo[PAGENUMBER(L0)].owner = PO_FREE;
   40a13:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40a17:	48 c1 e8 0c          	shr    $0xc,%rax
   40a1b:	48 98                	cltq   
   40a1d:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   40a24:	00 
    pageinfo[PAGENUMBER(L0)].refcount = 0;
   40a25:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40a29:	48 c1 e8 0c          	shr    $0xc,%rax
   40a2d:	48 98                	cltq   
   40a2f:	c6 84 00 41 4e 05 00 	movb   $0x0,0x54e41(%rax,%rax,1)
   40a36:	00 
    pageinfo[PAGENUMBER(L4)].owner = PO_FREE;
   40a37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   40a3b:	48 c1 e8 0c          	shr    $0xc,%rax
   40a3f:	48 98                	cltq   
   40a41:	c6 84 00 40 4e 05 00 	movb   $0x0,0x54e40(%rax,%rax,1)
   40a48:	00 
    pageinfo[PAGENUMBER(L4)].refcount = 0;
   40a49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   40a4d:	48 c1 e8 0c          	shr    $0xc,%rax
   40a51:	48 98                	cltq   
   40a53:	c6 84 00 41 4e 05 00 	movb   $0x0,0x54e41(%rax,%rax,1)
   40a5a:	00 

    

}
   40a5b:	90                   	nop
   40a5c:	c9                   	leave  
   40a5d:	c3                   	ret    

0000000000040a5e <exception>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers* reg) {
   40a5e:	55                   	push   %rbp
   40a5f:	48 89 e5             	mov    %rsp,%rbp
   40a62:	48 81 ec 50 01 00 00 	sub    $0x150,%rsp
   40a69:	48 89 bd b8 fe ff ff 	mov    %rdi,-0x148(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40a70:	48 8b 05 89 25 01 00 	mov    0x12589(%rip),%rax        # 53000 <current>
   40a77:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   40a7e:	48 83 c0 08          	add    $0x8,%rax
   40a82:	48 89 d6             	mov    %rdx,%rsi
   40a85:	ba 18 00 00 00       	mov    $0x18,%edx
   40a8a:	48 89 c7             	mov    %rax,%rdi
   40a8d:	48 89 d1             	mov    %rdx,%rcx
   40a90:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40a93:	48 8b 05 66 65 01 00 	mov    0x16566(%rip),%rax        # 57000 <kernel_pagetable>
   40a9a:	48 89 c7             	mov    %rax,%rdi
   40a9d:	e8 8f 22 00 00       	call   42d31 <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40aa2:	8b 05 54 85 07 00    	mov    0x78554(%rip),%eax        # b8ffc <cursorpos>
   40aa8:	89 c7                	mov    %eax,%edi
   40aaa:	e8 b0 19 00 00       	call   4245f <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40aaf:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40ab6:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40abd:	48 83 f8 0e          	cmp    $0xe,%rax
   40ac1:	74 14                	je     40ad7 <exception+0x79>
   40ac3:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40aca:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40ad1:	48 83 f8 0d          	cmp    $0xd,%rax
   40ad5:	75 16                	jne    40aed <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40ad7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40ade:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40ae5:	83 e0 04             	and    $0x4,%eax
   40ae8:	48 85 c0             	test   %rax,%rax
   40aeb:	74 1a                	je     40b07 <exception+0xa9>
    {
        check_virtual_memory();
   40aed:	e8 21 0b 00 00       	call   41613 <check_virtual_memory>
        if(disp_global){
   40af2:	0f b6 05 07 55 00 00 	movzbl 0x5507(%rip),%eax        # 46000 <disp_global>
   40af9:	84 c0                	test   %al,%al
   40afb:	74 0a                	je     40b07 <exception+0xa9>
            memshow_physical();
   40afd:	e8 89 0c 00 00       	call   4178b <memshow_physical>
            memshow_virtual_animate();
   40b02:	e8 b3 0f 00 00       	call   41aba <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40b07:	e8 36 1e 00 00       	call   42942 <check_keyboard>


    // Actually handle the exception.
    switch (reg->reg_intno) {
   40b0c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40b13:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b1a:	48 83 e8 0e          	sub    $0xe,%rax
   40b1e:	48 83 f8 2a          	cmp    $0x2a,%rax
   40b22:	0f 87 48 06 00 00    	ja     41170 <exception+0x712>
   40b28:	48 8b 04 c5 a0 47 04 	mov    0x447a0(,%rax,8),%rax
   40b2f:	00 
   40b30:	ff e0                	jmp    *%rax

    case INT_SYS_PANIC:
	    // rdi stores pointer for msg string
	    {
		char msg[160];
		uintptr_t addr = current->p_registers.reg_rdi;
   40b32:	48 8b 05 c7 24 01 00 	mov    0x124c7(%rip),%rax        # 53000 <current>
   40b39:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b3d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
		if((void *)addr == NULL)
   40b41:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
   40b46:	75 0f                	jne    40b57 <exception+0xf9>
		    panic(NULL);
   40b48:	bf 00 00 00 00       	mov    $0x0,%edi
   40b4d:	b8 00 00 00 00       	mov    $0x0,%eax
   40b52:	e8 2c 1f 00 00       	call   42a83 <panic>
		vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40b57:	48 8b 05 a2 24 01 00 	mov    0x124a2(%rip),%rax        # 53000 <current>
   40b5e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b65:	48 8d 45 90          	lea    -0x70(%rbp),%rax
   40b69:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40b6d:	48 89 ce             	mov    %rcx,%rsi
   40b70:	48 89 c7             	mov    %rax,%rdi
   40b73:	e8 a5 26 00 00       	call   4321d <virtual_memory_lookup>
		memcpy(msg, (void *)map.pa, 160);
   40b78:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40b7c:	48 89 c1             	mov    %rax,%rcx
   40b7f:	48 8d 85 c0 fe ff ff 	lea    -0x140(%rbp),%rax
   40b86:	ba a0 00 00 00       	mov    $0xa0,%edx
   40b8b:	48 89 ce             	mov    %rcx,%rsi
   40b8e:	48 89 c7             	mov    %rax,%rdi
   40b91:	e8 de 2a 00 00       	call   43674 <memcpy>
		panic(msg);
   40b96:	48 8d 85 c0 fe ff ff 	lea    -0x140(%rbp),%rax
   40b9d:	48 89 c7             	mov    %rax,%rdi
   40ba0:	b8 00 00 00 00       	mov    $0x0,%eax
   40ba5:	e8 d9 1e 00 00       	call   42a83 <panic>
	    }
	    panic(NULL);
	    break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40baa:	48 8b 05 4f 24 01 00 	mov    0x1244f(%rip),%rax        # 53000 <current>
   40bb1:	8b 10                	mov    (%rax),%edx
   40bb3:	48 8b 05 46 24 01 00 	mov    0x12446(%rip),%rax        # 53000 <current>
   40bba:	48 63 d2             	movslq %edx,%rdx
   40bbd:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40bc1:	e9 ba 05 00 00       	jmp    41180 <exception+0x722>

    case INT_SYS_YIELD:
        schedule();
   40bc6:	e8 de 05 00 00       	call   411a9 <schedule>
        break;                  /* will not be reached */
   40bcb:	e9 b0 05 00 00       	jmp    41180 <exception+0x722>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   40bd0:	48 8b 05 29 24 01 00 	mov    0x12429(%rip),%rax        # 53000 <current>
   40bd7:	48 8b 40 38          	mov    0x38(%rax),%rax
   40bdb:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        int r = -1;
   40bdf:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
        if ((addr >= PROC_START_ADDR) && (addr <= MEMSIZE_PHYSICAL) && (addr % PAGESIZE == 0))
   40be6:	48 81 7d d0 ff ff 0f 	cmpq   $0xfffff,-0x30(%rbp)
   40bed:	00 
   40bee:	76 2e                	jbe    40c1e <exception+0x1c0>
   40bf0:	48 81 7d d0 00 00 20 	cmpq   $0x200000,-0x30(%rbp)
   40bf7:	00 
   40bf8:	77 24                	ja     40c1e <exception+0x1c0>
   40bfa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40bfe:	25 ff 0f 00 00       	and    $0xfff,%eax
   40c03:	48 85 c0             	test   %rax,%rax
   40c06:	75 16                	jne    40c1e <exception+0x1c0>
        {
            r = assign_next_free_physical_page(current->p_pid);
   40c08:	48 8b 05 f1 23 01 00 	mov    0x123f1(%rip),%rax        # 53000 <current>
   40c0f:	8b 00                	mov    (%rax),%eax
   40c11:	0f be c0             	movsbl %al,%eax
   40c14:	89 c7                	mov    %eax,%edi
   40c16:	e8 e5 f9 ff ff       	call   40600 <assign_next_free_physical_page>
   40c1b:	89 45 fc             	mov    %eax,-0x4(%rbp)
        }
        if (r != -1) {
   40c1e:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%rbp)
   40c22:	74 38                	je     40c5c <exception+0x1fe>
            
            virtual_memory_map(current->p_pagetable, addr, PAGEADDRESS(r),
   40c24:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c27:	48 98                	cltq   
   40c29:	48 c1 e0 0c          	shl    $0xc,%rax
   40c2d:	48 89 c2             	mov    %rax,%rdx
   40c30:	48 8b 05 c9 23 01 00 	mov    0x123c9(%rip),%rax        # 53000 <current>
   40c37:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40c3e:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
   40c42:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40c48:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40c4d:	48 89 c7             	mov    %rax,%rdi
   40c50:	e8 0d 22 00 00       	call   42e62 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
            r = 0;
   40c55:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
        }
        current->p_registers.reg_rax = r;
   40c5c:	48 8b 05 9d 23 01 00 	mov    0x1239d(%rip),%rax        # 53000 <current>
   40c63:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40c66:	48 63 d2             	movslq %edx,%rdx
   40c69:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40c6d:	e9 0e 05 00 00       	jmp    41180 <exception+0x722>
    }

    case INT_SYS_MAPPING:
    {
	    syscall_mapping(current);
   40c72:	48 8b 05 87 23 01 00 	mov    0x12387(%rip),%rax        # 53000 <current>
   40c79:	48 89 c7             	mov    %rax,%rdi
   40c7c:	e8 e0 f9 ff ff       	call   40661 <syscall_mapping>
            break;
   40c81:	e9 fa 04 00 00       	jmp    41180 <exception+0x722>
    }

    case INT_SYS_MEM_TOG:
	{
	    syscall_mem_tog(current);
   40c86:	48 8b 05 73 23 01 00 	mov    0x12373(%rip),%rax        # 53000 <current>
   40c8d:	48 89 c7             	mov    %rax,%rdi
   40c90:	e8 95 fa ff ff       	call   4072a <syscall_mem_tog>
	    break;
   40c95:	e9 e6 04 00 00       	jmp    41180 <exception+0x722>
	}

    case INT_TIMER:
        ++ticks;
   40c9a:	8b 05 80 31 01 00    	mov    0x13180(%rip),%eax        # 53e20 <ticks>
   40ca0:	83 c0 01             	add    $0x1,%eax
   40ca3:	89 05 77 31 01 00    	mov    %eax,0x13177(%rip)        # 53e20 <ticks>
        schedule();
   40ca9:	e8 fb 04 00 00       	call   411a9 <schedule>
        break;                  /* will not be reached */
   40cae:	e9 cd 04 00 00       	jmp    41180 <exception+0x722>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40cb3:	0f 20 d0             	mov    %cr2,%rax
   40cb6:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    return val;
   40cba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40cbe:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   40cc2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40cc9:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40cd0:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   40cd3:	48 85 c0             	test   %rax,%rax
   40cd6:	74 07                	je     40cdf <exception+0x281>
   40cd8:	b8 10 47 04 00       	mov    $0x44710,%eax
   40cdd:	eb 05                	jmp    40ce4 <exception+0x286>
   40cdf:	b8 16 47 04 00       	mov    $0x44716,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   40ce4:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   40ce8:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40cef:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40cf6:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   40cf9:	48 85 c0             	test   %rax,%rax
   40cfc:	74 07                	je     40d05 <exception+0x2a7>
   40cfe:	b8 1b 47 04 00       	mov    $0x4471b,%eax
   40d03:	eb 05                	jmp    40d0a <exception+0x2ac>
   40d05:	b8 2e 47 04 00       	mov    $0x4472e,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   40d0a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   40d0e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40d15:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d1c:	83 e0 04             	and    $0x4,%eax
   40d1f:	48 85 c0             	test   %rax,%rax
   40d22:	75 2f                	jne    40d53 <exception+0x2f5>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40d24:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40d2b:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40d32:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
   40d36:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   40d3a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40d3e:	49 89 f0             	mov    %rsi,%r8
   40d41:	48 89 c6             	mov    %rax,%rsi
   40d44:	bf 40 47 04 00       	mov    $0x44740,%edi
   40d49:	b8 00 00 00 00       	mov    $0x0,%eax
   40d4e:	e8 30 1d 00 00       	call   42a83 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40d53:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   40d5a:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40d61:	48 8b 05 98 22 01 00 	mov    0x12298(%rip),%rax        # 53000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40d68:	8b 00                	mov    (%rax),%eax
   40d6a:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
   40d6e:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   40d72:	52                   	push   %rdx
   40d73:	ff 75 b0             	push   -0x50(%rbp)
   40d76:	49 89 f1             	mov    %rsi,%r9
   40d79:	49 89 c8             	mov    %rcx,%r8
   40d7c:	89 c1                	mov    %eax,%ecx
   40d7e:	ba 70 47 04 00       	mov    $0x44770,%edx
   40d83:	be 00 0c 00 00       	mov    $0xc00,%esi
   40d88:	bf 80 07 00 00       	mov    $0x780,%edi
   40d8d:	b8 00 00 00 00       	mov    $0x0,%eax
   40d92:	e8 92 37 00 00       	call   44529 <console_printf>
   40d97:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40d9b:	48 8b 05 5e 22 01 00 	mov    0x1225e(%rip),%rax        # 53000 <current>
   40da2:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40da9:	00 00 00 
        break;
   40dac:	e9 cf 03 00 00       	jmp    41180 <exception+0x722>
    {
        pid_t pid;
        int ret;
        
        // Look for a free process in processes[]
        pid = next_free_process();
   40db1:	b8 00 00 00 00       	mov    $0x0,%eax
   40db6:	e8 d8 f9 ff ff       	call   40793 <next_free_process>
   40dbb:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (pid != -1)
   40dbe:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40dc2:	0f 84 74 03 00 00    	je     4113c <exception+0x6de>
        {
            // Make a copy of the current process' pagetable
            // Set up a new page table
            // ASSIGN new page table to each process (5 physical pages) -- check vm.c (virtual_memory_init)
            x86_64_pagetable* process_pagetable[5];
            for(size_t i = 0; i < 5; i ++)
   40dc8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
   40dcf:	00 
   40dd0:	eb 45                	jmp    40e17 <exception+0x3b9>
            {
                process_pagetable[i] = (x86_64_pagetable*) PAGEADDRESS(assign_next_free_physical_page(pid));
   40dd2:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40dd5:	0f be c0             	movsbl %al,%eax
   40dd8:	89 c7                	mov    %eax,%edi
   40dda:	e8 21 f8 ff ff       	call   40600 <assign_next_free_physical_page>
   40ddf:	48 98                	cltq   
   40de1:	48 c1 e0 0c          	shl    $0xc,%rax
   40de5:	48 89 c2             	mov    %rax,%rdx
   40de8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   40dec:	48 89 94 c5 c0 fe ff 	mov    %rdx,-0x140(%rbp,%rax,8)
   40df3:	ff 
                memset(process_pagetable[i], 0, PAGESIZE);
   40df4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   40df8:	48 8b 84 c5 c0 fe ff 	mov    -0x140(%rbp,%rax,8),%rax
   40dff:	ff 
   40e00:	ba 00 10 00 00       	mov    $0x1000,%edx
   40e05:	be 00 00 00 00       	mov    $0x0,%esi
   40e0a:	48 89 c7             	mov    %rax,%rdi
   40e0d:	e8 60 29 00 00       	call   43772 <memset>
            for(size_t i = 0; i < 5; i ++)
   40e12:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   40e17:	48 83 7d f0 04       	cmpq   $0x4,-0x10(%rbp)
   40e1c:	76 b4                	jbe    40dd2 <exception+0x374>
            }
            // Resetting physical pages is done in assign_next_free_physical_page()
            // Connect the physical pages into a physical pages
            process_pagetable[0]->entry[0] = (x86_64_pageentry_t) process_pagetable[1] | PTE_P | PTE_W | PTE_U;
   40e1e:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   40e25:	48 89 c2             	mov    %rax,%rdx
   40e28:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   40e2f:	48 83 ca 07          	or     $0x7,%rdx
   40e33:	48 89 10             	mov    %rdx,(%rax)
            process_pagetable[1]->entry[0] = (x86_64_pageentry_t) process_pagetable[2] | PTE_P | PTE_W | PTE_U;
   40e36:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
   40e3d:	48 89 c2             	mov    %rax,%rdx
   40e40:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   40e47:	48 83 ca 07          	or     $0x7,%rdx
   40e4b:	48 89 10             	mov    %rdx,(%rax)
            process_pagetable[2]->entry[0] = (x86_64_pageentry_t) process_pagetable[3] | PTE_P | PTE_W | PTE_U;
   40e4e:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40e55:	48 89 c2             	mov    %rax,%rdx
   40e58:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
   40e5f:	48 83 ca 07          	or     $0x7,%rdx
   40e63:	48 89 10             	mov    %rdx,(%rax)
            process_pagetable[2]->entry[1] = (x86_64_pageentry_t) process_pagetable[4] | PTE_P | PTE_W | PTE_U;
   40e66:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
   40e6d:	48 89 c2             	mov    %rax,%rdx
   40e70:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
   40e77:	48 83 ca 07          	or     $0x7,%rdx
   40e7b:	48 89 50 08          	mov    %rdx,0x8(%rax)
            // Copy mappings from kernel page table to the process' page table
            for (uintptr_t i = 0; i < PROC_START_ADDR; i+=PAGESIZE)
   40e7f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   40e86:	00 
   40e87:	eb 50                	jmp    40ed9 <exception+0x47b>
            {
                vamapping map = virtual_memory_lookup(kernel_pagetable, i);
   40e89:	48 8b 0d 70 61 01 00 	mov    0x16170(%rip),%rcx        # 57000 <kernel_pagetable>
   40e90:	48 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%rax
   40e97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40e9b:	48 89 ce             	mov    %rcx,%rsi
   40e9e:	48 89 c7             	mov    %rax,%rdi
   40ea1:	e8 77 23 00 00       	call   4321d <virtual_memory_lookup>
                // Copy mapping to process' pagetable
                if ((int)map.pa != -1)
   40ea6:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   40eaa:	83 f8 ff             	cmp    $0xffffffff,%eax
   40ead:	74 22                	je     40ed1 <exception+0x473>
                {
                    virtual_memory_map(process_pagetable[0], i, map.pa, PAGESIZE, map.perm);
   40eaf:	8b 4d 88             	mov    -0x78(%rbp),%ecx
   40eb2:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
   40eb6:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   40ebd:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   40ec1:	41 89 c8             	mov    %ecx,%r8d
   40ec4:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40ec9:	48 89 c7             	mov    %rax,%rdi
   40ecc:	e8 91 1f 00 00       	call   42e62 <virtual_memory_map>
            for (uintptr_t i = 0; i < PROC_START_ADDR; i+=PAGESIZE)
   40ed1:	48 81 45 e8 00 10 00 	addq   $0x1000,-0x18(%rbp)
   40ed8:	00 
   40ed9:	48 81 7d e8 ff ff 0f 	cmpq   $0xfffff,-0x18(%rbp)
   40ee0:	00 
   40ee1:	76 a6                	jbe    40e89 <exception+0x42b>
                }
            }
            processes[pid].p_pagetable = process_pagetable[0];
   40ee3:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   40eea:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40eed:	48 63 d0             	movslq %eax,%rdx
   40ef0:	48 89 d0             	mov    %rdx,%rax
   40ef3:	48 c1 e0 03          	shl    $0x3,%rax
   40ef7:	48 29 d0             	sub    %rdx,%rax
   40efa:	48 c1 e0 05          	shl    $0x5,%rax
   40efe:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   40f04:	48 89 08             	mov    %rcx,(%rax)

            // Examine every virtual address on the old pagetable
            for (uintptr_t i = PROC_START_ADDR; i < MEMSIZE_VIRTUAL; i += PAGESIZE)
   40f07:	48 c7 45 e0 00 00 10 	movq   $0x100000,-0x20(%rbp)
   40f0e:	00 
   40f0f:	e9 68 01 00 00       	jmp    4107c <exception+0x61e>
            {
                vamapping mapping = virtual_memory_lookup(current->p_pagetable, i);
   40f14:	48 8b 05 e5 20 01 00 	mov    0x120e5(%rip),%rax        # 53000 <current>
   40f1b:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40f22:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
   40f29:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   40f2d:	48 89 ce             	mov    %rcx,%rsi
   40f30:	48 89 c7             	mov    %rax,%rdi
   40f33:	e8 e5 22 00 00       	call   4321d <virtual_memory_lookup>
                // Mapping found
                if((mapping.pn != -1))
   40f38:	8b 85 60 ff ff ff    	mov    -0xa0(%rbp),%eax
   40f3e:	83 f8 ff             	cmp    $0xffffffff,%eax
   40f41:	0f 84 2d 01 00 00    	je     41074 <exception+0x616>
                {
                    if (mapping.perm & PTE_W)
   40f47:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
   40f4d:	48 98                	cltq   
   40f4f:	83 e0 02             	and    $0x2,%eax
   40f52:	48 85 c0             	test   %rax,%rax
   40f55:	0f 84 a4 00 00 00    	je     40fff <exception+0x5a1>
                    {
                        // Allocate new physical table
                        ret = assign_next_free_physical_page(pid);
   40f5b:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40f5e:	0f be c0             	movsbl %al,%eax
   40f61:	89 c7                	mov    %eax,%edi
   40f63:	e8 98 f6 ff ff       	call   40600 <assign_next_free_physical_page>
   40f68:	89 45 d8             	mov    %eax,-0x28(%rbp)
                        if (ret != -1)
   40f6b:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%rbp)
   40f6f:	74 6b                	je     40fdc <exception+0x57e>
                        {
                            // Copy data to new physical table
                            memcpy((void*)PAGEADDRESS(ret), (void*)mapping.pa, PAGESIZE);
   40f71:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   40f78:	48 89 c1             	mov    %rax,%rcx
   40f7b:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40f7e:	48 98                	cltq   
   40f80:	48 c1 e0 0c          	shl    $0xc,%rax
   40f84:	ba 00 10 00 00       	mov    $0x1000,%edx
   40f89:	48 89 ce             	mov    %rcx,%rsi
   40f8c:	48 89 c7             	mov    %rax,%rdi
   40f8f:	e8 e0 26 00 00       	call   43674 <memcpy>
                            // Map physical page to virtual address
                            virtual_memory_map(processes[pid].p_pagetable, i, PAGEADDRESS(ret), PAGESIZE, PTE_P | PTE_W | PTE_U);
   40f94:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40f97:	48 98                	cltq   
   40f99:	48 c1 e0 0c          	shl    $0xc,%rax
   40f9d:	48 89 c7             	mov    %rax,%rdi
   40fa0:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40fa3:	48 63 d0             	movslq %eax,%rdx
   40fa6:	48 89 d0             	mov    %rdx,%rax
   40fa9:	48 c1 e0 03          	shl    $0x3,%rax
   40fad:	48 29 d0             	sub    %rdx,%rax
   40fb0:	48 c1 e0 05          	shl    $0x5,%rax
   40fb4:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   40fba:	48 8b 00             	mov    (%rax),%rax
   40fbd:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
   40fc1:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40fc7:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40fcc:	48 89 fa             	mov    %rdi,%rdx
   40fcf:	48 89 c7             	mov    %rax,%rdi
   40fd2:	e8 8b 1e 00 00       	call   42e62 <virtual_memory_map>
   40fd7:	e9 98 00 00 00       	jmp    41074 <exception+0x616>
                        }
                        else
                        {
                            processes[pid].p_registers.reg_rax = -1;
   40fdc:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40fdf:	48 63 d0             	movslq %eax,%rdx
   40fe2:	48 89 d0             	mov    %rdx,%rax
   40fe5:	48 c1 e0 03          	shl    $0x3,%rax
   40fe9:	48 29 d0             	sub    %rdx,%rax
   40fec:	48 c1 e0 05          	shl    $0x5,%rax
   40ff0:	48 05 28 30 05 00    	add    $0x53028,%rax
   40ff6:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
   40ffd:	eb 75                	jmp    41074 <exception+0x616>
                        }
                    }
                    // Read only
                    else
                    {
                        pageinfo[mapping.pn].refcount += 1;
   40fff:	8b 85 60 ff ff ff    	mov    -0xa0(%rbp),%eax
   41005:	48 98                	cltq   
   41007:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   4100e:	00 
   4100f:	8d 50 01             	lea    0x1(%rax),%edx
   41012:	8b 85 60 ff ff ff    	mov    -0xa0(%rbp),%eax
   41018:	48 98                	cltq   
   4101a:	88 94 00 41 4e 05 00 	mov    %dl,0x54e41(%rax,%rax,1)
                        // Map physical page to virtual address
                        virtual_memory_map(processes[pid].p_pagetable, i, mapping.pa, PAGESIZE, mapping.perm);
   41021:	8b 8d 70 ff ff ff    	mov    -0x90(%rbp),%ecx
   41027:	48 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%rdi
   4102e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41031:	48 63 d0             	movslq %eax,%rdx
   41034:	48 89 d0             	mov    %rdx,%rax
   41037:	48 c1 e0 03          	shl    $0x3,%rax
   4103b:	48 29 d0             	sub    %rdx,%rax
   4103e:	48 c1 e0 05          	shl    $0x5,%rax
   41042:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   41048:	48 8b 00             	mov    (%rax),%rax
   4104b:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
   4104f:	41 89 c8             	mov    %ecx,%r8d
   41052:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41057:	48 89 fa             	mov    %rdi,%rdx
   4105a:	48 89 c7             	mov    %rax,%rdi
   4105d:	e8 00 1e 00 00       	call   42e62 <virtual_memory_map>
                        // Insert read-only page into tracking array, read_only_pages[]
                        insert_read_only_page(pid, mapping.pn);
   41062:	8b 95 60 ff ff ff    	mov    -0xa0(%rbp),%edx
   41068:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4106b:	89 d6                	mov    %edx,%esi
   4106d:	89 c7                	mov    %eax,%edi
   4106f:	e8 cd f7 ff ff       	call   40841 <insert_read_only_page>
            for (uintptr_t i = PROC_START_ADDR; i < MEMSIZE_VIRTUAL; i += PAGESIZE)
   41074:	48 81 45 e0 00 10 00 	addq   $0x1000,-0x20(%rbp)
   4107b:	00 
   4107c:	48 81 7d e0 ff ff 2f 	cmpq   $0x2fffff,-0x20(%rbp)
   41083:	00 
   41084:	0f 86 8a fe ff ff    	jbe    40f14 <exception+0x4b6>
                    }
                    
                }
            } 
            //
            process_init(&processes[pid], 0);
   4108a:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4108d:	48 63 d0             	movslq %eax,%rdx
   41090:	48 89 d0             	mov    %rdx,%rax
   41093:	48 c1 e0 03          	shl    $0x3,%rax
   41097:	48 29 d0             	sub    %rdx,%rax
   4109a:	48 c1 e0 05          	shl    $0x5,%rax
   4109e:	48 05 20 30 05 00    	add    $0x53020,%rax
   410a4:	be 00 00 00 00       	mov    $0x0,%esi
   410a9:	48 89 c7             	mov    %rax,%rdi
   410ac:	e8 e4 12 00 00       	call   42395 <process_init>
            // Mark process as runnable
            processes[pid].p_state = P_RUNNABLE;
   410b1:	8b 45 dc             	mov    -0x24(%rbp),%eax
   410b4:	48 63 d0             	movslq %eax,%rdx
   410b7:	48 89 d0             	mov    %rdx,%rax
   410ba:	48 c1 e0 03          	shl    $0x3,%rax
   410be:	48 29 d0             	sub    %rdx,%rax
   410c1:	48 c1 e0 05          	shl    $0x5,%rax
   410c5:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   410cb:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
            // Initializa child's registers as a copy of parents' registers
            processes[pid].p_registers = current->p_registers;
   410d1:	48 8b 0d 28 1f 01 00 	mov    0x11f28(%rip),%rcx        # 53000 <current>
   410d8:	8b 45 dc             	mov    -0x24(%rbp),%eax
   410db:	48 63 d0             	movslq %eax,%rdx
   410de:	48 89 d0             	mov    %rdx,%rax
   410e1:	48 c1 e0 03          	shl    $0x3,%rax
   410e5:	48 29 d0             	sub    %rdx,%rax
   410e8:	48 c1 e0 05          	shl    $0x5,%rax
   410ec:	48 05 20 30 05 00    	add    $0x53020,%rax
   410f2:	48 83 c0 08          	add    $0x8,%rax
   410f6:	48 8d 51 08          	lea    0x8(%rcx),%rdx
   410fa:	b9 18 00 00 00       	mov    $0x18,%ecx
   410ff:	48 89 c7             	mov    %rax,%rdi
   41102:	48 89 d6             	mov    %rdx,%rsi
   41105:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
            // Return 0 to child
            processes[pid].p_registers.reg_rax = 0;
   41108:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4110b:	48 63 d0             	movslq %eax,%rdx
   4110e:	48 89 d0             	mov    %rdx,%rax
   41111:	48 c1 e0 03          	shl    $0x3,%rax
   41115:	48 29 d0             	sub    %rdx,%rax
   41118:	48 c1 e0 05          	shl    $0x5,%rax
   4111c:	48 05 28 30 05 00    	add    $0x53028,%rax
   41122:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
            // Return child's pid to parent
            current->p_registers.reg_rax = pid;
   41129:	48 8b 05 d0 1e 01 00 	mov    0x11ed0(%rip),%rax        # 53000 <current>
   41130:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41133:	48 63 d2             	movslq %edx,%rdx
   41136:	48 89 50 08          	mov    %rdx,0x8(%rax)
        }
        else
        {
            current->p_registers.reg_rax = -1;
        }
        break;
   4113a:	eb 44                	jmp    41180 <exception+0x722>
            current->p_registers.reg_rax = -1;
   4113c:	48 8b 05 bd 1e 01 00 	mov    0x11ebd(%rip),%rax        # 53000 <current>
   41143:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4114a:	ff 
        break;
   4114b:	eb 33                	jmp    41180 <exception+0x722>
    }
    case INT_SYS_EXIT:
    {
        // Free current process' pages
        free_pages(current->p_pid);
   4114d:	48 8b 05 ac 1e 01 00 	mov    0x11eac(%rip),%rax        # 53000 <current>
   41154:	8b 00                	mov    (%rax),%eax
   41156:	89 c7                	mov    %eax,%edi
   41158:	e8 29 f7 ff ff       	call   40886 <free_pages>
        // Mark process as FREE
        current->p_state = P_FREE;
   4115d:	48 8b 05 9c 1e 01 00 	mov    0x11e9c(%rip),%rax        # 53000 <current>
   41164:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   4116b:	00 00 00 
        break;
   4116e:	eb 10                	jmp    41180 <exception+0x722>
    }

    default:
        default_exception(current);
   41170:	48 8b 05 89 1e 01 00 	mov    0x11e89(%rip),%rax        # 53000 <current>
   41177:	48 89 c7             	mov    %rax,%rdi
   4117a:	e8 14 1a 00 00       	call   42b93 <default_exception>
        break;                  /* will not be reached */
   4117f:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   41180:	48 8b 05 79 1e 01 00 	mov    0x11e79(%rip),%rax        # 53000 <current>
   41187:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   4118d:	83 f8 01             	cmp    $0x1,%eax
   41190:	75 0f                	jne    411a1 <exception+0x743>
        run(current);
   41192:	48 8b 05 67 1e 01 00 	mov    0x11e67(%rip),%rax        # 53000 <current>
   41199:	48 89 c7             	mov    %rax,%rdi
   4119c:	e8 7e 00 00 00       	call   4121f <run>
    } else {
        schedule();
   411a1:	e8 03 00 00 00       	call   411a9 <schedule>
    }
}
   411a6:	90                   	nop
   411a7:	c9                   	leave  
   411a8:	c3                   	ret    

00000000000411a9 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   411a9:	55                   	push   %rbp
   411aa:	48 89 e5             	mov    %rsp,%rbp
   411ad:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   411b1:	48 8b 05 48 1e 01 00 	mov    0x11e48(%rip),%rax        # 53000 <current>
   411b8:	8b 00                	mov    (%rax),%eax
   411ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   411bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   411c0:	8d 50 01             	lea    0x1(%rax),%edx
   411c3:	89 d0                	mov    %edx,%eax
   411c5:	c1 f8 1f             	sar    $0x1f,%eax
   411c8:	c1 e8 1c             	shr    $0x1c,%eax
   411cb:	01 c2                	add    %eax,%edx
   411cd:	83 e2 0f             	and    $0xf,%edx
   411d0:	29 c2                	sub    %eax,%edx
   411d2:	89 55 fc             	mov    %edx,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   411d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   411d8:	48 63 d0             	movslq %eax,%rdx
   411db:	48 89 d0             	mov    %rdx,%rax
   411de:	48 c1 e0 03          	shl    $0x3,%rax
   411e2:	48 29 d0             	sub    %rdx,%rax
   411e5:	48 c1 e0 05          	shl    $0x5,%rax
   411e9:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   411ef:	8b 00                	mov    (%rax),%eax
   411f1:	83 f8 01             	cmp    $0x1,%eax
   411f4:	75 22                	jne    41218 <schedule+0x6f>
            run(&processes[pid]);
   411f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   411f9:	48 63 d0             	movslq %eax,%rdx
   411fc:	48 89 d0             	mov    %rdx,%rax
   411ff:	48 c1 e0 03          	shl    $0x3,%rax
   41203:	48 29 d0             	sub    %rdx,%rax
   41206:	48 c1 e0 05          	shl    $0x5,%rax
   4120a:	48 05 20 30 05 00    	add    $0x53020,%rax
   41210:	48 89 c7             	mov    %rax,%rdi
   41213:	e8 07 00 00 00       	call   4121f <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   41218:	e8 25 17 00 00       	call   42942 <check_keyboard>
        pid = (pid + 1) % NPROC;
   4121d:	eb 9e                	jmp    411bd <schedule+0x14>

000000000004121f <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   4121f:	55                   	push   %rbp
   41220:	48 89 e5             	mov    %rsp,%rbp
   41223:	48 83 ec 10          	sub    $0x10,%rsp
   41227:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   4122b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4122f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   41235:	83 f8 01             	cmp    $0x1,%eax
   41238:	74 14                	je     4124e <run+0x2f>
   4123a:	ba f8 48 04 00       	mov    $0x448f8,%edx
   4123f:	be 62 02 00 00       	mov    $0x262,%esi
   41244:	bf 00 47 04 00       	mov    $0x44700,%edi
   41249:	e8 15 19 00 00       	call   42b63 <assert_fail>
    current = p;
   4124e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41252:	48 89 05 a7 1d 01 00 	mov    %rax,0x11da7(%rip)        # 53000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   41259:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4125d:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41264:	48 89 c7             	mov    %rax,%rdi
   41267:	e8 c5 1a 00 00       	call   42d31 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   4126c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41270:	48 83 c0 08          	add    $0x8,%rax
   41274:	48 89 c7             	mov    %rax,%rdi
   41277:	e8 47 ee ff ff       	call   400c3 <exception_return>

000000000004127c <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   4127c:	55                   	push   %rbp
   4127d:	48 89 e5             	mov    %rsp,%rbp
   41280:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41284:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4128b:	00 
   4128c:	e9 81 00 00 00       	jmp    41312 <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   41291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41295:	48 89 c7             	mov    %rax,%rdi
   41298:	e8 33 0f 00 00       	call   421d0 <physical_memory_isreserved>
   4129d:	85 c0                	test   %eax,%eax
   4129f:	74 09                	je     412aa <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   412a1:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   412a8:	eb 2f                	jmp    412d9 <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   412aa:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   412b1:	00 
   412b2:	76 0b                	jbe    412bf <pageinfo_init+0x43>
   412b4:	b8 08 d0 05 00       	mov    $0x5d008,%eax
   412b9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   412bd:	72 0a                	jb     412c9 <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   412bf:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   412c6:	00 
   412c7:	75 09                	jne    412d2 <pageinfo_init+0x56>
            owner = PO_KERNEL;
   412c9:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   412d0:	eb 07                	jmp    412d9 <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   412d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   412d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   412dd:	48 c1 e8 0c          	shr    $0xc,%rax
   412e1:	89 c1                	mov    %eax,%ecx
   412e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
   412e6:	89 c2                	mov    %eax,%edx
   412e8:	48 63 c1             	movslq %ecx,%rax
   412eb:	88 94 00 40 4e 05 00 	mov    %dl,0x54e40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   412f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   412f6:	0f 95 c2             	setne  %dl
   412f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   412fd:	48 c1 e8 0c          	shr    $0xc,%rax
   41301:	48 98                	cltq   
   41303:	88 94 00 41 4e 05 00 	mov    %dl,0x54e41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   4130a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41311:	00 
   41312:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   41319:	00 
   4131a:	0f 86 71 ff ff ff    	jbe    41291 <pageinfo_init+0x15>
    }
}
   41320:	90                   	nop
   41321:	90                   	nop
   41322:	c9                   	leave  
   41323:	c3                   	ret    

0000000000041324 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   41324:	55                   	push   %rbp
   41325:	48 89 e5             	mov    %rsp,%rbp
   41328:	48 83 ec 50          	sub    $0x50,%rsp
   4132c:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   41330:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41334:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4133a:	48 89 c2             	mov    %rax,%rdx
   4133d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41341:	48 39 c2             	cmp    %rax,%rdx
   41344:	74 14                	je     4135a <check_page_table_mappings+0x36>
   41346:	ba 18 49 04 00       	mov    $0x44918,%edx
   4134b:	be 8c 02 00 00       	mov    $0x28c,%esi
   41350:	bf 00 47 04 00       	mov    $0x44700,%edi
   41355:	e8 09 18 00 00       	call   42b63 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   4135a:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   41361:	00 
   41362:	e9 9a 00 00 00       	jmp    41401 <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   41367:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   4136b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4136f:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41373:	48 89 ce             	mov    %rcx,%rsi
   41376:	48 89 c7             	mov    %rax,%rdi
   41379:	e8 9f 1e 00 00       	call   4321d <virtual_memory_lookup>
        if (vam.pa != va) {
   4137e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41382:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41386:	74 27                	je     413af <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   41388:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4138c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41390:	49 89 d0             	mov    %rdx,%r8
   41393:	48 89 c1             	mov    %rax,%rcx
   41396:	ba 37 49 04 00       	mov    $0x44937,%edx
   4139b:	be 00 c0 00 00       	mov    $0xc000,%esi
   413a0:	bf e0 06 00 00       	mov    $0x6e0,%edi
   413a5:	b8 00 00 00 00       	mov    $0x0,%eax
   413aa:	e8 7a 31 00 00       	call   44529 <console_printf>
        }
        assert(vam.pa == va);
   413af:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   413b3:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   413b7:	74 14                	je     413cd <check_page_table_mappings+0xa9>
   413b9:	ba 41 49 04 00       	mov    $0x44941,%edx
   413be:	be 95 02 00 00       	mov    $0x295,%esi
   413c3:	bf 00 47 04 00       	mov    $0x44700,%edi
   413c8:	e8 96 17 00 00       	call   42b63 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   413cd:	b8 00 60 04 00       	mov    $0x46000,%eax
   413d2:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   413d6:	72 21                	jb     413f9 <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   413d8:	8b 45 d0             	mov    -0x30(%rbp),%eax
   413db:	48 98                	cltq   
   413dd:	83 e0 02             	and    $0x2,%eax
   413e0:	48 85 c0             	test   %rax,%rax
   413e3:	75 14                	jne    413f9 <check_page_table_mappings+0xd5>
   413e5:	ba 4e 49 04 00       	mov    $0x4494e,%edx
   413ea:	be 97 02 00 00       	mov    $0x297,%esi
   413ef:	bf 00 47 04 00       	mov    $0x44700,%edi
   413f4:	e8 6a 17 00 00       	call   42b63 <assert_fail>
         va += PAGESIZE) {
   413f9:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41400:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   41401:	b8 08 d0 05 00       	mov    $0x5d008,%eax
   41406:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4140a:	0f 82 57 ff ff ff    	jb     41367 <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   41410:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41417:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41418:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   4141c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   41420:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41424:	48 89 ce             	mov    %rcx,%rsi
   41427:	48 89 c7             	mov    %rax,%rdi
   4142a:	e8 ee 1d 00 00       	call   4321d <virtual_memory_lookup>
    assert(vam.pa == kstack);
   4142f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41433:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   41437:	74 14                	je     4144d <check_page_table_mappings+0x129>
   41439:	ba 5f 49 04 00       	mov    $0x4495f,%edx
   4143e:	be 9e 02 00 00       	mov    $0x29e,%esi
   41443:	bf 00 47 04 00       	mov    $0x44700,%edi
   41448:	e8 16 17 00 00       	call   42b63 <assert_fail>
    assert(vam.perm & PTE_W);
   4144d:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41450:	48 98                	cltq   
   41452:	83 e0 02             	and    $0x2,%eax
   41455:	48 85 c0             	test   %rax,%rax
   41458:	75 14                	jne    4146e <check_page_table_mappings+0x14a>
   4145a:	ba 4e 49 04 00       	mov    $0x4494e,%edx
   4145f:	be 9f 02 00 00       	mov    $0x29f,%esi
   41464:	bf 00 47 04 00       	mov    $0x44700,%edi
   41469:	e8 f5 16 00 00       	call   42b63 <assert_fail>
}
   4146e:	90                   	nop
   4146f:	c9                   	leave  
   41470:	c3                   	ret    

0000000000041471 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   41471:	55                   	push   %rbp
   41472:	48 89 e5             	mov    %rsp,%rbp
   41475:	48 83 ec 20          	sub    $0x20,%rsp
   41479:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4147d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   41480:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41483:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   41486:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   4148d:	48 8b 05 6c 5b 01 00 	mov    0x15b6c(%rip),%rax        # 57000 <kernel_pagetable>
   41494:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   41498:	75 67                	jne    41501 <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   4149a:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   414a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   414a8:	eb 51                	jmp    414fb <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   414aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
   414ad:	48 63 d0             	movslq %eax,%rdx
   414b0:	48 89 d0             	mov    %rdx,%rax
   414b3:	48 c1 e0 03          	shl    $0x3,%rax
   414b7:	48 29 d0             	sub    %rdx,%rax
   414ba:	48 c1 e0 05          	shl    $0x5,%rax
   414be:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   414c4:	8b 00                	mov    (%rax),%eax
   414c6:	85 c0                	test   %eax,%eax
   414c8:	74 2d                	je     414f7 <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   414ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
   414cd:	48 63 d0             	movslq %eax,%rdx
   414d0:	48 89 d0             	mov    %rdx,%rax
   414d3:	48 c1 e0 03          	shl    $0x3,%rax
   414d7:	48 29 d0             	sub    %rdx,%rax
   414da:	48 c1 e0 05          	shl    $0x5,%rax
   414de:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   414e4:	48 8b 10             	mov    (%rax),%rdx
   414e7:	48 8b 05 12 5b 01 00 	mov    0x15b12(%rip),%rax        # 57000 <kernel_pagetable>
   414ee:	48 39 c2             	cmp    %rax,%rdx
   414f1:	75 04                	jne    414f7 <check_page_table_ownership+0x86>
                ++expected_refcount;
   414f3:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   414f7:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   414fb:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   414ff:	7e a9                	jle    414aa <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   41501:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41504:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41507:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4150b:	be 00 00 00 00       	mov    $0x0,%esi
   41510:	48 89 c7             	mov    %rax,%rdi
   41513:	e8 03 00 00 00       	call   4151b <check_page_table_ownership_level>
}
   41518:	90                   	nop
   41519:	c9                   	leave  
   4151a:	c3                   	ret    

000000000004151b <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   4151b:	55                   	push   %rbp
   4151c:	48 89 e5             	mov    %rsp,%rbp
   4151f:	48 83 ec 30          	sub    $0x30,%rsp
   41523:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41527:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   4152a:	89 55 e0             	mov    %edx,-0x20(%rbp)
   4152d:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41530:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41534:	48 c1 e8 0c          	shr    $0xc,%rax
   41538:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   4153d:	7e 14                	jle    41553 <check_page_table_ownership_level+0x38>
   4153f:	ba 70 49 04 00       	mov    $0x44970,%edx
   41544:	be bc 02 00 00       	mov    $0x2bc,%esi
   41549:	bf 00 47 04 00       	mov    $0x44700,%edi
   4154e:	e8 10 16 00 00       	call   42b63 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41553:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41557:	48 c1 e8 0c          	shr    $0xc,%rax
   4155b:	48 98                	cltq   
   4155d:	0f b6 84 00 40 4e 05 	movzbl 0x54e40(%rax,%rax,1),%eax
   41564:	00 
   41565:	0f be c0             	movsbl %al,%eax
   41568:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   4156b:	74 14                	je     41581 <check_page_table_ownership_level+0x66>
   4156d:	ba 88 49 04 00       	mov    $0x44988,%edx
   41572:	be bd 02 00 00       	mov    $0x2bd,%esi
   41577:	bf 00 47 04 00       	mov    $0x44700,%edi
   4157c:	e8 e2 15 00 00       	call   42b63 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   41581:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41585:	48 c1 e8 0c          	shr    $0xc,%rax
   41589:	48 98                	cltq   
   4158b:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   41592:	00 
   41593:	0f be c0             	movsbl %al,%eax
   41596:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   41599:	74 14                	je     415af <check_page_table_ownership_level+0x94>
   4159b:	ba b0 49 04 00       	mov    $0x449b0,%edx
   415a0:	be be 02 00 00       	mov    $0x2be,%esi
   415a5:	bf 00 47 04 00       	mov    $0x44700,%edi
   415aa:	e8 b4 15 00 00       	call   42b63 <assert_fail>
    if (level < 3) {
   415af:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   415b3:	7f 5b                	jg     41610 <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   415b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   415bc:	eb 49                	jmp    41607 <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   415be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   415c2:	8b 55 fc             	mov    -0x4(%rbp),%edx
   415c5:	48 63 d2             	movslq %edx,%rdx
   415c8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   415cc:	48 85 c0             	test   %rax,%rax
   415cf:	74 32                	je     41603 <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   415d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   415d5:	8b 55 fc             	mov    -0x4(%rbp),%edx
   415d8:	48 63 d2             	movslq %edx,%rdx
   415db:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   415df:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   415e5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   415e9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   415ec:	8d 70 01             	lea    0x1(%rax),%esi
   415ef:	8b 55 e0             	mov    -0x20(%rbp),%edx
   415f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   415f6:	b9 01 00 00 00       	mov    $0x1,%ecx
   415fb:	48 89 c7             	mov    %rax,%rdi
   415fe:	e8 18 ff ff ff       	call   4151b <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41603:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41607:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   4160e:	7e ae                	jle    415be <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   41610:	90                   	nop
   41611:	c9                   	leave  
   41612:	c3                   	ret    

0000000000041613 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41613:	55                   	push   %rbp
   41614:	48 89 e5             	mov    %rsp,%rbp
   41617:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   4161b:	8b 05 c7 1a 01 00    	mov    0x11ac7(%rip),%eax        # 530e8 <processes+0xc8>
   41621:	85 c0                	test   %eax,%eax
   41623:	74 14                	je     41639 <check_virtual_memory+0x26>
   41625:	ba e0 49 04 00       	mov    $0x449e0,%edx
   4162a:	be d1 02 00 00       	mov    $0x2d1,%esi
   4162f:	bf 00 47 04 00       	mov    $0x44700,%edi
   41634:	e8 2a 15 00 00       	call   42b63 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41639:	48 8b 05 c0 59 01 00 	mov    0x159c0(%rip),%rax        # 57000 <kernel_pagetable>
   41640:	48 89 c7             	mov    %rax,%rdi
   41643:	e8 dc fc ff ff       	call   41324 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41648:	48 8b 05 b1 59 01 00 	mov    0x159b1(%rip),%rax        # 57000 <kernel_pagetable>
   4164f:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41654:	48 89 c7             	mov    %rax,%rdi
   41657:	e8 15 fe ff ff       	call   41471 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   4165c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41663:	e9 9c 00 00 00       	jmp    41704 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   41668:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4166b:	48 63 d0             	movslq %eax,%rdx
   4166e:	48 89 d0             	mov    %rdx,%rax
   41671:	48 c1 e0 03          	shl    $0x3,%rax
   41675:	48 29 d0             	sub    %rdx,%rax
   41678:	48 c1 e0 05          	shl    $0x5,%rax
   4167c:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   41682:	8b 00                	mov    (%rax),%eax
   41684:	85 c0                	test   %eax,%eax
   41686:	74 78                	je     41700 <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   41688:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4168b:	48 63 d0             	movslq %eax,%rdx
   4168e:	48 89 d0             	mov    %rdx,%rax
   41691:	48 c1 e0 03          	shl    $0x3,%rax
   41695:	48 29 d0             	sub    %rdx,%rax
   41698:	48 c1 e0 05          	shl    $0x5,%rax
   4169c:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   416a2:	48 8b 10             	mov    (%rax),%rdx
   416a5:	48 8b 05 54 59 01 00 	mov    0x15954(%rip),%rax        # 57000 <kernel_pagetable>
   416ac:	48 39 c2             	cmp    %rax,%rdx
   416af:	74 4f                	je     41700 <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   416b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   416b4:	48 63 d0             	movslq %eax,%rdx
   416b7:	48 89 d0             	mov    %rdx,%rax
   416ba:	48 c1 e0 03          	shl    $0x3,%rax
   416be:	48 29 d0             	sub    %rdx,%rax
   416c1:	48 c1 e0 05          	shl    $0x5,%rax
   416c5:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   416cb:	48 8b 00             	mov    (%rax),%rax
   416ce:	48 89 c7             	mov    %rax,%rdi
   416d1:	e8 4e fc ff ff       	call   41324 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   416d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   416d9:	48 63 d0             	movslq %eax,%rdx
   416dc:	48 89 d0             	mov    %rdx,%rax
   416df:	48 c1 e0 03          	shl    $0x3,%rax
   416e3:	48 29 d0             	sub    %rdx,%rax
   416e6:	48 c1 e0 05          	shl    $0x5,%rax
   416ea:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   416f0:	48 8b 00             	mov    (%rax),%rax
   416f3:	8b 55 fc             	mov    -0x4(%rbp),%edx
   416f6:	89 d6                	mov    %edx,%esi
   416f8:	48 89 c7             	mov    %rax,%rdi
   416fb:	e8 71 fd ff ff       	call   41471 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41700:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41704:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41708:	0f 8e 5a ff ff ff    	jle    41668 <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4170e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41715:	eb 67                	jmp    4177e <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   41717:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4171a:	48 98                	cltq   
   4171c:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   41723:	00 
   41724:	84 c0                	test   %al,%al
   41726:	7e 52                	jle    4177a <check_virtual_memory+0x167>
   41728:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4172b:	48 98                	cltq   
   4172d:	0f b6 84 00 40 4e 05 	movzbl 0x54e40(%rax,%rax,1),%eax
   41734:	00 
   41735:	84 c0                	test   %al,%al
   41737:	78 41                	js     4177a <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   41739:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4173c:	48 98                	cltq   
   4173e:	0f b6 84 00 40 4e 05 	movzbl 0x54e40(%rax,%rax,1),%eax
   41745:	00 
   41746:	0f be c0             	movsbl %al,%eax
   41749:	48 63 d0             	movslq %eax,%rdx
   4174c:	48 89 d0             	mov    %rdx,%rax
   4174f:	48 c1 e0 03          	shl    $0x3,%rax
   41753:	48 29 d0             	sub    %rdx,%rax
   41756:	48 c1 e0 05          	shl    $0x5,%rax
   4175a:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   41760:	8b 00                	mov    (%rax),%eax
   41762:	85 c0                	test   %eax,%eax
   41764:	75 14                	jne    4177a <check_virtual_memory+0x167>
   41766:	ba 00 4a 04 00       	mov    $0x44a00,%edx
   4176b:	be e8 02 00 00       	mov    $0x2e8,%esi
   41770:	bf 00 47 04 00       	mov    $0x44700,%edi
   41775:	e8 e9 13 00 00       	call   42b63 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4177a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4177e:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41785:	7e 90                	jle    41717 <check_virtual_memory+0x104>
        }
    }
}
   41787:	90                   	nop
   41788:	90                   	nop
   41789:	c9                   	leave  
   4178a:	c3                   	ret    

000000000004178b <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   4178b:	55                   	push   %rbp
   4178c:	48 89 e5             	mov    %rsp,%rbp
   4178f:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41793:	ba 66 4a 04 00       	mov    $0x44a66,%edx
   41798:	be 00 0f 00 00       	mov    $0xf00,%esi
   4179d:	bf 20 00 00 00       	mov    $0x20,%edi
   417a2:	b8 00 00 00 00       	mov    $0x0,%eax
   417a7:	e8 7d 2d 00 00       	call   44529 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   417ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   417b3:	e9 f8 00 00 00       	jmp    418b0 <memshow_physical+0x125>
        if (pn % 64 == 0) {
   417b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   417bb:	83 e0 3f             	and    $0x3f,%eax
   417be:	85 c0                	test   %eax,%eax
   417c0:	75 3c                	jne    417fe <memshow_physical+0x73>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   417c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   417c5:	c1 e0 0c             	shl    $0xc,%eax
   417c8:	89 c1                	mov    %eax,%ecx
   417ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
   417cd:	8d 50 3f             	lea    0x3f(%rax),%edx
   417d0:	85 c0                	test   %eax,%eax
   417d2:	0f 48 c2             	cmovs  %edx,%eax
   417d5:	c1 f8 06             	sar    $0x6,%eax
   417d8:	8d 50 01             	lea    0x1(%rax),%edx
   417db:	89 d0                	mov    %edx,%eax
   417dd:	c1 e0 02             	shl    $0x2,%eax
   417e0:	01 d0                	add    %edx,%eax
   417e2:	c1 e0 04             	shl    $0x4,%eax
   417e5:	83 c0 03             	add    $0x3,%eax
   417e8:	ba 76 4a 04 00       	mov    $0x44a76,%edx
   417ed:	be 00 0f 00 00       	mov    $0xf00,%esi
   417f2:	89 c7                	mov    %eax,%edi
   417f4:	b8 00 00 00 00       	mov    $0x0,%eax
   417f9:	e8 2b 2d 00 00       	call   44529 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   417fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41801:	48 98                	cltq   
   41803:	0f b6 84 00 40 4e 05 	movzbl 0x54e40(%rax,%rax,1),%eax
   4180a:	00 
   4180b:	0f be c0             	movsbl %al,%eax
   4180e:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   41811:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41814:	48 98                	cltq   
   41816:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   4181d:	00 
   4181e:	84 c0                	test   %al,%al
   41820:	75 07                	jne    41829 <memshow_physical+0x9e>
            owner = PO_FREE;
   41822:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41829:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4182c:	83 c0 02             	add    $0x2,%eax
   4182f:	48 98                	cltq   
   41831:	0f b7 84 00 40 4a 04 	movzwl 0x44a40(%rax,%rax,1),%eax
   41838:	00 
   41839:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   4183d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41840:	48 98                	cltq   
   41842:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   41849:	00 
   4184a:	3c 01                	cmp    $0x1,%al
   4184c:	7e 1a                	jle    41868 <memshow_physical+0xdd>
   4184e:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41853:	48 c1 e8 0c          	shr    $0xc,%rax
   41857:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   4185a:	74 0c                	je     41868 <memshow_physical+0xdd>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   4185c:	b8 53 00 00 00       	mov    $0x53,%eax
   41861:	80 cc 0f             	or     $0xf,%ah
   41864:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
	    color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41868:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4186b:	8d 50 3f             	lea    0x3f(%rax),%edx
   4186e:	85 c0                	test   %eax,%eax
   41870:	0f 48 c2             	cmovs  %edx,%eax
   41873:	c1 f8 06             	sar    $0x6,%eax
   41876:	8d 50 01             	lea    0x1(%rax),%edx
   41879:	89 d0                	mov    %edx,%eax
   4187b:	c1 e0 02             	shl    $0x2,%eax
   4187e:	01 d0                	add    %edx,%eax
   41880:	c1 e0 04             	shl    $0x4,%eax
   41883:	89 c1                	mov    %eax,%ecx
   41885:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41888:	89 d0                	mov    %edx,%eax
   4188a:	c1 f8 1f             	sar    $0x1f,%eax
   4188d:	c1 e8 1a             	shr    $0x1a,%eax
   41890:	01 c2                	add    %eax,%edx
   41892:	83 e2 3f             	and    $0x3f,%edx
   41895:	29 c2                	sub    %eax,%edx
   41897:	89 d0                	mov    %edx,%eax
   41899:	83 c0 0c             	add    $0xc,%eax
   4189c:	01 c8                	add    %ecx,%eax
   4189e:	48 98                	cltq   
   418a0:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   418a4:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   418ab:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   418ac:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   418b0:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   418b7:	0f 8e fb fe ff ff    	jle    417b8 <memshow_physical+0x2d>
    }
}
   418bd:	90                   	nop
   418be:	90                   	nop
   418bf:	c9                   	leave  
   418c0:	c3                   	ret    

00000000000418c1 <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   418c1:	55                   	push   %rbp
   418c2:	48 89 e5             	mov    %rsp,%rbp
   418c5:	48 83 ec 40          	sub    $0x40,%rsp
   418c9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   418cd:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   418d1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   418d5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   418db:	48 89 c2             	mov    %rax,%rdx
   418de:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   418e2:	48 39 c2             	cmp    %rax,%rdx
   418e5:	74 14                	je     418fb <memshow_virtual+0x3a>
   418e7:	ba 80 4a 04 00       	mov    $0x44a80,%edx
   418ec:	be 19 03 00 00       	mov    $0x319,%esi
   418f1:	bf 00 47 04 00       	mov    $0x44700,%edi
   418f6:	e8 68 12 00 00       	call   42b63 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   418fb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   418ff:	48 89 c1             	mov    %rax,%rcx
   41902:	ba ad 4a 04 00       	mov    $0x44aad,%edx
   41907:	be 00 0f 00 00       	mov    $0xf00,%esi
   4190c:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41911:	b8 00 00 00 00       	mov    $0x0,%eax
   41916:	e8 0e 2c 00 00       	call   44529 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4191b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41922:	00 
   41923:	e9 80 01 00 00       	jmp    41aa8 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41928:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4192c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41930:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41934:	48 89 ce             	mov    %rcx,%rsi
   41937:	48 89 c7             	mov    %rax,%rdi
   4193a:	e8 de 18 00 00       	call   4321d <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   4193f:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41942:	85 c0                	test   %eax,%eax
   41944:	79 0b                	jns    41951 <memshow_virtual+0x90>
            color = ' ';
   41946:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   4194c:	e9 d7 00 00 00       	jmp    41a28 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41951:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41955:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4195b:	76 14                	jbe    41971 <memshow_virtual+0xb0>
   4195d:	ba ca 4a 04 00       	mov    $0x44aca,%edx
   41962:	be 22 03 00 00       	mov    $0x322,%esi
   41967:	bf 00 47 04 00       	mov    $0x44700,%edi
   4196c:	e8 f2 11 00 00       	call   42b63 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41971:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41974:	48 98                	cltq   
   41976:	0f b6 84 00 40 4e 05 	movzbl 0x54e40(%rax,%rax,1),%eax
   4197d:	00 
   4197e:	0f be c0             	movsbl %al,%eax
   41981:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41984:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41987:	48 98                	cltq   
   41989:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   41990:	00 
   41991:	84 c0                	test   %al,%al
   41993:	75 07                	jne    4199c <memshow_virtual+0xdb>
                owner = PO_FREE;
   41995:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   4199c:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4199f:	83 c0 02             	add    $0x2,%eax
   419a2:	48 98                	cltq   
   419a4:	0f b7 84 00 40 4a 04 	movzwl 0x44a40(%rax,%rax,1),%eax
   419ab:	00 
   419ac:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   419b0:	8b 45 e0             	mov    -0x20(%rbp),%eax
   419b3:	48 98                	cltq   
   419b5:	83 e0 04             	and    $0x4,%eax
   419b8:	48 85 c0             	test   %rax,%rax
   419bb:	74 27                	je     419e4 <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   419bd:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   419c1:	c1 e0 04             	shl    $0x4,%eax
   419c4:	66 25 00 f0          	and    $0xf000,%ax
   419c8:	89 c2                	mov    %eax,%edx
   419ca:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   419ce:	c1 f8 04             	sar    $0x4,%eax
   419d1:	66 25 00 0f          	and    $0xf00,%ax
   419d5:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   419d7:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   419db:	0f b6 c0             	movzbl %al,%eax
   419de:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   419e0:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   419e4:	8b 45 d0             	mov    -0x30(%rbp),%eax
   419e7:	48 98                	cltq   
   419e9:	0f b6 84 00 41 4e 05 	movzbl 0x54e41(%rax,%rax,1),%eax
   419f0:	00 
   419f1:	3c 01                	cmp    $0x1,%al
   419f3:	7e 33                	jle    41a28 <memshow_virtual+0x167>
   419f5:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   419fa:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   419fe:	74 28                	je     41a28 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41a00:	b8 53 00 00 00       	mov    $0x53,%eax
   41a05:	89 c2                	mov    %eax,%edx
   41a07:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41a0b:	66 25 00 f0          	and    $0xf000,%ax
   41a0f:	09 d0                	or     %edx,%eax
   41a11:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41a15:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41a18:	48 98                	cltq   
   41a1a:	83 e0 04             	and    $0x4,%eax
   41a1d:	48 85 c0             	test   %rax,%rax
   41a20:	75 06                	jne    41a28 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41a22:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
		color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41a28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a2c:	48 c1 e8 0c          	shr    $0xc,%rax
   41a30:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41a33:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a36:	83 e0 3f             	and    $0x3f,%eax
   41a39:	85 c0                	test   %eax,%eax
   41a3b:	75 34                	jne    41a71 <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   41a3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a40:	c1 e8 06             	shr    $0x6,%eax
   41a43:	89 c2                	mov    %eax,%edx
   41a45:	89 d0                	mov    %edx,%eax
   41a47:	c1 e0 02             	shl    $0x2,%eax
   41a4a:	01 d0                	add    %edx,%eax
   41a4c:	c1 e0 04             	shl    $0x4,%eax
   41a4f:	05 73 03 00 00       	add    $0x373,%eax
   41a54:	89 c7                	mov    %eax,%edi
   41a56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a5a:	48 89 c1             	mov    %rax,%rcx
   41a5d:	ba 76 4a 04 00       	mov    $0x44a76,%edx
   41a62:	be 00 0f 00 00       	mov    $0xf00,%esi
   41a67:	b8 00 00 00 00       	mov    $0x0,%eax
   41a6c:	e8 b8 2a 00 00       	call   44529 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41a71:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a74:	c1 e8 06             	shr    $0x6,%eax
   41a77:	89 c2                	mov    %eax,%edx
   41a79:	89 d0                	mov    %edx,%eax
   41a7b:	c1 e0 02             	shl    $0x2,%eax
   41a7e:	01 d0                	add    %edx,%eax
   41a80:	c1 e0 04             	shl    $0x4,%eax
   41a83:	89 c2                	mov    %eax,%edx
   41a85:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a88:	83 e0 3f             	and    $0x3f,%eax
   41a8b:	01 d0                	add    %edx,%eax
   41a8d:	05 7c 03 00 00       	add    $0x37c,%eax
   41a92:	89 c2                	mov    %eax,%edx
   41a94:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41a98:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   41a9f:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41aa0:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41aa7:	00 
   41aa8:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41aaf:	00 
   41ab0:	0f 86 72 fe ff ff    	jbe    41928 <memshow_virtual+0x67>
    }
}
   41ab6:	90                   	nop
   41ab7:	90                   	nop
   41ab8:	c9                   	leave  
   41ab9:	c3                   	ret    

0000000000041aba <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41aba:	55                   	push   %rbp
   41abb:	48 89 e5             	mov    %rsp,%rbp
   41abe:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41ac2:	8b 05 78 37 01 00    	mov    0x13778(%rip),%eax        # 55240 <last_ticks.1>
   41ac8:	85 c0                	test   %eax,%eax
   41aca:	74 13                	je     41adf <memshow_virtual_animate+0x25>
   41acc:	8b 15 4e 23 01 00    	mov    0x1234e(%rip),%edx        # 53e20 <ticks>
   41ad2:	8b 05 68 37 01 00    	mov    0x13768(%rip),%eax        # 55240 <last_ticks.1>
   41ad8:	29 c2                	sub    %eax,%edx
   41ada:	83 fa 31             	cmp    $0x31,%edx
   41add:	76 2c                	jbe    41b0b <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   41adf:	8b 05 3b 23 01 00    	mov    0x1233b(%rip),%eax        # 53e20 <ticks>
   41ae5:	89 05 55 37 01 00    	mov    %eax,0x13755(%rip)        # 55240 <last_ticks.1>
        ++showing;
   41aeb:	8b 05 13 45 00 00    	mov    0x4513(%rip),%eax        # 46004 <showing.0>
   41af1:	83 c0 01             	add    $0x1,%eax
   41af4:	89 05 0a 45 00 00    	mov    %eax,0x450a(%rip)        # 46004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   41afa:	eb 0f                	jmp    41b0b <memshow_virtual_animate+0x51>
           && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0)) {
        ++showing;
   41afc:	8b 05 02 45 00 00    	mov    0x4502(%rip),%eax        # 46004 <showing.0>
   41b02:	83 c0 01             	add    $0x1,%eax
   41b05:	89 05 f9 44 00 00    	mov    %eax,0x44f9(%rip)        # 46004 <showing.0>
    while (showing <= 2*NPROC
   41b0b:	8b 05 f3 44 00 00    	mov    0x44f3(%rip),%eax        # 46004 <showing.0>
           && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0)) {
   41b11:	83 f8 20             	cmp    $0x20,%eax
   41b14:	7f 6d                	jg     41b83 <memshow_virtual_animate+0xc9>
   41b16:	8b 15 e8 44 00 00    	mov    0x44e8(%rip),%edx        # 46004 <showing.0>
   41b1c:	89 d0                	mov    %edx,%eax
   41b1e:	c1 f8 1f             	sar    $0x1f,%eax
   41b21:	c1 e8 1c             	shr    $0x1c,%eax
   41b24:	01 c2                	add    %eax,%edx
   41b26:	83 e2 0f             	and    $0xf,%edx
   41b29:	29 c2                	sub    %eax,%edx
   41b2b:	89 d0                	mov    %edx,%eax
   41b2d:	48 63 d0             	movslq %eax,%rdx
   41b30:	48 89 d0             	mov    %rdx,%rax
   41b33:	48 c1 e0 03          	shl    $0x3,%rax
   41b37:	48 29 d0             	sub    %rdx,%rax
   41b3a:	48 c1 e0 05          	shl    $0x5,%rax
   41b3e:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   41b44:	8b 00                	mov    (%rax),%eax
   41b46:	85 c0                	test   %eax,%eax
   41b48:	74 b2                	je     41afc <memshow_virtual_animate+0x42>
   41b4a:	8b 15 b4 44 00 00    	mov    0x44b4(%rip),%edx        # 46004 <showing.0>
   41b50:	89 d0                	mov    %edx,%eax
   41b52:	c1 f8 1f             	sar    $0x1f,%eax
   41b55:	c1 e8 1c             	shr    $0x1c,%eax
   41b58:	01 c2                	add    %eax,%edx
   41b5a:	83 e2 0f             	and    $0xf,%edx
   41b5d:	29 c2                	sub    %eax,%edx
   41b5f:	89 d0                	mov    %edx,%eax
   41b61:	48 63 d0             	movslq %eax,%rdx
   41b64:	48 89 d0             	mov    %rdx,%rax
   41b67:	48 c1 e0 03          	shl    $0x3,%rax
   41b6b:	48 29 d0             	sub    %rdx,%rax
   41b6e:	48 c1 e0 05          	shl    $0x5,%rax
   41b72:	48 05 f8 30 05 00    	add    $0x530f8,%rax
   41b78:	0f b6 00             	movzbl (%rax),%eax
   41b7b:	84 c0                	test   %al,%al
   41b7d:	0f 84 79 ff ff ff    	je     41afc <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41b83:	8b 15 7b 44 00 00    	mov    0x447b(%rip),%edx        # 46004 <showing.0>
   41b89:	89 d0                	mov    %edx,%eax
   41b8b:	c1 f8 1f             	sar    $0x1f,%eax
   41b8e:	c1 e8 1c             	shr    $0x1c,%eax
   41b91:	01 c2                	add    %eax,%edx
   41b93:	83 e2 0f             	and    $0xf,%edx
   41b96:	29 c2                	sub    %eax,%edx
   41b98:	89 d0                	mov    %edx,%eax
   41b9a:	89 05 64 44 00 00    	mov    %eax,0x4464(%rip)        # 46004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41ba0:	8b 05 5e 44 00 00    	mov    0x445e(%rip),%eax        # 46004 <showing.0>
   41ba6:	48 63 d0             	movslq %eax,%rdx
   41ba9:	48 89 d0             	mov    %rdx,%rax
   41bac:	48 c1 e0 03          	shl    $0x3,%rax
   41bb0:	48 29 d0             	sub    %rdx,%rax
   41bb3:	48 c1 e0 05          	shl    $0x5,%rax
   41bb7:	48 05 e8 30 05 00    	add    $0x530e8,%rax
   41bbd:	8b 00                	mov    (%rax),%eax
   41bbf:	85 c0                	test   %eax,%eax
   41bc1:	74 52                	je     41c15 <memshow_virtual_animate+0x15b>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41bc3:	8b 15 3b 44 00 00    	mov    0x443b(%rip),%edx        # 46004 <showing.0>
   41bc9:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41bcd:	89 d1                	mov    %edx,%ecx
   41bcf:	ba e4 4a 04 00       	mov    $0x44ae4,%edx
   41bd4:	be 04 00 00 00       	mov    $0x4,%esi
   41bd9:	48 89 c7             	mov    %rax,%rdi
   41bdc:	b8 00 00 00 00       	mov    $0x0,%eax
   41be1:	e8 4f 2a 00 00       	call   44635 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   41be6:	8b 05 18 44 00 00    	mov    0x4418(%rip),%eax        # 46004 <showing.0>
   41bec:	48 63 d0             	movslq %eax,%rdx
   41bef:	48 89 d0             	mov    %rdx,%rax
   41bf2:	48 c1 e0 03          	shl    $0x3,%rax
   41bf6:	48 29 d0             	sub    %rdx,%rax
   41bf9:	48 c1 e0 05          	shl    $0x5,%rax
   41bfd:	48 05 f0 30 05 00    	add    $0x530f0,%rax
   41c03:	48 8b 00             	mov    (%rax),%rax
   41c06:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   41c0a:	48 89 d6             	mov    %rdx,%rsi
   41c0d:	48 89 c7             	mov    %rax,%rdi
   41c10:	e8 ac fc ff ff       	call   418c1 <memshow_virtual>
    }
}
   41c15:	90                   	nop
   41c16:	c9                   	leave  
   41c17:	c3                   	ret    

0000000000041c18 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   41c18:	55                   	push   %rbp
   41c19:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   41c1c:	e8 4f 01 00 00       	call   41d70 <segments_init>
    interrupt_init();
   41c21:	e8 d0 03 00 00       	call   41ff6 <interrupt_init>
    virtual_memory_init();
   41c26:	e8 f3 0f 00 00       	call   42c1e <virtual_memory_init>
}
   41c2b:	90                   	nop
   41c2c:	5d                   	pop    %rbp
   41c2d:	c3                   	ret    

0000000000041c2e <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   41c2e:	55                   	push   %rbp
   41c2f:	48 89 e5             	mov    %rsp,%rbp
   41c32:	48 83 ec 18          	sub    $0x18,%rsp
   41c36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41c3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41c3e:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   41c41:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41c44:	48 98                	cltq   
   41c46:	48 c1 e0 2d          	shl    $0x2d,%rax
   41c4a:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   41c4e:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   41c55:	90 00 00 
   41c58:	48 09 c2             	or     %rax,%rdx
    *segment = type
   41c5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41c5f:	48 89 10             	mov    %rdx,(%rax)
}
   41c62:	90                   	nop
   41c63:	c9                   	leave  
   41c64:	c3                   	ret    

0000000000041c65 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41c65:	55                   	push   %rbp
   41c66:	48 89 e5             	mov    %rsp,%rbp
   41c69:	48 83 ec 28          	sub    $0x28,%rsp
   41c6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41c71:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41c75:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41c78:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41c7c:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41c80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41c84:	48 c1 e0 10          	shl    $0x10,%rax
   41c88:	48 89 c2             	mov    %rax,%rdx
   41c8b:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   41c92:	00 00 00 
   41c95:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41c98:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41c9c:	48 c1 e0 20          	shl    $0x20,%rax
   41ca0:	48 89 c1             	mov    %rax,%rcx
   41ca3:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41caa:	00 00 ff 
   41cad:	48 21 c8             	and    %rcx,%rax
   41cb0:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   41cb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41cb7:	48 83 e8 01          	sub    $0x1,%rax
   41cbb:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41cbe:	48 09 d0             	or     %rdx,%rax
        | type
   41cc1:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | ((uint64_t) dpl << 45)
   41cc5:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41cc8:	48 63 d2             	movslq %edx,%rdx
   41ccb:	48 c1 e2 2d          	shl    $0x2d,%rdx
   41ccf:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   41cd2:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41cd9:	80 00 00 
   41cdc:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41cdf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41ce3:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41ce6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41cea:	48 83 c0 08          	add    $0x8,%rax
   41cee:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   41cf2:	48 c1 ea 20          	shr    $0x20,%rdx
   41cf6:	48 89 10             	mov    %rdx,(%rax)
}
   41cf9:	90                   	nop
   41cfa:	c9                   	leave  
   41cfb:	c3                   	ret    

0000000000041cfc <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41cfc:	55                   	push   %rbp
   41cfd:	48 89 e5             	mov    %rsp,%rbp
   41d00:	48 83 ec 20          	sub    $0x20,%rsp
   41d04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41d08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41d0c:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41d0f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41d13:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41d17:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41d1a:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | ((uint64_t) dpl << 45)
   41d1e:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41d21:	48 63 d2             	movslq %edx,%rdx
   41d24:	48 c1 e2 2d          	shl    $0x2d,%rdx
   41d28:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41d2b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41d2f:	48 c1 e0 20          	shl    $0x20,%rax
   41d33:	48 89 c1             	mov    %rax,%rcx
   41d36:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41d3d:	00 ff ff 
   41d40:	48 21 c8             	and    %rcx,%rax
   41d43:	48 09 c2             	or     %rax,%rdx
   41d46:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41d4d:	80 00 00 
   41d50:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41d53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41d57:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41d5a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41d5e:	48 c1 e8 20          	shr    $0x20,%rax
   41d62:	48 89 c2             	mov    %rax,%rdx
   41d65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41d69:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   41d6d:	90                   	nop
   41d6e:	c9                   	leave  
   41d6f:	c3                   	ret    

0000000000041d70 <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   41d70:	55                   	push   %rbp
   41d71:	48 89 e5             	mov    %rsp,%rbp
   41d74:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41d78:	48 c7 05 dd 34 01 00 	movq   $0x0,0x134dd(%rip)        # 55260 <segments>
   41d7f:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41d83:	ba 00 00 00 00       	mov    $0x0,%edx
   41d88:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41d8f:	08 20 00 
   41d92:	48 89 c6             	mov    %rax,%rsi
   41d95:	bf 68 52 05 00       	mov    $0x55268,%edi
   41d9a:	e8 8f fe ff ff       	call   41c2e <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   41d9f:	ba 03 00 00 00       	mov    $0x3,%edx
   41da4:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41dab:	08 20 00 
   41dae:	48 89 c6             	mov    %rax,%rsi
   41db1:	bf 70 52 05 00       	mov    $0x55270,%edi
   41db6:	e8 73 fe ff ff       	call   41c2e <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41dbb:	ba 00 00 00 00       	mov    $0x0,%edx
   41dc0:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41dc7:	02 00 00 
   41dca:	48 89 c6             	mov    %rax,%rsi
   41dcd:	bf 78 52 05 00       	mov    $0x55278,%edi
   41dd2:	e8 57 fe ff ff       	call   41c2e <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41dd7:	ba 03 00 00 00       	mov    $0x3,%edx
   41ddc:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41de3:	02 00 00 
   41de6:	48 89 c6             	mov    %rax,%rsi
   41de9:	bf 80 52 05 00       	mov    $0x55280,%edi
   41dee:	e8 3b fe ff ff       	call   41c2e <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41df3:	b8 a0 62 05 00       	mov    $0x562a0,%eax
   41df8:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41dfe:	48 89 c1             	mov    %rax,%rcx
   41e01:	ba 00 00 00 00       	mov    $0x0,%edx
   41e06:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41e0d:	09 00 00 
   41e10:	48 89 c6             	mov    %rax,%rsi
   41e13:	bf 88 52 05 00       	mov    $0x55288,%edi
   41e18:	e8 48 fe ff ff       	call   41c65 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41e1d:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41e23:	b8 60 52 05 00       	mov    $0x55260,%eax
   41e28:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41e2c:	ba 60 00 00 00       	mov    $0x60,%edx
   41e31:	be 00 00 00 00       	mov    $0x0,%esi
   41e36:	bf a0 62 05 00       	mov    $0x562a0,%edi
   41e3b:	e8 32 19 00 00       	call   43772 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41e40:	48 c7 05 59 44 01 00 	movq   $0x80000,0x14459(%rip)        # 562a4 <kernel_task_descriptor+0x4>
   41e47:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41e4b:	ba 00 10 00 00       	mov    $0x1000,%edx
   41e50:	be 00 00 00 00       	mov    $0x0,%esi
   41e55:	bf a0 52 05 00       	mov    $0x552a0,%edi
   41e5a:	e8 13 19 00 00       	call   43772 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41e5f:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41e66:	eb 30                	jmp    41e98 <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41e68:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   41e6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e70:	48 c1 e0 04          	shl    $0x4,%rax
   41e74:	48 05 a0 52 05 00    	add    $0x552a0,%rax
   41e7a:	48 89 d1             	mov    %rdx,%rcx
   41e7d:	ba 00 00 00 00       	mov    $0x0,%edx
   41e82:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41e89:	0e 00 00 
   41e8c:	48 89 c7             	mov    %rax,%rdi
   41e8f:	e8 68 fe ff ff       	call   41cfc <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41e94:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41e98:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41e9f:	76 c7                	jbe    41e68 <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41ea1:	b8 36 00 04 00       	mov    $0x40036,%eax
   41ea6:	48 89 c1             	mov    %rax,%rcx
   41ea9:	ba 00 00 00 00       	mov    $0x0,%edx
   41eae:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41eb5:	0e 00 00 
   41eb8:	48 89 c6             	mov    %rax,%rsi
   41ebb:	bf a0 54 05 00       	mov    $0x554a0,%edi
   41ec0:	e8 37 fe ff ff       	call   41cfc <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41ec5:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   41eca:	48 89 c1             	mov    %rax,%rcx
   41ecd:	ba 00 00 00 00       	mov    $0x0,%edx
   41ed2:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41ed9:	0e 00 00 
   41edc:	48 89 c6             	mov    %rax,%rsi
   41edf:	bf 70 53 05 00       	mov    $0x55370,%edi
   41ee4:	e8 13 fe ff ff       	call   41cfc <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41ee9:	b8 32 00 04 00       	mov    $0x40032,%eax
   41eee:	48 89 c1             	mov    %rax,%rcx
   41ef1:	ba 00 00 00 00       	mov    $0x0,%edx
   41ef6:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41efd:	0e 00 00 
   41f00:	48 89 c6             	mov    %rax,%rsi
   41f03:	bf 80 53 05 00       	mov    $0x55380,%edi
   41f08:	e8 ef fd ff ff       	call   41cfc <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41f0d:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41f14:	eb 3e                	jmp    41f54 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41f16:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41f19:	83 e8 30             	sub    $0x30,%eax
   41f1c:	89 c0                	mov    %eax,%eax
   41f1e:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   41f25:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41f26:	48 89 c2             	mov    %rax,%rdx
   41f29:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41f2c:	48 c1 e0 04          	shl    $0x4,%rax
   41f30:	48 05 a0 52 05 00    	add    $0x552a0,%rax
   41f36:	48 89 d1             	mov    %rdx,%rcx
   41f39:	ba 03 00 00 00       	mov    $0x3,%edx
   41f3e:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41f45:	0e 00 00 
   41f48:	48 89 c7             	mov    %rax,%rdi
   41f4b:	e8 ac fd ff ff       	call   41cfc <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41f50:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41f54:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41f58:	76 bc                	jbe    41f16 <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41f5a:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41f60:	b8 a0 52 05 00       	mov    $0x552a0,%eax
   41f65:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41f69:	b8 28 00 00 00       	mov    $0x28,%eax
   41f6e:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41f72:	0f 00 d8             	ltr    %ax
   41f75:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41f79:	0f 20 c0             	mov    %cr0,%rax
   41f7c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41f80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41f84:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41f87:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41f8e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41f91:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41f94:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41f97:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41f9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41f9f:	0f 22 c0             	mov    %rax,%cr0
}
   41fa2:	90                   	nop
    lcr0(cr0);
}
   41fa3:	90                   	nop
   41fa4:	c9                   	leave  
   41fa5:	c3                   	ret    

0000000000041fa6 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41fa6:	55                   	push   %rbp
   41fa7:	48 89 e5             	mov    %rsp,%rbp
   41faa:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41fae:	0f b7 05 4b 43 01 00 	movzwl 0x1434b(%rip),%eax        # 56300 <interrupts_enabled>
   41fb5:	f7 d0                	not    %eax
   41fb7:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41fbb:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41fbf:	0f b6 c0             	movzbl %al,%eax
   41fc2:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41fc9:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41fcc:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41fd0:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41fd3:	ee                   	out    %al,(%dx)
}
   41fd4:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41fd5:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41fd9:	66 c1 e8 08          	shr    $0x8,%ax
   41fdd:	0f b6 c0             	movzbl %al,%eax
   41fe0:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41fe7:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41fea:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41fee:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41ff1:	ee                   	out    %al,(%dx)
}
   41ff2:	90                   	nop
}
   41ff3:	90                   	nop
   41ff4:	c9                   	leave  
   41ff5:	c3                   	ret    

0000000000041ff6 <interrupt_init>:

void interrupt_init(void) {
   41ff6:	55                   	push   %rbp
   41ff7:	48 89 e5             	mov    %rsp,%rbp
   41ffa:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41ffe:	66 c7 05 f9 42 01 00 	movw   $0x0,0x142f9(%rip)        # 56300 <interrupts_enabled>
   42005:	00 00 
    interrupt_mask();
   42007:	e8 9a ff ff ff       	call   41fa6 <interrupt_mask>
   4200c:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   42013:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42017:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   4201b:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   4201e:	ee                   	out    %al,(%dx)
}
   4201f:	90                   	nop
   42020:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   42027:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4202b:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   4202f:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42032:	ee                   	out    %al,(%dx)
}
   42033:	90                   	nop
   42034:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   4203b:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4203f:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   42043:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   42046:	ee                   	out    %al,(%dx)
}
   42047:	90                   	nop
   42048:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   4204f:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42053:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   42057:	8b 55 bc             	mov    -0x44(%rbp),%edx
   4205a:	ee                   	out    %al,(%dx)
}
   4205b:	90                   	nop
   4205c:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   42063:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42067:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   4206b:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   4206e:	ee                   	out    %al,(%dx)
}
   4206f:	90                   	nop
   42070:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   42077:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4207b:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   4207f:	8b 55 cc             	mov    -0x34(%rbp),%edx
   42082:	ee                   	out    %al,(%dx)
}
   42083:	90                   	nop
   42084:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   4208b:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4208f:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   42093:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   42096:	ee                   	out    %al,(%dx)
}
   42097:	90                   	nop
   42098:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   4209f:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420a3:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   420a7:	8b 55 dc             	mov    -0x24(%rbp),%edx
   420aa:	ee                   	out    %al,(%dx)
}
   420ab:	90                   	nop
   420ac:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   420b3:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420b7:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   420bb:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   420be:	ee                   	out    %al,(%dx)
}
   420bf:	90                   	nop
   420c0:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   420c7:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420cb:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   420cf:	8b 55 ec             	mov    -0x14(%rbp),%edx
   420d2:	ee                   	out    %al,(%dx)
}
   420d3:	90                   	nop
   420d4:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   420db:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420df:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   420e3:	8b 55 f4             	mov    -0xc(%rbp),%edx
   420e6:	ee                   	out    %al,(%dx)
}
   420e7:	90                   	nop
   420e8:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   420ef:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420f3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   420f7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   420fa:	ee                   	out    %al,(%dx)
}
   420fb:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   420fc:	e8 a5 fe ff ff       	call   41fa6 <interrupt_mask>
}
   42101:	90                   	nop
   42102:	c9                   	leave  
   42103:	c3                   	ret    

0000000000042104 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   42104:	55                   	push   %rbp
   42105:	48 89 e5             	mov    %rsp,%rbp
   42108:	48 83 ec 28          	sub    $0x28,%rsp
   4210c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   4210f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42113:	0f 8e 9e 00 00 00    	jle    421b7 <timer_init+0xb3>
   42119:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   42120:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42124:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42128:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4212b:	ee                   	out    %al,(%dx)
}
   4212c:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   4212d:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42130:	89 c2                	mov    %eax,%edx
   42132:	c1 ea 1f             	shr    $0x1f,%edx
   42135:	01 d0                	add    %edx,%eax
   42137:	d1 f8                	sar    %eax
   42139:	05 de 34 12 00       	add    $0x1234de,%eax
   4213e:	99                   	cltd   
   4213f:	f7 7d dc             	idivl  -0x24(%rbp)
   42142:	89 c2                	mov    %eax,%edx
   42144:	89 d0                	mov    %edx,%eax
   42146:	c1 f8 1f             	sar    $0x1f,%eax
   42149:	c1 e8 18             	shr    $0x18,%eax
   4214c:	01 c2                	add    %eax,%edx
   4214e:	0f b6 d2             	movzbl %dl,%edx
   42151:	29 c2                	sub    %eax,%edx
   42153:	89 d0                	mov    %edx,%eax
   42155:	0f b6 c0             	movzbl %al,%eax
   42158:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   4215f:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42162:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42166:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42169:	ee                   	out    %al,(%dx)
}
   4216a:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   4216b:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4216e:	89 c2                	mov    %eax,%edx
   42170:	c1 ea 1f             	shr    $0x1f,%edx
   42173:	01 d0                	add    %edx,%eax
   42175:	d1 f8                	sar    %eax
   42177:	05 de 34 12 00       	add    $0x1234de,%eax
   4217c:	99                   	cltd   
   4217d:	f7 7d dc             	idivl  -0x24(%rbp)
   42180:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42186:	85 c0                	test   %eax,%eax
   42188:	0f 48 c2             	cmovs  %edx,%eax
   4218b:	c1 f8 08             	sar    $0x8,%eax
   4218e:	0f b6 c0             	movzbl %al,%eax
   42191:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   42198:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4219b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4219f:	8b 55 fc             	mov    -0x4(%rbp),%edx
   421a2:	ee                   	out    %al,(%dx)
}
   421a3:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   421a4:	0f b7 05 55 41 01 00 	movzwl 0x14155(%rip),%eax        # 56300 <interrupts_enabled>
   421ab:	83 c8 01             	or     $0x1,%eax
   421ae:	66 89 05 4b 41 01 00 	mov    %ax,0x1414b(%rip)        # 56300 <interrupts_enabled>
   421b5:	eb 11                	jmp    421c8 <timer_init+0xc4>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   421b7:	0f b7 05 42 41 01 00 	movzwl 0x14142(%rip),%eax        # 56300 <interrupts_enabled>
   421be:	83 e0 fe             	and    $0xfffffffe,%eax
   421c1:	66 89 05 38 41 01 00 	mov    %ax,0x14138(%rip)        # 56300 <interrupts_enabled>
    }
    interrupt_mask();
   421c8:	e8 d9 fd ff ff       	call   41fa6 <interrupt_mask>
}
   421cd:	90                   	nop
   421ce:	c9                   	leave  
   421cf:	c3                   	ret    

00000000000421d0 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   421d0:	55                   	push   %rbp
   421d1:	48 89 e5             	mov    %rsp,%rbp
   421d4:	48 83 ec 08          	sub    $0x8,%rsp
   421d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   421dc:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   421e1:	74 14                	je     421f7 <physical_memory_isreserved+0x27>
   421e3:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   421ea:	00 
   421eb:	76 11                	jbe    421fe <physical_memory_isreserved+0x2e>
   421ed:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   421f4:	00 
   421f5:	77 07                	ja     421fe <physical_memory_isreserved+0x2e>
   421f7:	b8 01 00 00 00       	mov    $0x1,%eax
   421fc:	eb 05                	jmp    42203 <physical_memory_isreserved+0x33>
   421fe:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42203:	c9                   	leave  
   42204:	c3                   	ret    

0000000000042205 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   42205:	55                   	push   %rbp
   42206:	48 89 e5             	mov    %rsp,%rbp
   42209:	48 83 ec 10          	sub    $0x10,%rsp
   4220d:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42210:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42213:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   42216:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42219:	c1 e0 10             	shl    $0x10,%eax
   4221c:	89 c2                	mov    %eax,%edx
   4221e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42221:	c1 e0 0b             	shl    $0xb,%eax
   42224:	09 c2                	or     %eax,%edx
   42226:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42229:	c1 e0 08             	shl    $0x8,%eax
   4222c:	09 d0                	or     %edx,%eax
}
   4222e:	c9                   	leave  
   4222f:	c3                   	ret    

0000000000042230 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   42230:	55                   	push   %rbp
   42231:	48 89 e5             	mov    %rsp,%rbp
   42234:	48 83 ec 18          	sub    $0x18,%rsp
   42238:	89 7d ec             	mov    %edi,-0x14(%rbp)
   4223b:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   4223e:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42241:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42244:	09 d0                	or     %edx,%eax
   42246:	0d 00 00 00 80       	or     $0x80000000,%eax
   4224b:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   42252:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   42255:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42258:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4225b:	ef                   	out    %eax,(%dx)
}
   4225c:	90                   	nop
   4225d:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   42264:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42267:	89 c2                	mov    %eax,%edx
   42269:	ed                   	in     (%dx),%eax
   4226a:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   4226d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   42270:	c9                   	leave  
   42271:	c3                   	ret    

0000000000042272 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   42272:	55                   	push   %rbp
   42273:	48 89 e5             	mov    %rsp,%rbp
   42276:	48 83 ec 28          	sub    $0x28,%rsp
   4227a:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4227d:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   42280:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42287:	eb 73                	jmp    422fc <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   42289:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   42290:	eb 60                	jmp    422f2 <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   42292:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42299:	eb 4a                	jmp    422e5 <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   4229b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4229e:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   422a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422a4:	89 ce                	mov    %ecx,%esi
   422a6:	89 c7                	mov    %eax,%edi
   422a8:	e8 58 ff ff ff       	call   42205 <pci_make_configaddr>
   422ad:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   422b0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   422b3:	be 00 00 00 00       	mov    $0x0,%esi
   422b8:	89 c7                	mov    %eax,%edi
   422ba:	e8 71 ff ff ff       	call   42230 <pci_config_readl>
   422bf:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   422c2:	8b 45 d8             	mov    -0x28(%rbp),%eax
   422c5:	c1 e0 10             	shl    $0x10,%eax
   422c8:	0b 45 dc             	or     -0x24(%rbp),%eax
   422cb:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   422ce:	75 05                	jne    422d5 <pci_find_device+0x63>
                    return configaddr;
   422d0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   422d3:	eb 35                	jmp    4230a <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   422d5:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   422d9:	75 06                	jne    422e1 <pci_find_device+0x6f>
   422db:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   422df:	74 0c                	je     422ed <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   422e1:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   422e5:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   422e9:	75 b0                	jne    4229b <pci_find_device+0x29>
   422eb:	eb 01                	jmp    422ee <pci_find_device+0x7c>
                    break;
   422ed:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   422ee:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   422f2:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   422f6:	75 9a                	jne    42292 <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   422f8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   422fc:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   42303:	75 84                	jne    42289 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   42305:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4230a:	c9                   	leave  
   4230b:	c3                   	ret    

000000000004230c <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   4230c:	55                   	push   %rbp
   4230d:	48 89 e5             	mov    %rsp,%rbp
   42310:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   42314:	be 13 71 00 00       	mov    $0x7113,%esi
   42319:	bf 86 80 00 00       	mov    $0x8086,%edi
   4231e:	e8 4f ff ff ff       	call   42272 <pci_find_device>
   42323:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42326:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   4232a:	78 30                	js     4235c <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   4232c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4232f:	be 40 00 00 00       	mov    $0x40,%esi
   42334:	89 c7                	mov    %eax,%edi
   42336:	e8 f5 fe ff ff       	call   42230 <pci_config_readl>
   4233b:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42340:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42343:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42346:	83 c0 04             	add    $0x4,%eax
   42349:	89 45 f4             	mov    %eax,-0xc(%rbp)
   4234c:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42352:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42356:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42359:	66 ef                	out    %ax,(%dx)
}
   4235b:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4235c:	ba 00 4b 04 00       	mov    $0x44b00,%edx
   42361:	be 00 c0 00 00       	mov    $0xc000,%esi
   42366:	bf 80 07 00 00       	mov    $0x780,%edi
   4236b:	b8 00 00 00 00       	mov    $0x0,%eax
   42370:	e8 b4 21 00 00       	call   44529 <console_printf>
 spinloop: goto spinloop;
   42375:	eb fe                	jmp    42375 <poweroff+0x69>

0000000000042377 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   42377:	55                   	push   %rbp
   42378:	48 89 e5             	mov    %rsp,%rbp
   4237b:	48 83 ec 10          	sub    $0x10,%rsp
   4237f:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   42386:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4238a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4238e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42391:	ee                   	out    %al,(%dx)
}
   42392:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   42393:	eb fe                	jmp    42393 <reboot+0x1c>

0000000000042395 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   42395:	55                   	push   %rbp
   42396:	48 89 e5             	mov    %rsp,%rbp
   42399:	48 83 ec 10          	sub    $0x10,%rsp
   4239d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   423a1:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   423a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423a8:	48 83 c0 08          	add    $0x8,%rax
   423ac:	ba c0 00 00 00       	mov    $0xc0,%edx
   423b1:	be 00 00 00 00       	mov    $0x0,%esi
   423b6:	48 89 c7             	mov    %rax,%rdi
   423b9:	e8 b4 13 00 00       	call   43772 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   423be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423c2:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   423c9:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   423cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423cf:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   423d6:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   423da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423de:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   423e5:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   423e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423ed:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   423f4:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   423f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423fa:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42401:	00 02 00 00 
    p->display_status = 1;
   42405:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42409:	c6 80 d8 00 00 00 01 	movb   $0x1,0xd8(%rax)

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42410:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42413:	83 e0 01             	and    $0x1,%eax
   42416:	85 c0                	test   %eax,%eax
   42418:	74 1c                	je     42436 <process_init+0xa1>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   4241a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4241e:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42425:	80 cc 30             	or     $0x30,%ah
   42428:	48 89 c2             	mov    %rax,%rdx
   4242b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4242f:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42436:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42439:	83 e0 02             	and    $0x2,%eax
   4243c:	85 c0                	test   %eax,%eax
   4243e:	74 1c                	je     4245c <process_init+0xc7>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42440:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42444:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   4244b:	80 e4 fd             	and    $0xfd,%ah
   4244e:	48 89 c2             	mov    %rax,%rdx
   42451:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42455:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   4245c:	90                   	nop
   4245d:	c9                   	leave  
   4245e:	c3                   	ret    

000000000004245f <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   4245f:	55                   	push   %rbp
   42460:	48 89 e5             	mov    %rsp,%rbp
   42463:	48 83 ec 28          	sub    $0x28,%rsp
   42467:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4246a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   4246e:	78 09                	js     42479 <console_show_cursor+0x1a>
   42470:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42477:	7e 07                	jle    42480 <console_show_cursor+0x21>
        cpos = 0;
   42479:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42480:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   42487:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4248b:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   4248f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42492:	ee                   	out    %al,(%dx)
}
   42493:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42494:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42497:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   4249d:	85 c0                	test   %eax,%eax
   4249f:	0f 48 c2             	cmovs  %edx,%eax
   424a2:	c1 f8 08             	sar    $0x8,%eax
   424a5:	0f b6 c0             	movzbl %al,%eax
   424a8:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   424af:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424b2:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   424b6:	8b 55 ec             	mov    -0x14(%rbp),%edx
   424b9:	ee                   	out    %al,(%dx)
}
   424ba:	90                   	nop
   424bb:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   424c2:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424c6:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   424ca:	8b 55 f4             	mov    -0xc(%rbp),%edx
   424cd:	ee                   	out    %al,(%dx)
}
   424ce:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   424cf:	8b 55 dc             	mov    -0x24(%rbp),%edx
   424d2:	89 d0                	mov    %edx,%eax
   424d4:	c1 f8 1f             	sar    $0x1f,%eax
   424d7:	c1 e8 18             	shr    $0x18,%eax
   424da:	01 c2                	add    %eax,%edx
   424dc:	0f b6 d2             	movzbl %dl,%edx
   424df:	29 c2                	sub    %eax,%edx
   424e1:	89 d0                	mov    %edx,%eax
   424e3:	0f b6 c0             	movzbl %al,%eax
   424e6:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   424ed:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424f0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   424f4:	8b 55 fc             	mov    -0x4(%rbp),%edx
   424f7:	ee                   	out    %al,(%dx)
}
   424f8:	90                   	nop
}
   424f9:	90                   	nop
   424fa:	c9                   	leave  
   424fb:	c3                   	ret    

00000000000424fc <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   424fc:	55                   	push   %rbp
   424fd:	48 89 e5             	mov    %rsp,%rbp
   42500:	48 83 ec 20          	sub    $0x20,%rsp
   42504:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4250b:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4250e:	89 c2                	mov    %eax,%edx
   42510:	ec                   	in     (%dx),%al
   42511:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42514:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42518:	0f b6 c0             	movzbl %al,%eax
   4251b:	83 e0 01             	and    $0x1,%eax
   4251e:	85 c0                	test   %eax,%eax
   42520:	75 0a                	jne    4252c <keyboard_readc+0x30>
        return -1;
   42522:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42527:	e9 e7 01 00 00       	jmp    42713 <keyboard_readc+0x217>
   4252c:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42533:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42536:	89 c2                	mov    %eax,%edx
   42538:	ec                   	in     (%dx),%al
   42539:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   4253c:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   42540:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42543:	0f b6 05 b8 3d 01 00 	movzbl 0x13db8(%rip),%eax        # 56302 <last_escape.2>
   4254a:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   4254d:	c6 05 ae 3d 01 00 00 	movb   $0x0,0x13dae(%rip)        # 56302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42554:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42558:	75 11                	jne    4256b <keyboard_readc+0x6f>
        last_escape = 0x80;
   4255a:	c6 05 a1 3d 01 00 80 	movb   $0x80,0x13da1(%rip)        # 56302 <last_escape.2>
        return 0;
   42561:	b8 00 00 00 00       	mov    $0x0,%eax
   42566:	e9 a8 01 00 00       	jmp    42713 <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   4256b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4256f:	84 c0                	test   %al,%al
   42571:	79 60                	jns    425d3 <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   42573:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42577:	83 e0 7f             	and    $0x7f,%eax
   4257a:	89 c2                	mov    %eax,%edx
   4257c:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   42580:	09 d0                	or     %edx,%eax
   42582:	48 98                	cltq   
   42584:	0f b6 80 20 4b 04 00 	movzbl 0x44b20(%rax),%eax
   4258b:	0f b6 c0             	movzbl %al,%eax
   4258e:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42591:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42598:	7e 2f                	jle    425c9 <keyboard_readc+0xcd>
   4259a:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   425a1:	7f 26                	jg     425c9 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   425a3:	8b 45 f4             	mov    -0xc(%rbp),%eax
   425a6:	2d fa 00 00 00       	sub    $0xfa,%eax
   425ab:	ba 01 00 00 00       	mov    $0x1,%edx
   425b0:	89 c1                	mov    %eax,%ecx
   425b2:	d3 e2                	shl    %cl,%edx
   425b4:	89 d0                	mov    %edx,%eax
   425b6:	f7 d0                	not    %eax
   425b8:	89 c2                	mov    %eax,%edx
   425ba:	0f b6 05 42 3d 01 00 	movzbl 0x13d42(%rip),%eax        # 56303 <modifiers.1>
   425c1:	21 d0                	and    %edx,%eax
   425c3:	88 05 3a 3d 01 00    	mov    %al,0x13d3a(%rip)        # 56303 <modifiers.1>
        }
        return 0;
   425c9:	b8 00 00 00 00       	mov    $0x0,%eax
   425ce:	e9 40 01 00 00       	jmp    42713 <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   425d3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   425d7:	0a 45 fa             	or     -0x6(%rbp),%al
   425da:	0f b6 c0             	movzbl %al,%eax
   425dd:	48 98                	cltq   
   425df:	0f b6 80 20 4b 04 00 	movzbl 0x44b20(%rax),%eax
   425e6:	0f b6 c0             	movzbl %al,%eax
   425e9:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   425ec:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   425f0:	7e 57                	jle    42649 <keyboard_readc+0x14d>
   425f2:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   425f6:	7f 51                	jg     42649 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   425f8:	0f b6 05 04 3d 01 00 	movzbl 0x13d04(%rip),%eax        # 56303 <modifiers.1>
   425ff:	0f b6 c0             	movzbl %al,%eax
   42602:	83 e0 02             	and    $0x2,%eax
   42605:	85 c0                	test   %eax,%eax
   42607:	74 09                	je     42612 <keyboard_readc+0x116>
            ch -= 0x60;
   42609:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   4260d:	e9 fd 00 00 00       	jmp    4270f <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42612:	0f b6 05 ea 3c 01 00 	movzbl 0x13cea(%rip),%eax        # 56303 <modifiers.1>
   42619:	0f b6 c0             	movzbl %al,%eax
   4261c:	83 e0 01             	and    $0x1,%eax
   4261f:	85 c0                	test   %eax,%eax
   42621:	0f 94 c2             	sete   %dl
   42624:	0f b6 05 d8 3c 01 00 	movzbl 0x13cd8(%rip),%eax        # 56303 <modifiers.1>
   4262b:	0f b6 c0             	movzbl %al,%eax
   4262e:	83 e0 08             	and    $0x8,%eax
   42631:	85 c0                	test   %eax,%eax
   42633:	0f 94 c0             	sete   %al
   42636:	31 d0                	xor    %edx,%eax
   42638:	84 c0                	test   %al,%al
   4263a:	0f 84 cf 00 00 00    	je     4270f <keyboard_readc+0x213>
            ch -= 0x20;
   42640:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42644:	e9 c6 00 00 00       	jmp    4270f <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42649:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42650:	7e 30                	jle    42682 <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42652:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42655:	2d fa 00 00 00       	sub    $0xfa,%eax
   4265a:	ba 01 00 00 00       	mov    $0x1,%edx
   4265f:	89 c1                	mov    %eax,%ecx
   42661:	d3 e2                	shl    %cl,%edx
   42663:	89 d0                	mov    %edx,%eax
   42665:	89 c2                	mov    %eax,%edx
   42667:	0f b6 05 95 3c 01 00 	movzbl 0x13c95(%rip),%eax        # 56303 <modifiers.1>
   4266e:	31 d0                	xor    %edx,%eax
   42670:	88 05 8d 3c 01 00    	mov    %al,0x13c8d(%rip)        # 56303 <modifiers.1>
        ch = 0;
   42676:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4267d:	e9 8e 00 00 00       	jmp    42710 <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   42682:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42689:	7e 2d                	jle    426b8 <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   4268b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4268e:	2d fa 00 00 00       	sub    $0xfa,%eax
   42693:	ba 01 00 00 00       	mov    $0x1,%edx
   42698:	89 c1                	mov    %eax,%ecx
   4269a:	d3 e2                	shl    %cl,%edx
   4269c:	89 d0                	mov    %edx,%eax
   4269e:	89 c2                	mov    %eax,%edx
   426a0:	0f b6 05 5c 3c 01 00 	movzbl 0x13c5c(%rip),%eax        # 56303 <modifiers.1>
   426a7:	09 d0                	or     %edx,%eax
   426a9:	88 05 54 3c 01 00    	mov    %al,0x13c54(%rip)        # 56303 <modifiers.1>
        ch = 0;
   426af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   426b6:	eb 58                	jmp    42710 <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   426b8:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   426bc:	7e 31                	jle    426ef <keyboard_readc+0x1f3>
   426be:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   426c5:	7f 28                	jg     426ef <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   426c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   426ca:	8d 50 80             	lea    -0x80(%rax),%edx
   426cd:	0f b6 05 2f 3c 01 00 	movzbl 0x13c2f(%rip),%eax        # 56303 <modifiers.1>
   426d4:	0f b6 c0             	movzbl %al,%eax
   426d7:	83 e0 03             	and    $0x3,%eax
   426da:	48 98                	cltq   
   426dc:	48 63 d2             	movslq %edx,%rdx
   426df:	0f b6 84 90 20 4c 04 	movzbl 0x44c20(%rax,%rdx,4),%eax
   426e6:	00 
   426e7:	0f b6 c0             	movzbl %al,%eax
   426ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
   426ed:	eb 21                	jmp    42710 <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   426ef:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   426f3:	7f 1b                	jg     42710 <keyboard_readc+0x214>
   426f5:	0f b6 05 07 3c 01 00 	movzbl 0x13c07(%rip),%eax        # 56303 <modifiers.1>
   426fc:	0f b6 c0             	movzbl %al,%eax
   426ff:	83 e0 02             	and    $0x2,%eax
   42702:	85 c0                	test   %eax,%eax
   42704:	74 0a                	je     42710 <keyboard_readc+0x214>
        ch = 0;
   42706:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4270d:	eb 01                	jmp    42710 <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   4270f:	90                   	nop
    }

    return ch;
   42710:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42713:	c9                   	leave  
   42714:	c3                   	ret    

0000000000042715 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   42715:	55                   	push   %rbp
   42716:	48 89 e5             	mov    %rsp,%rbp
   42719:	48 83 ec 20          	sub    $0x20,%rsp
   4271d:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42724:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42727:	89 c2                	mov    %eax,%edx
   42729:	ec                   	in     (%dx),%al
   4272a:	88 45 e3             	mov    %al,-0x1d(%rbp)
   4272d:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42734:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42737:	89 c2                	mov    %eax,%edx
   42739:	ec                   	in     (%dx),%al
   4273a:	88 45 eb             	mov    %al,-0x15(%rbp)
   4273d:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42744:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42747:	89 c2                	mov    %eax,%edx
   42749:	ec                   	in     (%dx),%al
   4274a:	88 45 f3             	mov    %al,-0xd(%rbp)
   4274d:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42754:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42757:	89 c2                	mov    %eax,%edx
   42759:	ec                   	in     (%dx),%al
   4275a:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   4275d:	90                   	nop
   4275e:	c9                   	leave  
   4275f:	c3                   	ret    

0000000000042760 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42760:	55                   	push   %rbp
   42761:	48 89 e5             	mov    %rsp,%rbp
   42764:	48 83 ec 40          	sub    $0x40,%rsp
   42768:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4276c:	89 f0                	mov    %esi,%eax
   4276e:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42771:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42774:	8b 05 8a 3b 01 00    	mov    0x13b8a(%rip),%eax        # 56304 <initialized.0>
   4277a:	85 c0                	test   %eax,%eax
   4277c:	75 1e                	jne    4279c <parallel_port_putc+0x3c>
   4277e:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42785:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42789:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4278d:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42790:	ee                   	out    %al,(%dx)
}
   42791:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   42792:	c7 05 68 3b 01 00 01 	movl   $0x1,0x13b68(%rip)        # 56304 <initialized.0>
   42799:	00 00 00 
    }

    for (int i = 0;
   4279c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   427a3:	eb 09                	jmp    427ae <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   427a5:	e8 6b ff ff ff       	call   42715 <delay>
         ++i) {
   427aa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   427ae:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   427b5:	7f 18                	jg     427cf <parallel_port_putc+0x6f>
   427b7:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   427be:	8b 45 f0             	mov    -0x10(%rbp),%eax
   427c1:	89 c2                	mov    %eax,%edx
   427c3:	ec                   	in     (%dx),%al
   427c4:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   427c7:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   427cb:	84 c0                	test   %al,%al
   427cd:	79 d6                	jns    427a5 <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   427cf:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   427d3:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   427da:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427dd:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   427e1:	8b 55 d8             	mov    -0x28(%rbp),%edx
   427e4:	ee                   	out    %al,(%dx)
}
   427e5:	90                   	nop
   427e6:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   427ed:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427f1:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   427f5:	8b 55 e0             	mov    -0x20(%rbp),%edx
   427f8:	ee                   	out    %al,(%dx)
}
   427f9:	90                   	nop
   427fa:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   42801:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42805:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42809:	8b 55 e8             	mov    -0x18(%rbp),%edx
   4280c:	ee                   	out    %al,(%dx)
}
   4280d:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   4280e:	90                   	nop
   4280f:	c9                   	leave  
   42810:	c3                   	ret    

0000000000042811 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   42811:	55                   	push   %rbp
   42812:	48 89 e5             	mov    %rsp,%rbp
   42815:	48 83 ec 20          	sub    $0x20,%rsp
   42819:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4281d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42821:	48 c7 45 f8 60 27 04 	movq   $0x42760,-0x8(%rbp)
   42828:	00 
    printer_vprintf(&p, 0, format, val);
   42829:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   4282d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42831:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42835:	be 00 00 00 00       	mov    $0x0,%esi
   4283a:	48 89 c7             	mov    %rax,%rdi
   4283d:	e8 cc 11 00 00       	call   43a0e <printer_vprintf>
}
   42842:	90                   	nop
   42843:	c9                   	leave  
   42844:	c3                   	ret    

0000000000042845 <log_printf>:

void log_printf(const char* format, ...) {
   42845:	55                   	push   %rbp
   42846:	48 89 e5             	mov    %rsp,%rbp
   42849:	48 83 ec 60          	sub    $0x60,%rsp
   4284d:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42851:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42855:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42859:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4285d:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42861:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42865:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4286c:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42870:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42874:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42878:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   4287c:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   42880:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42884:	48 89 d6             	mov    %rdx,%rsi
   42887:	48 89 c7             	mov    %rax,%rdi
   4288a:	e8 82 ff ff ff       	call   42811 <log_vprintf>
    va_end(val);
}
   4288f:	90                   	nop
   42890:	c9                   	leave  
   42891:	c3                   	ret    

0000000000042892 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42892:	55                   	push   %rbp
   42893:	48 89 e5             	mov    %rsp,%rbp
   42896:	48 83 ec 40          	sub    $0x40,%rsp
   4289a:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4289d:	89 75 d8             	mov    %esi,-0x28(%rbp)
   428a0:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   428a4:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   428a8:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   428ac:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   428b0:	48 8b 0a             	mov    (%rdx),%rcx
   428b3:	48 89 08             	mov    %rcx,(%rax)
   428b6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   428ba:	48 89 48 08          	mov    %rcx,0x8(%rax)
   428be:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   428c2:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   428c6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   428ca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   428ce:	48 89 d6             	mov    %rdx,%rsi
   428d1:	48 89 c7             	mov    %rax,%rdi
   428d4:	e8 38 ff ff ff       	call   42811 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   428d9:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   428dd:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   428e1:	8b 75 d8             	mov    -0x28(%rbp),%esi
   428e4:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428e7:	89 c7                	mov    %eax,%edi
   428e9:	e8 cf 1b 00 00       	call   444bd <console_vprintf>
}
   428ee:	c9                   	leave  
   428ef:	c3                   	ret    

00000000000428f0 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   428f0:	55                   	push   %rbp
   428f1:	48 89 e5             	mov    %rsp,%rbp
   428f4:	48 83 ec 60          	sub    $0x60,%rsp
   428f8:	89 7d ac             	mov    %edi,-0x54(%rbp)
   428fb:	89 75 a8             	mov    %esi,-0x58(%rbp)
   428fe:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   42902:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42906:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4290a:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4290e:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42915:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42919:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4291d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42921:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42925:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42929:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   4292d:	8b 75 a8             	mov    -0x58(%rbp),%esi
   42930:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42933:	89 c7                	mov    %eax,%edi
   42935:	e8 58 ff ff ff       	call   42892 <error_vprintf>
   4293a:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   4293d:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   42940:	c9                   	leave  
   42941:	c3                   	ret    

0000000000042942 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42942:	55                   	push   %rbp
   42943:	48 89 e5             	mov    %rsp,%rbp
   42946:	53                   	push   %rbx
   42947:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   4294b:	e8 ac fb ff ff       	call   424fc <keyboard_readc>
   42950:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42953:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42957:	74 1c                	je     42975 <check_keyboard+0x33>
   42959:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   4295d:	74 16                	je     42975 <check_keyboard+0x33>
   4295f:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42963:	74 10                	je     42975 <check_keyboard+0x33>
   42965:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42969:	74 0a                	je     42975 <check_keyboard+0x33>
   4296b:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4296f:	0f 85 e9 00 00 00    	jne    42a5e <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42975:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   4297c:	00 
        memset(pt, 0, PAGESIZE * 3);
   4297d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42981:	ba 00 30 00 00       	mov    $0x3000,%edx
   42986:	be 00 00 00 00       	mov    $0x0,%esi
   4298b:	48 89 c7             	mov    %rax,%rdi
   4298e:	e8 df 0d 00 00       	call   43772 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42993:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42997:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   4299e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   429a2:	48 05 00 10 00 00    	add    $0x1000,%rax
   429a8:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   429af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   429b3:	48 05 00 20 00 00    	add    $0x2000,%rax
   429b9:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   429c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   429c4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   429c8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   429cc:	0f 22 d8             	mov    %rax,%cr3
}
   429cf:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   429d0:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   429d7:	48 c7 45 e8 78 4c 04 	movq   $0x44c78,-0x18(%rbp)
   429de:	00 
        if (c == 'a') {
   429df:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   429e3:	75 0a                	jne    429ef <check_keyboard+0xad>
            argument = "allocator";
   429e5:	48 c7 45 e8 7d 4c 04 	movq   $0x44c7d,-0x18(%rbp)
   429ec:	00 
   429ed:	eb 2e                	jmp    42a1d <check_keyboard+0xdb>
        } else if (c == 'e') {
   429ef:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   429f3:	75 0a                	jne    429ff <check_keyboard+0xbd>
            argument = "forkexit";
   429f5:	48 c7 45 e8 87 4c 04 	movq   $0x44c87,-0x18(%rbp)
   429fc:	00 
   429fd:	eb 1e                	jmp    42a1d <check_keyboard+0xdb>
        }
        else if (c == 't'){
   429ff:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42a03:	75 0a                	jne    42a0f <check_keyboard+0xcd>
            argument = "test";
   42a05:	48 c7 45 e8 90 4c 04 	movq   $0x44c90,-0x18(%rbp)
   42a0c:	00 
   42a0d:	eb 0e                	jmp    42a1d <check_keyboard+0xdb>
        }
        else if(c == '2'){
   42a0f:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42a13:	75 08                	jne    42a1d <check_keyboard+0xdb>
            argument = "test2";
   42a15:	48 c7 45 e8 95 4c 04 	movq   $0x44c95,-0x18(%rbp)
   42a1c:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   42a1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42a21:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   42a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42a2a:	48 3b 45 d0          	cmp    -0x30(%rbp),%rax
   42a2e:	73 14                	jae    42a44 <check_keyboard+0x102>
   42a30:	ba 9b 4c 04 00       	mov    $0x44c9b,%edx
   42a35:	be 5d 02 00 00       	mov    $0x25d,%esi
   42a3a:	bf b7 4c 04 00       	mov    $0x44cb7,%edi
   42a3f:	e8 1f 01 00 00       	call   42b63 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42a44:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42a48:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42a4b:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   42a4f:	48 89 c3             	mov    %rax,%rbx
   42a52:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42a57:	e9 a4 d5 ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42a5c:	eb 11                	jmp    42a6f <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   42a5e:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   42a62:	74 06                	je     42a6a <check_keyboard+0x128>
   42a64:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42a68:	75 05                	jne    42a6f <check_keyboard+0x12d>
        poweroff();
   42a6a:	e8 9d f8 ff ff       	call   4230c <poweroff>
    }
    return c;
   42a6f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   42a72:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42a76:	c9                   	leave  
   42a77:	c3                   	ret    

0000000000042a78 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42a78:	55                   	push   %rbp
   42a79:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   42a7c:	e8 c1 fe ff ff       	call   42942 <check_keyboard>
   42a81:	eb f9                	jmp    42a7c <fail+0x4>

0000000000042a83 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42a83:	55                   	push   %rbp
   42a84:	48 89 e5             	mov    %rsp,%rbp
   42a87:	48 83 ec 60          	sub    $0x60,%rsp
   42a8b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42a8f:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42a93:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42a97:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42a9b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42a9f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42aa3:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42aaa:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42aae:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42ab2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42ab6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42aba:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   42abf:	0f 84 80 00 00 00    	je     42b45 <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42ac5:	ba cb 4c 04 00       	mov    $0x44ccb,%edx
   42aca:	be 00 c0 00 00       	mov    $0xc000,%esi
   42acf:	bf 30 07 00 00       	mov    $0x730,%edi
   42ad4:	b8 00 00 00 00       	mov    $0x0,%eax
   42ad9:	e8 12 fe ff ff       	call   428f0 <error_printf>
   42ade:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   42ae1:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42ae5:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42ae9:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42aec:	be 00 c0 00 00       	mov    $0xc000,%esi
   42af1:	89 c7                	mov    %eax,%edi
   42af3:	e8 9a fd ff ff       	call   42892 <error_vprintf>
   42af8:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42afb:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   42afe:	48 63 c1             	movslq %ecx,%rax
   42b01:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42b08:	48 c1 e8 20          	shr    $0x20,%rax
   42b0c:	89 c2                	mov    %eax,%edx
   42b0e:	c1 fa 05             	sar    $0x5,%edx
   42b11:	89 c8                	mov    %ecx,%eax
   42b13:	c1 f8 1f             	sar    $0x1f,%eax
   42b16:	29 c2                	sub    %eax,%edx
   42b18:	89 d0                	mov    %edx,%eax
   42b1a:	c1 e0 02             	shl    $0x2,%eax
   42b1d:	01 d0                	add    %edx,%eax
   42b1f:	c1 e0 04             	shl    $0x4,%eax
   42b22:	29 c1                	sub    %eax,%ecx
   42b24:	89 ca                	mov    %ecx,%edx
   42b26:	85 d2                	test   %edx,%edx
   42b28:	74 34                	je     42b5e <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   42b2a:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42b2d:	ba d3 4c 04 00       	mov    $0x44cd3,%edx
   42b32:	be 00 c0 00 00       	mov    $0xc000,%esi
   42b37:	89 c7                	mov    %eax,%edi
   42b39:	b8 00 00 00 00       	mov    $0x0,%eax
   42b3e:	e8 ad fd ff ff       	call   428f0 <error_printf>
   42b43:	eb 19                	jmp    42b5e <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42b45:	ba d5 4c 04 00       	mov    $0x44cd5,%edx
   42b4a:	be 00 c0 00 00       	mov    $0xc000,%esi
   42b4f:	bf 30 07 00 00       	mov    $0x730,%edi
   42b54:	b8 00 00 00 00       	mov    $0x0,%eax
   42b59:	e8 92 fd ff ff       	call   428f0 <error_printf>
    }

    va_end(val);
    fail();
   42b5e:	e8 15 ff ff ff       	call   42a78 <fail>

0000000000042b63 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42b63:	55                   	push   %rbp
   42b64:	48 89 e5             	mov    %rsp,%rbp
   42b67:	48 83 ec 20          	sub    $0x20,%rsp
   42b6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42b6f:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42b72:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42b76:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42b7a:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42b7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b81:	48 89 c6             	mov    %rax,%rsi
   42b84:	bf db 4c 04 00       	mov    $0x44cdb,%edi
   42b89:	b8 00 00 00 00       	mov    $0x0,%eax
   42b8e:	e8 f0 fe ff ff       	call   42a83 <panic>

0000000000042b93 <default_exception>:
}

void default_exception(proc* p){
   42b93:	55                   	push   %rbp
   42b94:	48 89 e5             	mov    %rsp,%rbp
   42b97:	48 83 ec 20          	sub    $0x20,%rsp
   42b9b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   42b9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ba3:	48 83 c0 08          	add    $0x8,%rax
   42ba7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42baf:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42bb6:	48 89 c6             	mov    %rax,%rsi
   42bb9:	bf f9 4c 04 00       	mov    $0x44cf9,%edi
   42bbe:	b8 00 00 00 00       	mov    $0x0,%eax
   42bc3:	e8 bb fe ff ff       	call   42a83 <panic>

0000000000042bc8 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42bc8:	55                   	push   %rbp
   42bc9:	48 89 e5             	mov    %rsp,%rbp
   42bcc:	48 83 ec 10          	sub    $0x10,%rsp
   42bd0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42bd4:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42bd7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42bdb:	78 06                	js     42be3 <pageindex+0x1b>
   42bdd:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   42be1:	7e 14                	jle    42bf7 <pageindex+0x2f>
   42be3:	ba 18 4d 04 00       	mov    $0x44d18,%edx
   42be8:	be 1e 00 00 00       	mov    $0x1e,%esi
   42bed:	bf 31 4d 04 00       	mov    $0x44d31,%edi
   42bf2:	e8 6c ff ff ff       	call   42b63 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42bf7:	b8 03 00 00 00       	mov    $0x3,%eax
   42bfc:	2b 45 f4             	sub    -0xc(%rbp),%eax
   42bff:	89 c2                	mov    %eax,%edx
   42c01:	89 d0                	mov    %edx,%eax
   42c03:	c1 e0 03             	shl    $0x3,%eax
   42c06:	01 d0                	add    %edx,%eax
   42c08:	83 c0 0c             	add    $0xc,%eax
   42c0b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42c0f:	89 c1                	mov    %eax,%ecx
   42c11:	48 d3 ea             	shr    %cl,%rdx
   42c14:	48 89 d0             	mov    %rdx,%rax
   42c17:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   42c1c:	c9                   	leave  
   42c1d:	c3                   	ret    

0000000000042c1e <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   42c1e:	55                   	push   %rbp
   42c1f:	48 89 e5             	mov    %rsp,%rbp
   42c22:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   42c26:	48 c7 05 cf 43 01 00 	movq   $0x58000,0x143cf(%rip)        # 57000 <kernel_pagetable>
   42c2d:	00 80 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   42c31:	ba 00 50 00 00       	mov    $0x5000,%edx
   42c36:	be 00 00 00 00       	mov    $0x0,%esi
   42c3b:	bf 00 80 05 00       	mov    $0x58000,%edi
   42c40:	e8 2d 0b 00 00       	call   43772 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   42c45:	b8 00 90 05 00       	mov    $0x59000,%eax
   42c4a:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   42c4e:	48 89 05 ab 53 01 00 	mov    %rax,0x153ab(%rip)        # 58000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   42c55:	b8 00 a0 05 00       	mov    $0x5a000,%eax
   42c5a:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   42c5e:	48 89 05 9b 63 01 00 	mov    %rax,0x1639b(%rip)        # 59000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42c65:	b8 00 b0 05 00       	mov    $0x5b000,%eax
   42c6a:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   42c6e:	48 89 05 8b 73 01 00 	mov    %rax,0x1738b(%rip)        # 5a000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42c75:	b8 00 c0 05 00       	mov    $0x5c000,%eax
   42c7a:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   42c7e:	48 89 05 83 73 01 00 	mov    %rax,0x17383(%rip)        # 5a008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   42c85:	48 8b 05 74 43 01 00 	mov    0x14374(%rip),%rax        # 57000 <kernel_pagetable>
   42c8c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   42c92:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42c97:	ba 00 00 00 00       	mov    $0x0,%edx
   42c9c:	be 00 00 00 00       	mov    $0x0,%esi
   42ca1:	48 89 c7             	mov    %rax,%rdi
   42ca4:	e8 b9 01 00 00       	call   42e62 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42ca9:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   42cb0:	00 
   42cb1:	eb 62                	jmp    42d15 <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   42cb3:	48 8b 0d 46 43 01 00 	mov    0x14346(%rip),%rcx        # 57000 <kernel_pagetable>
   42cba:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42cbe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42cc2:	48 89 ce             	mov    %rcx,%rsi
   42cc5:	48 89 c7             	mov    %rax,%rdi
   42cc8:	e8 50 05 00 00       	call   4321d <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l1pagetable ?
        assert(vmap.pa == addr);
   42ccd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42cd1:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42cd5:	74 14                	je     42ceb <virtual_memory_init+0xcd>
   42cd7:	ba 45 4d 04 00       	mov    $0x44d45,%edx
   42cdc:	be 2d 00 00 00       	mov    $0x2d,%esi
   42ce1:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42ce6:	e8 78 fe ff ff       	call   42b63 <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   42ceb:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42cee:	48 98                	cltq   
   42cf0:	83 e0 03             	and    $0x3,%eax
   42cf3:	48 83 f8 03          	cmp    $0x3,%rax
   42cf7:	74 14                	je     42d0d <virtual_memory_init+0xef>
   42cf9:	ba 68 4d 04 00       	mov    $0x44d68,%edx
   42cfe:	be 2e 00 00 00       	mov    $0x2e,%esi
   42d03:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42d08:	e8 56 fe ff ff       	call   42b63 <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42d0d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42d14:	00 
   42d15:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   42d1c:	00 
   42d1d:	76 94                	jbe    42cb3 <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   42d1f:	48 8b 05 da 42 01 00 	mov    0x142da(%rip),%rax        # 57000 <kernel_pagetable>
   42d26:	48 89 c7             	mov    %rax,%rdi
   42d29:	e8 03 00 00 00       	call   42d31 <set_pagetable>
}
   42d2e:	90                   	nop
   42d2f:	c9                   	leave  
   42d30:	c3                   	ret    

0000000000042d31 <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   42d31:	55                   	push   %rbp
   42d32:	48 89 e5             	mov    %rsp,%rbp
   42d35:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42d39:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42d3d:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42d41:	25 ff 0f 00 00       	and    $0xfff,%eax
   42d46:	48 85 c0             	test   %rax,%rax
   42d49:	74 14                	je     42d5f <set_pagetable+0x2e>
   42d4b:	ba 95 4d 04 00       	mov    $0x44d95,%edx
   42d50:	be 3d 00 00 00       	mov    $0x3d,%esi
   42d55:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42d5a:	e8 04 fe ff ff       	call   42b63 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   42d5f:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42d64:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   42d68:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42d6c:	48 89 ce             	mov    %rcx,%rsi
   42d6f:	48 89 c7             	mov    %rax,%rdi
   42d72:	e8 a6 04 00 00       	call   4321d <virtual_memory_lookup>
   42d77:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42d7b:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42d80:	48 39 d0             	cmp    %rdx,%rax
   42d83:	74 14                	je     42d99 <set_pagetable+0x68>
   42d85:	ba b0 4d 04 00       	mov    $0x44db0,%edx
   42d8a:	be 3f 00 00 00       	mov    $0x3f,%esi
   42d8f:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42d94:	e8 ca fd ff ff       	call   42b63 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   42d99:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   42d9d:	48 8b 0d 5c 42 01 00 	mov    0x1425c(%rip),%rcx        # 57000 <kernel_pagetable>
   42da4:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42da8:	48 89 ce             	mov    %rcx,%rsi
   42dab:	48 89 c7             	mov    %rax,%rdi
   42dae:	e8 6a 04 00 00       	call   4321d <virtual_memory_lookup>
   42db3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42db7:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42dbb:	48 39 c2             	cmp    %rax,%rdx
   42dbe:	74 14                	je     42dd4 <set_pagetable+0xa3>
   42dc0:	ba 18 4e 04 00       	mov    $0x44e18,%edx
   42dc5:	be 41 00 00 00       	mov    $0x41,%esi
   42dca:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42dcf:	e8 8f fd ff ff       	call   42b63 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42dd4:	48 8b 05 25 42 01 00 	mov    0x14225(%rip),%rax        # 57000 <kernel_pagetable>
   42ddb:	48 89 c2             	mov    %rax,%rdx
   42dde:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42de2:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42de6:	48 89 ce             	mov    %rcx,%rsi
   42de9:	48 89 c7             	mov    %rax,%rdi
   42dec:	e8 2c 04 00 00       	call   4321d <virtual_memory_lookup>
   42df1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42df5:	48 8b 15 04 42 01 00 	mov    0x14204(%rip),%rdx        # 57000 <kernel_pagetable>
   42dfc:	48 39 d0             	cmp    %rdx,%rax
   42dff:	74 14                	je     42e15 <set_pagetable+0xe4>
   42e01:	ba 78 4e 04 00       	mov    $0x44e78,%edx
   42e06:	be 43 00 00 00       	mov    $0x43,%esi
   42e0b:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42e10:	e8 4e fd ff ff       	call   42b63 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   42e15:	ba 62 2e 04 00       	mov    $0x42e62,%edx
   42e1a:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42e1e:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42e22:	48 89 ce             	mov    %rcx,%rsi
   42e25:	48 89 c7             	mov    %rax,%rdi
   42e28:	e8 f0 03 00 00       	call   4321d <virtual_memory_lookup>
   42e2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e31:	ba 62 2e 04 00       	mov    $0x42e62,%edx
   42e36:	48 39 d0             	cmp    %rdx,%rax
   42e39:	74 14                	je     42e4f <set_pagetable+0x11e>
   42e3b:	ba e0 4e 04 00       	mov    $0x44ee0,%edx
   42e40:	be 45 00 00 00       	mov    $0x45,%esi
   42e45:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42e4a:	e8 14 fd ff ff       	call   42b63 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   42e4f:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42e53:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42e57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42e5b:	0f 22 d8             	mov    %rax,%cr3
}
   42e5e:	90                   	nop
}
   42e5f:	90                   	nop
   42e60:	c9                   	leave  
   42e61:	c3                   	ret    

0000000000042e62 <virtual_memory_map>:
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l1pagetable(x86_64_pagetable* pagetable,
                 uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm) {
   42e62:	55                   	push   %rbp
   42e63:	48 89 e5             	mov    %rsp,%rbp
   42e66:	53                   	push   %rbx
   42e67:	48 83 ec 58          	sub    $0x58,%rsp
   42e6b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42e6f:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42e73:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42e77:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42e7b:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)

    // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42e7f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42e83:	25 ff 0f 00 00       	and    $0xfff,%eax
   42e88:	48 85 c0             	test   %rax,%rax
   42e8b:	74 14                	je     42ea1 <virtual_memory_map+0x3f>
   42e8d:	ba 46 4f 04 00       	mov    $0x44f46,%edx
   42e92:	be 66 00 00 00       	mov    $0x66,%esi
   42e97:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42e9c:	e8 c2 fc ff ff       	call   42b63 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   42ea1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42ea5:	25 ff 0f 00 00       	and    $0xfff,%eax
   42eaa:	48 85 c0             	test   %rax,%rax
   42ead:	74 14                	je     42ec3 <virtual_memory_map+0x61>
   42eaf:	ba 59 4f 04 00       	mov    $0x44f59,%edx
   42eb4:	be 67 00 00 00       	mov    $0x67,%esi
   42eb9:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42ebe:	e8 a0 fc ff ff       	call   42b63 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42ec3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42ec7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42ecb:	48 01 d0             	add    %rdx,%rax
   42ece:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
   42ed2:	73 24                	jae    42ef8 <virtual_memory_map+0x96>
   42ed4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42ed8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42edc:	48 01 d0             	add    %rdx,%rax
   42edf:	48 85 c0             	test   %rax,%rax
   42ee2:	74 14                	je     42ef8 <virtual_memory_map+0x96>
   42ee4:	ba 6c 4f 04 00       	mov    $0x44f6c,%edx
   42ee9:	be 68 00 00 00       	mov    $0x68,%esi
   42eee:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42ef3:	e8 6b fc ff ff       	call   42b63 <assert_fail>
    if (perm & PTE_P) {
   42ef8:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42efb:	48 98                	cltq   
   42efd:	83 e0 01             	and    $0x1,%eax
   42f00:	48 85 c0             	test   %rax,%rax
   42f03:	74 6e                	je     42f73 <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   42f05:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42f09:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f0e:	48 85 c0             	test   %rax,%rax
   42f11:	74 14                	je     42f27 <virtual_memory_map+0xc5>
   42f13:	ba 8a 4f 04 00       	mov    $0x44f8a,%edx
   42f18:	be 6a 00 00 00       	mov    $0x6a,%esi
   42f1d:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42f22:	e8 3c fc ff ff       	call   42b63 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   42f27:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42f2b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42f2f:	48 01 d0             	add    %rdx,%rax
   42f32:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
   42f36:	73 14                	jae    42f4c <virtual_memory_map+0xea>
   42f38:	ba 9d 4f 04 00       	mov    $0x44f9d,%edx
   42f3d:	be 6b 00 00 00       	mov    $0x6b,%esi
   42f42:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42f47:	e8 17 fc ff ff       	call   42b63 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42f4c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42f50:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42f54:	48 01 d0             	add    %rdx,%rax
   42f57:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42f5d:	76 14                	jbe    42f73 <virtual_memory_map+0x111>
   42f5f:	ba ab 4f 04 00       	mov    $0x44fab,%edx
   42f64:	be 6c 00 00 00       	mov    $0x6c,%esi
   42f69:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42f6e:	e8 f0 fb ff ff       	call   42b63 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   42f73:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42f77:	78 09                	js     42f82 <virtual_memory_map+0x120>
   42f79:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42f80:	7e 14                	jle    42f96 <virtual_memory_map+0x134>
   42f82:	ba c7 4f 04 00       	mov    $0x44fc7,%edx
   42f87:	be 6e 00 00 00       	mov    $0x6e,%esi
   42f8c:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42f91:	e8 cd fb ff ff       	call   42b63 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42f96:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42f9a:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f9f:	48 85 c0             	test   %rax,%rax
   42fa2:	74 14                	je     42fb8 <virtual_memory_map+0x156>
   42fa4:	ba e8 4f 04 00       	mov    $0x44fe8,%edx
   42fa9:	be 6f 00 00 00       	mov    $0x6f,%esi
   42fae:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   42fb3:	e8 ab fb ff ff       	call   42b63 <assert_fail>

    int last_index123 = -1;
   42fb8:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l1pagetable = NULL;
   42fbf:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42fc6:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42fc7:	e9 e1 00 00 00       	jmp    430ad <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42fcc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42fd0:	48 c1 e8 15          	shr    $0x15,%rax
   42fd4:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   42fd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42fda:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42fdd:	74 20                	je     42fff <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l1pagetable = lookup_l1pagetable(pagetable, va, perm);
   42fdf:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42fe2:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42fe6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42fea:	48 89 ce             	mov    %rcx,%rsi
   42fed:	48 89 c7             	mov    %rax,%rdi
   42ff0:	e8 ce 00 00 00       	call   430c3 <lookup_l1pagetable>
   42ff5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)

            last_index123 = cur_index123;
   42ff9:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42ffc:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l1pagetable) { // if page is marked present
   42fff:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43002:	48 98                	cltq   
   43004:	83 e0 01             	and    $0x1,%eax
   43007:	48 85 c0             	test   %rax,%rax
   4300a:	74 34                	je     43040 <virtual_memory_map+0x1de>
   4300c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43011:	74 2d                	je     43040 <virtual_memory_map+0x1de>
            // TODO
            // map `pa` at appropriate entry with permissions `perm`
            // Get the L1 pagetable index from the "va"
            l1pagetable->entry[L1PAGEINDEX(va)] = (uint64_t) pa | (uint64_t) perm;
   43013:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43016:	48 63 d8             	movslq %eax,%rbx
   43019:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4301d:	be 03 00 00 00       	mov    $0x3,%esi
   43022:	48 89 c7             	mov    %rax,%rdi
   43025:	e8 9e fb ff ff       	call   42bc8 <pageindex>
   4302a:	89 c2                	mov    %eax,%edx
   4302c:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   43030:	48 89 d9             	mov    %rbx,%rcx
   43033:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43037:	48 63 d2             	movslq %edx,%rdx
   4303a:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   4303e:	eb 55                	jmp    43095 <virtual_memory_map+0x233>

        } else if (l1pagetable) { // if page is NOT marked present
   43040:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43045:	74 26                	je     4306d <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            // Allocate  physical page 
            // Get the L1 pagetable index from the "va"
            l1pagetable->entry[L1PAGEINDEX(va)] = (uint64_t) 0 | (uint64_t) perm;
   43047:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4304b:	be 03 00 00 00       	mov    $0x3,%esi
   43050:	48 89 c7             	mov    %rax,%rdi
   43053:	e8 70 fb ff ff       	call   42bc8 <pageindex>
   43058:	89 c2                	mov    %eax,%edx
   4305a:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4305d:	48 63 c8             	movslq %eax,%rcx
   43060:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43064:	48 63 d2             	movslq %edx,%rdx
   43067:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   4306b:	eb 28                	jmp    43095 <virtual_memory_map+0x233>
            
        } else if (perm & PTE_P) {
   4306d:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43070:	48 98                	cltq   
   43072:	83 e0 01             	and    $0x1,%eax
   43075:	48 85 c0             	test   %rax,%rax
   43078:	74 1b                	je     43095 <virtual_memory_map+0x233>
            // error, no allocated l1 page found for va
            log_printf("[Kern Info] failed to find l1pagetable address at " __FILE__ ": %d\n", __LINE__);
   4307a:	be 8d 00 00 00       	mov    $0x8d,%esi
   4307f:	bf 10 50 04 00       	mov    $0x45010,%edi
   43084:	b8 00 00 00 00       	mov    $0x0,%eax
   43089:	e8 b7 f7 ff ff       	call   42845 <log_printf>
            return -1;
   4308e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43093:	eb 28                	jmp    430bd <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   43095:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   4309c:	00 
   4309d:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   430a4:	00 
   430a5:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   430ac:	00 
   430ad:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   430b2:	0f 85 14 ff ff ff    	jne    42fcc <virtual_memory_map+0x16a>
        }
    }
    return 0;
   430b8:	b8 00 00 00 00       	mov    $0x0,%eax
}
   430bd:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   430c1:	c9                   	leave  
   430c2:	c3                   	ret    

00000000000430c3 <lookup_l1pagetable>:
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l1pagetable(x86_64_pagetable* pagetable,
                 uintptr_t va, int perm) {
   430c3:	55                   	push   %rbp
   430c4:	48 89 e5             	mov    %rsp,%rbp
   430c7:	48 83 ec 40          	sub    $0x40,%rsp
   430cb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   430cf:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   430d3:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   430d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   430da:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l1 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   430de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   430e5:	e9 23 01 00 00       	jmp    4320d <lookup_l1pagetable+0x14a>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier

        x86_64_pageentry_t pe = (x86_64_pageentry_t) pt->entry[PAGEINDEX(va, i)]; // replace this
   430ea:	8b 55 f4             	mov    -0xc(%rbp),%edx
   430ed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   430f1:	89 d6                	mov    %edx,%esi
   430f3:	48 89 c7             	mov    %rax,%rdi
   430f6:	e8 cd fa ff ff       	call   42bc8 <pageindex>
   430fb:	89 c2                	mov    %eax,%edx
   430fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43101:	48 63 d2             	movslq %edx,%rdx
   43104:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   43108:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   4310c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43110:	83 e0 01             	and    $0x1,%eax
   43113:	48 85 c0             	test   %rax,%rax
   43116:	75 63                	jne    4317b <lookup_l1pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l1pagetable: Pagetable address: 0x%x perm: 0x%x."
   43118:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4311b:	8d 48 02             	lea    0x2(%rax),%ecx
   4311e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43122:	25 ff 0f 00 00       	and    $0xfff,%eax
   43127:	48 89 c2             	mov    %rax,%rdx
   4312a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4312e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43134:	48 89 c6             	mov    %rax,%rsi
   43137:	bf 58 50 04 00       	mov    $0x45058,%edi
   4313c:	b8 00 00 00 00       	mov    $0x0,%eax
   43141:	e8 ff f6 ff ff       	call   42845 <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   43146:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43149:	48 98                	cltq   
   4314b:	83 e0 01             	and    $0x1,%eax
   4314e:	48 85 c0             	test   %rax,%rax
   43151:	75 0a                	jne    4315d <lookup_l1pagetable+0x9a>
                return NULL;
   43153:	b8 00 00 00 00       	mov    $0x0,%eax
   43158:	e9 be 00 00 00       	jmp    4321b <lookup_l1pagetable+0x158>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   4315d:	be b2 00 00 00       	mov    $0xb2,%esi
   43162:	bf c0 50 04 00       	mov    $0x450c0,%edi
   43167:	b8 00 00 00 00       	mov    $0x0,%eax
   4316c:	e8 d4 f6 ff ff       	call   42845 <log_printf>
            return NULL;
   43171:	b8 00 00 00 00       	mov    $0x0,%eax
   43176:	e9 a0 00 00 00       	jmp    4321b <lookup_l1pagetable+0x158>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   4317b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4317f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43185:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4318b:	76 14                	jbe    431a1 <lookup_l1pagetable+0xde>
   4318d:	ba 08 51 04 00       	mov    $0x45108,%edx
   43192:	be b7 00 00 00       	mov    $0xb7,%esi
   43197:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   4319c:	e8 c2 f9 ff ff       	call   42b63 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   431a1:	8b 45 cc             	mov    -0x34(%rbp),%eax
   431a4:	48 98                	cltq   
   431a6:	83 e0 02             	and    $0x2,%eax
   431a9:	48 85 c0             	test   %rax,%rax
   431ac:	74 20                	je     431ce <lookup_l1pagetable+0x10b>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   431ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431b2:	83 e0 02             	and    $0x2,%eax
   431b5:	48 85 c0             	test   %rax,%rax
   431b8:	75 14                	jne    431ce <lookup_l1pagetable+0x10b>
   431ba:	ba 28 51 04 00       	mov    $0x45128,%edx
   431bf:	be b9 00 00 00       	mov    $0xb9,%esi
   431c4:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   431c9:	e8 95 f9 ff ff       	call   42b63 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   431ce:	8b 45 cc             	mov    -0x34(%rbp),%eax
   431d1:	48 98                	cltq   
   431d3:	83 e0 04             	and    $0x4,%eax
   431d6:	48 85 c0             	test   %rax,%rax
   431d9:	74 20                	je     431fb <lookup_l1pagetable+0x138>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   431db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431df:	83 e0 04             	and    $0x4,%eax
   431e2:	48 85 c0             	test   %rax,%rax
   431e5:	75 14                	jne    431fb <lookup_l1pagetable+0x138>
   431e7:	ba 33 51 04 00       	mov    $0x45133,%edx
   431ec:	be bc 00 00 00       	mov    $0xbc,%esi
   431f1:	bf 55 4d 04 00       	mov    $0x44d55,%edi
   431f6:	e8 68 f9 ff ff       	call   42b63 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable*) (PTE_ADDR(pe)); // replace this
   431fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431ff:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43205:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   43209:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4320d:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   43211:	0f 8e d3 fe ff ff    	jle    430ea <lookup_l1pagetable+0x27>
    }
    return pt;
   43217:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   4321b:	c9                   	leave  
   4321c:	c3                   	ret    

000000000004321d <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   4321d:	55                   	push   %rbp
   4321e:	48 89 e5             	mov    %rsp,%rbp
   43221:	48 83 ec 50          	sub    $0x50,%rsp
   43225:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43229:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   4322d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   43231:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43235:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   43239:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   43240:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   43241:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   43248:	eb 41                	jmp    4328b <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   4324a:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4324d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43251:	89 d6                	mov    %edx,%esi
   43253:	48 89 c7             	mov    %rax,%rdi
   43256:	e8 6d f9 ff ff       	call   42bc8 <pageindex>
   4325b:	89 c2                	mov    %eax,%edx
   4325d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43261:	48 63 d2             	movslq %edx,%rdx
   43264:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   43268:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4326c:	83 e0 06             	and    $0x6,%eax
   4326f:	48 f7 d0             	not    %rax
   43272:	48 21 d0             	and    %rdx,%rax
   43275:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   43279:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4327d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43283:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   43287:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   4328b:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   4328f:	7f 0c                	jg     4329d <virtual_memory_lookup+0x80>
   43291:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43295:	83 e0 01             	and    $0x1,%eax
   43298:	48 85 c0             	test   %rax,%rax
   4329b:	75 ad                	jne    4324a <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   4329d:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   432a4:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   432ab:	ff 
   432ac:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   432b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   432b7:	83 e0 01             	and    $0x1,%eax
   432ba:	48 85 c0             	test   %rax,%rax
   432bd:	74 34                	je     432f3 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   432bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   432c3:	48 c1 e8 0c          	shr    $0xc,%rax
   432c7:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   432ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   432ce:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   432d4:	48 89 c2             	mov    %rax,%rdx
   432d7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   432db:	25 ff 0f 00 00       	and    $0xfff,%eax
   432e0:	48 09 d0             	or     %rdx,%rax
   432e3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   432e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   432eb:	25 ff 0f 00 00       	and    $0xfff,%eax
   432f0:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   432f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   432f7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   432fb:	48 89 10             	mov    %rdx,(%rax)
   432fe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   43302:	48 89 50 08          	mov    %rdx,0x8(%rax)
   43306:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4330a:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   4330e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43312:	c9                   	leave  
   43313:	c3                   	ret    

0000000000043314 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43314:	55                   	push   %rbp
   43315:	48 89 e5             	mov    %rsp,%rbp
   43318:	48 83 ec 40          	sub    $0x40,%rsp
   4331c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43320:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43323:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   43327:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   4332e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43332:	78 08                	js     4333c <program_load+0x28>
   43334:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43337:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   4333a:	7c 14                	jl     43350 <program_load+0x3c>
   4333c:	ba 40 51 04 00       	mov    $0x45140,%edx
   43341:	be 37 00 00 00       	mov    $0x37,%esi
   43346:	bf 70 51 04 00       	mov    $0x45170,%edi
   4334b:	e8 13 f8 ff ff       	call   42b63 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   43350:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43353:	48 98                	cltq   
   43355:	48 c1 e0 04          	shl    $0x4,%rax
   43359:	48 05 20 60 04 00    	add    $0x46020,%rax
   4335f:	48 8b 00             	mov    (%rax),%rax
   43362:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   43366:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4336a:	8b 00                	mov    (%rax),%eax
   4336c:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43371:	74 14                	je     43387 <program_load+0x73>
   43373:	ba 82 51 04 00       	mov    $0x45182,%edx
   43378:	be 39 00 00 00       	mov    $0x39,%esi
   4337d:	bf 70 51 04 00       	mov    $0x45170,%edi
   43382:	e8 dc f7 ff ff       	call   42b63 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   43387:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4338b:	48 8b 50 20          	mov    0x20(%rax),%rdx
   4338f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43393:	48 01 d0             	add    %rdx,%rax
   43396:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   4339a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   433a1:	e9 94 00 00 00       	jmp    4343a <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   433a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   433a9:	48 63 d0             	movslq %eax,%rdx
   433ac:	48 89 d0             	mov    %rdx,%rax
   433af:	48 c1 e0 03          	shl    $0x3,%rax
   433b3:	48 29 d0             	sub    %rdx,%rax
   433b6:	48 c1 e0 03          	shl    $0x3,%rax
   433ba:	48 89 c2             	mov    %rax,%rdx
   433bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   433c1:	48 01 d0             	add    %rdx,%rax
   433c4:	8b 00                	mov    (%rax),%eax
   433c6:	83 f8 01             	cmp    $0x1,%eax
   433c9:	75 6b                	jne    43436 <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   433cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   433ce:	48 63 d0             	movslq %eax,%rdx
   433d1:	48 89 d0             	mov    %rdx,%rax
   433d4:	48 c1 e0 03          	shl    $0x3,%rax
   433d8:	48 29 d0             	sub    %rdx,%rax
   433db:	48 c1 e0 03          	shl    $0x3,%rax
   433df:	48 89 c2             	mov    %rax,%rdx
   433e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   433e6:	48 01 d0             	add    %rdx,%rax
   433e9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   433ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433f1:	48 01 d0             	add    %rdx,%rax
   433f4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   433f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   433fb:	48 63 d0             	movslq %eax,%rdx
   433fe:	48 89 d0             	mov    %rdx,%rax
   43401:	48 c1 e0 03          	shl    $0x3,%rax
   43405:	48 29 d0             	sub    %rdx,%rax
   43408:	48 c1 e0 03          	shl    $0x3,%rax
   4340c:	48 89 c2             	mov    %rax,%rdx
   4340f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43413:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43417:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4341b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4341f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43423:	48 89 c7             	mov    %rax,%rdi
   43426:	e8 3d 00 00 00       	call   43468 <program_load_segment>
   4342b:	85 c0                	test   %eax,%eax
   4342d:	79 07                	jns    43436 <program_load+0x122>
                return -1;
   4342f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43434:	eb 30                	jmp    43466 <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43436:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4343a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4343e:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43442:	0f b7 c0             	movzwl %ax,%eax
   43445:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43448:	0f 8c 58 ff ff ff    	jl     433a6 <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4344e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43452:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43456:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4345a:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43461:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43466:	c9                   	leave  
   43467:	c3                   	ret    

0000000000043468 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43468:	55                   	push   %rbp
   43469:	48 89 e5             	mov    %rsp,%rbp
   4346c:	48 83 ec 70          	sub    $0x70,%rsp
   43470:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   43474:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   43478:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   4347c:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   43480:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43484:	48 8b 40 10          	mov    0x10(%rax),%rax
   43488:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   4348c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43490:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43494:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43498:	48 01 d0             	add    %rdx,%rax
   4349b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   4349f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   434a3:	48 8b 50 28          	mov    0x28(%rax),%rdx
   434a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434ab:	48 01 d0             	add    %rdx,%rax
   434ae:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   434b2:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   434b9:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   434ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   434c2:	e9 93 00 00 00       	jmp    4355a <program_load_segment+0xf2>
        uintptr_t free_page = PAGEADDRESS(find_next_free_physical_page());
   434c7:	b8 00 00 00 00       	mov    $0x0,%eax
   434cc:	e8 2a d3 ff ff       	call   407fb <find_next_free_physical_page>
   434d1:	48 98                	cltq   
   434d3:	48 c1 e0 0c          	shl    $0xc,%rax
   434d7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        
        if (assign_physical_page(free_page, p->p_pid) < 0
   434db:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   434df:	8b 00                	mov    (%rax),%eax
   434e1:	0f be d0             	movsbl %al,%edx
   434e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   434e8:	89 d6                	mov    %edx,%esi
   434ea:	48 89 c7             	mov    %rax,%rdi
   434ed:	e8 9a d0 ff ff       	call   4058c <assign_physical_page>
   434f2:	85 c0                	test   %eax,%eax
   434f4:	78 2a                	js     43520 <program_load_segment+0xb8>
            || virtual_memory_map(p->p_pagetable, addr, free_page, PAGESIZE,
   434f6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   434fa:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43501:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43505:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43509:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4350f:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43514:	48 89 c7             	mov    %rax,%rdi
   43517:	e8 46 f9 ff ff       	call   42e62 <virtual_memory_map>
   4351c:	85 c0                	test   %eax,%eax
   4351e:	79 32                	jns    43552 <program_load_segment+0xea>
                                PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43520:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43524:	8b 00                	mov    (%rax),%eax
   43526:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4352a:	49 89 d0             	mov    %rdx,%r8
   4352d:	89 c1                	mov    %eax,%ecx
   4352f:	ba a0 51 04 00       	mov    $0x451a0,%edx
   43534:	be 00 c0 00 00       	mov    $0xc000,%esi
   43539:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4353e:	b8 00 00 00 00       	mov    $0x0,%eax
   43543:	e8 e1 0f 00 00       	call   44529 <console_printf>
            return -1;
   43548:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4354d:	e9 20 01 00 00       	jmp    43672 <program_load_segment+0x20a>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43552:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43559:	00 
   4355a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4355e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43562:	0f 82 5f ff ff ff    	jb     434c7 <program_load_segment+0x5f>
        }
        
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   43568:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4356c:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43573:	48 89 c7             	mov    %rax,%rdi
   43576:	e8 b6 f7 ff ff       	call   42d31 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   4357b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4357f:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43583:	48 89 c2             	mov    %rax,%rdx
   43586:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4358a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   4358e:	48 89 ce             	mov    %rcx,%rsi
   43591:	48 89 c7             	mov    %rax,%rdi
   43594:	e8 db 00 00 00       	call   43674 <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   43599:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4359d:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   435a1:	48 89 c2             	mov    %rax,%rdx
   435a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   435a8:	be 00 00 00 00       	mov    $0x0,%esi
   435ad:	48 89 c7             	mov    %rax,%rdi
   435b0:	e8 bd 01 00 00       	call   43772 <memset>

    // Detect all read-only program segments and map them as read-only for applications
    if ((ph->p_flags & ELF_PFLAG_WRITE) == 0)
   435b5:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   435b9:	8b 40 04             	mov    0x4(%rax),%eax
   435bc:	83 e0 02             	and    $0x2,%eax
   435bf:	85 c0                	test   %eax,%eax
   435c1:	0f 85 97 00 00 00    	jne    4365e <program_load_segment+0x1f6>
    {
        // allocate memory
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   435c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435cb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   435cf:	eb 7f                	jmp    43650 <program_load_segment+0x1e8>
            vamapping map = virtual_memory_lookup(p->p_pagetable, addr);
   435d1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   435d5:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   435dc:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   435e0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   435e4:	48 89 ce             	mov    %rcx,%rsi
   435e7:	48 89 c7             	mov    %rax,%rdi
   435ea:	e8 2e fc ff ff       	call   4321d <virtual_memory_lookup>
            if (virtual_memory_map(p->p_pagetable, addr, map.pa, PAGESIZE, PTE_P | PTE_U) < 0) 
   435ef:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   435f3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   435f7:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   435fe:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   43602:	41 b8 05 00 00 00    	mov    $0x5,%r8d
   43608:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4360d:	48 89 c7             	mov    %rax,%rdi
   43610:	e8 4d f8 ff ff       	call   42e62 <virtual_memory_map>
   43615:	85 c0                	test   %eax,%eax
   43617:	79 2f                	jns    43648 <program_load_segment+0x1e0>
            {
                console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43619:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4361d:	8b 00                	mov    (%rax),%eax
   4361f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   43623:	49 89 d0             	mov    %rdx,%r8
   43626:	89 c1                	mov    %eax,%ecx
   43628:	ba a0 51 04 00       	mov    $0x451a0,%edx
   4362d:	be 00 c0 00 00       	mov    $0xc000,%esi
   43632:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43637:	b8 00 00 00 00       	mov    $0x0,%eax
   4363c:	e8 e8 0e 00 00       	call   44529 <console_printf>
                return -1;
   43641:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43646:	eb 2a                	jmp    43672 <program_load_segment+0x20a>
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43648:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   4364f:	00 
   43650:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43654:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43658:	0f 82 73 ff ff ff    	jb     435d1 <program_load_segment+0x169>
        }
    }
    
    
    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   4365e:	48 8b 05 9b 39 01 00 	mov    0x1399b(%rip),%rax        # 57000 <kernel_pagetable>
   43665:	48 89 c7             	mov    %rax,%rdi
   43668:	e8 c4 f6 ff ff       	call   42d31 <set_pagetable>
    return 0;
   4366d:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43672:	c9                   	leave  
   43673:	c3                   	ret    

0000000000043674 <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   43674:	55                   	push   %rbp
   43675:	48 89 e5             	mov    %rsp,%rbp
   43678:	48 83 ec 28          	sub    $0x28,%rsp
   4367c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   43680:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   43684:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   43688:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4368c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43690:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43694:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43698:	eb 1c                	jmp    436b6 <memcpy+0x42>
        *d = *s;
   4369a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4369e:	0f b6 10             	movzbl (%rax),%edx
   436a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436a5:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   436a7:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   436ac:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   436b1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   436b6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   436bb:	75 dd                	jne    4369a <memcpy+0x26>
    }
    return dst;
   436bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   436c1:	c9                   	leave  
   436c2:	c3                   	ret    

00000000000436c3 <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   436c3:	55                   	push   %rbp
   436c4:	48 89 e5             	mov    %rsp,%rbp
   436c7:	48 83 ec 28          	sub    $0x28,%rsp
   436cb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   436cf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   436d3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   436d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   436db:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
   436df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   436e3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
   436e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   436eb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
   436ef:	73 6a                	jae    4375b <memmove+0x98>
   436f1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   436f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   436f9:	48 01 d0             	add    %rdx,%rax
   436fc:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   43700:	73 59                	jae    4375b <memmove+0x98>
        s += n, d += n;
   43702:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43706:	48 01 45 f8          	add    %rax,-0x8(%rbp)
   4370a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4370e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
   43712:	eb 17                	jmp    4372b <memmove+0x68>
            *--d = *--s;
   43714:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
   43719:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
   4371e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43722:	0f b6 10             	movzbl (%rax),%edx
   43725:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43729:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   4372b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4372f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   43733:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   43737:	48 85 c0             	test   %rax,%rax
   4373a:	75 d8                	jne    43714 <memmove+0x51>
    if (s < d && s + n > d) {
   4373c:	eb 2e                	jmp    4376c <memmove+0xa9>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
   4373e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43742:	48 8d 42 01          	lea    0x1(%rdx),%rax
   43746:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   4374a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4374e:	48 8d 48 01          	lea    0x1(%rax),%rcx
   43752:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   43756:	0f b6 12             	movzbl (%rdx),%edx
   43759:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   4375b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4375f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   43763:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   43767:	48 85 c0             	test   %rax,%rax
   4376a:	75 d2                	jne    4373e <memmove+0x7b>
        }
    }
    return dst;
   4376c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43770:	c9                   	leave  
   43771:	c3                   	ret    

0000000000043772 <memset>:

void* memset(void* v, int c, size_t n) {
   43772:	55                   	push   %rbp
   43773:	48 89 e5             	mov    %rsp,%rbp
   43776:	48 83 ec 28          	sub    $0x28,%rsp
   4377a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4377e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   43781:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43785:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43789:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   4378d:	eb 15                	jmp    437a4 <memset+0x32>
        *p = c;
   4378f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   43792:	89 c2                	mov    %eax,%edx
   43794:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43798:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4379a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   4379f:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   437a4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   437a9:	75 e4                	jne    4378f <memset+0x1d>
    }
    return v;
   437ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   437af:	c9                   	leave  
   437b0:	c3                   	ret    

00000000000437b1 <strlen>:

size_t strlen(const char* s) {
   437b1:	55                   	push   %rbp
   437b2:	48 89 e5             	mov    %rsp,%rbp
   437b5:	48 83 ec 18          	sub    $0x18,%rsp
   437b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   437bd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   437c4:	00 
   437c5:	eb 0a                	jmp    437d1 <strlen+0x20>
        ++n;
   437c7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
   437cc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   437d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   437d5:	0f b6 00             	movzbl (%rax),%eax
   437d8:	84 c0                	test   %al,%al
   437da:	75 eb                	jne    437c7 <strlen+0x16>
    }
    return n;
   437dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   437e0:	c9                   	leave  
   437e1:	c3                   	ret    

00000000000437e2 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   437e2:	55                   	push   %rbp
   437e3:	48 89 e5             	mov    %rsp,%rbp
   437e6:	48 83 ec 20          	sub    $0x20,%rsp
   437ea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   437ee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   437f2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   437f9:	00 
   437fa:	eb 0a                	jmp    43806 <strnlen+0x24>
        ++n;
   437fc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43801:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   43806:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4380a:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   4380e:	74 0b                	je     4381b <strnlen+0x39>
   43810:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43814:	0f b6 00             	movzbl (%rax),%eax
   43817:	84 c0                	test   %al,%al
   43819:	75 e1                	jne    437fc <strnlen+0x1a>
    }
    return n;
   4381b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   4381f:	c9                   	leave  
   43820:	c3                   	ret    

0000000000043821 <strcpy>:

char* strcpy(char* dst, const char* src) {
   43821:	55                   	push   %rbp
   43822:	48 89 e5             	mov    %rsp,%rbp
   43825:	48 83 ec 20          	sub    $0x20,%rsp
   43829:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4382d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
   43831:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43835:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
   43839:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4383d:	48 8d 42 01          	lea    0x1(%rdx),%rax
   43841:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   43845:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43849:	48 8d 48 01          	lea    0x1(%rax),%rcx
   4384d:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
   43851:	0f b6 12             	movzbl (%rdx),%edx
   43854:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
   43856:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4385a:	48 83 e8 01          	sub    $0x1,%rax
   4385e:	0f b6 00             	movzbl (%rax),%eax
   43861:	84 c0                	test   %al,%al
   43863:	75 d4                	jne    43839 <strcpy+0x18>
    return dst;
   43865:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43869:	c9                   	leave  
   4386a:	c3                   	ret    

000000000004386b <strcmp>:

int strcmp(const char* a, const char* b) {
   4386b:	55                   	push   %rbp
   4386c:	48 89 e5             	mov    %rsp,%rbp
   4386f:	48 83 ec 10          	sub    $0x10,%rsp
   43873:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   43877:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   4387b:	eb 0a                	jmp    43887 <strcmp+0x1c>
        ++a, ++b;
   4387d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   43882:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   43887:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4388b:	0f b6 00             	movzbl (%rax),%eax
   4388e:	84 c0                	test   %al,%al
   43890:	74 1d                	je     438af <strcmp+0x44>
   43892:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43896:	0f b6 00             	movzbl (%rax),%eax
   43899:	84 c0                	test   %al,%al
   4389b:	74 12                	je     438af <strcmp+0x44>
   4389d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   438a1:	0f b6 10             	movzbl (%rax),%edx
   438a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   438a8:	0f b6 00             	movzbl (%rax),%eax
   438ab:	38 c2                	cmp    %al,%dl
   438ad:	74 ce                	je     4387d <strcmp+0x12>
    }
    return ((unsigned char) *a > (unsigned char) *b)
   438af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   438b3:	0f b6 00             	movzbl (%rax),%eax
   438b6:	89 c2                	mov    %eax,%edx
   438b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   438bc:	0f b6 00             	movzbl (%rax),%eax
   438bf:	38 d0                	cmp    %dl,%al
   438c1:	0f 92 c0             	setb   %al
   438c4:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
   438c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   438cb:	0f b6 00             	movzbl (%rax),%eax
   438ce:	89 c1                	mov    %eax,%ecx
   438d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   438d4:	0f b6 00             	movzbl (%rax),%eax
   438d7:	38 c1                	cmp    %al,%cl
   438d9:	0f 92 c0             	setb   %al
   438dc:	0f b6 c0             	movzbl %al,%eax
   438df:	29 c2                	sub    %eax,%edx
   438e1:	89 d0                	mov    %edx,%eax
}
   438e3:	c9                   	leave  
   438e4:	c3                   	ret    

00000000000438e5 <strchr>:

char* strchr(const char* s, int c) {
   438e5:	55                   	push   %rbp
   438e6:	48 89 e5             	mov    %rsp,%rbp
   438e9:	48 83 ec 10          	sub    $0x10,%rsp
   438ed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   438f1:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
   438f4:	eb 05                	jmp    438fb <strchr+0x16>
        ++s;
   438f6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
   438fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   438ff:	0f b6 00             	movzbl (%rax),%eax
   43902:	84 c0                	test   %al,%al
   43904:	74 0e                	je     43914 <strchr+0x2f>
   43906:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4390a:	0f b6 00             	movzbl (%rax),%eax
   4390d:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43910:	38 d0                	cmp    %dl,%al
   43912:	75 e2                	jne    438f6 <strchr+0x11>
    }
    if (*s == (char) c) {
   43914:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43918:	0f b6 00             	movzbl (%rax),%eax
   4391b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4391e:	38 d0                	cmp    %dl,%al
   43920:	75 06                	jne    43928 <strchr+0x43>
        return (char*) s;
   43922:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43926:	eb 05                	jmp    4392d <strchr+0x48>
    } else {
        return NULL;
   43928:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   4392d:	c9                   	leave  
   4392e:	c3                   	ret    

000000000004392f <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
   4392f:	55                   	push   %rbp
   43930:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
   43933:	8b 05 c7 96 01 00    	mov    0x196c7(%rip),%eax        # 5d000 <rand_seed_set>
   43939:	85 c0                	test   %eax,%eax
   4393b:	75 0a                	jne    43947 <rand+0x18>
        srand(819234718U);
   4393d:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
   43942:	e8 24 00 00 00       	call   4396b <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43947:	8b 05 b7 96 01 00    	mov    0x196b7(%rip),%eax        # 5d004 <rand_seed>
   4394d:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
   43953:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43958:	89 05 a6 96 01 00    	mov    %eax,0x196a6(%rip)        # 5d004 <rand_seed>
    return rand_seed & RAND_MAX;
   4395e:	8b 05 a0 96 01 00    	mov    0x196a0(%rip),%eax        # 5d004 <rand_seed>
   43964:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   43969:	5d                   	pop    %rbp
   4396a:	c3                   	ret    

000000000004396b <srand>:

void srand(unsigned seed) {
   4396b:	55                   	push   %rbp
   4396c:	48 89 e5             	mov    %rsp,%rbp
   4396f:	48 83 ec 08          	sub    $0x8,%rsp
   43973:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
   43976:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43979:	89 05 85 96 01 00    	mov    %eax,0x19685(%rip)        # 5d004 <rand_seed>
    rand_seed_set = 1;
   4397f:	c7 05 77 96 01 00 01 	movl   $0x1,0x19677(%rip)        # 5d000 <rand_seed_set>
   43986:	00 00 00 
}
   43989:	90                   	nop
   4398a:	c9                   	leave  
   4398b:	c3                   	ret    

000000000004398c <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
   4398c:	55                   	push   %rbp
   4398d:	48 89 e5             	mov    %rsp,%rbp
   43990:	48 83 ec 28          	sub    $0x28,%rsp
   43994:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   43998:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   4399c:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
   4399f:	48 c7 45 f8 c0 53 04 	movq   $0x453c0,-0x8(%rbp)
   439a6:	00 
    if (base < 0) {
   439a7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   439ab:	79 0b                	jns    439b8 <fill_numbuf+0x2c>
        digits = lower_digits;
   439ad:	48 c7 45 f8 e0 53 04 	movq   $0x453e0,-0x8(%rbp)
   439b4:	00 
        base = -base;
   439b5:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
   439b8:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   439bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   439c1:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
   439c4:	8b 45 dc             	mov    -0x24(%rbp),%eax
   439c7:	48 63 c8             	movslq %eax,%rcx
   439ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   439ce:	ba 00 00 00 00       	mov    $0x0,%edx
   439d3:	48 f7 f1             	div    %rcx
   439d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   439da:	48 01 d0             	add    %rdx,%rax
   439dd:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   439e2:	0f b6 10             	movzbl (%rax),%edx
   439e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   439e9:	88 10                	mov    %dl,(%rax)
        val /= base;
   439eb:	8b 45 dc             	mov    -0x24(%rbp),%eax
   439ee:	48 63 f0             	movslq %eax,%rsi
   439f1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   439f5:	ba 00 00 00 00       	mov    $0x0,%edx
   439fa:	48 f7 f6             	div    %rsi
   439fd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
   43a01:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43a06:	75 bc                	jne    439c4 <fill_numbuf+0x38>
    return numbuf_end;
   43a08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43a0c:	c9                   	leave  
   43a0d:	c3                   	ret    

0000000000043a0e <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43a0e:	55                   	push   %rbp
   43a0f:	48 89 e5             	mov    %rsp,%rbp
   43a12:	53                   	push   %rbx
   43a13:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   43a1a:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
   43a21:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
   43a27:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   43a2e:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   43a35:	e9 8a 09 00 00       	jmp    443c4 <printer_vprintf+0x9b6>
        if (*format != '%') {
   43a3a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a41:	0f b6 00             	movzbl (%rax),%eax
   43a44:	3c 25                	cmp    $0x25,%al
   43a46:	74 31                	je     43a79 <printer_vprintf+0x6b>
            p->putc(p, *format, color);
   43a48:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43a4f:	4c 8b 00             	mov    (%rax),%r8
   43a52:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a59:	0f b6 00             	movzbl (%rax),%eax
   43a5c:	0f b6 c8             	movzbl %al,%ecx
   43a5f:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   43a65:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43a6c:	89 ce                	mov    %ecx,%esi
   43a6e:	48 89 c7             	mov    %rax,%rdi
   43a71:	41 ff d0             	call   *%r8
            continue;
   43a74:	e9 43 09 00 00       	jmp    443bc <printer_vprintf+0x9ae>
        }

        // process flags
        int flags = 0;
   43a79:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
   43a80:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43a87:	01 
   43a88:	eb 44                	jmp    43ace <printer_vprintf+0xc0>
            const char* flagc = strchr(flag_chars, *format);
   43a8a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a91:	0f b6 00             	movzbl (%rax),%eax
   43a94:	0f be c0             	movsbl %al,%eax
   43a97:	89 c6                	mov    %eax,%esi
   43a99:	bf e0 51 04 00       	mov    $0x451e0,%edi
   43a9e:	e8 42 fe ff ff       	call   438e5 <strchr>
   43aa3:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
   43aa7:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   43aac:	74 30                	je     43ade <printer_vprintf+0xd0>
                flags |= 1 << (flagc - flag_chars);
   43aae:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43ab2:	48 2d e0 51 04 00    	sub    $0x451e0,%rax
   43ab8:	ba 01 00 00 00       	mov    $0x1,%edx
   43abd:	89 c1                	mov    %eax,%ecx
   43abf:	d3 e2                	shl    %cl,%edx
   43ac1:	89 d0                	mov    %edx,%eax
   43ac3:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
   43ac6:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43acd:	01 
   43ace:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43ad5:	0f b6 00             	movzbl (%rax),%eax
   43ad8:	84 c0                	test   %al,%al
   43ada:	75 ae                	jne    43a8a <printer_vprintf+0x7c>
   43adc:	eb 01                	jmp    43adf <printer_vprintf+0xd1>
            } else {
                break;
   43ade:	90                   	nop
            }
        }

        // process width
        int width = -1;
   43adf:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
   43ae6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43aed:	0f b6 00             	movzbl (%rax),%eax
   43af0:	3c 30                	cmp    $0x30,%al
   43af2:	7e 67                	jle    43b5b <printer_vprintf+0x14d>
   43af4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43afb:	0f b6 00             	movzbl (%rax),%eax
   43afe:	3c 39                	cmp    $0x39,%al
   43b00:	7f 59                	jg     43b5b <printer_vprintf+0x14d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43b02:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   43b09:	eb 2e                	jmp    43b39 <printer_vprintf+0x12b>
                width = 10 * width + *format++ - '0';
   43b0b:	8b 55 e8             	mov    -0x18(%rbp),%edx
   43b0e:	89 d0                	mov    %edx,%eax
   43b10:	c1 e0 02             	shl    $0x2,%eax
   43b13:	01 d0                	add    %edx,%eax
   43b15:	01 c0                	add    %eax,%eax
   43b17:	89 c1                	mov    %eax,%ecx
   43b19:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b20:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43b24:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   43b2b:	0f b6 00             	movzbl (%rax),%eax
   43b2e:	0f be c0             	movsbl %al,%eax
   43b31:	01 c8                	add    %ecx,%eax
   43b33:	83 e8 30             	sub    $0x30,%eax
   43b36:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43b39:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b40:	0f b6 00             	movzbl (%rax),%eax
   43b43:	3c 2f                	cmp    $0x2f,%al
   43b45:	0f 8e 85 00 00 00    	jle    43bd0 <printer_vprintf+0x1c2>
   43b4b:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b52:	0f b6 00             	movzbl (%rax),%eax
   43b55:	3c 39                	cmp    $0x39,%al
   43b57:	7e b2                	jle    43b0b <printer_vprintf+0xfd>
        if (*format >= '1' && *format <= '9') {
   43b59:	eb 75                	jmp    43bd0 <printer_vprintf+0x1c2>
            }
        } else if (*format == '*') {
   43b5b:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b62:	0f b6 00             	movzbl (%rax),%eax
   43b65:	3c 2a                	cmp    $0x2a,%al
   43b67:	75 68                	jne    43bd1 <printer_vprintf+0x1c3>
            width = va_arg(val, int);
   43b69:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b70:	8b 00                	mov    (%rax),%eax
   43b72:	83 f8 2f             	cmp    $0x2f,%eax
   43b75:	77 30                	ja     43ba7 <printer_vprintf+0x199>
   43b77:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b7e:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43b82:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b89:	8b 00                	mov    (%rax),%eax
   43b8b:	89 c0                	mov    %eax,%eax
   43b8d:	48 01 d0             	add    %rdx,%rax
   43b90:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b97:	8b 12                	mov    (%rdx),%edx
   43b99:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43b9c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ba3:	89 0a                	mov    %ecx,(%rdx)
   43ba5:	eb 1a                	jmp    43bc1 <printer_vprintf+0x1b3>
   43ba7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43bae:	48 8b 40 08          	mov    0x8(%rax),%rax
   43bb2:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43bb6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43bbd:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43bc1:	8b 00                	mov    (%rax),%eax
   43bc3:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
   43bc6:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43bcd:	01 
   43bce:	eb 01                	jmp    43bd1 <printer_vprintf+0x1c3>
        if (*format >= '1' && *format <= '9') {
   43bd0:	90                   	nop
        }

        // process precision
        int precision = -1;
   43bd1:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
   43bd8:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43bdf:	0f b6 00             	movzbl (%rax),%eax
   43be2:	3c 2e                	cmp    $0x2e,%al
   43be4:	0f 85 00 01 00 00    	jne    43cea <printer_vprintf+0x2dc>
            ++format;
   43bea:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43bf1:	01 
            if (*format >= '0' && *format <= '9') {
   43bf2:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43bf9:	0f b6 00             	movzbl (%rax),%eax
   43bfc:	3c 2f                	cmp    $0x2f,%al
   43bfe:	7e 67                	jle    43c67 <printer_vprintf+0x259>
   43c00:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c07:	0f b6 00             	movzbl (%rax),%eax
   43c0a:	3c 39                	cmp    $0x39,%al
   43c0c:	7f 59                	jg     43c67 <printer_vprintf+0x259>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43c0e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   43c15:	eb 2e                	jmp    43c45 <printer_vprintf+0x237>
                    precision = 10 * precision + *format++ - '0';
   43c17:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   43c1a:	89 d0                	mov    %edx,%eax
   43c1c:	c1 e0 02             	shl    $0x2,%eax
   43c1f:	01 d0                	add    %edx,%eax
   43c21:	01 c0                	add    %eax,%eax
   43c23:	89 c1                	mov    %eax,%ecx
   43c25:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c2c:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43c30:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   43c37:	0f b6 00             	movzbl (%rax),%eax
   43c3a:	0f be c0             	movsbl %al,%eax
   43c3d:	01 c8                	add    %ecx,%eax
   43c3f:	83 e8 30             	sub    $0x30,%eax
   43c42:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43c45:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c4c:	0f b6 00             	movzbl (%rax),%eax
   43c4f:	3c 2f                	cmp    $0x2f,%al
   43c51:	0f 8e 85 00 00 00    	jle    43cdc <printer_vprintf+0x2ce>
   43c57:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c5e:	0f b6 00             	movzbl (%rax),%eax
   43c61:	3c 39                	cmp    $0x39,%al
   43c63:	7e b2                	jle    43c17 <printer_vprintf+0x209>
            if (*format >= '0' && *format <= '9') {
   43c65:	eb 75                	jmp    43cdc <printer_vprintf+0x2ce>
                }
            } else if (*format == '*') {
   43c67:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c6e:	0f b6 00             	movzbl (%rax),%eax
   43c71:	3c 2a                	cmp    $0x2a,%al
   43c73:	75 68                	jne    43cdd <printer_vprintf+0x2cf>
                precision = va_arg(val, int);
   43c75:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c7c:	8b 00                	mov    (%rax),%eax
   43c7e:	83 f8 2f             	cmp    $0x2f,%eax
   43c81:	77 30                	ja     43cb3 <printer_vprintf+0x2a5>
   43c83:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c8a:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43c8e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c95:	8b 00                	mov    (%rax),%eax
   43c97:	89 c0                	mov    %eax,%eax
   43c99:	48 01 d0             	add    %rdx,%rax
   43c9c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ca3:	8b 12                	mov    (%rdx),%edx
   43ca5:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43ca8:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43caf:	89 0a                	mov    %ecx,(%rdx)
   43cb1:	eb 1a                	jmp    43ccd <printer_vprintf+0x2bf>
   43cb3:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cba:	48 8b 40 08          	mov    0x8(%rax),%rax
   43cbe:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43cc2:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43cc9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43ccd:	8b 00                	mov    (%rax),%eax
   43ccf:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
   43cd2:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43cd9:	01 
   43cda:	eb 01                	jmp    43cdd <printer_vprintf+0x2cf>
            if (*format >= '0' && *format <= '9') {
   43cdc:	90                   	nop
            }
            if (precision < 0) {
   43cdd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   43ce1:	79 07                	jns    43cea <printer_vprintf+0x2dc>
                precision = 0;
   43ce3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
   43cea:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
   43cf1:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   43cf8:	00 
        int length = 0;
   43cf9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
   43d00:	48 c7 45 c8 e6 51 04 	movq   $0x451e6,-0x38(%rbp)
   43d07:	00 
    again:
        switch (*format) {
   43d08:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43d0f:	0f b6 00             	movzbl (%rax),%eax
   43d12:	0f be c0             	movsbl %al,%eax
   43d15:	83 e8 43             	sub    $0x43,%eax
   43d18:	83 f8 37             	cmp    $0x37,%eax
   43d1b:	0f 87 9f 03 00 00    	ja     440c0 <printer_vprintf+0x6b2>
   43d21:	89 c0                	mov    %eax,%eax
   43d23:	48 8b 04 c5 f8 51 04 	mov    0x451f8(,%rax,8),%rax
   43d2a:	00 
   43d2b:	ff e0                	jmp    *%rax
        case 'l':
        case 'z':
            length = 1;
   43d2d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
   43d34:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43d3b:	01 
            goto again;
   43d3c:	eb ca                	jmp    43d08 <printer_vprintf+0x2fa>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43d3e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43d42:	74 5d                	je     43da1 <printer_vprintf+0x393>
   43d44:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d4b:	8b 00                	mov    (%rax),%eax
   43d4d:	83 f8 2f             	cmp    $0x2f,%eax
   43d50:	77 30                	ja     43d82 <printer_vprintf+0x374>
   43d52:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d59:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43d5d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d64:	8b 00                	mov    (%rax),%eax
   43d66:	89 c0                	mov    %eax,%eax
   43d68:	48 01 d0             	add    %rdx,%rax
   43d6b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d72:	8b 12                	mov    (%rdx),%edx
   43d74:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43d77:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d7e:	89 0a                	mov    %ecx,(%rdx)
   43d80:	eb 1a                	jmp    43d9c <printer_vprintf+0x38e>
   43d82:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d89:	48 8b 40 08          	mov    0x8(%rax),%rax
   43d8d:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43d91:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d98:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43d9c:	48 8b 00             	mov    (%rax),%rax
   43d9f:	eb 5c                	jmp    43dfd <printer_vprintf+0x3ef>
   43da1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43da8:	8b 00                	mov    (%rax),%eax
   43daa:	83 f8 2f             	cmp    $0x2f,%eax
   43dad:	77 30                	ja     43ddf <printer_vprintf+0x3d1>
   43daf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43db6:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43dba:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43dc1:	8b 00                	mov    (%rax),%eax
   43dc3:	89 c0                	mov    %eax,%eax
   43dc5:	48 01 d0             	add    %rdx,%rax
   43dc8:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43dcf:	8b 12                	mov    (%rdx),%edx
   43dd1:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43dd4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ddb:	89 0a                	mov    %ecx,(%rdx)
   43ddd:	eb 1a                	jmp    43df9 <printer_vprintf+0x3eb>
   43ddf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43de6:	48 8b 40 08          	mov    0x8(%rax),%rax
   43dea:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43dee:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43df5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43df9:	8b 00                	mov    (%rax),%eax
   43dfb:	48 98                	cltq   
   43dfd:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43e01:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43e05:	48 c1 f8 38          	sar    $0x38,%rax
   43e09:	25 80 00 00 00       	and    $0x80,%eax
   43e0e:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
   43e11:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   43e15:	74 09                	je     43e20 <printer_vprintf+0x412>
   43e17:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43e1b:	48 f7 d8             	neg    %rax
   43e1e:	eb 04                	jmp    43e24 <printer_vprintf+0x416>
   43e20:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43e24:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43e28:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   43e2b:	83 c8 60             	or     $0x60,%eax
   43e2e:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
   43e31:	e9 cf 02 00 00       	jmp    44105 <printer_vprintf+0x6f7>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43e36:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43e3a:	74 5d                	je     43e99 <printer_vprintf+0x48b>
   43e3c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e43:	8b 00                	mov    (%rax),%eax
   43e45:	83 f8 2f             	cmp    $0x2f,%eax
   43e48:	77 30                	ja     43e7a <printer_vprintf+0x46c>
   43e4a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e51:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43e55:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e5c:	8b 00                	mov    (%rax),%eax
   43e5e:	89 c0                	mov    %eax,%eax
   43e60:	48 01 d0             	add    %rdx,%rax
   43e63:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e6a:	8b 12                	mov    (%rdx),%edx
   43e6c:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43e6f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e76:	89 0a                	mov    %ecx,(%rdx)
   43e78:	eb 1a                	jmp    43e94 <printer_vprintf+0x486>
   43e7a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e81:	48 8b 40 08          	mov    0x8(%rax),%rax
   43e85:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43e89:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e90:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43e94:	48 8b 00             	mov    (%rax),%rax
   43e97:	eb 5c                	jmp    43ef5 <printer_vprintf+0x4e7>
   43e99:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ea0:	8b 00                	mov    (%rax),%eax
   43ea2:	83 f8 2f             	cmp    $0x2f,%eax
   43ea5:	77 30                	ja     43ed7 <printer_vprintf+0x4c9>
   43ea7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43eae:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43eb2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43eb9:	8b 00                	mov    (%rax),%eax
   43ebb:	89 c0                	mov    %eax,%eax
   43ebd:	48 01 d0             	add    %rdx,%rax
   43ec0:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ec7:	8b 12                	mov    (%rdx),%edx
   43ec9:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43ecc:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ed3:	89 0a                	mov    %ecx,(%rdx)
   43ed5:	eb 1a                	jmp    43ef1 <printer_vprintf+0x4e3>
   43ed7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ede:	48 8b 40 08          	mov    0x8(%rax),%rax
   43ee2:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43ee6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43eed:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43ef1:	8b 00                	mov    (%rax),%eax
   43ef3:	89 c0                	mov    %eax,%eax
   43ef5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
   43ef9:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
   43efd:	e9 03 02 00 00       	jmp    44105 <printer_vprintf+0x6f7>
        case 'x':
            base = -16;
   43f02:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
   43f09:	e9 28 ff ff ff       	jmp    43e36 <printer_vprintf+0x428>
        case 'X':
            base = 16;
   43f0e:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
   43f15:	e9 1c ff ff ff       	jmp    43e36 <printer_vprintf+0x428>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
   43f1a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f21:	8b 00                	mov    (%rax),%eax
   43f23:	83 f8 2f             	cmp    $0x2f,%eax
   43f26:	77 30                	ja     43f58 <printer_vprintf+0x54a>
   43f28:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f2f:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43f33:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f3a:	8b 00                	mov    (%rax),%eax
   43f3c:	89 c0                	mov    %eax,%eax
   43f3e:	48 01 d0             	add    %rdx,%rax
   43f41:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f48:	8b 12                	mov    (%rdx),%edx
   43f4a:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43f4d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f54:	89 0a                	mov    %ecx,(%rdx)
   43f56:	eb 1a                	jmp    43f72 <printer_vprintf+0x564>
   43f58:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f5f:	48 8b 40 08          	mov    0x8(%rax),%rax
   43f63:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43f67:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f6e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43f72:	48 8b 00             	mov    (%rax),%rax
   43f75:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
   43f79:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43f80:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
   43f87:	e9 79 01 00 00       	jmp    44105 <printer_vprintf+0x6f7>
        case 's':
            data = va_arg(val, char*);
   43f8c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f93:	8b 00                	mov    (%rax),%eax
   43f95:	83 f8 2f             	cmp    $0x2f,%eax
   43f98:	77 30                	ja     43fca <printer_vprintf+0x5bc>
   43f9a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fa1:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43fa5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fac:	8b 00                	mov    (%rax),%eax
   43fae:	89 c0                	mov    %eax,%eax
   43fb0:	48 01 d0             	add    %rdx,%rax
   43fb3:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43fba:	8b 12                	mov    (%rdx),%edx
   43fbc:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43fbf:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43fc6:	89 0a                	mov    %ecx,(%rdx)
   43fc8:	eb 1a                	jmp    43fe4 <printer_vprintf+0x5d6>
   43fca:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fd1:	48 8b 40 08          	mov    0x8(%rax),%rax
   43fd5:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43fd9:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43fe0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43fe4:	48 8b 00             	mov    (%rax),%rax
   43fe7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
   43feb:	e9 15 01 00 00       	jmp    44105 <printer_vprintf+0x6f7>
        case 'C':
            color = va_arg(val, int);
   43ff0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ff7:	8b 00                	mov    (%rax),%eax
   43ff9:	83 f8 2f             	cmp    $0x2f,%eax
   43ffc:	77 30                	ja     4402e <printer_vprintf+0x620>
   43ffe:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44005:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44009:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44010:	8b 00                	mov    (%rax),%eax
   44012:	89 c0                	mov    %eax,%eax
   44014:	48 01 d0             	add    %rdx,%rax
   44017:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4401e:	8b 12                	mov    (%rdx),%edx
   44020:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44023:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4402a:	89 0a                	mov    %ecx,(%rdx)
   4402c:	eb 1a                	jmp    44048 <printer_vprintf+0x63a>
   4402e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44035:	48 8b 40 08          	mov    0x8(%rax),%rax
   44039:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4403d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44044:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44048:	8b 00                	mov    (%rax),%eax
   4404a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
   44050:	e9 67 03 00 00       	jmp    443bc <printer_vprintf+0x9ae>
        case 'c':
            data = numbuf;
   44055:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44059:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
   4405d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44064:	8b 00                	mov    (%rax),%eax
   44066:	83 f8 2f             	cmp    $0x2f,%eax
   44069:	77 30                	ja     4409b <printer_vprintf+0x68d>
   4406b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44072:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44076:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4407d:	8b 00                	mov    (%rax),%eax
   4407f:	89 c0                	mov    %eax,%eax
   44081:	48 01 d0             	add    %rdx,%rax
   44084:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4408b:	8b 12                	mov    (%rdx),%edx
   4408d:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44090:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44097:	89 0a                	mov    %ecx,(%rdx)
   44099:	eb 1a                	jmp    440b5 <printer_vprintf+0x6a7>
   4409b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   440a2:	48 8b 40 08          	mov    0x8(%rax),%rax
   440a6:	48 8d 48 08          	lea    0x8(%rax),%rcx
   440aa:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   440b1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   440b5:	8b 00                	mov    (%rax),%eax
   440b7:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   440ba:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
   440be:	eb 45                	jmp    44105 <printer_vprintf+0x6f7>
        default:
            data = numbuf;
   440c0:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   440c4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
   440c8:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   440cf:	0f b6 00             	movzbl (%rax),%eax
   440d2:	84 c0                	test   %al,%al
   440d4:	74 0c                	je     440e2 <printer_vprintf+0x6d4>
   440d6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   440dd:	0f b6 00             	movzbl (%rax),%eax
   440e0:	eb 05                	jmp    440e7 <printer_vprintf+0x6d9>
   440e2:	b8 25 00 00 00       	mov    $0x25,%eax
   440e7:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   440ea:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
   440ee:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   440f5:	0f b6 00             	movzbl (%rax),%eax
   440f8:	84 c0                	test   %al,%al
   440fa:	75 08                	jne    44104 <printer_vprintf+0x6f6>
                format--;
   440fc:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
   44103:	01 
            }
            break;
   44104:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
   44105:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44108:	83 e0 20             	and    $0x20,%eax
   4410b:	85 c0                	test   %eax,%eax
   4410d:	74 1e                	je     4412d <printer_vprintf+0x71f>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
   4410f:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44113:	48 83 c0 18          	add    $0x18,%rax
   44117:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4411a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   4411e:	48 89 ce             	mov    %rcx,%rsi
   44121:	48 89 c7             	mov    %rax,%rdi
   44124:	e8 63 f8 ff ff       	call   4398c <fill_numbuf>
   44129:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
   4412d:	48 c7 45 c0 e6 51 04 	movq   $0x451e6,-0x40(%rbp)
   44134:	00 
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   44135:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44138:	83 e0 20             	and    $0x20,%eax
   4413b:	85 c0                	test   %eax,%eax
   4413d:	74 48                	je     44187 <printer_vprintf+0x779>
   4413f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44142:	83 e0 40             	and    $0x40,%eax
   44145:	85 c0                	test   %eax,%eax
   44147:	74 3e                	je     44187 <printer_vprintf+0x779>
            if (flags & FLAG_NEGATIVE) {
   44149:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4414c:	25 80 00 00 00       	and    $0x80,%eax
   44151:	85 c0                	test   %eax,%eax
   44153:	74 0a                	je     4415f <printer_vprintf+0x751>
                prefix = "-";
   44155:	48 c7 45 c0 e7 51 04 	movq   $0x451e7,-0x40(%rbp)
   4415c:	00 
            if (flags & FLAG_NEGATIVE) {
   4415d:	eb 73                	jmp    441d2 <printer_vprintf+0x7c4>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   4415f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44162:	83 e0 10             	and    $0x10,%eax
   44165:	85 c0                	test   %eax,%eax
   44167:	74 0a                	je     44173 <printer_vprintf+0x765>
                prefix = "+";
   44169:	48 c7 45 c0 e9 51 04 	movq   $0x451e9,-0x40(%rbp)
   44170:	00 
            if (flags & FLAG_NEGATIVE) {
   44171:	eb 5f                	jmp    441d2 <printer_vprintf+0x7c4>
            } else if (flags & FLAG_SPACEPOSITIVE) {
   44173:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44176:	83 e0 08             	and    $0x8,%eax
   44179:	85 c0                	test   %eax,%eax
   4417b:	74 55                	je     441d2 <printer_vprintf+0x7c4>
                prefix = " ";
   4417d:	48 c7 45 c0 eb 51 04 	movq   $0x451eb,-0x40(%rbp)
   44184:	00 
            if (flags & FLAG_NEGATIVE) {
   44185:	eb 4b                	jmp    441d2 <printer_vprintf+0x7c4>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44187:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4418a:	83 e0 20             	and    $0x20,%eax
   4418d:	85 c0                	test   %eax,%eax
   4418f:	74 42                	je     441d3 <printer_vprintf+0x7c5>
   44191:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44194:	83 e0 01             	and    $0x1,%eax
   44197:	85 c0                	test   %eax,%eax
   44199:	74 38                	je     441d3 <printer_vprintf+0x7c5>
                   && (base == 16 || base == -16)
   4419b:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
   4419f:	74 06                	je     441a7 <printer_vprintf+0x799>
   441a1:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   441a5:	75 2c                	jne    441d3 <printer_vprintf+0x7c5>
                   && (num || (flags & FLAG_ALT2))) {
   441a7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   441ac:	75 0c                	jne    441ba <printer_vprintf+0x7ac>
   441ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441b1:	25 00 01 00 00       	and    $0x100,%eax
   441b6:	85 c0                	test   %eax,%eax
   441b8:	74 19                	je     441d3 <printer_vprintf+0x7c5>
            prefix = (base == -16 ? "0x" : "0X");
   441ba:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   441be:	75 07                	jne    441c7 <printer_vprintf+0x7b9>
   441c0:	b8 ed 51 04 00       	mov    $0x451ed,%eax
   441c5:	eb 05                	jmp    441cc <printer_vprintf+0x7be>
   441c7:	b8 f0 51 04 00       	mov    $0x451f0,%eax
   441cc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   441d0:	eb 01                	jmp    441d3 <printer_vprintf+0x7c5>
            if (flags & FLAG_NEGATIVE) {
   441d2:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   441d3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   441d7:	78 24                	js     441fd <printer_vprintf+0x7ef>
   441d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441dc:	83 e0 20             	and    $0x20,%eax
   441df:	85 c0                	test   %eax,%eax
   441e1:	75 1a                	jne    441fd <printer_vprintf+0x7ef>
            len = strnlen(data, precision);
   441e3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   441e6:	48 63 d0             	movslq %eax,%rdx
   441e9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   441ed:	48 89 d6             	mov    %rdx,%rsi
   441f0:	48 89 c7             	mov    %rax,%rdi
   441f3:	e8 ea f5 ff ff       	call   437e2 <strnlen>
   441f8:	89 45 bc             	mov    %eax,-0x44(%rbp)
   441fb:	eb 0f                	jmp    4420c <printer_vprintf+0x7fe>
        } else {
            len = strlen(data);
   441fd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44201:	48 89 c7             	mov    %rax,%rdi
   44204:	e8 a8 f5 ff ff       	call   437b1 <strlen>
   44209:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   4420c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4420f:	83 e0 20             	and    $0x20,%eax
   44212:	85 c0                	test   %eax,%eax
   44214:	74 20                	je     44236 <printer_vprintf+0x828>
   44216:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   4421a:	78 1a                	js     44236 <printer_vprintf+0x828>
            zeros = precision > len ? precision - len : 0;
   4421c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4421f:	3b 45 bc             	cmp    -0x44(%rbp),%eax
   44222:	7e 08                	jle    4422c <printer_vprintf+0x81e>
   44224:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44227:	2b 45 bc             	sub    -0x44(%rbp),%eax
   4422a:	eb 05                	jmp    44231 <printer_vprintf+0x823>
   4422c:	b8 00 00 00 00       	mov    $0x0,%eax
   44231:	89 45 b8             	mov    %eax,-0x48(%rbp)
   44234:	eb 5c                	jmp    44292 <printer_vprintf+0x884>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   44236:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44239:	83 e0 20             	and    $0x20,%eax
   4423c:	85 c0                	test   %eax,%eax
   4423e:	74 4b                	je     4428b <printer_vprintf+0x87d>
   44240:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44243:	83 e0 02             	and    $0x2,%eax
   44246:	85 c0                	test   %eax,%eax
   44248:	74 41                	je     4428b <printer_vprintf+0x87d>
                   && !(flags & FLAG_LEFTJUSTIFY)
   4424a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4424d:	83 e0 04             	and    $0x4,%eax
   44250:	85 c0                	test   %eax,%eax
   44252:	75 37                	jne    4428b <printer_vprintf+0x87d>
                   && len + (int) strlen(prefix) < width) {
   44254:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44258:	48 89 c7             	mov    %rax,%rdi
   4425b:	e8 51 f5 ff ff       	call   437b1 <strlen>
   44260:	89 c2                	mov    %eax,%edx
   44262:	8b 45 bc             	mov    -0x44(%rbp),%eax
   44265:	01 d0                	add    %edx,%eax
   44267:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   4426a:	7e 1f                	jle    4428b <printer_vprintf+0x87d>
            zeros = width - len - strlen(prefix);
   4426c:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4426f:	2b 45 bc             	sub    -0x44(%rbp),%eax
   44272:	89 c3                	mov    %eax,%ebx
   44274:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44278:	48 89 c7             	mov    %rax,%rdi
   4427b:	e8 31 f5 ff ff       	call   437b1 <strlen>
   44280:	89 c2                	mov    %eax,%edx
   44282:	89 d8                	mov    %ebx,%eax
   44284:	29 d0                	sub    %edx,%eax
   44286:	89 45 b8             	mov    %eax,-0x48(%rbp)
   44289:	eb 07                	jmp    44292 <printer_vprintf+0x884>
        } else {
            zeros = 0;
   4428b:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
   44292:	8b 55 bc             	mov    -0x44(%rbp),%edx
   44295:	8b 45 b8             	mov    -0x48(%rbp),%eax
   44298:	01 d0                	add    %edx,%eax
   4429a:	48 63 d8             	movslq %eax,%rbx
   4429d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   442a1:	48 89 c7             	mov    %rax,%rdi
   442a4:	e8 08 f5 ff ff       	call   437b1 <strlen>
   442a9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
   442ad:	8b 45 e8             	mov    -0x18(%rbp),%eax
   442b0:	29 d0                	sub    %edx,%eax
   442b2:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   442b5:	eb 25                	jmp    442dc <printer_vprintf+0x8ce>
            p->putc(p, ' ', color);
   442b7:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442be:	48 8b 08             	mov    (%rax),%rcx
   442c1:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   442c7:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442ce:	be 20 00 00 00       	mov    $0x20,%esi
   442d3:	48 89 c7             	mov    %rax,%rdi
   442d6:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   442d8:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   442dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   442df:	83 e0 04             	and    $0x4,%eax
   442e2:	85 c0                	test   %eax,%eax
   442e4:	75 36                	jne    4431c <printer_vprintf+0x90e>
   442e6:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   442ea:	7f cb                	jg     442b7 <printer_vprintf+0x8a9>
        }
        for (; *prefix; ++prefix) {
   442ec:	eb 2e                	jmp    4431c <printer_vprintf+0x90e>
            p->putc(p, *prefix, color);
   442ee:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442f5:	4c 8b 00             	mov    (%rax),%r8
   442f8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   442fc:	0f b6 00             	movzbl (%rax),%eax
   442ff:	0f b6 c8             	movzbl %al,%ecx
   44302:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44308:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4430f:	89 ce                	mov    %ecx,%esi
   44311:	48 89 c7             	mov    %rax,%rdi
   44314:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
   44317:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
   4431c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44320:	0f b6 00             	movzbl (%rax),%eax
   44323:	84 c0                	test   %al,%al
   44325:	75 c7                	jne    442ee <printer_vprintf+0x8e0>
        }
        for (; zeros > 0; --zeros) {
   44327:	eb 25                	jmp    4434e <printer_vprintf+0x940>
            p->putc(p, '0', color);
   44329:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44330:	48 8b 08             	mov    (%rax),%rcx
   44333:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44339:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44340:	be 30 00 00 00       	mov    $0x30,%esi
   44345:	48 89 c7             	mov    %rax,%rdi
   44348:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
   4434a:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
   4434e:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
   44352:	7f d5                	jg     44329 <printer_vprintf+0x91b>
        }
        for (; len > 0; ++data, --len) {
   44354:	eb 32                	jmp    44388 <printer_vprintf+0x97a>
            p->putc(p, *data, color);
   44356:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4435d:	4c 8b 00             	mov    (%rax),%r8
   44360:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44364:	0f b6 00             	movzbl (%rax),%eax
   44367:	0f b6 c8             	movzbl %al,%ecx
   4436a:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44370:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44377:	89 ce                	mov    %ecx,%esi
   44379:	48 89 c7             	mov    %rax,%rdi
   4437c:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
   4437f:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
   44384:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
   44388:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   4438c:	7f c8                	jg     44356 <printer_vprintf+0x948>
        }
        for (; width > 0; --width) {
   4438e:	eb 25                	jmp    443b5 <printer_vprintf+0x9a7>
            p->putc(p, ' ', color);
   44390:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44397:	48 8b 08             	mov    (%rax),%rcx
   4439a:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   443a0:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   443a7:	be 20 00 00 00       	mov    $0x20,%esi
   443ac:	48 89 c7             	mov    %rax,%rdi
   443af:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
   443b1:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   443b5:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   443b9:	7f d5                	jg     44390 <printer_vprintf+0x982>
        }
    done: ;
   443bb:	90                   	nop
    for (; *format; ++format) {
   443bc:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   443c3:	01 
   443c4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   443cb:	0f b6 00             	movzbl (%rax),%eax
   443ce:	84 c0                	test   %al,%al
   443d0:	0f 85 64 f6 ff ff    	jne    43a3a <printer_vprintf+0x2c>
    }
}
   443d6:	90                   	nop
   443d7:	90                   	nop
   443d8:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   443dc:	c9                   	leave  
   443dd:	c3                   	ret    

00000000000443de <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   443de:	55                   	push   %rbp
   443df:	48 89 e5             	mov    %rsp,%rbp
   443e2:	48 83 ec 20          	sub    $0x20,%rsp
   443e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   443ea:	89 f0                	mov    %esi,%eax
   443ec:	89 55 e0             	mov    %edx,-0x20(%rbp)
   443ef:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
   443f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   443f6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   443fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   443fe:	48 8b 40 08          	mov    0x8(%rax),%rax
   44402:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
   44407:	48 39 d0             	cmp    %rdx,%rax
   4440a:	72 0c                	jb     44418 <console_putc+0x3a>
        cp->cursor = console;
   4440c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44410:	48 c7 40 08 00 80 0b 	movq   $0xb8000,0x8(%rax)
   44417:	00 
    }
    if (c == '\n') {
   44418:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
   4441c:	75 78                	jne    44496 <console_putc+0xb8>
        int pos = (cp->cursor - console) % 80;
   4441e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44422:	48 8b 40 08          	mov    0x8(%rax),%rax
   44426:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   4442c:	48 d1 f8             	sar    %rax
   4442f:	48 89 c1             	mov    %rax,%rcx
   44432:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   44439:	66 66 66 
   4443c:	48 89 c8             	mov    %rcx,%rax
   4443f:	48 f7 ea             	imul   %rdx
   44442:	48 c1 fa 05          	sar    $0x5,%rdx
   44446:	48 89 c8             	mov    %rcx,%rax
   44449:	48 c1 f8 3f          	sar    $0x3f,%rax
   4444d:	48 29 c2             	sub    %rax,%rdx
   44450:	48 89 d0             	mov    %rdx,%rax
   44453:	48 c1 e0 02          	shl    $0x2,%rax
   44457:	48 01 d0             	add    %rdx,%rax
   4445a:	48 c1 e0 04          	shl    $0x4,%rax
   4445e:	48 29 c1             	sub    %rax,%rcx
   44461:	48 89 ca             	mov    %rcx,%rdx
   44464:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
   44467:	eb 25                	jmp    4448e <console_putc+0xb0>
            *cp->cursor++ = ' ' | color;
   44469:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4446c:	83 c8 20             	or     $0x20,%eax
   4446f:	89 c6                	mov    %eax,%esi
   44471:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44475:	48 8b 40 08          	mov    0x8(%rax),%rax
   44479:	48 8d 48 02          	lea    0x2(%rax),%rcx
   4447d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   44481:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44485:	89 f2                	mov    %esi,%edx
   44487:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
   4448a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4448e:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
   44492:	75 d5                	jne    44469 <console_putc+0x8b>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
   44494:	eb 24                	jmp    444ba <console_putc+0xdc>
        *cp->cursor++ = c | color;
   44496:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
   4449a:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4449d:	09 d0                	or     %edx,%eax
   4449f:	89 c6                	mov    %eax,%esi
   444a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   444a5:	48 8b 40 08          	mov    0x8(%rax),%rax
   444a9:	48 8d 48 02          	lea    0x2(%rax),%rcx
   444ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   444b1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   444b5:	89 f2                	mov    %esi,%edx
   444b7:	66 89 10             	mov    %dx,(%rax)
}
   444ba:	90                   	nop
   444bb:	c9                   	leave  
   444bc:	c3                   	ret    

00000000000444bd <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
   444bd:	55                   	push   %rbp
   444be:	48 89 e5             	mov    %rsp,%rbp
   444c1:	48 83 ec 30          	sub    $0x30,%rsp
   444c5:	89 7d ec             	mov    %edi,-0x14(%rbp)
   444c8:	89 75 e8             	mov    %esi,-0x18(%rbp)
   444cb:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   444cf:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
   444d3:	48 c7 45 f0 de 43 04 	movq   $0x443de,-0x10(%rbp)
   444da:	00 
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   444db:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
   444df:	78 09                	js     444ea <console_vprintf+0x2d>
   444e1:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
   444e8:	7e 07                	jle    444f1 <console_vprintf+0x34>
        cpos = 0;
   444ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
   444f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
   444f4:	48 98                	cltq   
   444f6:	48 01 c0             	add    %rax,%rax
   444f9:	48 05 00 80 0b 00    	add    $0xb8000,%rax
   444ff:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   44503:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   44507:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4450b:	8b 75 e8             	mov    -0x18(%rbp),%esi
   4450e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
   44512:	48 89 c7             	mov    %rax,%rdi
   44515:	e8 f4 f4 ff ff       	call   43a0e <printer_vprintf>
    return cp.cursor - console;
   4451a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4451e:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   44524:	48 d1 f8             	sar    %rax
}
   44527:	c9                   	leave  
   44528:	c3                   	ret    

0000000000044529 <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
   44529:	55                   	push   %rbp
   4452a:	48 89 e5             	mov    %rsp,%rbp
   4452d:	48 83 ec 60          	sub    $0x60,%rsp
   44531:	89 7d ac             	mov    %edi,-0x54(%rbp)
   44534:	89 75 a8             	mov    %esi,-0x58(%rbp)
   44537:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   4453b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4453f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44543:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44547:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   4454e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44552:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44556:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4455a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   4455e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44562:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   44566:	8b 75 a8             	mov    -0x58(%rbp),%esi
   44569:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4456c:	89 c7                	mov    %eax,%edi
   4456e:	e8 4a ff ff ff       	call   444bd <console_vprintf>
   44573:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   44576:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   44579:	c9                   	leave  
   4457a:	c3                   	ret    

000000000004457b <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   4457b:	55                   	push   %rbp
   4457c:	48 89 e5             	mov    %rsp,%rbp
   4457f:	48 83 ec 20          	sub    $0x20,%rsp
   44583:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44587:	89 f0                	mov    %esi,%eax
   44589:	89 55 e0             	mov    %edx,-0x20(%rbp)
   4458c:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
   4458f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44593:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
   44597:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4459b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4459f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   445a3:	48 8b 40 10          	mov    0x10(%rax),%rax
   445a7:	48 39 c2             	cmp    %rax,%rdx
   445aa:	73 1a                	jae    445c6 <string_putc+0x4b>
        *sp->s++ = c;
   445ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   445b0:	48 8b 40 08          	mov    0x8(%rax),%rax
   445b4:	48 8d 48 01          	lea    0x1(%rax),%rcx
   445b8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   445bc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   445c0:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   445c4:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
   445c6:	90                   	nop
   445c7:	c9                   	leave  
   445c8:	c3                   	ret    

00000000000445c9 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   445c9:	55                   	push   %rbp
   445ca:	48 89 e5             	mov    %rsp,%rbp
   445cd:	48 83 ec 40          	sub    $0x40,%rsp
   445d1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   445d5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   445d9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   445dd:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
   445e1:	48 c7 45 e8 7b 45 04 	movq   $0x4457b,-0x18(%rbp)
   445e8:	00 
    sp.s = s;
   445e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   445ed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
   445f1:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   445f6:	74 33                	je     4462b <vsnprintf+0x62>
        sp.end = s + size - 1;
   445f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   445fc:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   44600:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44604:	48 01 d0             	add    %rdx,%rax
   44607:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   4460b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   4460f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   44613:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   44617:	be 00 00 00 00       	mov    $0x0,%esi
   4461c:	48 89 c7             	mov    %rax,%rdi
   4461f:	e8 ea f3 ff ff       	call   43a0e <printer_vprintf>
        *sp.s = 0;
   44624:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44628:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
   4462b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4462f:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
   44633:	c9                   	leave  
   44634:	c3                   	ret    

0000000000044635 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   44635:	55                   	push   %rbp
   44636:	48 89 e5             	mov    %rsp,%rbp
   44639:	48 83 ec 70          	sub    $0x70,%rsp
   4463d:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   44641:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   44645:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   44649:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4464d:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44651:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44655:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
   4465c:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44660:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   44664:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44668:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
   4466c:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   44670:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   44674:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
   44678:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4467c:	48 89 c7             	mov    %rax,%rdi
   4467f:	e8 45 ff ff ff       	call   445c9 <vsnprintf>
   44684:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
   44687:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
   4468a:	c9                   	leave  
   4468b:	c3                   	ret    

000000000004468c <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   4468c:	55                   	push   %rbp
   4468d:	48 89 e5             	mov    %rsp,%rbp
   44690:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44694:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4469b:	eb 13                	jmp    446b0 <console_clear+0x24>
        console[i] = ' ' | 0x0700;
   4469d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   446a0:	48 98                	cltq   
   446a2:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%rax,%rax,1)
   446a9:	00 20 07 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   446ac:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   446b0:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
   446b7:	7e e4                	jle    4469d <console_clear+0x11>
    }
    cursorpos = 0;
   446b9:	c7 05 39 49 07 00 00 	movl   $0x0,0x74939(%rip)        # b8ffc <cursorpos>
   446c0:	00 00 00 
}
   446c3:	90                   	nop
   446c4:	c9                   	leave  
   446c5:	c3                   	ret    

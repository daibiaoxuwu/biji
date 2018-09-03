 .equ NULL,  0 
 .section  .data 
 intNum: 
    .int 1498
.section .bss
    .lcomm strNum, 10

.section .text
.globl _start
_start:
    movl intNum, %eax 
    movq $0,   %rcx 
    movl $10, %ebx 
divideLoop: 
    movl $0, %edx 
    divl %ebx 
    pushq %rdx #push remainder
    incq %rcx
    cmpl $0, %eax
    jne divideLoop

    movq $strNum, %rbx
    movq $0, %rdi
popLoop:
    popq %rax
    addb $48, %al     # 字符0的ASCII码是48 
    movb %al, (%rbx,%rdi,1)
    incq %rdi
    loop popLoop

    movb $NULL, (%rbx,%rdi,1)
    movq %rdi, %rdx
    movq %rbx, %rsi
    movq $1, %rax # 系统调用号(sys_write)
    movq $1, %rdi # 文件描述符(stdout)
    syscall
exit:
    movq $60, %rax #程序退出 
    movq $0,   %rdi #退出值 
    syscall

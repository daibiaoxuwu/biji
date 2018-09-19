.text
.globl _start
_start:
    popq %rsi # argc
vnext:
    popq %rsi # argv
    testq %rsi, %rsi # 空指针表明结束 
    jz exit 
    movq %rsi, %rbx
    xorq %rdx, %rdx
    
strlen:
    movb (%rbx), %al 
    incq %rdx
    incq %rbx
    testb %al, %al
    jnz strlen 
    movb $10, -1(%rbx) #10是换行键
    movq $1, %rax # 系统调用号(sys_write) 
    movq $1, %rdi # 文件描述符(stdout) 
    syscall 
    jmpvnext
exit:
    movq $60, %rax #程序退出 
    movq $0,   %rdi #退出值 
    syscall

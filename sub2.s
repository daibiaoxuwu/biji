.text
.globl _start
_start:
    popq %rsi # argc
vnext:
    popq %rsi # argv
    testq %rsi, %rsi # ��ָ��������� 
    jz exit 
    movq %rsi, %rbx
    xorq %rdx, %rdx
    
strlen:
    movb (%rbx), %al 
    incq %rdx
    incq %rbx
    testb %al, %al
    jnz strlen 
    movb $10, -1(%rbx) #10�ǻ��м�
    movq $1, %rax # ϵͳ���ú�(sys_write) 
    movq $1, %rdi # �ļ�������(stdout) 
    syscall 
    jmpvnext
exit:
    movq $60, %rax #�����˳� 
    movq $0,   %rdi #�˳�ֵ 
    syscall

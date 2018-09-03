# Example program to demonstrate file I/O.
This example # will open/create a file, write some information to the # file, and close the file.
Note, the file name and # write message are hard-coded for the example.
.section .data
.equ LF, 10 #line feed
.equ NULL,0 #end of string
.equ TRUE,1 .equ FALSE,0
.equ EXIT_SUCCESS,0 #success code
.equ STDIN, 0  #standard input 
.equ STDOUT,1 #standard output 
.equ STDERR,2 #standard error
.equ SYS_read,0 #read
.equ SYS_write,1 #write
.equ SYS_open, 2 #file open
.equ SYS_close,3 #file close
.equ SYS_fork,57 #fork
.equ SYS_exit, 60 #terminate
.equ SYS_creat, 85 #file open/create
.equ SYS_time, 201 #get time
.equ O_CREAT,  0x40 .equ O_TRUNC,  0x200
.equ O_APPEND, 0x400
.equ O_RDONLY, 000000 #read only
.equ O_WRONLY, 000001 #write only
.equ O_RDWR,   000002 #read and write 
.equ S_IRUSR,  0x100 
.equ S_IWUSR,  0x80 
.equ S_IXUSR, 0x40

newline: 
    .int LF, NULL 
header:
    .ascii "\nFile Write Example.\n\n\0"
filename:
    .ascii "url.txt\0"
url:
    .ascii "http://www.google.com\n\0
len = .–url - 1

writeDone:
    .ascii "Write Completed.\n\0"
fileDescrip:
    .quad   0
errMsgOpen:
    .ascii "Error opening file.\n\0"
errMsgWrite:
    .ascii "Error writing to file.\n\0"

.section .text
.globl _start
_start: 
    movq $header,%rdi
    call printString
openInputFile:
    movq $SYS_creat, %rax
    movq $filename, %rdi
    movq $S_IRUSR|S_IWUSR, %rsi
    syscall

    cmp $0, %rax
    jl errorOnOpen
    
    movq %rax, fileDescrip

    movq $SYS_write, %rax
    movq fileDescriptor, %rdi
    movq $url, %rsi
    movq $len, %rdx
    syscall
    cmpq $0, %rax
    jl errorOnWrite
    
    movq $writeDone, %rdi
    call printString
    
    movq $SYS_close, %rax
    movq fileDescriptor, %rdi
    syscall
    jmp exampleDone

errorOnOpen:
    movq $errMsgOpen,  %rdi
    call printString
    jmp exampleDone

errorOnWrite:
    movq $errMsgWrite, %rdi
    call printString
    jmp exampleDone

exampleDone:
    movq $SYS_exit, %rax
    movq $EXIT_SUCCESS, %rdi
    syscall

.globl printString
printString:
    pushq %rbx
    movq %rdi, %rbx
    movq $0, %rdx
strCountLoop:
    cmpb $NULL,(%rbx)
    je strCountDone
    incq %rdx
    incq %rbx
    jmp strCountLoop
strCountDone:
    cmpq $0, %rdx
    je prtDone
    
    movq $SYS_write, %rax
    movq %rdi,%rsi
    movq $STDOUT,%rdi
    syscall
prtDone:
    popq %rbx
    ret


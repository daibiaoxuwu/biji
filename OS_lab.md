#### OS实验操作

###### 启动gdb调试

编译源码：lab1$ make

启动qemu进程：lab1$ qemu-system-i386 -S -s -hda bin/ucore.img -monitor stdio

启动gdb：lab1$ gdb -tui -x ../tools/gdbinit

或者在gdb下输入

```
(gdb)  target remote 127.0.0.1:1234
(gdb)  file ./bin/kernel
(gdb)  b memset
(gdb)  c
```

- 软件：Eclipse-CDT：基于Eclipse的C/C++集成开发环境、跨平台、丰富的分析理解代码的功能，可与qemu结合，联机源码级Debug uCore OS。
- Eclipse-CDT
  - <http://blog.csdn.net/anzhu_111/article/details/5946634>

直接运行方法：lab1$ make qemu



```
"$(QEMU) -S -s -d in_asm -D $(BINDIR)/q.log -monitor stdio -hda $< -serial null"
sleep 2
gdb -tui -q -x tools/gdbinit_bios

file bin/kernel
target remote :1234
set architecture i8086
```

ec

b0

ec-b0=3c=60 3g

300-ec=14

c4-b0=14
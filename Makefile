TARGETS = add/add hello/hello fib/fib list/list simd/add4

ARCH != uname -m

ifneq ($(ARCH),aarch64)
QEMU=qemu-aarch64
LDFLAGS=-static
endif



CC=aarch64-linux-gnu-gcc
AS=aarch64-linux-gnu-as



CFLAGS=-g -Wall -W

all : $(TARGETS)

ADD_OBJS = add/add.o add/main.o

add/add : $(ADD_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(ADD_OBJS)

HELLO_OBJS = hello/hello.o

hello/hello : $(HELLO_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(HELLO_OBJS)

FIB_OBJS = fib/fib.o

fib/fib : $(FIB_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(FIB_OBJS)

LIST_OBJS = list/main.o list/list.o

list/main.o : list/list.h

list/list : $(LIST_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(LIST_OBJS)

SIMD_OBJS = simd/main.o simd/add4.o

simd/add4 : $(SIMD_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(SIMD_OBJS)

ALL_OBJS = $(ADD_OBJS) $(HELLO_OBJS) $(FIB_OBJS) $(LIST_OBJS) $(SIMD_OBJS)

clean :
	rm -f $(TARGETS) $(ALL_OBJS)

test : add-test

add-test : add/add
	$(QEMU) add/add 3 4 | cmp - test/add.expected

TARGETS = add/add hello/hello fib/fib list/list

CFLAGS=-g -Wall -W

all : $(TARGETS)

ADD_OBJS = add/add.o add/main.o

add/add : $(ADD_OBJS)
	$(CC) -o $@ $(ADD_OBJS)

HELLO_OBJS = hello/hello.o

hello/hello : $(HELLO_OBJS)
	$(CC) -o $@ $(HELLO_OBJS)

FIB_OBJS = fib/fib.o

fib/fib : $(FIB_OBJS)
	$(CC) -o $@ $(FIB_OBJS)

LIST_OBJS = list/main.o list/list.o

list/main.o : list/list.h

list/list : $(LIST_OBJS)
	$(CC) -o $@ $(LIST_OBJS)


ALL_OBJS = $(ADD_OBJS) $(HELLO_OBJS) $(FIB_OBJS)

clean :
	rm $(TARGETS) $(ALL_OBJS)



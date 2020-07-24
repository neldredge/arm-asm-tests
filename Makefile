TARGETS = add/add hello/hello fib/fib

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

ALL_OBJS = $(ADD_OBJS) $(HELLO_OBJS) $(FIB_OBJS)

clean :
	rm $(TARGETS) $(ALL_OBJS)



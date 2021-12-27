CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

./9cc/main: $(OBJS)
						$(CC) -o 9cc $(OBJS) $(LDFLAGS)

$(OBJS): 9cc.h

test: 9cc
				./test/test.sh

clean:
				rm -f 9cc *.o *~ tmp* ./test/tmp*

.PHONY: test clean
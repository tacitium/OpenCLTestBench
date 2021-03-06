CFLAGS = -std=c99 -Wall -Wno-unused-variable -Wno-deprecated-declarations -DMAX_ITERS=100 -DNTH=8 -DBUF_SZ=1048576 -DVERBOSE_MT=0
# If you have a GPU, add this to your CFLAGS: -DGPU

CC = gcc
ALL = testbench

all: $(ALL)


testbench: testbench.o driver.o
	$(CC) -L$(AMDAPPSDKROOT)/lib/x86_64  testbench.o driver.o -lOpenCL -o testbench


testbench.o: testbench.c
	$(CC) $(CFLAGS) -I$(AMDAPPSDKROOT)/include -pthread -c testbench.c

driver.o: driver.c
	$(CC) $(CFLAGS) -I$(AMDAPPSDKROOT)/include -c driver.c

clean:
	rm *.o testbench

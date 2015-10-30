EXTRA_CFLAGS +=
APP_EXTRA_FLAGS:= -O2 -ansi -pedantic
KERNEL_SRC:= /lib/modules/$(shell uname -r)/build
SUBDIR= $(PWD)
GCC:=gcc
RM:=rm

.PHONY : clean

all: clean modules

obj-m:= vmlaunch_simple.o

modules:
	$(MAKE) -C $(KERNEL_SRC) M=$(SUBDIR) modules

clean:
	$(RM) -f *~ *.ko *.o *.mod.c Module.symvers modules.order

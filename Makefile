TARGET = inferno

C_OBJS = \
	main.o \
	src/iodrv_funcs.o \
	src/umd.o \
	src/isoread.o \
	src/isocache.o

OBJS = $(C_OBJS) imports.o

PSPSDK = $(shell psp-config --pspsdk-path)
ARKSDK ?= ../ark-dev-sdk

all: $(TARGET).prx
INCDIR = include $(ARKSDK)/include
CFLAGS = -std=c99 -Os -G0 -Wall

ifdef DEBUG
CFLAGS += -DDEBUG=$(DEBUG)
endif

LDFLAGS =  -nostartfiles
LIBDIR = $(ARKSDK)/libs
LIBS = -lpspsystemctrl_kernel

PSP_FW_VERSION = 660

PRX_EXPORTS = exports.exp

BUILD_PRX=1
USE_KERNEL_LIBS=1
USE_KERNEL_LIBC=1

include $(PSPSDK)/lib/build.mak

ifneq (${KERNELRELEASE},)
obj-m += procfs1.o
obj-m += procfs2.o
obj-m += procfs3.o
obj-m += assignment.o

# Assignment module here
else
KERNEL_SOURCE := ../kernel_source/linux-4.18.16/
PWD := $(shell pwd)
default:
	# Compile for the same architecture as the host machine
	$(MAKE) -C $(KERNEL_SOURCE) SUBDIRS=${PWD} modules
arm:
	# Cross compile for arm64/aarch64 architecture - Cross compiler needed !!!  
	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- $(MAKE) -C $(KERNEL_SOURCE) SUBDIRS=${PWD} modules
clean:
	# Cleans the Directory - removes all the files that were created
	$(MAKE) -C $(KERNEL_SOURCE) SUBDIRS=${PWD} clean
endif

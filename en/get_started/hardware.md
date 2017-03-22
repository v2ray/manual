# Hardware requirements

## CPU

V2Ray supports x86, x86-64, ARM, ARM-64 and MIPS 64 CPU。

* X86: At least single core. 64-bits dual core or above is recommended.
* ARM: At least ARMv6 single core. Dual core or above is recommended.

## Memory

At least 32MB free memory, 64 MB or above is recommended. Golang program will apply for a hugh amount of virutal memories(VIRT), it will not be calculated into memory that you actually used, OpenVz may not friendly with this.

## Hard drive

V2Ray will storage necessary binaries and config files(less than 10M), as well as log files during working(will continuously increase until hard drive is full), the logs should increase less than 10M per week in normal circumstances (You can turn off logging manually).

## Network

V2Ray will use as much as bandwidth to increase the speed. Notice: the bandwidth of a machine you used to trasnfer data is symmetry, which mean if you downloaded a 10G file, the machine will use 20G bandwidth.

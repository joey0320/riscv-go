#!/bin/bash


echo $RISCV
QEMU=/scratch/joonho.whangbo/coding/riscv-gnu-toolchain/qemu/build/qemu-system-riscv64
MEM=16384
CHIPYARD=/scratch/joonho.whangbo/coding/chipyard/
FIREMARSHAL=$CHIPYARD/software/firemarshal
KERNEL=$FIREMARSHAL/images/helloworld/helloworld-bin
IMAGE=$FIREMARSHAL/images/helloworld/helloworld.img

$QEMU -s -nographic -bios none \
  -smp 4 -machine virt -m $MEM \
  -kernel $KERNEL \
  -device virtio-blk-device,drive=hd0 \
  -drive file=$IMAGE,format=raw,id=hd0

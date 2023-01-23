#!/bin/bash


echo $RISCV
QEMU=/scratch/joonho.whangbo/coding/riscv-gnu-toolchain/qemu/build/qemu-system-riscv64
MEM=16384
CHIPYARD=/scratch/joonho.whangbo/coding/chipyard/
FIREMARSHAL=$CHIPYARD/software/firemarshal


function run_qemu {
  if [ $# -eq 0 ]
  then
    echo "Usage: ./run-qemu.sh <name>"
    exit 1
  fi

  KERNEL=$FIREMARSHAL/images/$1/$1-bin
  IMAGE=$FIREMARSHAL/images/$1/$1.img

  $QEMU -s -nographic -bios none \
    -smp 4 -machine virt -m $MEM \
    -kernel $KERNEL \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-device,rng=rng0 \
    -device virtio-net-device,netdev=usernet \
    -netdev user,id=usernet,hostfwd=tcp::3020-:22 \
    -device virtio-blk-device,drive=hd0 \
    -drive file=$IMAGE,format=raw,id=hd0
}

run_qemu $1

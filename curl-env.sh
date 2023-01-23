#!/bin/bash


export CPPFLAGS="-I$RISCV/include -I$RISCV/riscv64-unknown-elf/include -I$RISCV/sysroot/lib"
export AR="riscv64-unknown-elf-ar"
export AS="riscv64-unknown-elf-as"
export LD="riscv64-unknown-elf-ld"
export RANLIB="riscv64-unknown-elf-ranlib"
export CC="riscv64-unknown-elf-gcc"
export NM="riscv64-unknown-elf-nm"
export CROSS_COMPILE="riscv64-unknown-elf"

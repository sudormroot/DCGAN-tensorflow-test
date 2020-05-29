#!/bin/sh

script_path="`dirname $0`"

. $script_path/env.sh

export UNIFIED_MEMORY_SET=no

stdbuf -oL python main.py --epoch 1 --batch_size 64 --dataset mnist --input_height=28 --output_height=28 --train 2>&1 | tee $script_path/output_mnist_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt
stdbuf -oL python main.py --epoch 1 --batch_size 128 --dataset mnist --input_height=28 --output_height=28 --train 2>&1 | tee $script_path/output_mnist_batchsize-128_umem-$UNIFIED_MEMORY_SET.txt

#stdbuf -oL python main.py --epoch 1 --batch_size 64 --dataset celebA --input_height=108 --train --crop 2>&1 | tee $script_path/output_celeba_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt
#stdbuf -oL python main.py --epoch 1 --batch_size 128 --dataset celebA --input_height=108 --train --crop 2>&1 | tee $script_path/output_celeba_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt


export UNIFIED_MEMORY_SET=yes
stdbuf -oL python main.py --epoch 1 --batch_size 64 --dataset mnist --input_height=28 --output_height=28 --train 2>&1 | tee $script_path/output_mnist_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt
stdbuf -oL python main.py --epoch 1 --batch_size 128 --dataset mnist --input_height=28 --output_height=28 --train 2>&1 | tee $script_path/output_mnist_batchsize-128_umem-$UNIFIED_MEMORY_SET.txt

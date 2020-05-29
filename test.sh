#!/bin/sh

script_path="`dirname $0`"

. $script_path/env.sh

export UNIFIED_MEMORY_SET=no
#stdbuf -oL python $script_path/train.py --train_batch_size=128 --train_steps=12 2>&1 | tee $script_path/output_batchsize-128_umem-$UNIFIED_MEMORY_SET.txt
#stdbuf -oL python $script_path/train.py --train_batch_size=256 --train_steps=12 2>&1 | tee $script_path/output_batchsize-256_umem-$UNIFIED_MEMORY_SET.txt

stdbuf -oL python main.py --epoch 12 --batch_size 64 --dataset celebA --input_height=108 --train --crop 2>&1 | tee $script_path/output_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt
stdbuf -oL python main.py --epoch 12 --batch_size 128 --dataset celebA --input_height=108 --train --crop 2>&1 | tee $script_path/output_batchsize-64_umem-$UNIFIED_MEMORY_SET.txt


export UNIFIED_MEMORY_SET=yes
#stdbuf -oL python $script_path/train.py --train_batch_size=128 --train_steps=12 2>&1 | tee $script_path/output_batchsize-128_umem-$UNIFIED_MEMORY_SET.txt
#stdbuf -oL python $script_path/train.py --train_batch_size=256 --train_steps=12 2>&1 | tee $script_path/output_batchsize-256_umem-$UNIFIED_MEMORY_SET.txt

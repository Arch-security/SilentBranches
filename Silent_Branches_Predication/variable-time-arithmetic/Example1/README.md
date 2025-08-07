This PoC demonstrates silent branches via predication by exploiting variable-time arithmetic instructions. It implements **Example 1 from Section VI-A-1)** of our paper.  

This PoC is adapted from [USENIX '23 Ultimate SLH](https://github.com/0xADE1A1DE/USLH/tree/master/PoC/variable_time). It exploits timing differences in executing a sequence of sqrtsd and mulsd instructions on specific fast and slow values. By crafting a secret-bit-dependent selection between operands with different execution latencies, the PoC leaks secret bits through timing variations.

---
## Test Environment:
This attack has been validated in the following environment:
- Intel® Xeon Gold 6248R processor running Ubuntu 22.04 with Linux kernel version 5.15.0-107-generic. 

---
## How to Use
### Step 1: Configure LLVM
 We require a custom-built version of Clang/LLVM with assertions enabled. You can follow the official guide at https://clang.llvm.org/get_started.html, or use the steps below:
1. `git clone https://github.com/llvm/llvm-project.git`
2. `cd llvm-project`
3. `mkdir build && cd build`
4. `cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" -DLLVM_ENABLE_ASSERTIONS=On -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_BUILD_TYPE=Release -DLLVM_USE_LINKER=gold ../llvm`
5. `make -j10` 
6. After the compilation, you should find *clang* under folder /build/bin/

### Step 2: Edit `attack.bash`
1. Line 3: Set the path to your local LLVM *clang* binary, e.g.:
`folder=full/path/to/llvm-project/build/bin`
2. Line 14: Set the secret value you wish to leak, e.g.:
`secret_char=85  `
### Step 3: Run the PoC
`$bash attack.bash`
Sample output:
```bash
===== Run 31 =====
1,  90
0, 272
1,  90
0, 272
1,  90
0, 310
1,  90
0,  92
secret :  85 Guess :  85, --> 1
```
The generated assembly code (`main.s`) allows you to verify whether the ternary operator was compiled into `CMOV`-class instructions by Clang, as described in the paper.

## Notes(adapted from original [USLH](https://github.com/0xADE1A1DE/USLH/tree/master/PoC/variable_time) repo)
- The number of pairs of `sqrtsd, mulsd` is various from platform to platform. 
You will need to find a vulnerable pair on your machine.  
To test different pairs of operations, you can change the repeat times at line 40 of main.c.  
For example `asm volatile (".rept 40;\nsqrtsd %xmm0, %xmm0;\nmulsd %xmm0, %xmm0;\n.endr");` 
to play with 40 pairs of the operations.
- Since the number of vulnerable pairs of `sqrtsd, mulsd` are various from processors.  
We use inline assemblyline to adjust the number easily.  
`volatile double tmp2 = tmp * tmp` is compiled to store tmp2 into %xmm0.  
If the compiler does not store tmp2 to %xmm0, you may need to check the main.s to find which %xmm register is used and change the %xmm register in the inline assemblyline accrodingly.



This PoC demonstrates silent branches via predication by exploiting variable-time arithmetic instructions. It implements **Example 2 from Section VI-A-1)** of our paper.

This PoC leverages timing differences in arithmetic instruction sequences caused by operand cache hits and misses, which induce contention on Reservation Station (RS) entries and delay subsequent instruction fetches. It constructs an I-cache side channel implemented in the [Gem5 simulator](https://github.com/gem5/gem5).


---
## Environment Configuration:
- **Operating System**: Ubuntu 22.04
- **Simulator**: Gem5 22.1.0.0
---
## How to Use
### Step 1: Build your Gem5 x86 proccessor
Before testing this PoC, ensure that you have a compiled Gem5 x86 simulator.
Use a configuration compatible with the following parameters:

```bash
GEM5FLAGS 		+=   configs/example/se.py \
					    --num-cpus=1 \
					    --bp-type=BiModeBP \
			 		    --caches \
					    --l2cache \
					    --num-l2cache=1 \
			 		    --l1i_size=32kB \
			 		    --l1i_assoc=8 \
					    --l1d_size=32kB \
			 		    --l1d_assoc=8 \
					    --l2_size=256kB \
					    --l2_assoc=16 \
					    --mem-size=8192MB \
					    --cpu-type=DerivO3CPU \
```

### Step 2: Compile the Attack PoC
Edit the `Makefile` and set `LIBDIR` to the absolute path of this directory. For example:
   ```bash
   LIBDIR = full/path/to/SilentBranch/Silent_Branches_Predication/variable-time-arithmetic/Example2/
   ```
Simply run the following command to compile: `make`

To verify whether the compiled binary exhibits the same behavior described in the paper (i.e., `SBB` instruction appearing in gadget1 due to gcc optimizations), you can inspect the disassembled code using:
`make disam`

you can disable the current compiler optimization in the Makefile by modifying the following line:

```
CFLAGS = -std=gnu  -O1 -mno-bmi2 -march=native
```
Remove or change the -O1 flag (e.g., to -O0) to observe how the original ternary operator in gadget1 is compiled into a regular secret-dependent branch instead of being optimized into a `SBB` instruction.

## Step 3: Run the Attack
Run the attack using the compiled binary with your Gem5 build. For example:

```
./build/X86/gem5.opt $(GEM5FLAGS) \
--cmd=path/SilentBranch/Silent_Branches_Predication/variable-time-arithmetic/Example2/gadget2_CMOVE
  ```



## [DOLMA](https://www.usenix.org/system/files/sec21-loughlin.pdf) Bypass Invalidation

We will release our DOLMA-enhanced gem5 x86 processor and build guide after the paper is accepted to support bypass invalidation.



## Overview
This is the anonymous repository for NDSS paper **Silent Branches: Breaking Selective Speculation Defenses via Unseen Control Divergence**. It contains our proof-of-concept (PoC) implementations of attacks on both [Gem5 simulator](https://github.com/gem5/gem5) (x86) and  [SonicBOOM](https://github.com/riscv-boom/riscv-boom)  (RISC-V), as well as attacks exploiting predicated instructions on real Intel CPUs (Cascade Lake and Raptor Cove).



---

## Folder Structure

### `Silent_Branches_Predication/`
Contains the PoC for Silent Branches via Predication.
PoC implementations related to **Section VI-A** of the paper.

- `REP_MOVS/`
Contains the attack code for **Section VI-A-2)**. The evaluation results are presented in **Section VII-B-2)**.
Demonstrates the newly discovered `REP MOVS`-based side channel on Intel Raptor Cove.

- `variable-time-arithmetic/`
  Contains the attack code for **Section VI A-1)**
   - `Example1/`: Corresponds to **Example 1** in **Section VI-A-1)**. Evaluation results are shown in **Section VII-B-1)**.
   - `Example2/`: Contains two gadgets corresponding to **Example 2** in **Section VI-A-1)**. Evaluation results are shown in **Section VII-A-1)**.

### `Silent_Branches_SFB/`
Contains the PoC for Silent Branches via Short-Forwarding Branch (SFB) optimization in [SonicBOOM](https://github.com/riscv-boom/riscv-boom).
PoC demonstrates a speculative cache side-channel leveraging SFB, as described in **Section VI-B**.
Evaluation results are presented in **Section VII-A-2)**.


---

## How to Use
Please refer to the README.md files in each subdirectory for detailed setup instructions and descriptions of the experimental environments.